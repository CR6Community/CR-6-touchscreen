# Instructions for flashing the firmware

As always, this is all on your own risk. The CR-6 Community firmware developers take no responsibility on flashing this firmware.



~~~~~ Windows Users ~~~~~

Format an micro-SD card as FAT32 with 4KB sector size.
If you like to use the command prompt, you can use this: 

	format /Q X: /FS:FAT32 /A:4096
	
	Where X: is the drive where the SD card is mounted.

If you can't find the option for 4KB sector size your SD card is too large.
You can either use a smaller SD card or can shrink the partition in Disk Manager.

~~~~~ Mac Users ~~~~~

First, unmount the SDCard.
    sudo diskutil unmountdisk /dev/diskXXX

Then, format it
    sudo newfs_msdos -F 32 -c 8 -v micro /dev/diskXXX

To figure out what your SDCard path is, you can use the following command:
    sudo diskutil list

It'll list all drives attached to your computer. Look for an entry that matches your SDCard size.
	
~~~~~~ Once you have your SDCard properly formatted ~~~~~
	
Take the firmware archive and extract the DWIN_SET folder to the SD card, so
that the DWIN_SET folder itself is present on the SD card.

Then, follow this YouTube video to complete the flashing process:
https://www.youtube.com/watch?v=Jswzrh2_ekk

The flash process is completed when you see "END!" like shown in flash_succesful.jpg.
Note that there are several lines showing updated files

If you get an orange screen, flashing did most likely _not_ succeed.
If you get a blue screen with END!, but the numbers of the updated files showing "0", flashing did not succeed either.


~~~~~~~~~ Examples ~~~~~~~~~~~

**flash_succesful.jpg** shows the indicators that flashing has been successful

**flash_failed.jpg** shows the indicators that flashing has been unsuccesful

