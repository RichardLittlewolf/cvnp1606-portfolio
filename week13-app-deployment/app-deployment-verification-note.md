# App Deployment Verification Note — Course Simulation

> **Important:** This is the interactive mission's simulated device data, not verification from the live ACME LAB tenant.

## App details

Contoso Field Tools **2.1** was packaged from `ContosoFieldTools_2.1.exe` using `IntuneWinAppUtil.exe` as a **Win32 (.intunewin)** application.

## Assignment configuration

The simulation shows a **Required** assignment to **Remote-Sales-Users**, **User** installation context, with an instructional deadline of **May 21, 2026, 08:00**. The same scenario shows an **Available** assignment to **All ACME Devices** without a deadline.

## Installation status

For simulated device **ACME-MO-7731**, Intune Managed apps shows **Installed / Succeeded**, with **Last modified: May 18, 2026, 09:14**.

## Detection rule result

Registry rule: `HKLM\SOFTWARE\Contoso\FieldTools`, value `Version` string equals `2.1`. The sample Intune Management Extension excerpt reports installer exit code **0** and **Detected**, indicating that the sample device passed the detection check.

**Conclusion:** The course example meets all four elements of a verification note. A real deployment cannot be called verified until its actual Intune and endpoint evidence has been collected.
