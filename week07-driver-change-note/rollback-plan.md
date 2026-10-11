# Week 7 - Rollback Plan

## Ticket Information
Ticket: CVNP1606-W07-007
Computer: ACME11
Date: October 11, 2026
Device: Microsoft Kernel Debug Network Adapter

## Planned Change
Restore the network adapter disabled by lab-fault.ps1.

## Previous State
Device: Microsoft Kernel Debug Network Adapter
Status: Disabled - Code 22
Hardware ID: root\kdnic
Driver Provider: Microsoft
Driver Date: 6/21/2006
Driver Version: 10.0.26100.8521

## Rollback Trigger
If restoring the adapter causes additional errors or system instability, reverse the change after notifying the lead technician.

## Rollback Procedure
1. Open Device Manager using devmgmt.msc.
2. Select View - Show hidden devices.
3. Expand Network adapters.
4. Locate Microsoft Kernel Debug Network Adapter.
5. Right-click the adapter and select Disable device.
6. Confirm the action if prompted.
7. Open the device Properties window.
8. Verify that the General tab reports Code 22.
9. Confirm the driver remains version 10.0.26100.8521, dated 6/21/2006.
10. Record the rollback results in the support ticket.

## Responsibility and Notification
The assigned IT technician performs the rollback with appropriate authorization.

Notify the lead technician and ACME office manager Alex Torres of the results and any continuing problems.

## Rollback Verification
Device Manager should display the disabled-device indicator.

The General tab should report:
This device is disabled. (Code 22)

The installed driver version should remain 10.0.26100.8521.

## Escalation
If the rollback fails or causes additional issues, stop making changes and escalate to the lead technician.

Provide the device inventory, screenshots, driver information, error code, and change documentation.

## Important Limitation
This procedure reverses the simulated device enablement. It does not restore an earlier driver version.

The disabled state is not the final working configuration. After investigating any new problem, the technician should restore the adapter and verify its status.
