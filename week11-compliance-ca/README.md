# Week 11 — Compliance, Conditional Access, Windows Hello, and LAPS

**Ticket:** CVNP1606-W11-011  
**Environment:** ACME Lab student tenant  
**Test device:** 1606MIDTERM  
**Date:** November 8, 2026

## Portfolio summary — review and personalize in your own words

In this lab, I created a Windows compliance policy in Intune, assigned it to a pilot device group, and reviewed why one of my test devices failed. I found that BitLocker was noncompliant while Microsoft Defender and the Windows version passed. I also analyzed how Conditional Access would use that compliance result, although my tenant's Entra Free license prevented me from creating the report-only CA policy.

## Objective and outcome

ACME wants managed, encrypted, compliant Windows devices accessing Microsoft 365. I created `ACME-Windows-Baseline-Compliance` in Intune and assigned it to the `ACME-Pilot-Devices` security group, which contained my test device `1606MIDTERM`. Intune evaluated the policy on that device and returned **Not compliant** because the BitLocker check failed; the minimum OS and Defender antimalware checks passed.

I attempted to access Conditional Access in the ACME Lab tenant. Entra displayed an access error specifying that Entra ID P1 or P2 is required. **I did not create a live CA policy or obtain report-only sign-in events.** I documented the intended policy design and the licensing blocker in `conditional-access-memo.md`.

## Compliance policy

| Configured setting | Required value | Observed result on 1606MIDTERM |
|---|---|---|
| Require BitLocker | Require | Not compliant |
| Minimum OS version | 10.0.19041 | Compliant (device OS 10.0.22631.6199) |
| Microsoft Defender Antimalware | Require | Compliant |

**Assignment:** `ACME-Pilot-Devices`, created as an assigned security group with one test device.  
**Action for noncompliance:** Mark device noncompliant — Immediately.

The Intune screen confirms the failed BitLocker setting, **but does not show an underlying local encryption diagnostic**. I did not enable BitLocker or verify its local `manage-bde` state in this exercise; no remediation was claimed.

## Conditional Access design — analyzed, not deployed

| Parameter | Intended report-only value |
|---|---|
| Name | `ACME-Require-Compliant-Device-Report` |
| Users | Test user only; not All users |
| Target resources | Office 365 |
| Grant | Require device to be marked as compliant |
| Policy state | Report-only (not On) |

The portal displayed **"You don't have access"** and specified that Microsoft Entra ID P1 or P2 is required. Consequently, there is no live Conditional Access policy screenshot, no report-only sign-in evaluation, and no evidence that Microsoft 365 access was actually blocked. See `screenshots/10-conditional-access-license-block.png`.

## Evidence index

- `screenshots/01-clean-baseline-snapshot.png` — W01 baseline snapshot.
- `screenshots/02-clean-baseline-desktop.png` — restored VM desktop.
- `screenshots/03-compliance-policy-review.png` — Intune policy configuration and immediate noncompliance action.
- `screenshots/04-compliance-bitlocker-os.png` — BitLocker and minimum OS version settings.
- `screenshots/05-compliance-defender.png` — Defender Antimalware setting.
- `screenshots/06-pilot-group-created.png` — ACME-Pilot-Devices security group in Entra.
- `screenshots/07-managed-device-noncompliant.png` — enrolled Windows test device shown as noncompliant.
- `screenshots/08-policy-applied-to-device.png` — new compliance policy attached to the device.
- `screenshots/09-per-setting-compliance-results.png` — BitLocker failed; Defender and OS passed.
- `screenshots/10-conditional-access-license-block.png` — CA blocked by missing P1/P2 licensing.

**Remaining evidence to capture:** A current screenshot of Intune **Assignments → Included groups → ACME-Pilot-Devices** and the VM **Settings → Accounts → Sign-in options** page for Windows Hello. These were not in the screenshots provided when this folder was built.

## Additional submitted notes

- `compliance-policy-summary.md` — configuration and observed device results.
- `conditional-access-memo.md` — impact on Emily Park and report-only rationale.
- `laps-hello-note.md` — two endpoint identity controls and ACME relevance.
- `security-exception-template.md` — blank, time-limited exception form.
- `troubleshooting-narrative.md` — six written troubleshooting answers.
- `ai-disclosure.md` — AI assistance statement and verification responsibilities.
- `mission-flags.md` — three simulated checkpoint flags.

## Evidence collection and submission

Before submitting, copy the instructor-provided `collect-evidence.ps1` into this folder, run it as administrator per the assignment instructions, check for zero `NOT FOUND` entries, and commit the resulting `evidence-report.txt` along with these files to the GitHub portfolio `week11-compliance-ca/` folder. The evidence script and report are **not included** in this draft package because they have not yet been provided or executed.

**Important:** Verify each written statement and screenshot against your actual tenant before submission. Redact any personal emails, tenant IDs, passwords, or recovery keys if additional screenshots are added. All evidence here is from user-provided screenshots; no live verification was performed by the drafting assistant.
