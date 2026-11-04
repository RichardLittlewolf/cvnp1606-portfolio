\# Week 10 — Intune Pilot Group Design



\## Purpose



Before enrolling every ACME employee into Microsoft Intune, I would start with a small pilot group. This would let the IT team test device enrollment, identify problems, and make changes without affecting the entire organization.



\## Pilot Group



\*\*Proposed group name:\*\* ACME-Intune-Pilot



I would start with five users:



\- One IT administrator

\- Two IT support technicians

\- Two regular employees



This would allow testing from both an administrator's perspective and an everyday user's perspective.



The pilot would initially use Windows 11 devices.



\## Enrollment Method



The preferred method for a larger deployment would be automatic enrollment through Microsoft Entra ID.



However, my trial tenant did not include Entra ID P1 licensing, which prevented automatic enrollment.



For this lab, I successfully used manual MDM enrollment with the `1606MIDTERM` Windows 11 VM.



Before enrolling additional devices, I would verify licensing and confirm that the correct enrollment method was available.



\## Pilot Testing



During the pilot, I would check whether:



1\. Devices appear in the Intune admin center after enrollment.

2\. Devices successfully synchronize with Intune.

3\. Device compliance status is reported correctly.

4\. Users can sign in and access their normal applications.

5\. Security settings and management policies apply as expected.



I would record any problems and document the troubleshooting steps.



\## Success Criteria



I would consider the pilot successful when:



\- All five pilot devices are enrolled and visible in Intune.

\- Devices report their compliance status.

\- Assigned policies apply successfully.

\- Users can continue working without major problems.

\- Any enrollment failures have been investigated and documented.



\## Rollback Plan



Before making major changes, I would back up important data and create VM snapshots where applicable.



If enrollment caused problems, I would investigate the issue and remove the affected test device from management when appropriate. For virtual machines, I could restore a verified pre-enrollment snapshot if necessary.



I would not expand enrollment until the problems were resolved.



\## Deployment Recommendation



Once the pilot works successfully, I would gradually expand enrollment to additional departments.



I would monitor device compliance, enrollment errors, and user feedback during each stage.



Using a pilot group first reduces the risk of introducing configuration problems across the entire organization.



\## Current Lab Results



For Week 10, I enrolled one Windows 11 VM named `1606MIDTERM`.



The device appeared in Intune and was reported as compliant.



This provided an initial successful test of manual MDM enrollment. The five-user pilot described above is a proposed deployment plan and has not been implemented.

