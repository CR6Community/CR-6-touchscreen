# Instructions for flashing the firmware

As always, this is all on your own risk.

Format an micro-SD card as FAT32 with 4KB sector size.
If you like to use the command prompt, you can use this: 

	format /Q X: /FS:FAT32 /A:4096
	
	Where X: is the drive where the SD card is mounted.
	
If you can't find the option for 4KB sector size your SD card is too large. 
You can either use a smaller SD card or can shrink the partition in Disk Manager.
	
Take the firmware archive and extract the DWIN_SET folder to the SD card, so
that the DWIN_SET folder itself is present on the SD card.

Then, follow this YouTube video to complete the flashing process:
https://www.youtube.com/watch?v=Jswzrh2_ekk

The flash process is completed when you see "END!" like shown in flash_succesful.jpg.
If you get an orange screen, flashing did most likely _not_ succeed.