**CAUTION: THIS FILE IS OUT OF DATE.  IT IS HERE TO PRESERVE KEY USEFUL INFO UNTIL THE REPLACEMENT DOCUMENTATION (CURRENTLY IN WIP) IS READY TO POST.** - Thinkersbluff.

### Translations / localization 

Internationalization support in DGUS DWIN is very cumbersome. 
- The text on the background bitmaps for each screen, each button, and each icon is embedded in the bitmaps. To translate and have it first-class, you would need to duplicate all the bmps, give each version of each bitmap a separate ID, and keep track of that mapping in firmware, which is a lot of work. The volunteers in the development team have no capacity to maintain localizations that way.

If you want to translate the English-only user interface into your own language, you instead have the option of forking this repository and building maintaining your own version of the touch screen firmware.

The complete workflow could look like this:

1. Fork this repository.
2. Work on the extui branch (this is the branch for all work going forward)
3. In your fork, follow [the steps in the images section of this file](#images--screen-images-sources) to change the current bitmaps and translate them.
4. Use the DWINTools ICL Tool to generate new 23_Screens.ICL, 42_Toggles.ICL and 45_Icons.ICL files.
5. Use the DWINTools Tool to Generate the 13_Show.bin, 14_Touch.bin files
6. Overwrite the ICL and bin files in the English-language DWIN_SET folder with your translated files.
7. Flash your localized DWIN_SET to your system.

Good luck, and if you maintain your own translated firmware, please let us know!

## Documentation for development

You need [the DGUS v8.2.1.14.x software](https://github.com/CR6Community/CR-6-touchscreen/releases/download/v2.0.8.1-cr6-community-release-6.1/DGUS_Tool_V8.2.1.14.7z) for editing the DWIN_SET touchscreen functionality.

Open the DWprj.hmi file in the [`src\DWIN`](src\DWIN) folder:

![DGUS II interface](https://github.com/Thinkersbluff/CR-6-touchscreen_Thinkersbluff_Fork/blob/extui/doc/dgus2util.png)

### Build firmware archive

To build a firmware archive for distribution, use the `build.cmd` script. It will do a sanity check and then zip the files to the `build` folder.

For development you can run the build script as follows: 

```pwsh
.\build -Deploy Q:
```

Where Q: is the path of your flash drive with the SD card.

You need to have Powershell Core installed (pwsh).

### Images / screen images sources

You can find the source files where the screen bitmaps are generated from in the [`/src/DWIN/DWIN_SOURCEimages_src`](./src/DWIN/DWIN_SOURCEimages_src) folder.

To update the BMP of a screen put the **generated BMP file you made with your image editor** in the [`src\DWIN\DWIN_SOURCE`](src\DWIN\DWIN_SOURCE) folder. 

#### Updating the touch screen firmware files

It will be picked up automatically by the build process of DWIN when saving or generating the project. However, the ICL file is what actually gets flashed. This is essentially a dictionary of concatenated compressed JFIF files.

Next, re-generate the `23_Screen.icl` ICL file are follows:

![Update ICL file](images/update-screen-icl.gif)

Things worthy of note:

- Quality is set to 100%, followed by pressing the "Set all" button to apply it to each import file.
- The `DWIN_SOURCE` is used as a source for generating the ICL.
- The ICL is saved twice: once in the `DWIN_SOURCE` folder, once in the `DWIN_SET` folder.

As you can note, you update it in both `DWIN_SET` and `DWIN_SOURCE`. The first is what goes to the touch screen, the latter is what the DWIN editor uses (apparently).

For icon ICL generation the process is the same, except that you pick the icons from a subdirectory of `DWIN_SOURCE`.

### Flash space

DWIN uses a specific set-up of the flash space as described in the manual - as shown below.

![DWIN flash space](images/flash-space.png)

Essentially what it boils down to:

- The flash space is divided into 256KB sectors
- The number prefix on the ICL/HZK/BIN file name is the sector number where the file is flashed
- A sector can only contain a single file
- A file can span over multiple sectors, and if a file needs 1½ sectors for instance, it will allocate 2 sectors.
- There is no protection against sector overwriting: if you have files overlap sectors, DWIN will happily flash the next file over the previous file

So with the above in mind one must take care to make sure files do not overlap. When you flash everything to the touch screen you must ensure you've deleted the old (renumbered) ICL files from your SD card, otherwise weird things will happen. Background may go missing, etc.

During build a script will run to make sure no sectors have been overallocated. You can also run this script manually.

![DWIN sector allocation check script](imaages/sector-allocation-check.png)

### How buttons are handled with code

In the currently - cleaned up - source code of the touch screen handling in Marlin, the events of the touch screen are handled as described below. This may change in the future. This picture says it all:

![DWIN button-code correlation](images/button_type.png)

For buttons:

- Virtual Pointers for buttons are defined in `extui/lib/dgus_creality/DGUSDisplayDef.h`
- In `extui/lib/dgus_creality/DGUSDisplayDef.cpp` in the `ListOfVP` the Virtual Pointer are connected to a callback handler
- Because the Creality display used the same VP all over the place, sometimes in completely different functions or values (and this is quite some work to clean up!), these "legacy" VPs are delegated to `DGUSCrealityDisplay_HandleReturnKeyEvent`
- For legacy VPs handlers are defined per page in `extui/lib/dgus_creality/PageHandlers.cpp`
    - The "Key Data" is used to distinguish between the actual key pressed and passed to these functions as `buttonValue`

For dynamic updatable values:

- Dynamic updatable values are Virtual Pointers with a value that is pushed from the display when it is changed, and pushed to the display during the Marlin `idle` loop
- The Virtual Pointers are defined in `extui/lib/dgus_creality/DGUSDisplayDef.h`
- Per dynamically updated virtual pointer there is in `extui/lib/dgus_creality/DGUSDisplayDef.cpp`:
    - A registration in `ListOfVP`, with:
        - The VP ID
        - A pointer to the memory location to read the value from in Marlin (can be `nullptr`)
        - A callback that is triggered when the VP changed in the display and is pushed to firmware
        - A callback that is triggered to format the VP for transfer to the display. This is because strings need to be sent differently than floats, or if your VP does not point to a direct value in memory.
    - A mention in the specific `VPList` for the current page as referenced in `VPMap`. This is to optimize that we don't update VPs that are not displayed anyway.
- Some values like the M117 text are transient and are pushed directly to the display, but are still present in the `ListOfVP`

#### Previous version of the code

If you like to see how the touch screen code is handled in the Creality firmware and the original Community Firmware release 3 and lower, please check the [cf3-legacy](https://github.com/CR6Community/CR-6-touchscreen/tree/cf-3-legacy) branch. This branch is no longer maintained and only exists for historical purposes.

### Touch screen configuration

The touch screen configuration file "T5LCFG_272480.CFG" has its specification described in [T5L_DGUSII Application Development Guide20200902.pdf](vendor%20docs/T5L_DGUSII%20Application%20Development%20Guide20200902.pdf) chapter 4. You can use an editor like HxD to explore and edit it (with caution!). The DWIN editor also has a way to edit this file. Many parameters can also be set at runtime.

### Fonts

Font's are currently configured like below:

![Font Settings](images/font-settings.png)

In the same folder where you have the DWIN tool unpacked a `0_DWIN_ASC.HZK` file is placed. You need to copy that to the DWIN_SET folder, and can flash it directly.
The kerning of the current font is not ideal (especially using numbers that are small, like "1"), so perhaps we should look for a replacement.

### Other documentation

Vendor documentation is mirrored to the [vendor docs](vendor%20docs) folder.

In addition, [this is a nice resource](https://github.com/rubienr/MarlinDgusResources/tree/creality-ender-5-plus/projects).

## Credits

[The core CR-6 Community firmware dev team](https://github.com/CR6Community/Marlin#credits)

Icons from [Font Awesome](https://fontawesome.com/) and [Remix Icon](https://remixicon.com/).

Font from [Google Fonts](https://fonts.google.com/specimen/B612) and customized with [FontForge](https://fontforge.org)