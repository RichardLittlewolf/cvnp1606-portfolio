# \# Week 1 - Windows 11 Build and Baseline

# 

# \## Overview

# 

# For Week 1, I created and documented a Windows 11 virtual machine that will be used for future labs. I checked the VM hardware, Windows version, user accounts, Windows updates, system inventory, TPM, and created a clean baseline snapshot.

# 

# \## VM Hardware

# 

# I configured the virtual machine in VMware Workstation with:

# 

# \- 8 GB RAM

# \- 4 processors

# \- 125 GB virtual hard drive

# \- Trusted Platform Module (TPM)

# \- Windows 11 Enterprise

# 

# \### Evidence

# 

# !\[VM Hardware](Screenshots/VM-Hardware.png)

# 

# \## Windows 11 System Information

# 

# I verified the Windows version and system information by going to:

# 

# \*\*Settings > System > About\*\*

# 

# The VM is running Windows 11 Enterprise version 25H2. The device name is ACME11 and the VM has 8 GB of RAM.

# 

# \### Evidence

# 

# !\[Windows About](Screenshots/Windows-about.png)

# 

# \## User Accounts

# 

# I verified the administrator account and created a local test account for use during future labs.

# 

# \### Administrator Account

# 

# The main account has administrator permissions.

# 

# !\[Administrator Account](Screenshots/Admin.png)

# 

# \### Standard Test Account

# 

# I created a local account named \*\*Test\*\* and verified that its account type is \*\*Standard user\*\*.

# 

# !\[Standard User](Screenshots/Standard-user.png)

# 

# \## Windows Updates

# 

# I checked Windows Update and verified that Windows reports the system is up to date. An optional preview update was available, but it was not required to complete the normal updates.

# 

# \### Evidence

# 

# !\[Windows Update](Screenshots/windows=update.png)

# 

# \## System Inventory

# 

# I used PowerShell to collect the computer name, Windows product name, OS version, and firmware type.

# 

# The command I used was:

# 

# &#x20;   Get-ComputerInfo | Select-Object CsName, WindowsProductName, OsVersion, BiosFirmwareType

# 

# I also saved the results to `inventory.txt` and verified the contents of the file.

# 

# The PowerShell results showed:

# 

# \- Computer name: ACME11

# \- OS version: 10.0.26200

# \- Firmware type: UEFI

# 

# \### Evidence

# 

# !\[PowerShell Inventory](Screenshots/Inventory-Powershell.png)

# 

# The complete inventory output is also saved in `inventory.txt`.

# 

# \## TPM Verification

# 

# I ran the Week 1 evidence collection script and verified that the virtual TPM is present and enabled.

# 

# The evidence report showed:

# 

# \- TpmPresent: True

# \- TpmEnabled: True

# 

# The complete results are saved in `evidence-report.txt`.

# 

# \## Clean Baseline Snapshot

# 

# After checking the system, accounts, updates, and inventory, I created a VMware snapshot named:

# 

# \*\*W01\_CleanBaseline\*\*

# 

# I created this snapshot so I have a clean Windows 11 baseline that I can return to for future labs and troubleshooting.

# 

# \### Evidence

# 

# !\[Clean Baseline Snapshot](Screenshots/clean-baseline-snapshot.png)

# 

# \## What I Learned

# 

# This lab helped me learn how to build and verify a Windows 11 VM instead of assuming that the configuration is correct. I also learned how to collect system information with PowerShell, verify user account permissions, check TPM status, and create a clean snapshot that can be used for future troubleshooting.

## Troubleshooting Narrative

1. When I tried to run `collect-evidence.ps1`, PowerShell would not run the script because running scripts was disabled on the system.

2. I first checked the PowerShell error message to see why the script would not run. The error showed that the execution policy was blocking the script.

3. I opened PowerShell as Administrator and changed the execution policy for the current PowerShell session to allow the script to run.

4. I used `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` so the change would only apply to the current PowerShell session. After that, I ran `.\collect-evidence.ps1` again.

5. I verified the fix by checking the script output. It showed the ACME11 system information, local accounts, TPM status, and `inventory.txt : FOUND`. The script also successfully created `evidence-report.txt`.

6. The fix allowed me to collect evidence without permanently changing the PowerShell execution policy on the VM. This is important because changing security settings more than necessary could create a security risk.

