# Week 08 - Event Logs and Root-Cause Analysis

## Support Ticket
- Ticket: CVNP1606-W08-008
- Customer: Riley Chen, ACME Branch Manager
- Reported workstation: ACME-W11-POS01
- Lab system: ACME11
- Priority: High
- Investigation date: October 18, 2026

## Root-Cause Analysis

### Hypothesis
The event logs show that Windows experienced two unexpected shutdowns. The most likely explanation for the simulated shutdowns is the forced power-off performed during testing. However, a separate hardware-related bugcheck was also recorded, so not every event can be attributed to power loss without further investigation.

### Supporting Evidence
Event ID 41 from Kernel-Power was recorded at 3:14:03 PM and 4:08:10 PM. Both events indicate Windows restarted without completing a proper shutdown. Event ID 6008 from EventLog appeared at 3:15:35 PM and 4:08:13 PM, confirming that the previous shutdowns were unexpected. Event ID 1001 was also recorded at 4:08:12 PM with bugcheck code 0x00000124. Windows saved a crash dump that could provide more information about that error.

### Alternative Causes
Other possible causes include hardware problems, driver failures, Windows crashes, and unstable power. The controlled power-off explains the expected unclean-shutdown events, but the 0x00000124 bugcheck suggests a hardware-related error may also have occurred. The available logs do not identify a specific failed component.

### Escalation
I would escalate this ticket if unexpected shutdowns continued without a controlled power interruption, if additional bugcheck events appeared, or if hardware diagnostics found a problem. A senior technician should analyze the crash dump and investigate the power supply, drivers, and hardware before determining a permanent fix.

## What I Can Do Now
I used Event Viewer and PowerShell to investigate unexpected Windows shutdowns, organize the evidence into a timeline, and document findings that could help a support team determine the cause of a workstation failure.
