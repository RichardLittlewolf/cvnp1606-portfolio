## Ticket Prioritization

I would prioritize the tickets in the order A, C, D, then B. I would handle Ticket A first because the cashier being locked out is preventing the shift from starting, which affects multiple employees. I would work on Ticket C next because Emily has a video call in two hours and needs her audio working before then. Ticket D would be third because Marcus cannot access the company network, but he has until the end of the business day to complete his onboarding paperwork. I would handle Ticket B last because Alex's computer is running slowly, but he can still do some work. I would also check whether any network issues could prevent me from troubleshooting or verifying the other tickets.



\## Ticket A — Account Lockout



\*\*Status:\*\* Escalation required



I checked Local Users and Groups and PowerShell for the `acme-pos-cashier01` account, but it was not listed on the midterm VM. I also checked Event Viewer under Windows Logs > Security and filtered for Event IDs 4740 and 4625. I found three failed-login events (4625), but none were for the cashier account. There were also no 4740 lockout events in the local Security log.



I could not unlock the account because it was not available on this system. I would escalate the ticket to the team responsible for the cashier account and have them verify where it is managed, check the appropriate account logs, and restore access after confirming authorization. I would also request verification that the cashier can sign in before closing the ticket.



\*\*Evidence:\*\* Local user list and filtered Security event log.



\# Ticket C — Audio Driver Change Note



\*\*Status:\*\* Investigation completed — reported failure not reproduced



\*\*Reported problem:\*\* Emily's audio stopped working after a Windows Update, and she has a video call in two hours.



\*\*Evidence checked:\*\* I opened Device Manager and checked the High Definition Audio Device. It showed no warning triangle, and Windows reported that the device was working properly. I also checked PowerShell, which showed the currently present audio device had a status of OK.



\*\*Driver information:\*\* Microsoft driver version 10.0.22621.2506, dated October 19, 2023.



\*\*Change decision:\*\* I did not update or uninstall the driver because Windows was not reporting a problem. The Roll Back Driver option was also unavailable. I did not want to make unnecessary changes to a device that appeared to be working.



\*\*Approval:\*\* No driver change was made, so no change approval was needed.



\*\*Rollback plan:\*\* If a future driver update causes problems, I would restore the previous known-working driver if available, or reinstall an approved compatible driver.



\*\*Verification:\*\* Device Manager and PowerShell both reported normal device status. Audio playback and microphone functionality have not yet been tested, so I cannot confirm that Emily's reported problem is resolved.



\*\*Next action:\*\* Test actual audio playback and recording with the user. If the issue continues, investigate the affected endpoint or escalate with the evidence collected.

## Ticket D — Network Connectivity

**Status:** Diagnosis completed — reported issue not reproduced

I checked the network settings using `ipconfig /all`. The VM had a valid IP address of 192.168.145.132, a default gateway of 192.168.145.2, and a DNS server of 192.168.145.2.

I ran four ping tests: loopback, local IP, default gateway, and 8.8.8.8. All four passed with no packet loss. This showed that the VM's basic network connectivity was working.

I also used `Test-NetConnection` to test TCP port 445 on 192.168.145.2. The ping succeeded, but the TCP connection failed. Since this address is the VMware gateway and not a confirmed ACME file server, I cannot conclude that the company's shared drives are unavailable.

**Action taken:** No network settings were changed because the reported issue was not reproduced.

**Next action:** I would verify Marcus's actual workstation and test connectivity to the correct ACME file server and internal HR portal. If those systems were unreachable, I would escalate the ticket with the diagnostic results.

### User Instructions for Marcus

I checked the network connection on the test computer, but I haven't confirmed the cause of the problem on your workstation. The next step is to check your connection to the company's shared drives and HR website. You do not need to change any settings yourself. I will keep you updated and let you know when access has been restored. Since your paperwork is due today, I would also notify the appropriate support team about your deadline.

## Ticket B — Slow Workstation

**Status:** Investigation completed — reported slowdown not reproduced

I investigated the slow workstation using Task Manager and Task Scheduler. The initial CPU reading was 9%, memory usage was 60%, and disk usage was 1%. Task Manager was the highest CPU consumer at 5.5%.

When I sorted processes by memory usage, Windows PowerShell was using the most memory at 142.8 MB, followed by Microsoft Defender at 119.8 MB. Overall memory usage was 59%.

I checked Startup apps and found that OneDrive and VMware Tools both had high startup impact. I also checked Task Scheduler and found scheduled tasks for Microsoft Edge updates and OneDrive.

I investigated OneDrive further, but it was using 0% CPU and approximately 7.1 MB of memory. I did not find evidence that it was causing the reported slowdown.

**Action taken:** No processes or startup applications were disabled because none showed excessive resource usage during the investigation.

**Before/after comparison:** Initial CPU usage was 9% and memory usage was 60%. During the later measurement, CPU usage was 3% and memory usage was 59%. These values changed without any corrective action and do not establish that the reported slowdown was resolved.

**Next action:** I would test Outlook and browser performance on Alex's actual workstation, monitor resource usage while the slowdown occurs, and investigate further if the problem continues.

## Troubleshooting Narrative

**1. What went wrong across the queue, or what was the most significant issue you encountered?**

The biggest problem I ran into was that the issues described in the tickets were not showing up on the midterm VM. The cashier account was missing, the audio driver was working, and the network tests passed. I also couldn't find anything using an unusually high amount of resources on the slow workstation.

**2. What evidence did you check first, and why?**

I checked the network connection first to make sure the VM could communicate. After that, I used the tools that matched each ticket, including Computer Management, Event Viewer, Device Manager, PowerShell, Task Manager, and Task Scheduler. I wanted to see what was actually happening before making changes.

**3. What did you try on each ticket?**

For Ticket A, I checked the local accounts and Security event logs. For Ticket C, I checked the audio device status, driver information, and PowerShell device results. For Ticket D, I checked the IP configuration, ran four ping tests, and tested port 445. For Ticket B, I checked CPU and memory usage, startup applications, and scheduled tasks.

**4. What resolved each issue, or what would you try next if you could not resolve it?**

I couldn't confirm the reported problems on the supplied VM, so I didn't make unnecessary changes. My next step for Ticket A would be to find out where the cashier account is managed. For Ticket C, I would test the user's actual audio devices. For Ticket D, I would test the company's actual file server and HR portal. For Ticket B, I would monitor the computer while the slowdown was happening.

**5. How did you verify the result for each ticket you closed?**

I checked the results using the same tools I used during troubleshooting. Device Manager and PowerShell showed the audio device was working. The network tests showed successful basic connectivity, and Task Manager showed normal resource usage during testing. I did not mark the reported issues as resolved because I couldn't verify the fixes on the affected systems.

**6. What was the support or security impact of the issues or fixes across the queue?**

The reported issues could prevent employees from working, delay important meetings, and stop access to company resources. The cashier lockout could affect an entire shift. I avoided making changes without enough evidence because changing a working system could create additional problems. I documented what I found so the appropriate support team could continue troubleshooting.

