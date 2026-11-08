# Week 11 troubleshooting narrative — six questions

## 1. Which compliance settings were configured, and which failed?

I configured Require BitLocker, a minimum Windows version of `10.0.19041`, and Require Microsoft Defender Antimalware. On device `1606MIDTERM`, Defender and the OS version passed, but BitLocker was marked Not compliant. In practice, that means the device does not meet ACME's encryption requirement; my Intune screenshot did not show the precise local cause.

## 2. What did the Conditional Access sign-in log show?

I could not access the Conditional Access policy page because my student tenant required an Entra ID P1 or P2 subscription. Therefore, I could not create the report-only policy or capture a report-only sign-in log. If it were configured, I would expect the report-only evaluation to indicate whether the sign-in would satisfy the compliant-device control without actually blocking the user.

## 3. What is the difference between Entra registration and Intune enrollment?

Entra registration identifies a device in the identity directory and can support sign-in scenarios, but it does not by itself mean the device is managed by Intune. Intune enrollment enables device management and compliance evaluation. Emily Park's registered but unenrolled personal device would not have the required managed compliance state, so it would be at risk of denied access under a live compliant-device CA requirement.

## 4. Who is most at risk if the CA policy is turned On tomorrow?

Users signing in from unmanaged, unenrolled, or noncompliant devices are most likely to lose access to the targeted cloud applications. My own test device was marked Not compliant because of BitLocker. Before enforcing the rule, I would limit the scope to a test group, use report-only evaluations where licensed, review logs and compliance reports, and notify affected users with instructions to remediate.

## 5. When might a security exception be appropriate, and what must it document?

A short-term exception might be justified for a business-critical device that cannot meet one requirement before a fixed deadline, provided there is no reasonable compliant alternative. The exception must identify who or what it applies to, why it is necessary, the exact control waived, a firm expiration, who approved it, and compensating controls. It should be reviewed and removed as soon as the device can meet the policy.

## 6. What would be different for a real 500-device organization?

I would not apply a new compliant-device gate to everyone immediately. I would inventory the fleet, validate license coverage, pilot policies with a small group, use report-only logs and communication to find disruption risks, then expand in stages with an approved remediation and rollback plan. I would also establish emergency administrative access safeguards before enforcing access policies.
