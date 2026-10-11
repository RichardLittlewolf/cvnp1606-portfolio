# Week 7 - Driver Change Note

## Ticket Information
Ticket: CVNP1606-W07-007
Computer: ACME11
Date: October 11, 2026
Technician: Student IT Technician
Device: Microsoft Kernel Debug Network Adapter

## Before State
The Microsoft Kernel Debug Network Adapter was disabled using the instructor's lab-fault.ps1 script.

Device Manager reported Code 22: This device is disabled.

Hardware ID: root\kdnic
Instance ID: ROOT\KDNIC\0000

Driver Provider: Microsoft
Driver Date: 6/21/2006
Driver Version: 10.0.26100.8521
Digital Signer: Microsoft Windows

## Investigation
I checked Device Manager and recorded the error code, Hardware ID, driver version, and driver date.

The Roll Back Driver button was greyed out, meaning a previous driver was not available through Device Manager.

The device was intentionally disabled by the lab script. There was no evidence that the installed driver was damaged.

## Remediation Decision
I will restore the device using the instructor's lab-fault.ps1 -Restore command.

I chose this because the confirmed issue is a disabled device, not a corrupted driver.

Although the Roll Back Driver button is unavailable, uninstalling and reinstalling the driver would be unnecessary for this specific Code 22 fault.

## Expected After State
The Microsoft Kernel Debug Network Adapter should be enabled.

Device Manager should report that the device is working properly.

The disabled-device indicator should disappear.

The driver should remain version 10.0.26100.8521, dated 6/21/2006.

## Verification
On October 11, 2026, I ran the instructor's lab-fault.ps1 -Restore command.

The script confirmed that the Microsoft Kernel Debug Network Adapter was restored.

I opened Device Manager and verified that the disabled-device indicator was gone.

The General tab displayed: This device is working properly.

I also ran Get-PnpDevice against instance ROOT\KDNIC\0000.

PowerShell confirmed:
Status: OK
Class: Net
FriendlyName: Microsoft Kernel Debug Network Adapter

The results were saved to device-after-fix.txt.

Result: The simulated Code 22 device fault was resolved.

## Rollback
See rollback-plan.md for steps to reverse the change if additional problems occur.

