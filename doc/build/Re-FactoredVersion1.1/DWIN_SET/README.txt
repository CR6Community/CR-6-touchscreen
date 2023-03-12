This README file can be left in this folder or deleted, as you wish.  The display bootloader will ignore it.

These two files need only be flashed ONCE to your display:
 - T5LCFG_272480.CFG
 - 0_DWIN_ASC_New_At_v1.1.HZK

The T5LCFG file configures your display. DO NOT INTERUPT POWER WHILE FLASHING THAT FILE OR YOU MAY BRICK YOUR DISPLAY!!!

The HZK file loads the font graphics to your display.
The data displays have been sized to work specifically with this font If you do not flash it, the display will use the last font file you did flash, which might cause some values to be too large or small for the field.

NOTE: This font file finally fixes the "clipped descenders" bug!


If you wish:
  You can put just these two files into a folder called DWIN_SET and flash just them to your display.
    The blue screen will show 001 CFG file and 001 HZK file flashed, when it reaches END!

  Then you can delete those two files from this DWIN_SET folder and flash the rest of these files to your display.

Alternatively, you can flash all of the files in this folder to your display in one "shot."


