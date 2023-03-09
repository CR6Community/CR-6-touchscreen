# Re-Factored CR-6 Touchscreen firmware

## Do You Need This Re-Factored Version?

**The June 2021 release of the CF6.1 Touchscreen firmware remains valid for use on all CR6 printers currently already running and calibrated for DGUS2 v3.5.**

*If you have [a BTT SKR board with the BTT TFT](https://damsteen.nl/blog/2020/11/25/how-to-btt-skr-cr6-installation) you do not need this firmware. This firmware is only for when you use the stock Creality DWIN TFT display with the stock or BTT motherboard.*

If your DWIN display is flashed with DGUS2 v4.5 or higher, THIS IS YOUR ONLY OPTION for running CF6.1 on your CR6 printer (unless you wish to recalibrate your touchscreen to work with DGUS2 v3.5...  See the README in the folder containing the DGUS2 Kernel files.)

## What Problem Does This Solve?

The original June 2021 CF6.1 DWIN_SET will ONLY run on displays using DGUS2 v3.5.  As of approximately December 2021, Creality started shipping displays flashed and calibrated with DGUS2 v4.5.  DGUS2 v4.5 and higher require a different touchscreen calibration than prior DGUS2 versions.  CF6.1 users who flashed those new displays started having one of two serious problems: 
  1. If they flashed the Kernel Upgrade files to their displays, then the push buttons on the main menu did not respond to touch (because the touchscreen was not calibrated for DGUS2 v3.5)
  2. If they did NOT flash the Kernel Upgrade files (What? Not everybody follows the Readme instructions?!?), their screens came up blank, because the June 2021 version of CF6.1 DWIN_SET ONLY runs on DGUS2 v3.5.

That issue left some new CF6.1 users "snookered" and often led to other issues as they tried to revert to stock and could not make that work either (if they had flashed the kernel upgrade files.)

## How Re-Factoring Helps

This Re-Factored version of DWIN_SET was recreated from the June2021 release of the CF6.1 Touchscreen Firmware, in a different version of the DGUSTools.
It will run on ALL versions of DGUS2, regardless of the touchscreen calibration, AS LONG AS YOU DO NOT FLASH DGUS2 KERNEL FILES TO THE DISPLAY THAT ARE INCOMPATIBLE WITH THE TOUCHSCREEN CALIBRATION. (See the README in the folder containing the DGUS2 Kernel files.)  

**NOTE: Text kerning does NOT work correctly on DGUS2 v1.x, so although this DWIN_SET can be used on Kickstarter CR6 machines still running DGUS2 v1.04, some data will not fit neatly into their display fields, unless you upgrade the DGUS2 with the DGUS2 v3.5 kernel upgrade file provided.**

## How Do I Find Out What DGUS2 kernel is Running on my Display?

**To find out which version of DGUS2 is running on your display, "flash" your display with a micro SD card that contains ONLY an EMPTY folder named DWIN_SET. The top line on the blue flash screen will display the DGUS2 version currently installed.**


## Downloads

When code is ready for users to experiment with, the Source and DWIN_SET zip files are posted as Assets in the Releases section of this repository.

* The Zip file with DWIN_SET in the name contains the DWIN_SET folder, README and support files for the current release. 
  Download that file from the latest Release's Assets list.

* Zip files with "Source" in their name are the DGUS project and source files for this project.
  You do not need those files, unless you intend to try to fork and modify this version of the UI.

## Installing This Firmware to your Touchscreen
1. Download the applicable DWIN_SET .zip file from the latest Release's Assets list
2. Extract all contents from that .zip file into a new blank directory
3. Find and read ALL of the README files BEFORE attempting to flash your display (You'll be glad you did!)
4. Figure-out which DGUS 2 is presently running on your display (as explained above)
5. DO NOT FLASH ANY KERNEL FILES TO YOUR DISPLAY, unless:
  5.1 You have inadvertently "bricked" your display by flashing the DGUS2 kernel upgrade files to a display calibrated for DGUS2 v4.5+
  5.2 Your display is running version 1.x of DGUS2, and you want to fix the text kerning (in which case, add the DGUS2 v3.5 kernel file to your DWIN_SET.)
6. Verify that you have satisfied all of the Pre-Requisites for flashing this firmware (Which you will know after reading the README files...)
7. Flash your display with the DWIN_SET folder 
8. If anything went wrong, try the TROUBLESHOOTING.MD instructions
9. Please provide feedback in Comments or Issues, as applicable

## Contributing

If you wish to contribute to the project, please provide your inputs by raising a new Issue or by commenting on an Open Issue on this repository, and/or by contributing to the discussion on the [CR6Community Discord #lcd-discussion channel](https://discord.gg/yDY6pb2BQS)

## Credits

[InsanityAutomation](https://github.com/InsanityAutomation/Marlin/tree/CrealityDwin2.0_Bleeding) initiated the refactoring project. It is upon that work that Thinkersbluff has built this Release.

[The core CR-6 Community firmware dev team](https://github.com/CR6Community/Marlin#credits) did the heavy-lifting that resulted in the CF6.1 baseline.

Icons from [Font Awesome](https://fontawesome.com/) and [Remix Icon](https://remixicon.com/).

Font from [Google Fonts](https://fonts.google.com/specimen/B612) and customized with [FontForge](https://fontforge.org/).
