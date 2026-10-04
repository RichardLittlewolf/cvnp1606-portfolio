\# Week 6 - Networking and Remote Support



\## Scenario



Emily Park is a remote ACME employee who could not reach the ACME intranet or shared drives. Some outside websites were still working, so I needed to determine whether the problem was related to the IP address, gateway, DNS, or another network service.



\## Simulated Fault



I changed the DNS server on the Windows 11 VM to 1.2.3.4 while leaving the IP address and default gateway unchanged. I chose this fault so I could test whether the computer still had network access even though name resolution was not working.



\## Tools Used



\- `ipconfig /all`

\- `ping`

\- `nslookup`

\- `Test-NetConnection`

\- `ipconfig /flushdns`

\- Windows Network Adapter Settings

\- PowerShell



\## Root Cause



The DNS was set to 1.2.3.4 and nslookup timed out. I could still ping 8.8.8.8. I changed the DNS back to 192.168.145.2 and it started working again.



\## Diagnostic Results



The computer had an IPv4 address of 192.168.145.129 and a default gateway of 192.168.145.2.



The default gateway responded to all four ping requests with 0% packet loss.



The computer also successfully pinged 8.8.8.8 with 0% packet loss. This showed that the computer still had network access using an IP address.



The `nslookup acme.internal` test timed out while the DNS server was set to 1.2.3.4.



After changing the DNS setting back to 192.168.145.2 and flushing the DNS cache, `nslookup www.microsoft.com` successfully returned IP addresses.



\## Evidence



\- DNS fault configuration before diagnostics

\- `ipconfig /all` showing DNS server 1.2.3.4

\- Successful default gateway ping

\- Successful ping to 8.8.8.8

\- Failed DNS lookup while using 1.2.3.4

\- `Test-NetConnection` results

\- `connectivity-evidence.txt`

\- DNS settings after the fix

\- Successful DNS lookup after the fix



\## Escalation



Basic network troubleshooting such as checking IP and DNS settings, running ping tests, flushing the DNS cache, restarting the adapter, and using the Windows troubleshooter are within Tier 1 support.



Changes to VPN servers, firewall rules, or other network infrastructure would be escalated to the network or systems team. More details are included in `escalation-note.md`.



\## Troubleshooting Narrative



1\. \*\*What fault did you simulate and what symptom did it produce?\*\*



&#x20;  I changed the DNS server to 1.2.3.4. The computer could still reach IP addresses, but DNS lookups timed out.



2\. \*\*Which diagnostic command gave you the first clear signal of the fault layer?\*\*



&#x20;  `nslookup acme.internal` gave me the clearest signal because it timed out while trying to use DNS server 1.2.3.4.



3\. \*\*What did you try first to resolve it?\*\*



&#x20;  I changed the DNS setting back to the original address of 192.168.145.2 and flushed the DNS cache.



4\. \*\*What confirmed the fix worked, or what would you try next if it did not?\*\*



&#x20;  `nslookup www.microsoft.com` worked after I restored the DNS setting and returned IP addresses.



5\. \*\*How did you verify the result after the fix?\*\*



&#x20;  I ran `ipconfig /all` to make sure the DNS server was back to 192.168.145.2 and then used `nslookup www.microsoft.com` to confirm that name resolution worked.



6\. \*\*What was the support or business impact of leaving this issue unresolved?\*\*



&#x20;  Emily would not be able to reach ACME resources or shared drives, which would prevent her from completing work that depends on those resources.



\## What I Can Do Now



I can use Windows networking tools to find whether a connection problem is caused by the IP address, gateway, DNS, or a network service and explain the solution to a remote user in simple steps.

