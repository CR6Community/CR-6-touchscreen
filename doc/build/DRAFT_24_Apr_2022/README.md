# Introduction

## Background

The original CF6.1 touch screen firmware was designed and distributed to run on the DGUS2 v3.5 operating system and on the original DWIN display hardware being delivered with CR6 printers up until December 2021.

Creality has since begun delivering the CR6 printers with a different version or configuration of the display hardware, running a more recent version of DGUS2 (v4.5, at the time of this release.) 

DGUS2 v4.5 & higher requires a different calibration of the display screen to run than did v3.5. Following the CF6.1 installation instructions to flash v3.5 with CF6.1 causes the v4.5 screen calibration to be invalid, resulting in the touchsceen becoming non-responsive after flashing CF6.1.

This version of the firmware has therefore been refactored from the original, to be made compatible with that new configuration of the DWIN TFT displays.

This refactored version of the firmware should run on any DGUS OS version 2 or higher. (Original Kickstarter machines were delivered with v1.4)
The display hardware will, however, still need to be configured to work with the installed version of DGUS2, so you will also need to ensure that the display calibration and the DGUS2 versions match, as explained herein.

## Recommendations for using this firmware

**NOTE: As always, flashing this firmware to your system is done entirely at your own risk. The CR-6 Community firmware developers take no responsibility for any consequences of flashing this firmware to your system.**

For as long as CF6.1 is the most recent release of the Community Firmware, there is no advantage to flashing this variation of the firmware to your printer, if you are already running CF6.1 successfully.

If flashing the original CF6.1 touchscreen firmware to your display hardware renders the display non-responsive, and if your display was previously calibrated to work with DGUS2 v4.5 or higher, then flashing this firmware may enable you to use the CF6.1 firmware on your printer, after-all.  (see Example below)

### Example - "Flashing CF6.1 with the DGUS2 v3.5 kernel upgrade files seems to have "bricked" my printer" 
If you first tried flashing the CF6.1 firmware to your display, carefully including the three DGUS2 v3.5 kernel "upgrade" files in DWIN_SET, and your system had been running DGUS2 v4.5, then you will likely find that your touchscreen has become non-responsive and flashing back to the Creality stock firmware also does not fix this.

You have two options, at this point:

1. You can revert to the Creality stock firmware (see below)
2. You can flash this refactored version of the CF6.1 UI to your display and restore DGUS2 to v4.5
 
To flash this refactored UI and restore DGUS2 to v4.5:
1. Delete the DWIN_SET folder from the SD card with which you previously flashed your display. (Make sure you keep a copy!)
2. Copy T5L_UI_DGUS2_V45_20220105.BIN from the DGUS2 kernel upgrade files folder in this repository to the DWIN_SET folder in this repository
3. Copy the new DWIN_SET folder to the SD card
4. Re-flash your display and cycle power
5. The CF6.1 interface should now work correctly

## Instructions for Reverting to the Creality Stock Firmware

IF you decide to revert your system back to the Creality firmware, and to abandon the Community Firmware, then copy the T5L_UI_DGUS2_V45_20220105.BIN kernel upgrade file into the Creality DWIN_SET folder before flashing the display.

## Instructions for Reverting to the Released CF6.1-Final Display Firmware

If you decide to abandon this DRAFT release of the next gen display firmware, just repeat the steps you did last time you flashed that firmware to your system. Remember to copy the DGUS2 v3.5 kernel upgrade files into the CF6.1-Final TouchScreen DWIN_SET folder, before flashing it, if your display is calibrated to work with a DGUS2 kernel prior to v4.5.

## Instructions for Calibrating DWIN Display Hardware

**CAUTION - DWIN display calibration is definitely not for the faint-hearted. DWIN warn that you can brick your display, if you don't do this correctly.**

DWIN display calibration is normally done at the factory & should not need to be done again by the user.

If, however, you wish to re-calibrate your display hardware (e.g. to enable changing the DGUS2 OS from v3.5 to v4.5 or higher OR to revert from v4.5 back to v3.5), you do this at your own risk. 

**Our Discord Community member @ScratchFury has posted this YouTube video of this process: https://youtu.be/oaiXSls1NXs **

The process is as follows:
0. Ensure that your display is already flashed with the DGUS2 version that you wish to calibrate. (OR include the applicable kernel file in DWIN_SET with the T5LCFG_Calibrate_Touchscreen.CFG file)

1. Use any Hex editor program to view and edit a copy of the T5LCFG_272480.CFG to create your own copy of T5LCFG_Calibrate_Touchscreen.CFG, by making the following three edits to that file:

1.1 Change the contents of address 0x05 to 38
1.2 Change the contents of address 0x20 to 5a
1.3 Change the contents of address 0x21 to 0b

The resulting file should look like this, in the HEX editor: 
![image](https://user-images.githubusercontent.com/36551518/165141828-cffbc04c-117e-4b0d-8958-bf83b1f37e03.png)

2. Save the modified file as T5LCFG_Calibrate_Touchscreen.CFG.

3. To activate the calibration screen on your display, put T5LCFG_Calibrate_Touchscreen.CFG into a folder called DWIN_SET on your SD card (IMPORTANT: Make sure it is the ONLY CFG file in the DWIN_SET folder)

4. Flash T5LCFG_Calibrate_Touchscreen.CFG to your display
5. Cycle power off/on
6. The screen displays coloured noise on this first power-up.  Keep the faith.
7. Cycle power off/on
8. The screen now displays a series of five crosses as you perform the calibration routine.  Your goal is to tap the pixel at the center of each cross (use a stylus for best results)
9. When you have tapped all 5 crosses, power off the display.
10. Delete the DWIN_SET folder from the SD card
11. Copy/paste the DWIN_SET folder from this repository onto the SD card. 
12. Flash this DWIN_SET to your display.
13. Cycle power off/on
14. Same as step 6 above.
15. Same as step 7 above
16. The screen should now display the CF6.1 UI and all should be well.


# Detailed Instructions for flashing this display firmware

**NOTE: If you have successfully flashed your system by following the above instructions, then you do not need to read this section.
These detailed instructions are offered for use by those who were not able to succeed by following only what is written above.**

The touch screen is very picky when it comes to SD cards, partitioning and partition sizes. If you did follow the instructions below and still you could not flash the files properly, try a different SD card and double check that you followed the instructions accurately.


## Prequisites

1. The correct version of the CR-6 Community Firmware must already be flashed to the printer motherboard.

2. You must have prepared a micro-SD card as follows (per the instructions below), to host the DWIN_SET folder:
 - partitioned to the MBR standard with the first Primary Partition sized 16GB or less
 - formatted FAT32, with an allocation unit size of 4096


## SD card formatting instructions

### Windows Users

If you prefer to use Windows 10 or 11 applications, use the Windows Disk Management application to verify or adjust the partition type and size and to format the SD card.  

Both SDHC and SDXC cards will work.

If you can't find the option for 4096 sector size, when formatting your SD card, then the partition is too large.  You can either use a smaller SD card or you can shrink or split the partition in Disk Manager. (NOTE: The Disk Management application can only shrink partitions formatted NTFS, so you may need to reformat the partition before shrinking it.)

### Linux Users

The SD-card should be formatted FAT32 with 4096 cluster size, with only one partition on the card, starting at sector 8192. The partion should be of type b, "W95 FAT32". Partition table type GPT does not work. The card must be partitioned as MBR, so choose type DOS.

Commands:
	
	fdisk /dev/sdX where sdX is your SD card's device
	
In fdisk:

	o (new DOS(MBR) partition table)
	n (new partition)
	p (primary)
	1 (partition nr)
	8192 (starting sector)
	enter (last sector) ---> if your SD card is bigger than 8Gb, enter a lower sector number here so that the partition <8Gb
	t (change type)
	b (hex code of W95 FAT32)
	w (write all changes to sd-card)

On the command line:

	mkfs.fat -F 32 -s 8 /dev/sdX1
	fsck.fat -v /dev/sdX1
	mount /dev/sdX1 /mnt

For touchscreen firmware:

	cp -r /path/to/touchscreen-firmware/DWIN_SET /mnt

### Mac Users

First, unmount the SDCard.

    sudo diskutil unmountdisk /dev/diskXXX

Then, format it

    sudo newfs_msdos -F 32 -c 8 -v micro /dev/diskXXX

To figure out what your SDCard path is, you can use the following command:

    sudo diskutil list

It'll list all drives attached to your computer. Look for an entry that matches your SDCard size.
	
## Steps when you have formatted your SD card
	
Take the firmware archive and extract the DWIN_SET folder to the SD card, so that the DWIN_SET folder itself is present on the SD card. Note: Ensure this folder is empty/deleted before you copy the new firmware packages because some files may have been renamed!

Then, follow one of these YouTube videos to complete the flashing process:

https://www.youtube.com/watch?v=Jswzrh2_ekk
https://www.youtube.com/watch?v=2-Mnin3_1jw
https://www.youtube.com/watch?v=9jk3lirEfg0
https://www.youtube.com/watch?v=9jk3lirEfg0

**Be careful that you don't short out the touch screen when flashing it. Ensure the power is not interrupted while flashing.**


### What does a successful flash look like?

The flash process is completed when you see "END!", as shown in the image flash_succesful.jpg. Note that there are also several lines below that, each showing the number of files flashed to the display, listed by file suffix (there must be non-zero numbers displayed, as shown in that photo.)

If this is the first time you have flashed the required version of the DGUS OS, then the top line on the screen will name that version of DGUS2 in red text, written over top of white text naming the DGUS version that has been overwritten (upgraded.)

If you flash the display with the same DGUS kernel file that is already installed, the top line will again be in red text, but more easily read, since it will overwrite the same text written in white.

If you flash the firmware without including any kernel upgrade file in the DWIN_SET folder, then the top line will report the currently active version of DGUS on the display, written in white text.


After flashing the touch screen has succeeded, you can turn the printer off, and remove the SD card.

If the motherboard was also flashed correctly, after restarting the printer the version will be shown (as shown in flash_succesful2.jpg). Make sure the version number reported matches that of the release of the firmware you downloaded. (e.g. "6.1-Final")

### What does an unsuccessful flash look like

- If you get an orange screen, flashing did **not** succeed.

- If you get a blue screen with END!, but the numbers of the updated files only showing "0", flashing did **not** succeed. Check the examples further down in this document for more information.

- If, after rebooting the printer, a message is shown about "TFT version mismatch" (like in flash_failed2.jpg) then flashing is not successful.

- if, after rebooting the printer, a message is shown about "Firmware flashed incorrectly" then your screen firmware might be flashed but your motherboard ignored the firmware update. You need to re-attempt flashing the motherboard. This sometimes happens on Creality v4.5.2/v4.5.3 boards - reformat your SD card and rename the ".bin" file of the motherboard firmware to something like "today.bin" or "1.bin" and retry.

**NOTE** 
We have observed with one user that even though the file counts were correct, the firmware still was not flashed correctly.

Some users have also used cards that work sometimes but not other times, which can be very confusing.

If you observe no issues with the firmware flashing but there are still elements missing on the touch screen, please try a different SD card, a smaller SD card and partition etc. 

If the touchscreen looks right after flashing but does not respond when you tap the menu buttons on the screen, then you may have an incompatible combination of firmware, DGUS kernel version and display hardware.  Try flashing again with the other kernel upgrade file.  (Make sure there is only the one kernel file in the DWIN_SET folder.)

## Examples

**dwin-folder-on-sd-card.png** shows how you place the files on your SD card

![Files on your SD card](dwin-folder-on-sd-card.png)

**flashing_in_progress.jpg** shows the indicators that flashing is in progress

![Flashing of touch screen successful](flashing_in_progress.jpg)

**flash_succesful.jpg** shows the indicators that flashing has been successful

![Flashing of touch screen successful](flash_succesful.jpg)

**flash_succesful2.jpg** shows that after flashing the version number of the firmware is shown. If you (for instance) downloaded Community Firmware Release 7 then "CR6Comm-Rel7 Ready" would show.

![Flashing of touch screen successful](flash_succesful2.jpg)

**flash_failed.jpg** shows the indicators that flashing has been unsuccesful

![Flashing of touch screen failed](flash_failed.jpg)

**flash_failed2.jpg** shows that the firmware does not recognize the version of the TFT. The LED near the hotend will also keep flashing on and off.

![Flashing of touch screen failed](flash_failed2.jpg)

## Troubleshooting

Follow the instruction in "What does an unsuccessful flash look like". 

### My touch screen is garbled, pages are shown partially or the screen stops responding

If the screen stops responding or is not displaying properly, try reflashing the firmware using a __different__ SD card.


# If you need more help

Check this video tutorial playlist on YouTube: https://www.youtube.com/watch?v=Q6738aiEKkU&list=PLfDSKnF0RNcYDkxM5mYtyuvlTfMAMD-Nr
