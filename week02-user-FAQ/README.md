# Windows 11 User FAQ

**Ticket ID:** CVNP1606-W02-002

This FAQ provides verified instructions for common Windows 11 questions after a system refresh. Each entry includes the user's goal, the Windows tool path tested, steps, evidence, and when the issue should be escalated.

---

## How do I make text larger in Windows 11?

**User goal:** Make text easier to read without changing unrelated system settings.

**Tool path tested:** Settings > Accessibility > Text size

**Steps:**
1. Open **Settings**.
2. Select **Accessibility**.
3. Select **Text size**.
4. Move the slider to the preferred text size.
5. Select **Apply**.
6. Confirm that the new text size is comfortable to read.

During testing, the user selected **150%** and confirmed that it was a comfortable text size.

**Evidence:**

<img width="885" height="640" alt="TextSize" src="https://github.com/user-attachments/assets/ab7da99c-5885-4987-993c-5f445ddef8dc" />

**When to escalate:** If the text is still difficult to read after adjusting the text size, check the Windows display scale and resolution. If display problems continue, collect the device and display information and escalate for driver or hardware review.

---

## How do I find and manage my printers in Windows 11?

**User goal:** Find installed printers and access printer settings after the Windows 11 refresh.

**Tool path tested:** Settings > Bluetooth & devices > Printers & scanners

**Steps:**
1. Open **Settings**.
2. Select **Bluetooth & devices**.
3. Select **Printers & scanners**.
4. Review the list of installed printers.
5. Select a printer to view or manage its settings.
6. Confirm that the expected printer appears in the list.

**Evidence:**

<img width="1009" height="711" alt="DefaultPrinter" src="https://github.com/user-attachments/assets/09a16233-4085-4eeb-b907-457073ed4768" />

**When to escalate:** If the expected printer does not appear, try adding the printer using **Add device**. If Windows cannot find or install the printer, collect the printer name, connection type, and any error messages, then escalate for printer or driver support.

---

## How do I find which apps are using the most memory?

**User goal:** Identify applications or processes that are using a large amount of system memory.

**Tool path tested:** Task Manager > Processes > Memory

**Steps:**
1. Right-click the **Start** button.
2. Select **Task Manager**.
3. Select **Processes**.
4. Locate the **Memory** column.
5. Select the **Memory** column heading to sort the processes by memory usage.
6. Review which applications or processes are using the most memory.

**Evidence:**

<img width="762" height="578" alt="Memory" src="https://github.com/user-attachments/assets/cf14d206-a6d4-4ac8-be0f-dc5a33333cc7" />

**When to escalate:** If memory usage remains unusually high or the computer continues to perform slowly after unnecessary applications are closed, document the processes using the most memory and escalate for further troubleshooting.

---

## How do I uninstall a program in Windows 11?

**User goal:** Find the list of installed programs and remove a program that is no longer needed.

**Tool path tested:** Control Panel > Programs > Programs and Features

**Steps:**
1. Open **Start**.
2. Search for and open **Control Panel**.
3. Select **Programs**.
4. Select **Programs and Features**.
5. Select the program you want to remove.
6. Select **Uninstall** and follow the prompts.

**Evidence:**

<img width="1023" height="654" alt="Uninstall" src="https://github.com/user-attachments/assets/59dd1f1c-74bb-4a06-950f-3ce5e4084505" />

**When to escalate:** If the program cannot be uninstalled, requires administrator approval, or is managed by the organization, record the application name and any error message and escalate before making additional changes.

---

## How do I check how much storage space is available?

**User goal:** Check how much storage space is being used and how much free space remains on the computer.

**Tool path tested:** Windows Search > Storage settings > System > Storage

**Steps:**
1. Open **Windows Search**.
2. Search for **Storage settings**.
3. Open **Storage settings**.
4. Review the storage information for **Local Disk (C:)**.
5. Check the amount of used and free storage space.
6. Review the storage categories if more information about disk usage is needed.

**Evidence:**

<img width="1013" height="694" alt="Storage" src="https://github.com/user-attachments/assets/fabd1b13-f7dc-46e6-8d89-396ef2eb8548" />

**When to escalate:** If the drive is critically low on space and normal cleanup options do not provide enough storage, collect the storage usage information and escalate before deleting user files or organization-managed data.
