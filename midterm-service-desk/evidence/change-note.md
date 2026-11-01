# Ticket C — Audio Driver Change Note

**Status:** Investigation completed — reported failure not reproduced

**Reported Issue:** Emily's audio device stopped working after a Windows Update. She has a video call in two hours.

**Evidence Checked:** I opened Device Manager and checked the High Definition Audio Device. There was no yellow warning triangle, and Windows reported that the device was working properly. I also used PowerShell to check device status, and the currently present audio device showed OK.

**Driver Information:**
- Provider: Microsoft
- Driver date: October 19, 2023
- Driver version: 10.0.22621.2506

**Change Decision:** I did not update or uninstall the driver because Windows was not reporting any problems. The Roll Back Driver option was grayed out, so rolling back was not available. I didn't want to make unnecessary changes to a working device.

**Approval:** No driver change was made, so no change approval was required.

**Rollback Plan:** If a future driver update causes problems, I would restore the previous working driver if available or reinstall an approved compatible driver.

**Verification:** Device Manager and PowerShell both reported that the device was working properly. I did not test actual audio playback or recording, so I cannot confirm that Emily's reported issue was resolved.

**Next Steps:** I would test audio playback and the microphone on Emily's actual workstation. If the problem continues, I would investigate further or escalate the ticket with the evidence collected.