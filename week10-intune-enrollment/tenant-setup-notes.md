\# Week 10 — Tenant Setup Notes



\## Tenant Information



\- Tenant name: ACME Lab

\- Default domain: ACMELab.onmicrosoft.com

\- Administrator account: RichardLittlewolf@ACMELab.onmicrosoft.com

\- Subscription: Microsoft Intune Plan 1 Trial

\- Trial start date: November 1, 2026

\- Trial expiration: December 1, 2026

\- Recurring billing: Off

\- Total licenses: 25

\- Assigned licenses: 1



\## Tenant Readiness Check



I ran the instructor-provided `setup-tenant.ps1` script on November 2, 2026.



The script generated `tenant-check-report.txt` and returned:



\- PASS: 2

\- WARN: 3

\- FAIL: 0



The script confirmed that the tenant had an active Intune subscription.



\## Licensing Findings



The readiness report warned that my administrator account did not have an Intune license assigned.



I checked the Microsoft 365 admin center under Users → Active users → Licenses and apps. The administrator account had Microsoft Intune Plan 1 assigned and enabled.



The report also identified that Entra ID P1 licensing was unavailable.



Because of this, automatic MDM enrollment could not be configured.



I investigated the Microsoft Entra ID P2 trial, but the signup process indicated it would convert into a paid subscription after the trial ended. I chose not to activate it.



\## Enrollment Method



I used manual MDM enrollment rather than automatic enrollment.



Test device: `1606MIDTERM`



I confirmed that the device was not previously joined to an organization, created a VMware snapshot, and enrolled the device through Windows Settings → Accounts → Access work or school → Enroll only in device management.



The device appeared in the Intune admin center with the following status:



\- Managed by: Intune

\- Ownership: Personal

\- Compliance: Compliant



\## Trial Extension



The current Intune trial expires December 1, 2026.



The readiness script reported a one-time extension window from November 16 through November 30, 2026.



I will verify the extension option in the Microsoft 365 admin center before the trial expires so that the tenant remains available through the end of the course.



\## Security and Evidence



I did not include passwords, authentication codes, or the full tenant ID in my GitHub portfolio.



Supporting evidence is saved in the `evidence` folder, and the readiness results are recorded in `tenant-check-report.txt`.

