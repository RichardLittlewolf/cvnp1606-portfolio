# Week 08 - Event Timeline

**System:** ACME11
**Date:** October 18, 2026
**Evidence:** Windows System log, Event Viewer, and Get-WinEvent

| Timestamp | Event ID | Source | Level | Meaning |
|---|---|---|---|---|
| 2026-10-18 15:14:03 | 41 | Microsoft-Windows-Kernel-Power | Critical | Windows detected that the previous shutdown was not completed cleanly. |
| 2026-10-18 15:15:35 | 6008 | EventLog | Error | Windows reported an unexpected previous shutdown at 3:02:17 PM. |
| 2026-10-18 16:08:10 | 41 | Microsoft-Windows-Kernel-Power | Critical | Windows detected another unclean shutdown. |
| 2026-10-18 16:08:12 | 1001 | Microsoft-Windows-WER-SystemErrorReporting | Error | Windows reported bugcheck 0x00000124 and saved a crash dump. |
| 2026-10-18 16:08:13 | 6008 | EventLog | Error | Windows reported an unexpected previous shutdown at 3:16:28 PM. |

## Timeline Summary

The System log confirms two unexpected shutdowns, supported by Event IDs 41 and 6008. Event ID 1001 also reports a hardware-related bugcheck (0x00000124). The shutdowns were investigated during a controlled VM simulation. The evidence confirms unclean shutdowns but does not establish one underlying cause for every event. Additional investigation of the crash dump would be needed to determine the cause of the bugcheck.
