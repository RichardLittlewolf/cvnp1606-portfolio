# Week 08 - Troubleshooting Narrative

## 1. What was the reported problem?
Riley Chen reported that the cashier workstation ACME-W11-POS01 rebooted twice overnight without anyone logged in. Management needed evidence of the cause for an insurance audit.

## 2. What steps did you take?
I restored the W01_CleanBaseline snapshot and opened Event Viewer. I filtered the System log for Critical and Error events. At first, no reboot events were found. I then performed a controlled shutdown simulation in the lab and checked the logs again. After finding the events, I used PowerShell Get-WinEvent to export them and created a timeline.

## 3. What did you find?
I found two Event ID 41 entries showing that Windows had restarted without shutting down cleanly. Two Event ID 6008 entries confirmed unexpected previous shutdowns. Event ID 1001 also showed a bugcheck with code 0x00000124 and reported that Windows saved a crash dump.

## 4. What was your conclusion?
The logs confirm two unclean shutdowns during testing. The controlled power-off explains the simulated interruption, but the separate bugcheck indicates that an additional system error was recorded. The evidence does not prove the cause of the original cashier workstation incident.

## 5. What other causes did you consider?
I considered hardware failure, driver problems, Windows crashes, and power interruptions. The controlled power-off provides an explanation for the simulated shutdowns, but the bugcheck prevents me from ruling out a hardware-related problem. I would need more evidence before identifying a failed component.

## 6. When would you escalate?
I would escalate if unexpected shutdowns continued during normal operation, if more bugchecks occurred, or if hardware diagnostics identified a problem. A senior technician could examine the crash dump and investigate the hardware, drivers, and power system.
