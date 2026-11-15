# Week 12 — AI Validation

- **What AI helped with:** Reviewing Autopilot modes, drafting the decision tree, README, repeatable deployment note, and troubleshooting narrative, and interpreting Intune screenshots.
- **What I verified on the live system:** In ACME LAB Intune I created `ACME-W12-ScreenLock`, set **Interactive Logon Machine Inactivity Limit = 900**, assigned it to `ACME-Pilot-Devices`, and captured its final **Succeeded** status in the `1606MIDTERM` device configuration report after the device checked in on November 15 at 4:15 PM.
- **One suggestion I corrected:** I initially chose **Interactive Logon Machine Account Lockout Threshold** by mistake. I removed it and selected **Interactive Logon Machine Inactivity Limit**. I verified the exact correct setting in the screenshot before creating the policy.

**Scope of validation:** A successful configuration policy is not proof of overall compliance, Autopilot device registration, or an ESP first-boot test. The device still showed **Not compliant** in the overview screenshot.
