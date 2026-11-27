# CR-6 Touchscreen firmware for Marlin 2.1.x

<img
  align="right"
  width="300"
  alt="CR-6 Touchscreen"
  src="https://github.com/user-attachments/assets/890761e5-c6df-4bf3-964c-527eb123830b">


## Do You Need This Firmware?

*If you have [a BTT SKR board with the BTT TFT](https://damsteen.nl/blog/2020/11/25/how-to-btt-skr-cr6-installation) you do not need this firmware.*

**Everyone else** needs this version of the CR6Community display firmware, to use their stock Creality CR6 TFT display with the Marlin 2.1.x software developed under Marlin Pull Request (PR)#19588.


## Background

In 2021, the CR6 community submitted [PR#19955](https://github.com/MarlinFirmware/Marlin/pull/19955) to merge the cleaned-up CF6.1 UI and extended functionality upstream. The pull request stalled as Marlin evolved from 2.0.8.x to 2.1.x, a major update that fundamentally rewrote the extui API. Consequently, the original CF6.1 handlers and UI fell out of sync and were excluded from the Marlin 2.1.x branch.

In fall 2026, the Marlin core team (led by Thinkyhead) revived the CR6 extui project as [PR#19958](https://github.com/MarlinFirmware/Marlin/pull/19958/). They rewote the extui, dgus, and Creality handlers to comply with the current API while preserving compatibility with the ReFactored CF6.1 DWIN_SET interface. The team then asked CR6 owners to flash the build, run hardware tests, and report on stability and feature parity.

Thinkersbluff engaged with that team, testing a series of adaptations, reporting issues observed, and contributing suggestions for solutions.
Thinkersbluff also established forks of both the Marlin and DWIN_SET firmwares from that PR, to facilitate maintaining a CR6Community-specific version of the UI/extui interface, in the event that there was a desire and interest from the Community to do so.

This repository hosts the curated DWIN_SET firmware Thinkersbluff used to facilitate those tests.

The default branch 'bf2_creality_CR_6_SE_PR' contains the most recently released stable version of the project.

Development branches are named 'New_At_...'.  One branch for each new version while it is still under development.  When a new version is ready to release, its 'New_At...' branch is merged into the default branch and a formal Release of that new version becomes the latest Release.
e.g. The first version of this UI firmware is being developed on the branch New_At_v2.1.0.  When that version is stable and ready for release, it will be merged with the default branch and Released as "Release_v2.1.0".

## Downloads

All CR6 printers using the stock TFT display need the exact same DWIN_SET flashed to their display, regardless of which motherboard or what modifications have been made to that printer. 

The DWIN_SET firmware is available from the Source.zip file attached to the Latest Release on this site.
A copy of the most recent release is also pushed to the original CR6Community/CR-6-touchscreen repository, which is where the comments in the Marlin Configuration.h file points users for the download.

This one version works on all CR6 stock displays, regardless of the printer motherboard.

 ## Configuring this Firmware for Your Printer
 
Flash the file T5LCFG_272480.CFG in DWIN_SET to configure the stock DWIN display for this firmware.

As with all Marlin firmware, all CR6 printer-specific configuration settings are managed through edits to the Configuration.h and Configuration_adv.h files with which the firmware.bin file is compiled.

## Installing This Firmware to your Touchscreen
___________________________________________________________________________________________
**CAUTION: If you are using a MAC to prepare the SD card and to copy DWIN_SET to the card, 
PLEASE FIRST READ [THIS FAQ](https://github.com/CR6Community/Marlin/wiki/Troubleshooting-Problems-with-Firmware-Flashing#my-screen-looks-like-this-picture-after-flashing-it)**  NOTE: It is actually the .cfg file that gets corrupted on the MAC, so you can follow the FAQ instructions to flash the CF6.1 Baseline DWIN_SET to your card and then overwrite any superceded files, from any later DWIN_SET release posted here.
__________________________________________________________________________________________

  1. Download the Source.zip file from the latest Release's Assets list
  2. Extract the DWIN_SET folder and contents from that .zip file into a new blank directory
  3. Find and read ALL of the README files BEFORE attempting to flash your display (You'll be glad you did!)
  4. Figure-out which DGUS 2 is presently running on your display (it may help you later, to know what you started with)
  5. DO NOT FLASH ANY KERNEL FILES TO YOUR DISPLAY, unless:  
    5.1 You have inadvertently "bricked" your display by flashing the DGUS2 kernel upgrade files to a display calibrated for DGUS2 v4.5+  
    5.2 Your display is running version 1.x of DGUS2, and you want to fix the text kerning (in which case, add the DGUS2 v3.5 kernel file to your DWIN_SET.)
  6. Flash your display with the DWIN_SET folder 
  7. If anything went wrong, try the TROUBLESHOOTING.MD instructions
  8. Please provide feedback in Comments or Issues, as applicable

## Contributing

If you wish to contribute to the project, please provide your inputs by raising a new Issue or by commenting on an Open Issue on this repository, and/or by contributing to the discussion on the [CR6Community Discord #lcd-discussion channel](https://discord.gg/yDY6pb2BQS)

## Credits

[InsanityAutomation](https://github.com/InsanityAutomation/Marlin/tree/CrealityDwin2.0_Bleeding) initiated the refactoring project. It is upon that work that Thinkersbluff has built this Release.

[The core CR-6 Community firmware dev team](https://github.com/CR6Community/Marlin#credits) did the heavy-lifting that resulted in the CF6.1 baseline.

Icons from [Font Awesome](https://fontawesome.com/) and [Remix Icon](https://remixicon.com/).

Font from [Google Fonts](https://fonts.google.com/specimen/B612) and customized with [FontForge](https://fontforge.org/).
