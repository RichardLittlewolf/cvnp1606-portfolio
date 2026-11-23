# Week 13 — App Deployment Worksheet

**Ticket:** CVNP1606-W13-013  
**Status:** Instructor-provided **simulated app configuration** analyzed; a real Win32 app was not found in the ACME LAB tenant when checked.

| Required field | Documented answer |
|---|---|
| **1. App name and version** | Contoso Field Tools **2.1** — instructor's scenario application. |
| **2. Source type** | Win32 application, created by wrapping `ContosoFieldTools_2.1.exe` with `IntuneWinAppUtil.exe` into `ContosoFieldTools_2.1.intunewin`. |
| **3. Silent install switch** | `ContosoFieldTools_2.1.exe /quiet /norestart`. `/quiet` suppresses the installation interface; `/norestart` suppresses an automatic restart. These commands came from the course exercise and were **not tested against a real vendor installer**. |
| **4. Detection rule type and logic** | **Registry**, path `HKLM\SOFTWARE\Contoso\FieldTools`, value name `Version`, method **String comparison**, expected string `2.1`. Intune checks that the registry value matches `2.1` to decide that the app is installed. |
| **5. Target group name** | **Required** → `Remote-Sales-Users` in the scenario; **Available** → `All ACME Devices` in the scenario. These group assignments are not verified in the user's live tenant. |
| **6. Assignment type and reason** | **Required** for remote sales users because the department tool must arrive automatically before an agreed deadline. **Available** for other eligible users to install from Company Portal. The exercise uses an illustrative deadline of **May 21, 2026, at 08:00** (historical scenario, not a proposed new deployment date). Install context: **User**. |
| **7. Failure behavior** | If the registry path is missing, the Version value differs, or the installer writes to another location, Intune cannot detect the installed app. After an attempted install, it can report failure and may retry the required installation on later evaluations, creating unnecessary repeat installs. Check the installer command, registry value, install context, and IME logs. |

## Verification of the simulated scenario

The mission dashboard shows **ACME-MO-7731** with **Installed / Succeeded**, last modified **May 18, 2026, at 09:14**, and an illustrative IME exit code **0** and passed detection rule. This supports answers about the course scenario only. It is **not a claim that this app was deployed to the live ACME LAB tenant**.

## Real-tenant verification to complete

The actual Intune Windows apps page displayed **No data found**, so live Program, Detection rules, and Assignments screenshots remain outstanding. If an approved sample/installer is used later, replace the simulated answers above with its actual version, package details, install command, detection logic and real assigned Entra group, then attach portal screenshots.
