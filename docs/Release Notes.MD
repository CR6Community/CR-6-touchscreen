# Release#: Re-Factored Version 1.1

## NOTE: If you do not see this release number on your system, you have not flashed this version of the touchscreen firmware. 

# Introduction

This formal release is identical to 61F_220622_v1, except:
  1. The colour theme of the screens has been changed back from cyan/darkblue to black/grey/red
  2. The jpeg compression artifacts have been removed
  3. The font has been changed, to solve the descender clipping issues 
  4. The version # has been rebranded on the splash screen, main menu and Info screens.
  5. A red line has been added between the grey screen banner and the black background on each screen, to facilitate the recognition of this build vs the original DWIN_SET, when providing help based on photos of the screens.


## Background

The CF6.1 touch screen firmware was designed and distributed to run only on the DGUS2 v3.5 operating system.

Creality has now begun delivering the CR6 printers running a more recent version of DGUS2 (v4.5, at the time of this release.) 

DGUS2 v4.5 and higher require a different calibration of the touchscreen than did v3.5.

Following the CF6.1 installation instructions to flash v3.5 with CF6.1 to these newer printers therefore causes the v4.5 touchscreen calibration to be invalid. That results in the touchscreen becoming non-responsive. Reverting to Creality stock also then fails, until the DGUS2 v4.5 kernel is restored to the display.

This re-factored version of the firmware operates correctly on all CR6 printers flashed with DGUS2 OS version 2.0 or higher, as long as:

1. The motherboard has also been flashed with the correct configuration of CF6.1-Final firmware

2. The display hardware has already been calibrated to operate with the version of DGUS2 (2.0 or higher) that is installed on the display.



# Recommendations for using this firmware
## _PLEASE read all of these recommendations, before following any of them._

**NOTES:**

**1. As always, flashing this firmware to your system is done entirely at your own risk. The CR-6 Community firmware developers take no responsibility for any consequences of flashing this firmware to your system.**

2. We have seen STEP1 display DGUS2 v4.5 with a different date stamp than the one bundled with this release. (13/01/22 vs 05/01/22) We can not explain why DWIN would publish two variants of the same OS version, nor can we answer whether there are any differences between the two. (See note 1)


**STEP1 - BEFORE ACTING ON ANY OF THE FOLLOWING RECOMMENDATIONS:**
1. Create an EMPTY folder at the root directory of an EMPTY micro SD card.
2. Ensure that your printer power is OFF
3. Place that SD card in your display and cycle power ON
4. The top line of the display will report which version of DGUS2 is currently flashed .  
4. Make note of which DGUS version is currently flashed to your display hardware (see top line on display)
5. Take care to follow the applicable instructions below.


### If you are currently running Creality stock firmware on your system, and your display is currently running DGUS2 v4.5+

Flash this touchscreen firmware INSTEAD of the CF6.1-Final touchscreen firmware.  

1. Ignore the Touchscreen firmware folder in the CF6.1-Final release zip file.

2. INSTEAD, copy the DWIN_SET folder and contents from this release to the micro-SD card you use to flash the display 

3. DO NOT copy ANY DGUS2 kernel upgrade files to the DWIN_SET folder before flashing it to your display.

### If you are currently running Creality stock firmware on your system, and your display is currently running any version of DGUS2 between (and including) v2.0 and v4.4 (e.g. v3.5)

EITHER: Go ahead and flash the CF6.1 TouchScreen Firmware to your system, following the CF6.1 Touchscreen Firmware README instructions precisely

OR:

Do exactly the same thing as recommended above for the v4.5 users:

1. Ignore the Touchscreen firmware folder in the CF6.1-Final release zip file.

2. INSTEAD, copy the DWIN_SET folder and contents from this release to the micro-SD card you use to flash the display 

3. DO NOT copy ANY DGUS2 kernel upgrade files to the DWIN_SET folder before flashing it to your display.

### If you already flashed the CF6.1-Final touchscreen firmware to your display hardware, your display is now running DGUS2 v3.5, and your display is non-responsive

You can flash this re-factored version of the CF6.1 UI to your display and restore the display to running DGUS2 to v4.5, as follows:

  1. Delete the DWIN_SET folder from the SD card with which you previously flashed your display. (Make sure you keep a copy, just in case!) OR prepare a new blank micro SD card.
  2. Copy the new DWIN_SET folder distributed in this release to that SD card  
  3. Copy T5L_UI_DGUS2_V45_20220105.BIN from the DGUS2 kernel upgrade files folder into the new DWIN_SET folder on that card
  4. Re-flash your display with the updated card
  5. Verify that the top line of the display shows the DGUS2 v4.5 OS was flashed as part of the process (it will be written in red text over the top of white text that said v3.5)
  6. Power off the printer
  7. Remove the SD card from the display and power it back up
  8. The CF6.1 interface should now work correctly
  9. Repeating the empty DWIN_SET folder trick described as STEP 1 above will allow you to confirm with confidence that DGUS2 v4.5 is now flashed to the display

## Instructions for Reverting a Display to the Creality Stock Firmware

### If you flashed the CF6.1 firmware and the DGUS v3.5 kernel upgrade files to a DWIN display that was previously configured to run on DGUS2 v4.5 and just want to revert to stock, rather than flashing this firmware release

1. Copy the T5L_UI_DGUS2_V45_20220105.BIN kernel upgrade file into the Creality DWIN_SET folder. 
2. Important: Verify that the Creality DWIN_SET folder includes their T5L...CFG file
3. Re-flash that Creality DWIN_SET to your display. 
4. Re-flash the stock Creality DWIN_SET firmware to the motherboard

The printer will now have been reverted to the Creality stock firmware.

### If you successfully flashed CF6.1 or this release to a DWIN display without flashing any DGUS kernel upgrade files to that display, but now wish to revert to the Creality stock firmware

Flash the stock Creality firmware back to the motherboard and the display, per Creality's instructions.

## Instructions for reverting from this re-factored version BACK to the CF6.1-Final TouchScreen Firmware on a display running DGUS2 v3.5 

Follow the flashing instructions in the CF6.1-Final Touchscreen firmware README file.




