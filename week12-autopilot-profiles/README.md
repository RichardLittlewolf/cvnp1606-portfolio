# Week 12 — Autopilot, Provisioning, and Configuration Profiles

**Course:** CVNP1606 — Windows 11 Administration  
**Ticket:** CVNP1606-W12-012  
**Scenario:** ACME needs a repeatable zero-touch process for new-hire laptops, including Emily's deployment, plus a testable Intune configuration policy.

## Work performed

- Restored the VMware `CVNP1606-Lab` snapshot `W01_CleanBaseline`, reached the Windows desktop, and documented later startup crashes. A Windows update later appeared to stabilize that guest, but long-term stability was not tested.
- Compared **user-driven**, **self-deploying**, and **pre-provisioning (White Glove)** Autopilot modes for four ACME cases in `deployment-decision-tree.md`.
- Created `ACME-W12-ScreenLock` in the **ACME LAB** Intune tenant as a **Windows 10 and later / Settings catalog** configuration profile.
- Set **Local Policies Security Options → Interactive Logon Machine Inactivity Limit = 900 seconds**, a 15-minute inactivity lock.
- Assigned the policy to the active **ACME-Pilot-Devices** device group (one device; no additional filter).
- Tested the target device **1606MIDTERM**. Initially its assignment showed **Pending**, and the last check-in was November 8. After the VM was brought online and synced, Intune showed a **November 15, 2026, 4:15 PM** check-in. **Device configuration** then showed `ACME-W12-ScreenLock — Succeeded`.
- Documented the full proposed Autopilot enrollment process and verification steps for a subsequent cohort. Hardware-hash import and production ESP deployment were documented as procedures, not performed in this lab.

## Tools used

VMware Workstation Pro; Windows 11 lab and midterm VMs; Microsoft Intune admin center; Entra device groups; Windows host browser; Git/GitHub portfolio workflow.

## Evidence

| File | What it shows |
| --- | --- |
| `Screenshots/W12-01-CleanBaseline-Snapshot.png` | `W01_CleanBaseline` in VMware Snapshot Manager |
| `Screenshots/W12-02-CleanBaseline-Desktop.png` | Windows desktop after snapshot restore |
| `Screenshots/W12-03-ScreenLock-Settings.png` | Correct inactivity setting = 900 seconds |
| `Screenshots/W12-04-Profile-Assignments.png` | `ACME-Pilot-Devices` targeted, no filter |
| `Screenshots/W12-05-Profile-Verification-Pending.png` | Initial generated report: target device Pending |
| `Screenshots/W12-05-Profile-Verification-Succeeded.png` | Final per-device report: `ACME-W12-ScreenLock` Succeeded |
| `Screenshots/W12-06-Device-Last-Checkin.png` | Earlier stale check-in and Not compliant status |
| `Screenshots/W12-07-Device-Configuration-Status.png` | Earlier monitor panel before the new device check-in |
| `Screenshots/W12-08-Policy-Created.png` | Profile listed in Intune |
| `Screenshots/W12-09-Device-List.png` | Initial enrolled device list |
| `Screenshots/W12-10-Device-New-Checkin.png` | Device checked in again on November 15 |

## Deliverables

- `deployment-decision-tree.md` — four Autopilot choices with alternatives
- `profile-evidence.md` — security setting, pilot scope, successful verification, support impact
- `repeatable-deployment-note.md` — complete numbered procedure
- `troubleshooting-narrative.md` — six troubleshooting answers
- `ai-validation.md` and `ai-disclosure.md` — transparent AI assistance and on-device validation
- **Still required:** the course's `collect-evidence.ps1` and generated `evidence-report.txt` — run the original course script before committing

## What I Can Do Now

I can select an appropriate Autopilot deployment mode for ACME's different device needs, configure and target a Windows security policy in Intune, check that it applied, and document the process so another technician can repeat it.

## AI disclosure

I used ChatGPT to help organize the decision tree and documentation and to interpret the Intune screens. I validated the policy name, inactivity setting, target group, new check-in, and final **Succeeded** result against the live Intune portal. I corrected an initial mistaken account-lockout setting before publishing. Details are in `ai-validation.md` and `ai-disclosure.md`.

## Remaining production limitations

- `1606MIDTERM` showed **Not compliant** as of its latest overview screenshot, even though this **one configuration profile succeeded**. Investigate any outstanding compliance requirements separately.
- Live Autopilot hardware-hash registration, profile assignment for the hypothetical Riverside devices, and ESP first-boot completion were not demonstrated in this lab. The procedure describes how to verify them in production, without claiming they were completed.
- The official course `collect-evidence.ps1` still needs to run, and its `evidence-report.txt` needs to show all files FOUND before GitHub submission.
