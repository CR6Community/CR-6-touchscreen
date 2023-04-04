# Welcome!
This is the documentation for the latest release of the CR6Community DWIN_SET application - Re-Factored version 1.1, released 13 March 2023.

## Application
This DWIN_SET is compatible with:
- the motherboard firmware of [CR6Community Firmware Release 6.1](https://github.com/CR6Community/Marlin/releases/tag/v2.0.8.1-cr6-community-release-6.1)
- any version of DGUS2 OS
- the 272 x 480 pixel portrait-mode DWIN TFT display delivered stock with each Creality CR6 printer

NOTE: This DWIN_SET is NOT compatible with the AnyCubic Vyper display.
- The Vyper is supplied with a different TFT.    
- If users wish to adapt this display to that TFT, they will need to use a bitmap editor to modify the screenmaps, and DGUSTools to refactor the application.  That effort is beyond the scope of this project.

## Installation Guidelines
This DWIN_SET must be flashed to the DWIN TFT display, from an SD card.
- The SD card must be prepared as documented in [Detailed SD Card Formatting Instructions.MD](Detailed%20SD%20Card%20Formatting%20Instructions.MD)
- A high-level set of installation instructions is included in [the repo README](../README.md)
- Detailed Instructions and Examples for preparing-for, performing and troubleshooting problems with the flashing process are documented in [Flashing Help.MD](Flashing%20Help.MD)

## Help For Users Who Have Problems With or After Flashing Their Display
Some users will have difficulty flashing this firmware to their display.
 - e.g.: The display bootloader may not read their SD card correctly
Troubleshooting advice is included in [Flashing Help.MD](Flashing%20Help.MD)
Some users will have flashed their touchscreens with a different version of DGUS2 than the one for which their display was calibrated.  Those users will find that although the main menu screen is correctly displayed after flashing this firmware, the buttons will not work if tapped, as if their touchscreen is "frozen".
- DGUS2 Kernel files are provided, with instructions, to support users who wish to flash their screen back to a compatible version of DGUS2.

## Release Notes
A brief summary of the differences between this release and the CF6.1 release is documented in [Release Notes.MD](Release%20Notes.MD)

## Known Issues
A brief overview of known issues with this release is documented in [Known Issues.MD](KNOWN%20ISSUES.MD)

## Reverting to Stock Creality Firmware
Guidelines for reverting a CR6 printer from CR6Community Firmware back to Creality stock firmware are included in [Release Notes.MD](Release%20Notes.MD)
**NOTE: Those guidelines are offered in good faith, but we obviously can not guarantee that those instructions will work, since we can not be sure what (if any) changes Creality have made or will make to their systems.

## License
The CR6Community CR-6-touchscreen firmware is licensed under the GNU General Public License (GPL) v3.0
