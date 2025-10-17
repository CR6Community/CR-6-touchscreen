# NOTE: These kernel files are normally not required, since the Refactored display firmware runs correctly on all versions of DGUS2.
They are included here for two special use cases:
1. If you are still running DGUS2 v1.4, the refactored display firmware will not parse text correctly.  The result will be some data not fitting within the boundary boxes of the data fields.   You can fix this by flashing the DGUS2v3.5 kernel to your display. BUT DO NOT flash v4.5!
2. If you have flashed the wrong version of DGUS2 to your display, and now the touchscreen beeps but the buttons are not doing anything, check now which kernel you are running and try flashing the other one to your display instead.
This YouTube video explains why these files were originally placed here: https://youtu.be/otaNJFLcuQ8
We have since removed the confusing DWIN_SET.zip file from the motherboard zip files, so the file here is truly your only option.

## STEP1 - BEFORE ACTING ON ANY OF THE FOLLOWING RECOMMENDATIONS:
1. Create an EMPTY folder at the root directory of an EMPTY micro SD card.
2. Ensure that your printer power is OFF
3. Place that SD card in your display and cycle power ON
4. The top line of the display will report which version of DGUS2 is currently flashed .  
4. Make note of which DGUS version is currently flashed to your display hardware (see top line on display)
5. Take care to follow the applicable instructions below.

## IF your display is currently running v3.5 and it should be running v4.5:
STEP 2: 
1. Copy T5L_UI_DGUS2_V45_20220105.BIN from the folder  "/src/DWIN/DGUS2 kernel files" to the DWIN_SET folder created at step 1 above, and flash that to your display.
2. Verify that the top line on the blue flash screen is now overwritten in red confirming that DGUS2 v4.5 is flashed
3. Optionally repeat step 1 with an empty DWIN_SET folder, to confirm v4.5 is now the DGUS2 OS

# OR

## IF your display is currently running v4.5 and it should be running v3.5:
STEP 2: 
1. Copy T5L_UI_DGUS2_V35_20200730.BIN from the folder  "/src/DWIN/DGUS2 kernel files" to the DWIN_SET folder created at step 1 above, and flash that to your display.
2. Verify that the top line on the blue flash screen is now overwritten in red confirming that DGUS2 v3.5 is flashed
3. Optionally repeat step 1 with an empty DWIN_SET folder, to confirm v3.5 is now the DGUS2 OS


# Here is how to interpret what you see:

The top line of the blue boot screen always identifies the current DGUS2 OS in white text.

If the DWIN_SET folder being flashed contains a DGUS kernel BIN file, the top line is overwritten in RED text, reporting the version that has been flashed.

If the two lines are different, it may be difficult to read either line.

If the two lines are identical, the current DWIN_SET folder has reflashed the same kernel to the display.
