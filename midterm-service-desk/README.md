# CVNP1606 — Week 09 Midterm: Service Desk Surge

## Summary

For this midterm, I investigated four Windows support tickets involving an account lockout, a slow workstation, an audio driver problem, and network connectivity.

I used Computer Management, Event Viewer, PowerShell, Device Manager, Task Manager, and Task Scheduler to investigate the reported problems.

The problems described in the tickets were not reproduced on the supplied midterm VM. I documented the results I actually found and identified what would need further investigation or escalation instead of making unnecessary changes.

## What I Can Do Now

I can prioritize a mixed Windows support queue, use troubleshooting tools to gather evidence, and document my findings so other technicians can continue working on unresolved issues.

## Evidence

- `ticket-pack.md` — Four ticket investigations and troubleshooting narrative
- `ai-disclosure.md` — AI assistance disclosure
- `evidence/change-note.md` — Audio driver investigation and change decision
- `evidence/` — Screenshots supporting each ticket
- `evidence-report.txt` — Evidence collection results

## Additional Notes

The supplied VM did not reproduce several of the reported faults. The cashier account was missing locally, the audio driver reported normal status, basic network connectivity worked, and no unusual resource consumption was observed during the performance investigation.

No repairs were claimed without verification.