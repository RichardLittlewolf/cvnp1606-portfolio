# Week 13 — Intune Application Lifecycle

**Course:** CVNP1606 — Windows 11 Administration  
**Ticket:** CVNP1606-W13-013  
**Scenario:** ACME Managed Endpoint Fleet / Intune  
**Date:** November 22, 2026

## Scenario summary

ACME employees are reporting inconsistent application availability. Riley requested a documented Win32 deployment approach with detection and assignment rules. Emily cannot find a required department app, and Maya must approve any production deployment. The goal is to show how an application is packaged, assigned, detected, monitored, and safely rolled back.

## Tools used

- VMware Workstation (CVNP1606-Lab / Week 1 baseline)
- Microsoft Intune admin center in a host-computer browser
- Microsoft 365 Apps configuration wizard
- Week 13 interactive App Deployment Planner
- GitHub portfolio (submission destination)

## Steps and results

1. Restored the CVNP1606-Lab VM to its Week 1 clean baseline. Captured a post-restore desktop image. The VM later rebooted unexpectedly, so cloud-only work continued from the host computer. A snapshot-manager image remains to be captured.
2. Confirmed the ACME LAB Intune tenant could open **Apps > Windows apps**. The list displayed **No data found**; this was not an already configured live Win32 app.
3. Opened **Create > Microsoft 365 Apps for Windows 10 and later** and reviewed settings without publishing. Selected eight apps, 64-bit, Office Open XML, latest version, and **Monthly Enterprise Channel**. Screenshot captured.
4. Completed the Week 13 interactive mission and quiz. Reviewed the instructor's *simulated* Contoso Field Tools 2.1 deployment example, including the packaging workflow, a registry detection rule, Required/Available assignment scenarios, and managed-app verification. These values were not observed as a real app in the ACME LAB Intune tenant.
5. Documented the simulated app's seven deployment worksheet fields, proposed change control, and Microsoft 365 Apps governance in the files below.

## Evidence index

| File | What it supports | Evidence type |
|---|---|---|
| `Screenshots/W13-CleanBaseline-Desktop.png` | Windows desktop after Week 1 restoration | Live VM screenshot |
| `Screenshots/W13-M365-Apps-Configuration.png` | Microsoft 365 Apps wizard settings and Monthly Enterprise Channel | Live Intune configuration review (not deployed) |
| `Screenshots/W13-Intune-Windows-Apps-No-Data.png` | Actual ACME LAB Windows apps list at the time of review | Live Intune screenshot |
| `Screenshots/W13-Intune-Trial-Extension.png` | Trial active through December 31, 2026 with recurring billing off | Live admin screenshot |
| `Screenshots/W13-Mission-Simulated-Dashboard.png` | Contoso detection, assignments and status in course exercise | **Simulation; not live Intune proof** |

## Deployment worksheet and change control

- [App deployment worksheet](app-deployment-worksheet.md)
- [Microsoft 365 Apps configuration summary](m365-apps-config-summary.md)
- [Change-control note](change-control-note.md)
- [Simulation verification note](app-deployment-verification-note.md)
- [AI validation](ai-validation.md)
- [AI disclosure](ai-disclosure.md)

## Repeatable Win32 application process

1. Obtain a trusted vendor installer and record its version and license requirements.
2. Package the installer with the Microsoft Win32 Content Prep Tool (`IntuneWinAppUtil.exe`) to produce an `.intunewin` file.
3. In Intune, choose **Apps > Windows apps > Create > Windows app (Win32)** and upload the package.
4. Set the name, publisher, silent installation and removal commands, and installation context.
5. Configure and test a detection rule (registry, file, or MSI product code) that matches what the installer actually creates.
6. Start with a limited pilot group, use **Required** for mandatory software or **Available** for self-service, and avoid conflicting deployment intentions.
7. Monitor the pilot in Intune, check device installation status and timestamps, verify the detection rule, and review the Intune Management Extension log on any failed device before expanding the assignment.
8. If a significant issue occurs, stop the Required rollout and, where appropriate, use a tested **Uninstall** assignment for the affected group.

## Troubleshooting narrative

1. **What went wrong or might go wrong?** The actual Intune app list had no existing Windows app available to analyze, and the VM repeatedly restarted after a baseline restore. In the mission scenario, a missing or incorrect detection rule could lead to application reinstall attempts.
2. **First evidence checked:** The Intune Windows apps list and Microsoft 365 configuration wizard; the instructor's sample showed Intune app properties, assignments, managed-device state, and IME logs.
3. **What was tried?** Instead of continuing to fight an unstable VM, reviewed the cloud-side configuration using the host browser and worked through the interactive sample.
4. **Fix or next action:** Obtain an instructor-supplied `.intunewin` sample or package an approved vendor application, then configure real detection and assignments for a pilot group.
5. **Verification:** For the M365 review, the channel choice was verified by screenshot. Live Win32 detection and installation were **not yet verified**; the mission's sample verification is labeled as simulated.
6. **Support impact:** Good detection and assignment documentation prevents missing-app tickets, unnecessary reinstalls, and unmanaged production changes.

## What I Can Do Now — portfolio card

I used Microsoft Intune to review application settings for ACME, explain how Win32 detection and assignments work, and document a controlled rollout so technicians can troubleshoot missing apps without guessing.

## AI use

AI helped organize the evidence and draft the portfolio documents. Settings observed in the real Intune portal are separated from instructor-provided simulated data. See `ai-validation.md` and `ai-disclosure.md`.

## Remaining submission blockers (do not mark complete prematurely)

- [ ] Capture the Snapshot Manager view of `W01_CleanBaseline`, if accessible without triggering VM problems.
- [ ] Obtain and configure a **real Win32 app**, or obtain the instructor's accepted app sample, and capture the **Program**, **Detection rules**, and **Assignments** pages. The course simulation does not replace live deployment evidence unless the instructor explicitly permits it.
- [ ] Update the worksheet and change-control note with actual app, group, commands and detection values, if different from the sample.
- [ ] Copy the instructor's actual `collect-evidence.ps1` into this folder and run it in PowerShell; review `evidence-report.txt` for `NOT FOUND`. Do not invent that report.
- [ ] Add the Week 13 portfolio card to the repository's top-level README, commit to `main`, and submit the repo URL in Brightspace.
