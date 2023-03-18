# Flashing Help For Re-Factored DWIN_SET Version 1.1
**NOTE: If you have already successfully flashed your system by following the instructions in the README.MD file, then you do not need to read this file.**

**These instructions are offered for use by those who were not able to succeed at flashing this DWIN_SET to their display by following the README.**

## Begin wih the End in Mind - _Steve Covey, The 7 Habits of Highly Effective People_

The end goal of the flashing process documented herein is to install version 1.1 of the DWIN_SET application Re-Factored from the original Community Firmware 6.1 Final DWIN_SET, to run on all versions of DGUS2. 

When you have successfully achieved that goal, your screen will look like this: 
![Alt text](Sample%20Screen%20Images/SampleMainMenuAfter%20Successful%20Flash%20of%20both%20Display%20+%20Motherboard.JPG)

**RECOMMENDED PRACTICES:**

- Always Start this process a BLANK SD Card, when copying a new DWIN_SET folder and/or contents to the SD Card!
- ALWAYS Power-Off the printer, before removing or installing a card from the display!
- Be VERY careful that you don't short out the touch screen when flashing it. Ensure the power is not interrupted while flashing. 
- Seriously consider installing a micro-SD to SD card extension cable, permanently plugged into the display micro SD card slot
  - This minimizes the stress on what may be a very delicate card slot
  - It also eliminates the need to remove the back cover (and the serial interface harness), which speeds up the process considerably and elimiates the potential risk of damage to the PCB

## Step 1: Prepare a Blank Micro SD card
Partition and format a micro SD card, per [the detailed SD card formatting instructions](Detailed%20SD%20Card%20Formatting%20Instructions.MD).   

_Alternatively, if you are using a micro SD to full SD extension cable, you can prepare a full sized SD card._

## After you have partitioned and formatted your SD card:
### Extract DWIN_SET to the SD card	
Take the firmware archive and extract the DWIN_SET folder to the SD card, so that the DWIN_SET folder itself is present on the SD card. Except (perhaps) for the name and disc number, the result will look like this:
![Full DWIN_SET extracted to an SD card](Sample%20Screen%20Images/exract-dwin-folder-onto-sd-card.png)

### Decide whether to use the approach described in Option 1 or in Option 2, below, to Flash the DWIN_SET contents to your display
Review the Examples below and follow either Option 1 or Option 2.
- Option 1 is the quickest, if it works
- Option 2 is more methodical and more consistent with the flashing practices recommended by DWIN.  e.g.: It may help you succeed if you flash the T5L CFG file all by itself, before trying to flash the other files. 

### Use this general approach, to flash the display:
To flash the display from the SD card:
- Power OFF the printer
- Access the SD card slot on the back of the display (involves removing the back cover off the display or using a micro SD to full (or to micro) SD extension cable)
- Insert an SD card containing the DWIN_SET files to be flashed
- Power ON the printer
- Wait for  END! to display
- Power OFF the printer
- Remove the SD card
- If not finished, delete or empty the DWIN_SET folder on the card, then copy the next DWIN_SET folder/files to a blank SD card and repeat the above steps, starting with "Power OFF the printer"
- If finished, Power ON the printer
- Verify (per the Examples below) that the flash has been successful

If the motherboard was also flashed correctly before starting this process, then after restarting the printer the Re-Factored Version 1.1 Splash Screen will display, followed by the Main Menu screen, as shown in "Begin with the End in Mind" above and in the Examples below.

IF your system has NOT flashed correctly, proceed to the Troubleshooting section below.

_**NB: If you decide to follow a video to clarify these instructions, please note: NONE of those YouTubers was flashing this version of the firmware, so they may provide instructions that DO NOT APPLY to this installation!**_


### What does a successful flash look like?

The flash process is completed when you see "END!", as shown in the Examples below. Note that there are also several lines below END!, each showing the number of files flashed to the display, listed by file suffix (there must be non-zero numbers displayed, as shown in the Examples.)

If - as recommended - you flash this firmware without including any kernel upgrade file in the DWIN_SET folder, then the top line will report the currently active version of DGUS on the display, written in white text.

#### What if I also flashed a DGUS2 kernel file?
If this is the first time you have flashed the required version of the DGUS OS, then the top line on the screen will name that version of DGUS2 in red text, written over top of white text naming the DGUS version that has been overwritten (upgraded.)

If you flash the display with the same DGUS kernel file that is already installed, the top line will again be in red text, but more easily read, since it will overwrite the same text written in white.


### What does an unsuccessful flash look like

- If you get an orange screen, flashing did **not** succeed.

- If you get a blue screen with END!, but the numbers of the updated files only showing "0", flashing did **not** succeed. Check the examples further down in this document for more information.

- If, after rebooting the printer, a message is shown about "TFT version mismatch", then flashing was not successful.

- if, after rebooting the printer, a message is shown about "Firmware flashed incorrectly" then your screen firmware might be flashed but your motherboard ignored the firmware update. You need to re-attempt flashing the motherboard. This sometimes happens on Creality v4.5.2/v4.5.3 boards - reformat your SD card and rename the ".bin" file of the motherboard firmware to something like "today.bin" or "1.bin" and retry.

**NOTE**   
We have observed with at least one user that even though the file counts were correct, the firmware still was not flashed correctly.

Some users have also used cards that work sometimes but not other times, which can be very confusing.

If you observe no issues with the firmware flashing but there are still elements missing on the touch screen, please try a different SD card, a smaller SD card and partition etc. 

If the touchscreen looks right after flashing but does not respond when you tap the menu buttons on the screen, then you may have an incompatible combination of firmware, DGUS2 kernel version and display hardware.  Try flashing again with the other kernel upgrade file, per the instructions in [the DGUS2 kernel files README](DGUS2%20kernel%20files/README.md).  (Make sure there is only the one kernel file in the DWIN_SET folder.)

## Examples

**NB: This section assumes that you have already flashed CF6.1 to the Motherboard, BEFORE you try to flash the Re-Factored DWIN_SET to the display.  If instead you choose to flash the motherboard AFTER flashing the display, you will NOT see "CR6Comm-Rel6.1 Final Ready." after flashing the display, until you have also flashed the motherboard. You will instead likely see the splash screen message with the "bootloader seems confused" message. In that event, just proceed with flashing the motherboard.**

**All of these images also assume that you have DGUS2v3.5 installed on your system and that you do not need to flash DGUS2 v4.5. If in fact you do and should have DGUS2 v4.5 installed, there will be one additional status line on the blue flash END! screen for CRC32 Check, which you can ignore** as shown here:

![CRC32 Check: 000 Appears only with DGUS2v4.5](Sample%20Screen%20Images/Empty%20DWIN_SET%20Flash.jpg)

### Options for Flashing Contents of DWIN_SET Folder to Display

#### SD Card Requirements
You must use a micro SD card to flash DWIN_SET to the display (or an SD card in an SD to micro SD card extension cable).

The display bootloader program imposes the following mandatory requirements on the SD card you use:
- Partitioning must be:
  - Master Boot Record (MBR)
  - Primary (not Logical) Partition
    - NOTE: If using a MAC, this is probably called DOS partitioning (vs GPT)
  - NOTE: If there are multiple partitions on your card, the display will only "see" the first one!
  - **CAUTION**: If a card has been partitioned multiple times and/or some partitions have been deleted, the boot loader may become unable to read the partition containing DWIN_SET.  Try deleting all partitionss from the card and starting again, with just one Primary MBR 8Gb(or smaller) partition
- Formatting must be:
  - FAT32
  - 4096 allocation units per sector

#### A NOTE About SD/HC/XC
This DWIN display seems to have difficulty reading XC cards, even if they are particioned smaller, so it is best to try to use SD cards which are 8Gb or smaller.  
If you can not find smaller cards, HC cards (16Gb or 32Gb) may work.

#### Option 1: Flash All of the Files At Once

Copy the DWIN_SET folder as-is, from the ZIP file to a blank SD card.  
**dwin-folder-on-sd-card.png** shows the DWIN_SET folder and files as they should be on your SD card, if you plan to flash them all at once:

![Default DWIN_SET folder on SD Card](Sample%20Screen%20Images/dwin-folder-on-sd-card.png)

If you successfully flash all of the DWIN_SET files at once, to a screen loaded with DGUS2v3.5, the display will look like the example in **flash_successful.jpg**
![Flashing of touch screen successful](Sample%20Screen%20Images/flash_succesful%20-%20DGUS2%20v3.5.JPG)

If you have DGUS2 v4.5 or higher loaded, there will be one additional status line at the bottom of that list, reporting the status of a CHECKSUM function, which is not used by these displays. You can ignore that info.

#### Option 2, Part 1 of 2: Flash the CFG and HZK Files Separately, First
 The CFG file configures your display. It is critical that the flashing of that particular file NOT be interrupted, since an incomplete flash may brick your display. You only need to flash it once, so you may want to _flash it by itself, before flashing anything else.

 Create an empty DWIN_SET folder alone on the SD card, and copy just the CFG file into that. It should look like this:_

![Optionally - Flash T5LCFG_272480K.CFG by itself](Sample%20Screen%20Images/dwin-folder-on-sd-card_one-time-Flash-of-CFG-file.png)

With power OFF, insert that card into the display and power ON to flash it.  If flashing just the CFG file is successful, the screen will show this, pretty quickly:

![Successful Flash of CFG file only](Sample%20Screen%20Images/flash_successful%20-%20CFG%20Only.jpg)

Flashing the HZK file loads the font data. It is a large file, so it takes a long time to flash.  Since the HZK file only needs to be flashed once, and since you may need to flash your display several times with other files, you may prefer to remove the HZK file from the default DWIN_SET folder and flash it once, by itself, after flashing the T5L file and before flashing everything else.

As above, create an empty DWIN_SET folder alone on the card.  Copy the HZK file into that. It should look like this:

![The HZK file flashed alone in DWIN_SET](Sample%20Screen%20Images/dwin-folder-on-sd-card_one-time-Flash-of-HZK-file.png)

With power OFF, insert that card into the display and power ON to flash it.  If flashing just the HZK file is successful, the screen will show this afer a minute or two:

![Successful Flash of HZK file only](Sample%20Screen%20Images/flash_successful%20-%20HZK%20Only.JPG)

#### Option 2, Part 2: Flash the rest of the files
Once the CFG and HZK files have been flashed, you can remove those two files from the default DWIN_SET folder that you copy to your SD card.  The resulting card should look like this:  

![Default DWIN_SET without the CFG and HZK files in it](Sample%20Screen%20Images/dwin-folder-on-sd-card-after-one-time-Files-Flashed.png)

With power OFF, insert that card into the display and power ON to flash it.  If flashing just the HZK file is successful, the screen will show this afer a minute or two:

![All remaining files successfully flashed at once](Sample%20Screen%20Images/Remainder%20flash_successful%20-%20DGUS2%20v3.5%20-.JPG)

**NOTE** You can also choose to flash any combination of the above files alone or in combination.  The display will only work correctly after all of the files have been successfully flashed to it.

### What a Successful FLash Looks Like
In the previous section, we showed you what to expect on the blue screen, while flashing.

"If your attempts at flashing do NOT result in the blue screen as shown, then proceed to the Troubleshooting section, below.

Otherwise, when you have completed flashing all of the DWIN_SET files to the display, you should Power OFF, remove the SD Card, and Power ON.

The display screen should first load this "splash screen", and the progress bar should fill from left to right,...

![Splash Screen, if Flash Successful](Sample%20Screen%20Images/Sample%20Splash%20Screen-Successful%20Flash.JPG)

... then the screen should switch to this main menu screen:
 ![Main Menu Screen, if flash successful](Sample%20Screen%20Images/SampleMainMenuAfter%20Successful%20Flash%20of%20both%20Display%20+%20Motherboard.JPG)

NOTE: IF, instead, the Splash Screen looks like this, a minute or so after powering-up, then proceed to Troubleshooting, below:

![Motherboard Firmware Error Message](Sample%20Screen%20Images/Sample%20Splash%20Screen%20if%20motherboard%20and%20display%20firmwares%20do%20not%20match.JPG)



## Troubleshooting

### The Blue Screen Shows all Zeroes at Process END!

![Blue Screen shows all zeroes - DGUS2v3.5](Sample%20Screen%20Images/flash_failed%20-%20ALL%20ZEROES.jpg%0D) 

There are several possible root causes for this failure, but the bottom line is that the bootloader is not able to find any of the files it tries to flash, in the DWIN_SET folder on the card.  It does, however, see the card and the DWIN_SET folder.

Verify that 
 - the DWIN_SET folder is not empty, when viewed on your PC/MAC
 - there is only one partition on the card, and it is a Primary MBR partition.
 - that one partition is formatted FAT32, 4096 allocation units per sector
 - there are no bad sectors on the card, when you perform a surface test on the card, using your PC/MAC.
 - there are no other contents on the SD card, except for the DWIN_SET folder and its contents

Try flashing just one file at a time in the DWIN_SET folder, starting with CFG, then HZK, then each of the other files.
- if this works for some files but not for one or more of the others, those unzipped files may be corrupted.  Try replacing those files from a fresh download of the zip file. 

## ISSUE: The Screen Shows a Different Splash Screen or Main Menu

### ADVICE: You have not flashed the Re-Factored Version 1.1 firmware. 

What you are looking at is whatever remains in the display's memory, which has not yet been overwritten by the flashing process (or you are flashing from the wrong DWIN_SET folder)

Verify that you are working with the correct DWIN_SET .zip file and try again to flash per the above instructions.

## ISSUE: I Hear Beeping and the Nozzle LED is Flashing

## ADVICE: The CF6.1 Motherboard Firmware is programmed to signal you in that way, if it can not communicate with a compatible DWIN_SET on your display 
IF the motherboard has already been flashed with CF6.1, then you will likely also see the nozzle LED flashing and hear a beeping from the motherboard, when you power-up and CF6.1 can not find a compatible version of DWIN_SET on the display.

- Verify that the display flash screen matches the example.
- Verify that the serial cable to the display is not damaged.

## ISSUE: My touch screen is garbled, pages are shown partially or the screen stops responding

### ADVICE: Your display is not correctly flashed
One or more of the files flashed to the display may have been corrupted.
 - Try reflashing the firmware using a __different__ SD card.
 - Try downloading a fresh copy of the DWIN_SET zip file and unpack it to a different location than last time

If, alternatively, one or more memory location in the display is faulty, you will need to replace the display.

## ISSUE: The Screen Stays Stuck on the Splash Screen

### ADVICE: Verify that you have met all of the following Pre-Requisites
Users are often unsure whether to flash the motherboard or the display first.  When they see this "Bootloader may be confused" message appear on the screen, some think it is referring to the display bootloader and display SD card.  
![Bootloader may be confused](Sample%20Screen%20Images/Sample%20Splash%20Screen%20if%20motherboard%20and%20display%20firmwares%20do%20not%20match.JPG)
That message actually refers to the motherboard bootloader and card, assuming that the display was flashed first.

The motherboard must be flashed with CF6.1 and the display with Re-Factored DWIN_SET version 1.1, before the display and the printer will show the Main Menu screen with the message "CR6Comm-Rel6.1 Final Ready."

## ISSUE: I see the main menu screen, but tapping the buttons on the screen doesn't do anything

### ADVICE: Verify that the correct version of DGUS2 is installed on your display, per [the README.MD file in the folder "DGUS2 kernel files"](DGUS2%20kernel%20files/README.md)

**NOTE: This is why it was STEP 1 of the README recommendations to identify which DGUS2 was running on your hardware before you started flashing anything.**

 - If you inadvertently flashed your display with DGUS2 v3.5, but your display was factory-calibrated for DGUS v4.5, the screen is likely to be non-responsive.  Try flashing it back to v4.5 (per the README in the kernel upgrades folder).

 - If you inadvertently flashed your display with DGUS2 v4.5, but your display was factory-calibrated for DGUS v3.5, the screen is likely to be non-responsive.  Try flashing it back to v3.5.

## ISSUE: The Display did not flash from the SD card (the screen remained blank or zero files were copied)

### ADVICE: You must prepare the micro-SD card per the [the detailed SD card formatting instructions](Detailed%20SD%20Card%20Formatting%20Instructions.MD), to host the DWIN_SET folder
 
The touch screen is very picky when it comes to SD cards, partitioning and partition sizes.  

SD, SDHC and SDXC cards will all work with the display, but:
 - the card must be partitioned to the Master Boot Record (MBR) standard, not GPT
 - the first partition **must** be a Primary Partition, formatted FAT32 with an allocation unit size of 4096 sectors.  To achieve that FAT32 format with an SDHC or SDXC card, the first Primary Partition must be sized <16GB. (NOTE: 16Gb is actually the threshold value. You may need to size your partition to 15Gb, to be able to select 4096 as your option in the PC OS.)
 - the display does seem to favour the older technology cards.XC cards in particular may not always work with it.

 This YouTube video explains and demonstrates how to prepare SDHC or SDXC cards: https://youtu.be/CEvQpMpNxbY
 
_When all else fails, try a different SD card_


# If you need more help

Check this video tutorial playlist on YouTube: https://www.youtube.com/watch?v=Q6738aiEKkU&list=PLfDSKnF0RNcYDkxM5m 