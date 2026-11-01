
# CVNP1606 Week 09 - Evidence Collection Script (Midterm)
# Run as Administrator.
# Saves output to evidence-report.txt.

$lines = @()
$lines += "=== CVNP1606-W09 Evidence Report (Midterm) ==="
$lines += "Generated : $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$lines += "Host      : $env:COMPUTERNAME"
$lines += ""

# Ticket A - Account lockout state
$lines += "[TICKET A - ACCOUNT STATE]"

Get-LocalUser | ForEach-Object {
    $name = $_.Name
    $enabled = $_.Enabled
    $locked = $_.IsAccountLockedOut
    $lines += "  $name | Enabled: $enabled | LockedOut: $locked"
}

$lines += ""

# Ticket B - Top CPU and memory consumers
$lines += "[TICKET B - TOP PROCESSES (CPU)]"

Get-Process |
    Sort-Object CPU -Descending |
    Select-Object -First 8 |
    ForEach-Object {
        $name = $_.ProcessName
        $cpu = [math]::Round($_.CPU, 1)
        $memory = [math]::Round($_.WorkingSet64 / 1MB, 1)
        $lines += "  $name | CPU: $cpu seconds | Memory: $memory MB"
    }

$lines += ""

# Ticket C - Device Manager non-OK devices
$lines += "[TICKET C - PNP DEVICE STATUS]"

$nonOK = Get-PnpDevice |
    Where-Object { $_.Status -ne "OK" }

if ($nonOK) {
    $nonOK | ForEach-Object {
        $status = $_.Status
        $class = $_.Class
        $name = $_.FriendlyName
        $lines += "  Status: $status | Class: $class | Name: $name"
    }
}
else {
    $lines += "  All devices status: OK"
}

$lines += ""

# Ticket D - Network connectivity
$lines += "[TICKET D - NETWORK STATE]"

Get-NetIPConfiguration |
    Where-Object { $_.IPv4Address } |
    ForEach-Object {
        $adapter = $_.InterfaceAlias
        $ip = $_.IPv4Address.IPAddress
        $prefix = $_.IPv4Address.PrefixLength
        $gateway = $_.IPv4DefaultGateway.NextHop
        $lines += "  $adapter | IP: $ip/$prefix | Gateway: $gateway"
    }

@("127.0.0.1", "8.8.8.8") | ForEach-Object {
    $target = $_
    $result = Test-Connection -ComputerName $target -Count 1 -ErrorAction SilentlyContinue

    if ($result) {
        $lines += "  Ping ${target}: REACHABLE"
    }
    else {
        $lines += "  Ping ${target}: UNREACHABLE"
    }
}

$lines += ""

# Security log - Failed logins and account lockouts
$lines += "[SECURITY LOG - EVENTS 4625 AND 4740 (LAST 24 HOURS)]"

try {
    $lockouts = Get-WinEvent -FilterHashtable @{
        LogName   = "Security"
        Id        = @(4625, 4740)
        StartTime = (Get-Date).AddHours(-24)
    } -ErrorAction SilentlyContinue |
        Select-Object -First 10

    if ($lockouts) {
        $lockouts | ForEach-Object {
            $timestamp = $_.TimeCreated.ToString("yyyy-MM-dd HH:mm:ss")
            $eventID = $_.Id
            $lines += "  $timestamp | Event ID: $eventID"
        }
    }
    else {
        $lines += "  No matching events found in the last 24 hours."
    }
}
catch {
    $lines += "  Security log query could not be completed."
}

$lines += ""

# Required files
$lines += "[REQUIRED FILES]"

$requiredFiles = @(
    "ticket-pack.md",
    "evidence\change-note.md",
    "ai-disclosure.md"
)

foreach ($file in $requiredFiles) {
    $path = Join-Path $PSScriptRoot $file

    if (Test-Path $path -PathType Leaf) {
        $size = (Get-Item $path).Length
        $lines += "  ${file}: FOUND ($size bytes)"
    }
    else {
        $lines += "  ${file}: NOT FOUND"
    }
}

$lines += ""

# Check ticket screenshots
$lines += "[TICKET SCREENSHOT CHECK]"

$ticketNames = @("Ticket-A", "Ticket-B", "Ticket-C", "Ticket-D")

foreach ($ticket in $ticketNames) {
    $images = @(
        Get-ChildItem -Path (Join-Path $PSScriptRoot "evidence") `
            -Filter "$ticket*.png" `
            -File -ErrorAction SilentlyContinue
    )

    if ($images.Count -gt 0) {
        $lines += "  ${ticket}: FOUND ($($images.Count) screenshots)"
    }
    else {
        $lines += "  ${ticket}: NOT FOUND"
    }
}

$lines += ""
$lines += "Review all evidence before submitting."
$lines += "Commit evidence-report.txt to GitHub under midterm-service-desk/."

# Write report
$out = $lines -join "`r`n"

$out | Out-File -FilePath (Join-Path $PSScriptRoot "evidence-report.txt") -Encoding utf8

Write-Host $out
