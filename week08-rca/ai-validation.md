# Week 08 - AI Validation

## AI Tool Used
ChatGPT (OpenAI)

## How I Used AI
I used ChatGPT to help organize my Week 08 portfolio, understand Windows Event IDs 41, 6008, and 1001, write PowerShell commands, and format my event timeline, root-cause analysis, and troubleshooting narrative.

## How I Verified the Results
I checked the information against Event Viewer and my actual PowerShell output. I confirmed the event IDs, timestamps, sources, and descriptions before adding them to my documentation. I also used Get-Content to verify that my exported evidence and Markdown files were saved correctly.

## Suggestion I Accepted
I accepted the suggestion to use Get-WinEvent to export the reboot-related events because it provided actual Windows log evidence for my timeline.

## Suggestion I Revised
I revised the original investigation after the clean VM had no matching reboot events. I performed a controlled VM power-off simulation and collected new evidence instead.

## Suggestion I Rejected
I rejected the suggestion that I needed to transfer my evidence from the guest VM to the host computer. My portfolio folder was already inside the VM, so transferring files was unnecessary.

## Final Validation
The lab evidence came from my Windows VM, ACME11. The forced shutdowns were part of a controlled simulation and do not prove what caused the original cashier workstation incident. I reviewed the generated documentation against the logs before submission.
