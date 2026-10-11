# Week 7 - AI Validation

## What I Asked AI
I asked ChatGPT for help organizing the Week 7 troubleshooting process, preparing PowerShell commands, and documenting the device repair.

## What I Verified
I verified the following directly on ACME11:

- Device: Microsoft Kernel Debug Network Adapter
- Hardware ID: root\kdnic
- Error: Code 22 - Device disabled
- Driver version: 10.0.26100.8521
- Driver date: 6/21/2006
- Roll Back Driver: Unavailable

After running lab-fault.ps1 -Restore, I confirmed that Device Manager reported the device was working properly.

PowerShell also reported Status: OK.

## AI Suggestion Evaluated
ChatGPT recommended restoring the disabled device rather than unnecessarily reinstalling the driver.

I accepted this recommendation because Device Manager showed Code 22 and the instructor's script provided a restore command.

I verified that the restore operation resolved the simulated device fault.

## Limitations
This lab demonstrated restoring a disabled device. It did not demonstrate rolling back or reinstalling a driver.
