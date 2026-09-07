\# Week 3 - Accounts, Identity, and Least Privilege



\## Scenario Summary

For this lab I was tasked with creating a standard user account for seasonal staff at ACME. The account needed to be able to do normal work without having administrator access. I also tested what happened when the standard user tried to run something as administrator and used PowerShell to check the local users and Administrators group.



\## Tools Used

\- VMware Workstation

\- Windows 11 Settings

\- User Account Control (UAC)

\- PowerShell

\- Git and GitHub



\## Steps Taken

1\. Restored my Windows 11 VM back to the W01\_CleanBaseline snapshot in VMware Workstation.

2\. After restoring the snapshot, I ran into an issue with Git because my local repository was behind GitHub. I checked git status, stashed the old files, and ran git pull again to get everything up to date.

3\. Created a local account named seasonal-staff and set it as a standard user.

4\. Signed into the seasonal-staff account to test what happens when a standard user tries to use administrator privileges.

5\. I first tried opening Computer Management, but it opened without a UAC prompt. I then tried running PowerShell as administrator and received a prompt asking for an administrator username and password.

6\. Signed back into my administrator account and used PowerShell to view the local users and members of the Administrators group.

7\. Verified that seasonal-staff was not a member of the Administrators group.

8\. Exported the PowerShell results to local-users-export.txt and checked the file to make sure both command outputs were saved.

9\. Wrote a least-privilege memo explaining when administrator access should be given, when a request should be escalated, and what should be required for an exception.



\## Evidence

Screenshots in Screenshots folder

\- Snapshotwk3.png - VMware snapshot showing the W01\_CleanBaseline restore.

\- seasonal-staff.png - seasonal-staff account showing the Standard user account type.

\- UAC.png - UAC credential prompt after seasonal-staff tried to run PowerShell as administrator.

\- Local-users.png - PowerShell output from Get-LocalUser.

\- Admin-Group.png - PowerShell output showing the members of the Administrators group.

\- Local-users-export.png - verification that the PowerShell audit results were exported.

\- local-users-export.txt - saved output from the local user and Administrators group audit.



\## Troubleshooting Narrative

1\. \*\*What went wrong, or what could realistically have gone wrong?\*\*  

After restoring my Week 1 snapshot, I tried to run git pull and received an error saying that untracked files would be overwritten by the merge.



2\. \*\*What evidence did you check first?\*\*  

I ran git status and found that my local branch was four commits behind origin/main. It also showed deleted and untracked files in my Week 1 folder.



3\. \*\*What did you try?\*\*  

I used git stash with the -u option to save the changes and untracked files before trying the pull again.



4\. \*\*What fixed it, or what would you try next?\*\*  

After stashing the files, I ran git pull again and it was able to fast-forward and download the newer files from GitHub.



5\. \*\*How did you verify the result?\*\*  

I ran git status again and it showed that my branch was up to date with origin/main and the working tree was clean.



6\. \*\*What was the support or security impact of the issue or fix?\*\*  

Fixing the issue allowed me to update my portfolio without overwriting the files from the restored snapshot. Stashing the files first also gave me a backup in case I needed them later.



\## AI Disclosure

I used ChatGPT as a notes and troubleshooting aide while completing this lab. I used it to help troubleshoot the Git pull issue, keep track of the steps I completed, and help clean up my documentation.



I verified the suggestions by performing the steps myself on my Windows 11 VM and checking the results with screenshots and PowerShell output.



One suggestion I revised was the UAC test. I first tried opening Computer Management, but it did not give me a UAC prompt. I then tested it by running PowerShell as administrator, which gave me the administrator credential prompt I needed.



\## What I Can Do Now

I can create and check local Windows accounts, use PowerShell to make sure users have the right access, and test UAC to make sure standard users cannot make changes that require administrator access.

