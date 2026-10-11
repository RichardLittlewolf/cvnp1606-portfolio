
# CVNP1606 Week 07 - Evidence Collection Script
# Run as Administrator.
# Saves output to evidence-report.txt.
# Commit evidence-report.txt to your GitHub portfolio repo
# under week07-driver-change-note/.

$lines = @()

$lines += "=== CVNP1606-W07 Evidence Report ==="
$lines += "Generated : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$lines += "Host      : $env:COMPUTERNAME"
$lines += ""

# Device Manager - Non-OK devices
$lines += "[PNP DEVICES - NON-OK STATUS]"

try {
    $nonOK = Get-PnpDevice | Where-Object { $_.Status -ne "OK" }

    if ($nonOK) {
        foreach ($device in $nonOK) {
            $status = [string]$device.Status
            $class = [string]$device.Class
            $name = [string]$device.FriendlyName

            $lines += "  Status: $($status.PadRight(12)) Class: $($class.PadRight(20)) Name: $name"
        }
    }
    else {
        $lines += "  All devices status: OK (remediation may have succeeded)"
    }
}
catch {
    $lines += "  Could not query devices: $($_.Exception.Message)"
}

$lines += ""

# All devices - Summary by status
$lines += "[PNP DEVICES - ALL (summary by status)]"

try {
    Get-PnpDevice | Group-Object Status | ForEach-Object {
        $status = [string]$_.Name
        $count = $_.Count

        $lines += "  $($status.PadRight(16)) : $count device(s)"
    }
}
catch {
    $lines += "  Could not query device summary: $($_.Exception.Message)"
}

$lines += ""

# Signed drivers - Last 30 days
$lines += "[RECENTLY MODIFIED DRIVERS (last 30 days)]"

try {
    $recent = Get-CimInstance Win32_PnPSignedDriver |
        Where-Object {
            $_.DriverDate -and
            $_.DriverDate -gt (Get-Date).AddDays(-30)
        } |
        Select-Object -First 10

    if ($recent) {
        foreach ($driver in $recent) {
            $lines += "  $($driver.DeviceName) | Version: $($driver.DriverVersion) | Date: $($driver.DriverDate)"
        }
    }
    else {
        $lines += "  No drivers with dates in the last 30 days."
    }
}
catch {
    $lines += "  Could not query driver dates: $($_.Exception.Message)"
}

$lines += ""

# Required assignment files
$lines += "[REQUIRED FILES]"

$requiredFiles = @(
    "hardware-inventory.txt",
    "change-note.md",
    "rollback-plan.md",
    "README.md"
)

foreach ($file in $requiredFiles) {
    $path = Join-Path $PSScriptRoot $file

    if (Test-Path -LiteralPath $path -PathType Leaf) {
        $size = (Get-Item -LiteralPath $path).Length
        $lines += "  ${file} : FOUND ($size bytes)"
    }
    else {
        $lines += "  ${file} : NOT FOUND"
    }
}

$lines += ""

# AI documentation
$lines += "[AI DOCUMENTATION]"

$aiFiles = @(
    "ai-disclosure.md",
    "ai-validation.md"
)

foreach ($file in $aiFiles) {
    $path = Join-Path $PSScriptRoot $file

    if (Test-Path -LiteralPath $path -PathType Leaf) {
        $size = (Get-Item -LiteralPath $path).Length
        $lines += "  ${file} : FOUND ($size bytes)"
    }
    else {
        $lines += "  ${file} : NOT FOUND"
    }
}

$lines += ""

# Screenshot inventory
$lines += "[SCREENSHOT INVENTORY]"

$screenshotFolder = Join-Path $PSScriptRoot "Screenshots"

if (Test-Path -LiteralPath $screenshotFolder -PathType Container) {
    $screenshots = @(
        Get-ChildItem -LiteralPath $screenshotFolder -File |
        Where-Object { $_.Extension -in @(".png", ".jpg", ".jpeg") }
    )

    if ($screenshots.Count -gt 0) {
        foreach ($screenshot in $screenshots) {
            $lines += "  FOUND: $($screenshot.Name)"
        }
        $lines += "  Total screenshots: $($screenshots.Count)"
    }
    else {
        $lines += "  NOT FOUND: No screenshots in folder"
    }
}
else {
    $lines += "  NOT FOUND: Screenshots folder"
}

$lines += ""
$lines += "Commit evidence-report.txt to your GitHub repo under week07-driver-change-note/."

# Save evidence report
$out = $lines -join [Environment]::NewLine

$outputPath = Join-Path $PSScriptRoot "evidence-report.txt"

$out | Out-File -FilePath $outputPath -Encoding utf8

# Display results
Write-Host $out

