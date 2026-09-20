\# Week 4 - Permissions and Access Control



\## Overview



For this lab, I created a shared Payroll folder and configured permissions for different HR groups. I used both NTFS and share permissions and tested the access using an HR-Staff test account.



\## Folder Structure



The Payroll folder was created at:



C:\\HR\\Payroll



It contains two folders:



\- CurrentYear

\- Archive



The Payroll folder was also shared on the network as:



\\\\localhost\\Payroll



\## Groups



I created three local security groups:



\- HR-Managers

\- HR-Staff

\- Audit-Readonly



I also created a test account named `hr-staff-test` and added it to the HR-Staff group.



\## NTFS Permissions



The following NTFS permissions were configured:



| Group | Permission |

|---|---|

| HR-Managers | Full Control |

| HR-Staff | Modify |

| Audit-Readonly | Read \& Execute |



\## Share Permissions



The following share permissions were configured:



| Group | Permission |

|---|---|

| HR-Managers | Full |

| HR-Staff | Change |

| Audit-Readonly | Read |



Administrators were also given Full access to the share.



\## Access Testing



I signed into the `hr-staff-test` account and accessed the Payroll share through `\\\\localhost\\Payroll`.



The account was able to create a file in CurrentYear and edit and save the file. The account was also able to delete a file that had been created by the Administrator account.



When I attempted to change the Payroll folder security permissions, Windows required credentials from an account with additional permissions. This showed that the HR-Staff account could work with the files but could not manage the security permissions.



\## Evidence



Before and after permission information is saved in:



\- `acl-before.txt`

\- `acl-after.txt`



Screenshots of the configuration and access testing are stored in the `Screenshots` folder.

