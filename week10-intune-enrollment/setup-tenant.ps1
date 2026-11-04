# CVNP1606 Tenant Readiness Check — run AFTER you create your trial tenant.
# Works on your host PC or the lab VM (PowerShell 5.1 or PowerShell 7).
# Saves output to tenant-check-report.txt in the current folder.
#
# What this script does:   confirms your tenant is ready for Weeks 10-15 (licenses,
#                          trial expiry math, extension deadline) and writes a report
#                          you can use to fill in tenant-setup-notes.md.
# What it does NOT do:     create groups, enroll devices, or change any tenant setting.
#                          That is your graded lab work — this script never touches it.
#
# First run will prompt to install three small Microsoft.Graph modules (CurrentUser
# scope, no admin needed) and to sign in to YOUR tenant in a browser window.

param(
    # Last due date of the course. UPDATE EACH SEMESTER to match semester.yaml.
    [string]$CourseEndDate = "2026-12-13"
)

$ErrorActionPreference = "Stop"
$requiredModules = @(
    "Microsoft.Graph.Authentication",
    "Microsoft.Graph.Identity.DirectoryManagement",
    "Microsoft.Graph.Users"
)

# ── Module check ──────────────────────────────────────────────────────────────
$missing = @()
foreach ($m in $requiredModules) {
    if (-not (Get-Module -ListAvailable -Name $m)) { $missing += $m }
}
if ($missing.Count -gt 0) {
    Write-Host "This script needs the following PowerShell modules (one-time install):"
    $missing | ForEach-Object { Write-Host "  - $_" }
    $answer = Read-Host "Install them now for the current user? (y/n)"
    if ($answer -ne "y") {
        Write-Host "Cannot continue without the modules. Re-run when ready."
        exit 1
    }
    foreach ($m in $missing) {
        Write-Host "Installing $m ..."
        Install-Module -Name $m -Scope CurrentUser -Repository PSGallery -Force
    }
}
Import-Module Microsoft.Graph.Authentication

# ── Sign in to the STUDENT's tenant ───────────────────────────────────────────
Write-Host ""
Write-Host "A browser window will open. Sign in with the ADMIN account of the tenant"
Write-Host "you created (user@<yourtenant>.onmicrosoft.com) - NOT your school account."
Connect-MgGraph -Scopes "Organization.Read.All","Directory.Read.All","User.Read" -NoWelcome

$lines = @()
$pass = 0; $warn = 0; $fail = 0
function Add-Check {
    param([string]$Status, [string]$Message)
    $script:lines += ("  [{0}] {1}" -f $Status, $Message)
    switch ($Status) {
        "PASS" { $script:pass++ }
        "WARN" { $script:warn++ }
        "FAIL" { $script:fail++ }
    }
}

$lines += "=== CVNP1606 Tenant Readiness Report ==="
$lines += "Generated : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$lines += ""

# ── Tenant identity ───────────────────────────────────────────────────────────
$lines += "[TENANT]"
$org = Get-MgOrganization | Select-Object -First 1
$defaultDomain = ($org.VerifiedDomains | Where-Object { $_.IsDefault }).Name
$maskedId = $org.Id.Substring(0, 8) + "-****  (full ID redacted - good habit for shared docs)"
$lines += "  Tenant name    : $($org.DisplayName)"
$lines += "  Default domain : $defaultDomain"
$lines += "  Tenant ID      : $maskedId"
$lines += "  Signed in as   : $((Get-MgContext).Account)"
$lines += ""

# ── Licenses on the tenant ────────────────────────────────────────────────────
$lines += "[TENANT LICENSES]"
$skus = Get-MgSubscribedSku
$intunePlan = $false
$entraP1 = $false
foreach ($sku in $skus) {
    $lines += "  SKU: $($sku.SkuPartNumber)  (enabled: $($sku.PrepaidUnits.Enabled), assigned: $($sku.ConsumedUnits))"
    foreach ($plan in $sku.ServicePlans) {
        if ($plan.ServicePlanName -match "INTUNE") { $intunePlan = $true }
        if ($plan.ServicePlanName -match "AAD_PREMIUM") { $entraP1 = $true }
    }
}
if ($intunePlan) { Add-Check "PASS" "An Intune service plan exists on this tenant." }
else { Add-Check "FAIL" "No Intune service plan found. Weeks 10-15 portal work needs Intune - re-check which trial you signed up for (see the Tenant Setup Guide, Path A)." }
if ($entraP1) { Add-Check "PASS" "Entra ID P1 (or higher) exists - Conditional Access in Week 11 will work." }
else { Add-Check "WARN" "No Entra ID P1 plan found. Week 11 Conditional Access tasks need it." }

# ── License assigned to YOU ───────────────────────────────────────────────────
$me = Get-MgContext
$myLicenses = @()
$licReadFailed = $false
try { $myLicenses = Get-MgUserLicenseDetail -UserId $me.Account }
catch {
    $licReadFailed = $true
    Add-Check "WARN" "Could not read your account's license details ($($_.Exception.Message)). Check manually: admin center > Users > Active users > your account > Licenses and apps."
}
if (-not $licReadFailed) {
    $iHaveIntune = $false
    foreach ($lic in $myLicenses) {
        foreach ($plan in $lic.ServicePlans) {
            if ($plan.ServicePlanName -match "INTUNE" -and $plan.ProvisioningStatus -eq "Success") { $iHaveIntune = $true }
        }
    }
    if ($iHaveIntune) { Add-Check "PASS" "Your admin account has an Intune license assigned." }
    else { Add-Check "WARN" "Your account has no Intune license assigned yet. Fix: Microsoft 365 admin center > Users > Active users > your account > Licenses and apps. An enrolled device with a blank MdmUrl is the classic symptom of skipping this." }
}
$lines += ""

# ── Trial lifecycle + survival calendar ───────────────────────────────────────
$lines += "[TRIAL LIFECYCLE]"
$subs = Get-MgDirectorySubscription
$courseEnd = [datetime]::ParseExact($CourseEndDate, "yyyy-MM-dd", $null)
$reported = $false
foreach ($sub in $subs) {
    if ($sub.Status -ne "Enabled") { continue }
    $reported = $true
    $lines += "  Subscription   : $($sub.SkuPartNumber)  (trial: $($sub.IsTrial))"
    if ($sub.NextLifecycleDateTime) {
        $expiry = [datetime]$sub.NextLifecycleDateTime
        $extendBy = $expiry.AddDays(-1)
        $windowOpens = $expiry.AddDays(-15)
        $daysLeft = [int]($expiry.Date - (Get-Date).Date).TotalDays
        $lines += "  Expires        : $($expiry.ToString('yyyy-MM-dd'))  ($daysLeft days from today)"
        if ($sub.IsTrial) {
            $lines += "  Extension      : one-time +30 days allowed, only inside the last 15 days."
            $lines += "                   Window: $($windowOpens.ToString('yyyy-MM-dd')) through $($extendBy.ToString('yyyy-MM-dd'))"
            $lines += "                   Where : admin.microsoft.com > Billing > Your products > (subscription) > Extend end date"
            if ($expiry.AddDays(30) -ge $courseEnd) {
                Add-Check "PASS" "With the one-time extension, this trial covers the course end date ($CourseEndDate)."
            } else {
                Add-Check "WARN" "Even extended, this trial ends before the course does ($CourseEndDate). Export evidence every week and talk to your instructor early."
            }
            if ($expiry -lt $courseEnd) {
                Add-Check "WARN" ("Unextended, this trial dies before the course ends. SET A REMINDER to extend between {0} and {1}." -f $windowOpens.ToString('yyyy-MM-dd'), $extendBy.ToString('yyyy-MM-dd'))
            }
        }
    }
}
if (-not $reported) { Add-Check "WARN" "No enabled subscription details returned - check Billing > Your products in the admin center manually." }
$lines += ""

# ── Summary ───────────────────────────────────────────────────────────────────
$lines += "[SUMMARY]"
$lines += "  PASS: $pass   WARN: $warn   FAIL: $fail"
$lines += ""
$lines += "Next steps:"
$lines += "  1. Fix any FAIL before starting the Week 10 lab. WARNs have fix pointers above."
$lines += "  2. Keep this file - it gives you the tenant name and expiry date that"
$lines += "     tenant-setup-notes.md asks for, plus your extension deadline."
$lines += "  3. Export evidence (screenshots/reports) the same day you do portal work."
$lines += "     If the trial dies, your exported evidence still earns full credit."

$outFile = Join-Path (Get-Location) "tenant-check-report.txt"
$lines | Set-Content -Path $outFile -Encoding UTF8
$lines | ForEach-Object { Write-Host $_ }
Write-Host ""
Write-Host "Report saved to $outFile"
Disconnect-MgGraph | Out-Null
