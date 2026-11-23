# Week 13 — Change-Control Note

**Ticket:** CVNP1606-W13-013  
**Requested by:** Riley Chen, ACME IT Manager  
**Reviewer/approver:** Maya (per assignment scenario; approval not yet documented)  
**Status:** **Proposed for review — not approved and not deployed to production**  
**Prepared:** November 22, 2026

## 1. What change is being made?

Create or review a managed **Win32 application** in Microsoft Intune, with trusted packaged installation media, silent install/uninstall commands, a tested detection rule, and group-based assignments. The instructor's example is **Contoso Field Tools 2.1**, packaged as `.intunewin`, installed using `ContosoFieldTools_2.1.exe /quiet /norestart` and detected through the registry value `HKLM\SOFTWARE\Contoso\FieldTools\Version = 2.1`. These values are from the course simulation; the app is not presently confirmed in the real ACME LAB tenant.

## 2. Who is affected?

The production department in the scenario is **Remote-Sales-Users**. Other eligible users could later receive an **Available** assignment through Company Portal. The pilot should target only a small, approved subset of remote-sales accounts and their enrolled devices, not all employees or every managed device.

## 3. Pilot approach

Before any production rollout, verify the installer comes from an approved source and test the install and uninstall commands. Create or identify a small approved pilot Entra group (proposed name: `ACME-W13-App-Pilot`; **not confirmed to exist**). Assign the Win32 app as **Required** to that pilot only. Monitor installation status and the registry detection rule, confirm at least one real device can launch the app, and collect the Program, Detection rules, and Assignments screenshots. Have Maya review the evidence and approve expansion to `Remote-Sales-Users`. Do not reuse the mission's historical May 2026 deadline in a new live assignment.

## 4. Success criteria

The pilot is successful when Intune shows **Installed / Succeeded** on targeted devices with timestamps, the configured detection rule matches the actual installed app, the app opens for the pilot users, and the Company Portal or installation experience has no unexplained errors. Any failed or pending installations must be investigated before expanding to production.

## 5. Rollback plan

If the pilot app crashes or causes other issues, stop expanding the rollout and remove the **Required** assignment for the affected group. After checking that the uninstall command has been tested, target the group with an **Uninstall** assignment as appropriate; avoid conflicting assignments for the same users/devices. Confirm the app is removed, check the device status and IME logs, document incident details, and communicate with affected staff. Only reintroduce the deployment after correcting the issue and obtaining approval.

## Decision and evidence

**Approval:** Pending.  
**Production deployment:** Not performed.  
**Live Win32 portal evidence:** Not yet available; real Intune Windows apps list displayed no apps.  
**Guided M365 configuration evidence:** Captured separately in the screenshots folder.  
**Instructor simulation source:** Week 13 Contoso Field Tools 2.1 mission.
