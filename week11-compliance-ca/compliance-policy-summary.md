# Compliance policy summary — CVNP1606-W11-011

**Policy:** ACME-Windows-Baseline-Compliance  
**Platform:** Windows 10 and later; Windows 10/11 compliance policy  
**Assigned security group:** ACME-Pilot-Devices (one test device)  
**Evaluated device:** 1606MIDTERM  
**Date checked:** November 8, 2026

| Setting | Required value | Actual/observed condition | Intune result |
|---|---|---|---|
| BitLocker | Require | Intune returned Not compliant; the screenshot did not display the underlying local protection status or the exact error reason | **Not compliant** |
| Minimum OS version | `10.0.19041` | Windows `10.0.22631.6199`, above the specified minimum | **Compliant** |
| Microsoft Defender Antimalware | Require | Intune reported compliant; no local Defender details were captured | **Compliant** |

**Overall result: Not compliant.** One failed required setting is sufficient to fail this compliance policy. The default device-compliance policy separately displayed Compliant, but the newly created ACME baseline displayed Not compliant.

**Noncompliance action:** Mark device noncompliant — Immediately. This changes its compliance status without a configured grace period. The device's cloud-app access is **not automatically blocked by Intune alone**; that would require a relevant Conditional Access policy in an enforceable state.

**Potential cause:** BitLocker protection may be disabled or not meeting attestation requirements, but the provided portal view does not establish the local root cause. To investigate further, check `manage-bde -status C:` on the actual test device, verify protection and encryption, preserve the recovery key securely if enabling encryption, and sync before rechecking in Intune. **None of these remediation steps is claimed as completed here.**

**Evidence:** `screenshots/03-compliance-policy-review.png`, `screenshots/07-managed-device-noncompliant.png`, `screenshots/08-policy-applied-to-device.png`, `screenshots/09-per-setting-compliance-results.png`.
