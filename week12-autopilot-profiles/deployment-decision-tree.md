# Week 12 — Autopilot Deployment Decision Tree

**Ticket:** CVNP1606-W12-012  
**Business requirement:** Choose a reproducible enrollment path for ACME devices while minimizing technician time.

## Decision tree

1. **Is this a shared, userless device (such as a kiosk)?** If yes, choose **self-deploying**, provided the physical device supports TPM 2.0 attestation.
2. **Will IT or the warehouse deliberately stage apps and policies before the employee receives the device?** If yes, choose **pre-provisioning (White Glove)**: IT completes the device phase and the employee completes the user phase.
3. **Otherwise, does a named employee sign in to set up the laptop?** Choose **user-driven** Autopilot. The employee signs in with company credentials and the device enrolls using assigned policies.

## Four ACME scenarios

### 1. New hire receives a laptop at the ACME office
- **Mode:** User-driven.
- **Why:** This is a laptop for a specific employee. The employee signs in with Microsoft Entra credentials during OOBE, and Intune supplies the assigned configuration.
- **Unsuitable alternative:** Self-deploying. It is intended for shared/userless endpoints and would not provide the normal named-user onboarding flow.

### 2. Break-room kiosk with no assigned employee
- **Mode:** Self-deploying.
- **Why:** The kiosk should be provisioned without a particular employee signing in. Supported physical hardware uses TPM 2.0 device attestation.
- **Unsuitable alternative:** User-driven. It would require a specific user's sign-in during setup, which does not fit an unattended shared kiosk.

### 3. Remote employee gets a pre-staged warehouse laptop
- **Mode:** Pre-provisioning (White Glove).
- **Why:** Warehouse IT can stage device-targeted policies and apps before shipping, reducing first-day setup time. The employee finishes the user phase at home.
- **Unsuitable alternative:** Self-deploying. The laptop belongs to a named employee and needs a user sign-in rather than a kiosk-style deployment.

### 4. Replacement laptop after an employee's primary device fails
- **Mode:** User-driven, assuming the replacement ships directly to the employee without warehouse staging.
- **Why:** The existing employee can sign in and receive corporate settings without waiting for a technician. If IT can pre-stage the machine, pre-provisioning is another reasonable choice.
- **Unsuitable alternative:** Self-deploying. A userless setup is inappropriate for a personal replacement device.

**Production note:** These are mode recommendations, not evidence that Autopilot profiles or device hashes were registered in the live tenant.
