## FOR COMMUNITY FIRMWARE DEVELOPERS AND TESTERS ONLY: Instructions for Calibrating the DWIN Display Hardware

**CAUTION - DWIN display calibration is definitely NOT NECESSARY TO INSTALL OR RUN THIS FIRMWARE and NOT for the faint-hearted. DWIN warn that you can brick your display, if you don't do this correctly.  These instructions are included FOR TESTERS ONLY**

DWIN display calibration is normally done at the factory & should not need to be done again by the user.

If, however, you wish to re-calibrate your display hardware (e.g. to enable changing the DGUS2 OS from v3.5 to v4.5 or higher OR to revert from v4.5 back to v3.5), you do this at your own risk. 

**Our Discord Community member @ScratchFury has posted this YouTube video of this process, to go from DGUS2 v3.5 to v4.5+: https://youtu.be/oaiXSls1NXs**

To revert your display from v4.5+ back to v3.5 requires a similar configuration process. 
What differs is that:
1. You need to flash the v3.5 kernel upgrade files with the same T5LCFG_Calibrate_Touchscreen.CFG file, at step 0 (or step 3) below.
2. At step 8, there are only four calibration crosses (in the corners of the screen) and they are not visible on the screen, so you need to touch the corners on the screen, in this order: bottom left, upper left, upper right, bottom right. 

NB: If you try to perform the v3.5 calibration process the first time you flash the Calibration CFG file to the display, it will fail, and tapping on the screen will create a dot in a totally different place.  You must flash the Configuration CFG file twice before trying to calibrate. You must also ensure that the CFG file is the ONLY file in the DWIN_SET folder when you are flashing it. (This is much more obvious, when running the DGUS2 v4.5 calibration routine...)

**Again, @ScratchFury has posted a YouTube video of this process of going from v4.5 to v3.5: https://www.youtube.com/watch?v=g3zH8nUG3eE**
NOTE: ScratchFury refers to the bottom left corner of the physical screen as "upper left" in his video, because the screen display is rotated and he is refering to the upper left corner of the displayed info screen.

The process for the v4.5 calibration is as follows:

0. Ensure that your display is already flashed with the DGUS2 version that you wish to calibrate. 

1. [Optionally] You can use any Hex editor program to view and edit a copy of the T5LCFG_272480.CFG to create your own copy of T5LCFG_Calibrate_Touchscreen.CFG, by making the following three edits to that file:

   1.1 Change the contents of address 0x05 to 38

   1.2 Change the contents of address 0x20 to 5a

   1.3 Change the contents of address 0x21 to 0b

Alternatively - Download and open T5LCFG_Calibrate_Touchscreen.CFG from this repository in a HEX editor

The resulting file should look like this, in the HEX editor: 

![image](https://user-images.githubusercontent.com/36551518/165141828-cffbc04c-117e-4b0d-8958-bf83b1f37e03.png)

2. Save the modified file as T5LCFG_Calibrate_Touchscreen.CFG.

3. To activate the calibration screen on your display, put T5LCFG_Calibrate_Touchscreen.CFG into a folder called DWIN_SET on your SD card (IMPORTANT: Make sure it is the ONLY file in that DWIN_SET folder)

4. Insert the SD card into your display
5. Cycle power off/on
6. The screen displays coloured noise on this first power-up, if it is the first time you are reorienting the display to landscape mode.  Keep the faith.
7. Cycle power off/on
8. The screen now displays - in landscape mode - a white cross in the bottom left corner. It will continue to display the next cross, in a series of five crosses, as you perform the calibration routine.  Your goal is to tap the pixel at the center of each cross, as and where it appears on the screen (use a stylus for best results)
9. When you have tapped all 5 crosses, power off the display.
10. Delete the DWIN_SET folder from the SD card
11. Copy/paste the DWIN_SET folder from this repository onto the SD card. Ensure that it also contains the file T5L_280472.CFG, which will reset the screen orientation to portrait mode. 
12. Flash this DWIN_SET to your display.
13. Cycle power off/on
14. Same as step 6 above.
15. Same as step 7 above
16. The screen should now display the CF6.1 UI and all should be well.
