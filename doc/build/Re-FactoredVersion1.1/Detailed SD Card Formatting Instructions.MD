# Detailed SD card formatting instructions

One of the most frequent (and frustrating) problems users have when flashing firmware to a CR6 printer is that the bootloader routines are VERY PICKY about what kind of SD Media they will work with.  This file documents the critical factors and the processes most likely to help you succeed.  

- You can IGNORE this file, if you flash successfully.  

- FOLLOW IT VERY CAREFULLY, if you can NOT flash the firmware (especially the DWIN_SET firmware!)

## Windows Users (Linux/MAC users, see below)

You can use the Windows File Explorer to format 16GB cards or smaller, to FAT32, 4096.

#### If you are trying to format an SDHC 32GB card, or a larger (SDXC) card, and can't find the option for FAT32, 4096 in File Explorer when formatting your SD card
The partition is too large.  You can either use a smaller SD card or you can shrink or split the partition in Disk Manager.

NOTE: Disk Manager can only shrink volumes which are formatted NTFS.  If the card is already formatted FAT32 with the wrong allocation unit size, you can use Disk Manager to:

1. Format the card back to NTFS
2. Shrink or Split the volume, so that the first Primary Partition is smaller than 16GB
3. Format the first Primary Partition on the card to FAT32, 4096


#### If the card shows that the first partition is a Logical Partition instead of a Primary Partition
The printer will not be able to read the card, until you create a Primary Partition as the first partition on that card.

If there is Unallocated Space on the card, to the left of the Logical Partition, right click on that space and select Create New Volume.  Use the Wizard to create a new Primary Partition in that space.  Format that new partition FAT32, 4096.

If there is no Unallocated Space to the left of the Logical Partition, you can try right-clicking that partition and shrinking that volume to create unallocated space. (NOTE that a partition must be formatted NTFS, to be able to shrink it)

If you are not able to create a Primary Partition on that card, you may need to delete the volume on which the Logical Partition(s) exist. 

**Be aware that Disk Manager may not be able to read an SD card that has NO volumes on it.**  
If you delete all volumes on the card and Disk Manager is no longer able to launch the Create New Volume Wizard for that card, you may need to use a commercial Disk Partitioning software to recover the card. 

Alternatively, you may find that a digital camera or an alternative (eg. Linux or Mac) system can reformat the card for you.


## Linux Users (MAC users, see below)

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

## Mac Users

First, unmount the SDCard.

    sudo diskutil unmountdisk /dev/diskXXX

Then, format it

    sudo newfs_msdos -F 32 -c 8 -v micro /dev/diskXXX

To figure out what your SDCard path is, you can use the following command:

    sudo diskutil list

It'll list all drives attached to your computer. Look for an entry that matches your SDCard size.