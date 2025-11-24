# CR-6 Touchscreen firmware for Marlin-bugfix-2.1.x_For_CR6
## Where is Marlin-bugfix-2.1.x_For_CR6?
Marlin-bugfix-2.1.x_For_CR6 mainboard firmware is located on the MAIN branch of this repository: https://github.com/Thinkersbluff/Marlin-bugfix-2.1.x_For_CR6.

This first pre-release of the firmware is offered for beta testing.  Use at your own risk.  Please report any Issues that you find, being careful to describe how to reproduce the problem.
There is no specific target date for completing a formal release of this updated firmware, but Thinkersbluff does hope to have something ready to offer for evaluation, before the end of 2025.

## Why do we need a new UI firmware for Marlin-bugfix-2.1.x_For_CR6?
1. Because Marlin changed some of the functionality on which the 6.1.x version of the UI depended.  It became necessary to modify some screens and introduce others, to hide or replace the deprecated functions.
2. In future releases, it is likely that the UI will need to be modified to support features that are in Marlin 2.1.x but were not present in Marlin 2.0.8.1.

## How Re-Factoring Helps
This Re-Factored version of DWIN_SET was recreated from the June2021 release of the CF6.1 Touchscreen Firmware, in a different version of the DGUSTools.
It runs on ALL versions of DGUS2, regardless of the touchscreen calibration. DO NOT FLASH ANY DGUS2 KERNEL FILES TO YOUR DISPLAY, IF YOU DON'T KNOW WHY YOU ARE DOING IT!! (See the README in the folder containing the DGUS2 Kernel files.)  

**NOTE: Text kerning does NOT work correctly on DGUS2 v1.x, so although this DWIN_SET can be used on Kickstarter CR6 machines still running DGUS2 v1.4, some data will not fit neatly into their display fields, unless you upgrade the DGUS2 with the DGUS2 v3.5 kernel upgrade file provided.**

## How Do I Find Out What DGUS2 kernel is Running on my Display?
To find out which version of DGUS2 is running on your display, "flash" your display with a micro SD card that contains ONLY an EMPTY folder named DWIN_SET. The top line on the blue flash screen will display the DGUS2 version currently installed.

## Downloads
The Source and DWIN_SET zip files are posted as Assets in the Releases section of this repository.

* The Zip file with DWIN_SET in the name contains the DWIN_SET folder, README and support files for the current release. 
  Download that file from the latest Release's Assets list.

* Zip files with "Source" in their name are the DGUS project and source files for this project.
  You do not need those files, unless you intend to try to fork and modify this version of the UI.

## Installing This Firmware to your Touchscreen
___________________________________________________________________________________________
**CAUTION: If you are using a MAC to prepare the SD card and to copy DWIN_SET to the card, 
PLEASE FIRST READ [THIS FAQ:](https://github.com/CR6Community/Marlin/wiki/Troubleshooting-Problems-with-Firmware-Flashing#my-screen-looks-like-this-picture-after-flashing-it)**
__________________________________________________________________________________________

  1. Download the DWIN_SET .zip file from the latest Release's Assets list
  2. Extract all contents from that .zip file into a new blank directory
  3. Find and read ALL of the README files BEFORE attempting to flash your display (You'll be glad you did!)
  4. Figure-out which DGUS 2 is presently running on your display (it may help you later, to know what you started with)
  5. DO NOT FLASH ANY KERNEL FILES TO YOUR DISPLAY, unless:  
    5.1 You have inadvertently "bricked" your display by flashing the DGUS2 kernel upgrade files to a display calibrated for DGUS2 v4.5+  
    5.2 Your display is running version 1.x of DGUS2, and you want to fix the text kerning (in which case, add the DGUS2 v3.5 kernel file to your DWIN_SET.)
  6. Verify that you have satisfied all of the Pre-Requisites for flashing this firmware (Which you will know after reading the README files...)
  7. Flash your display with the DWIN_SET folder 
  8. If anything went wrong, try the TROUBLESHOOTING.MD instructions
  9. Please provide feedback in Comments or Issues, as applicable

## Contributing

If you wish to contribute to the project, please provide your inputs by commenting on an Open Issue on this repository, and/or by contributing to a Discussion.

## Credits

[InsanityAutomation](https://github.com/InsanityAutomation/Marlin/tree/CrealityDwin2.0_Bleeding) initiated the refactoring project. It is upon that work that Thinkersbluff has built this Release.

[The core CR-6 Community firmware dev team](https://github.com/CR6Community/Marlin#credits) did the heavy-lifting that resulted in the CF6.1 baseline.

Icons from [Font Awesome](https://fontawesome.com/) and [Remix Icon](https://remixicon.com/).

Font from [Google Fonts](https://fonts.google.com/specimen/B612) and customized with [FontForge](https://fontforge.org/).
