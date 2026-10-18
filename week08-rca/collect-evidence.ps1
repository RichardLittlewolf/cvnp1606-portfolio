
# CVNP1606 Week 08 - Evidence Collection
# Event Logs and Root-Cause Analysis

$ErrorActionPreference = "Continue"

$folder = $PSScriptRoot
$reportPath = Join-Path $folder "evidence-report.txt"
$lines = @()

$lines += "CVNP1606 - WEEK 08 EVIDENCE REPORT"
$lines += "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$lines += "Computer: $env:COMPUTERNAME"
$lines += "Folder: $folder"
$lines += "========================================"
$lines += ""

# Check required portfolio files
$lines += "[REQUIRED FILES]"

$requiredFiles = @(
    "README.md",
    "event-timeline.md",
    "event-export.txt",
    "ai-validation.md",
    "troubleshooting-narrative.md",
    "collect-evidence.ps1"
)

foreach ($file in $requiredFiles) {
    $path = Join-Path $folder $file

    if ((Test-Path $path) -and
        ((Get-Item $path).Length -gt 0)) {
        $lines += "FOUND: $file"
    }
    else {
        $lines += "NOT FOUND: $file (missing or empty)"
    }
}

$lines += ""

# Check screenshot evidence
$lines += "[SCREENSHOT EVIDENCE]"

$screenshotFolder = Join-Path $folder "Screenshots"

if (Test-Path $screenshotFolder) {
    $screenshots = @(
        Get-ChildItem -Path $screenshotFolder -File |
        Where-Object {
            $_.Extension -in @(".png", ".jpg", ".jpeg")
        }
    )

    if ($screenshots.Count -gt 0) {
        $lines += "FOUND: Screenshots folder"
        $lines += "Screenshot count: $($screenshots.Count)"

        foreach ($screenshot in $screenshots) {
            $lines += "FOUND: $($screenshot.Name)"
        }
    }
    else {
        $lines += "NOT FOUND: Screenshot evidence"
    }
}
else {
    $lines += "NOT FOUND: Screenshots folder"
}

$lines += ""

# Query Windows System events
$lines += "[SYSTEM LOG - CRITICAL AND ERROR]"
$lines += "Date range: Last 7 days"

try {
    $startDate = (Get-Date).AddDays(-7)

    $events = @(
        Get-WinEvent -FilterHashtable @{
            LogName = "System"
            StartTime = $startDate
            Level = 1,2
        } -ErrorAction Stop
    )

    $lines += "Events found: $($events.Count)"

    foreach ($event in $events) {
        $lines += (
            "{0} | ID {1} | {2} | {3}" -f
            $event.TimeCreated,
            $event.Id,
            $event.ProviderName,
            $event.LevelDisplayName
        )
    }
}
catch {
    $lines += "Could not query System log: $($_.Exception.Message)"
}

$lines += ""

# Check reboot-related events
$lines += "[REBOOT EVENT CHECK]"

try {
    $rebootEvents = @(
        Get-WinEvent -FilterHashtable @{
            LogName = "System"
            Id = 41,6008,1001
        } -ErrorAction Stop |
        Sort-Object TimeCreated
    )

    foreach ($event in $rebootEvents) {
        $lines += (
            "FOUND: Event ID {0} | {1} | {2}" -f
            $event.Id,
            $event.TimeCreated,
            $event.ProviderName
        )
    }
}
catch {
    $lines += "No matching reboot events returned: $($_.Exception.Message)"
}

$lines += ""

# Final summary
$lines += "[FINAL VALIDATION]"

$missing = @($lines | Where-Object {
    $_ -like "NOT FOUND:*"
})

if ($missing.Count -eq 0) {
    $lines += "PASS: No missing required files detected."
}
else {
    $lines += "FAIL: $($missing.Count) missing evidence item(s)."
}

$lines += ""
$lines += "Note: This report checks file presence and event data."
$lines += "It does not verify the accuracy of the root-cause analysis."

# Save report
$lines | Out-File -FilePath $reportPath -Encoding UTF8 -Width 300

Write-Host ""
Write-Host "Evidence collection completed."
Write-Host "Report saved to: $reportPath"
Write-Host ""

Get-Content $reportPath
