# lab-fault.ps1 — creates a reversible device fault for the Week 7 driver lab
# Run as Administrator before starting Task 1
# Run with -Restore after Task 3 to re-enable the device
#
# Default : disables one network adapter so Device Manager shows a warning icon
# -Restore : re-enables the same adapter

param([switch]$Restore)

if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Run this script as Administrator."; exit 1
}

$adapter = Get-PnpDevice -Class Net |
    Where-Object {
        $_.FriendlyName -notlike '*Hyper-V*' -and
        $_.FriendlyName -notlike '*Loopback*' -and
        $_.FriendlyName -notlike '*WAN Miniport*' -and
        $_.Status -ne 'Unknown'
    } |
    Select-Object -First 1

if (-not $adapter) {
    Write-Host "No suitable network adapter found."
    Write-Host "Open Device Manager (devmgmt.msc) and disable an adapter manually."
    exit 1
}

if ($Restore) {
    Enable-PnpDevice -InstanceId $adapter.InstanceId -Confirm:$false
    Write-Host ""
    Write-Host "Restored : $($adapter.FriendlyName)"
    Write-Host "Open Device Manager to confirm the device shows OK status."
} else {
    Disable-PnpDevice -InstanceId $adapter.InstanceId -Confirm:$false
    Write-Host ""
    Write-Host "Disabled : $($adapter.FriendlyName)"
    Write-Host "Open Device Manager (devmgmt.msc) -- the device should show a warning icon."
    Write-Host ""
    Write-Host "When Task 3 is complete, restore the device with:"
    Write-Host "  .\lab-fault.ps1 -Restore"
}
