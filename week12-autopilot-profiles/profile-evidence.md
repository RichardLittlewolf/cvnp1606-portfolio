# Week 12 — Configuration Profile Evidence

**Policy:** `ACME-W12-ScreenLock`  
**Platform / type:** Windows 10 and later / Settings catalog  
**Ticket:** CVNP1606-W12-012

I created a Settings Catalog configuration profile in Microsoft Intune to enforce **Interactive Logon Machine Inactivity Limit = 900 seconds**. Windows locks the session after 15 minutes of inactivity, helping protect ACME data when employees leave their computers unattended.

I assigned the profile to **ACME-Pilot-Devices**, an active Entra device group with one device and no additional assignment filter. Using a pilot group lets IT validate the setting on a small number of devices before a wider rollout.

I verified the configured setting and group assignment using screenshots from the Intune portal. The initial report showed `1606MIDTERM` as **Pending**, because the device had not checked in since November 8. After starting the separate midterm VM and syncing it, Intune showed a new check-in on **November 15, 2026, at 4:15 PM**. The device's **Device configuration** page then showed `ACME-W12-ScreenLock — Succeeded`.

Without this policy, unattended devices could remain unlocked longer than ACME intends. An incorrect setting or assignment could leave intended devices unprotected. The test VM still reports **Not compliant** overall; policy success and device compliance are separate results.
