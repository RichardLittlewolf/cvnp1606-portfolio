# Windows Hello for Business and Windows LAPS — Week 11 reference note

## A. Windows Hello for Business

Windows Hello for Business can replace routine password entry with a PIN or biometric gesture. Rather than treating the PIN as a password sent to a service, it uses a cryptographic credential tied to the enrolled device; a local gesture unlocks the protected private key, commonly backed by the device's TPM. A stolen password can be reused from another machine, but a Hello for Business credential cannot simply be copied and replayed elsewhere because the private key remains on its device. For ACME, this can reduce password-theft risk while making sign-in easier for staff.

A Windows Hello PIN appearing in Settings does **not by itself prove that Windows Hello for Business is provisioned**. My lab evidence still needs a screenshot of Settings → Accounts → Sign-in options and a note on whether the device is Entra joined / Hello for Business provisioned, or just using a local PIN. I did not claim that Hello for Business was deployed.

## B. Windows LAPS

Windows LAPS (Local Administrator Password Solution) protects local administrator accounts by managing a unique, strong password on each computer instead of using one shared, static local admin password across many devices. It can rotate the managed password automatically based on the configured expiration policy or through an authorized manual rotation and back up the password to Microsoft Entra ID or Active Directory, depending on the environment and setup. Only authorized staff should be able to retrieve it.

For ACME cashier kiosks, this is especially valuable. If every kiosk used the same maintenance password, one leaked password might expose all machines. LAPS limits that risk by using a different password on each kiosk and rotating it, while allowing authorized technicians to perform maintenance. A policy and access-control review would still be required before production deployment. I documented the feature's purpose; I did not deploy a LAPS policy in this lab.
