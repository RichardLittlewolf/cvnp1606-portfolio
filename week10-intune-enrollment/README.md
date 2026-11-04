\# Week 10 — Intune and Entra Onboarding



\## Overview



For Week 10, I set up a Microsoft Intune trial tenant called ACME Lab and enrolled a Windows 11 virtual machine into Intune. The goal was to verify device management, investigate enrollment issues, and prepare a pilot enrollment plan for ACME.



\## Tenant Setup



\- Tenant name: ACME Lab

\- Domain: ACMELab.onmicrosoft.com

\- Subscription: Microsoft Intune Plan 1 Trial

\- Trial started: November 1, 2026

\- Trial expiration: December 1, 2026

\- Licenses: 25 available, 1 assigned

\- Recurring billing: Off



I verified that I could access the Microsoft 365 admin center and Microsoft Intune admin center.



I also ran the provided `setup-tenant.ps1` script and generated `tenant-check-report.txt`.



\## Enrollment Troubleshooting



During the readiness check, the script reported three warnings and no failures.



One warning indicated that my administrator account did not have an Intune license. I checked the Microsoft 365 admin center and confirmed that Microsoft Intune Plan 1 was assigned and enabled.



Another warning identified that the tenant did not have Microsoft Entra ID P1 licensing. This prevented me from configuring automatic MDM enrollment.



I investigated the Microsoft Entra ID P2 trial, but the signup process showed that it would automatically become a paid subscription after 30 days. I decided not to activate it.



Instead, I used the manual device-management enrollment option.



\## Windows Device Enrollment



I used my Windows 11 virtual machine named `1606MIDTERM` for testing.



Before making changes, I created a VMware snapshot so I could restore the VM if something went wrong.



I checked the device's original join status using:



`dsregcmd /status`



The results showed:



\- AzureAdJoined: NO

\- EnterpriseJoined: NO

\- DomainJoined: NO

\- WorkplaceJoined: NO



I then opened Windows Settings, navigated to Accounts → Access work or school, and selected Enroll only in device management.



I signed in with my ACME Lab administrator account and completed the enrollment.



\## Enrollment Verification



After enrollment, I opened the Microsoft Intune admin center and verified the following:



\- Device name: 1606MIDTERM

\- Managed by: Intune

\- Ownership: Personal

\- Operating system: Windows

\- Device compliance: Compliant



I also generated a device compliance report. It showed one compliant device and zero noncompliant devices.



The device overview initially displayed a compliance-reporting error, but the overall compliance summary reported the device as compliant. I documented the discrepancy rather than making unnecessary changes.



\## Pilot Enrollment Plan



For an ACME pilot deployment, I would start with a small group of test users and devices before enrolling the entire organization.



The pilot would include one IT administrator and a few test users. I would verify that devices enroll successfully, appear in Intune, synchronize correctly, and report their compliance status.



I would document any enrollment failures and resolve them before expanding the deployment.



The goal would be to test the process with a small group first so that any problems could be identified without affecting every employee.



\## Evidence



The `evidence` folder contains screenshots of the initial device join state, successful Intune enrollment, compliance reporting, and trial subscription details.



Additional supporting files:



\- `setup-tenant.ps1`

\- `tenant-check-report.txt`

\- `tenant-setup-notes.md`

\- `pilot-group-design.md`



\## Conclusion



This assignment helped me understand how Microsoft Entra ID and Intune work together to manage Windows devices.



The biggest challenge was discovering that my Intune trial did not include Entra ID P1 licensing for automatic enrollment. I was able to use manual MDM enrollment instead and verify that my virtual machine appeared in Intune as a compliant device.



I also learned why checking licensing, documenting device status, and keeping rollback options available are important during endpoint onboarding.

