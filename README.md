# CR-6 Touchscreen firmware
Attempt to extend the CR-6-touchscreen firmware to operate with DWIN display hardware flashed with and calibrated to run DGUS2 v4.5 or higher, such as those being sold with new CR6 machines as of approximately Dec 2021.

**NOTE: The June 2021 release of the CF6.1 Touchscreen firmware remains valid for use on all CR6 printers currently running and calibrated for DGUS2 v3.5.**

**To find out which version of DGUS2 is running on your display, "flash" your display with a micro SD card that contains ONLY an EMPTY folder named DWIN_SET. The top line on the blue screen will display the current DGUS2 version.**

*If you have [a BTT SKR board with the BTT TFT](https://damsteen.nl/blog/2020/11/25/how-to-btt-skr-cr6-installation) you do not need this firmware. This firmware is only for when you use the stock Creality LCD with the stock or BTT motherboard.*

## Downloads

When code is ready for users to experiment with, the Source and zip files are posted as Assets in the Releases section of this repository.

* Zip files with "ReleaseCandidate" in their name are ready to download for beta test and feedback.

* Zip files with "Source" in their name are the DGUS project and source files for this project.

## Installing This Firmware to your Touchscreen
1. Download the applicable .zip file from the Releases Assets list
2. Extract all contents from the .zip file into a new blank directory
3. Find and read ALL of the README files BEFORE attempting to flash your display (You'll be glad you did!)
4. Figure-out which DGUS 2 is presently running on your display 
5. Flash the other DGUS2 kernel ONLY if you should (per the README in the kernel upgrades folder)
6. Verify that you have satisfied all of the Pre-Requisites for flashing this firmware (Which you will know after reading the README files...)
7. Flash your display with the DWIN_SET folder 
8. If anything went wrong, try the TROUBLESHOOTING.MD instructions
9. Please provide feedback in Comments or Issues, as applicable

## Contributing

If you wish to contribute to the project, please provide your inputs by raising a new Issue or by commenting on an Open Issue on this repository, and/or by contributing to the discussion on the [CR6Community Discord #lcd-discussion channel](https://discord.gg/yDY6pb2BQS)

## Credits

[InsanityAutomation](https://github.com/InsanityAutomation/Marlin/tree/CrealityDwin2.0_Bleeding) initiated and leads this project. It is upon his work that Thinkersbluff is building.

[The core CR-6 Community firmware dev team](https://github.com/CR6Community/Marlin#credits) did the heavy-lifting that resulted in the CF6.1 baseline.

Icons from [Font Awesome](https://fontawesome.com/) and [Remix Icon](https://remixicon.com/).

Font from [Google Fonts](https://fonts.google.com/specimen/B612) and customized with [FontForge](https://fontforge.org/).
