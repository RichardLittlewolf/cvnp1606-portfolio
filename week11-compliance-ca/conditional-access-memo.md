# Conditional Access memo — CVNP1606-W11-011

**To:** Jordan Lee, Nexus Support Services  
**Subject:** Protecting access from noncompliant devices

## For Emily Park — what you would experience

If ACME enforced a Conditional Access policy requiring a compliant device, Outlook might display a message saying your device does not meet the organization's security requirements. Because your personal computer is not enrolled in Intune, it cannot demonstrate that it meets ACME's compliance checks. The help desk would first confirm the sign-in problem, then help you use an approved managed device or follow an authorized enrollment process. We would not bypass the control without approval.

## For Jordan Lee — technical response and rollout

Intune determines whether each enrolled device meets requirements such as BitLocker, Defender, and the minimum Windows version. Conditional Access can use that status when deciding whether a Microsoft 365 sign-in should succeed. Report-only mode is a safer first step: it records which sign-ins would be affected without actually blocking employees. The team can review logs, verify the pilot group, and resolve unexpected failures before enforcement. Any necessary exception should be approved, documented, temporary, and supported by compensating controls.

**Lab limitation:** The ACME tenant returned an Entra ID P1/P2 licensing error. I analyzed the report-only policy but could not create or test it live.
