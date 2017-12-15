# Labs #4, 5 and 6: UART, SPI, OLED display, FreeRTOS and Wolf3D Clone

## Content

* [About](#about)
* [Build](#build)

## About

![Wolf3D Clone gameplay](media/wolf3d_clone.gif)

This is simple clone of the legendary [Wolfenstein 3D](https://en.wikipedia.org/wiki/Wolfenstein_3D) video game, first-person shooter developed by **id Software**. Originally released on May 5, 1992 for MS-DOS.

Like the original - clone is written in [Pure C](http://lurkmore.to/Pure_C).

The project was tested on a microcontrollers `PIC32MZ2048ECG100` and `PIC32MZ2048EFG100`.

## Build

The project is compiled using the **Makefile**. But Makefile included in this project does not know the location of the compiler on the hard disk. So all these files need to be added to the already created and configured project in the [~~normal~~](http://www.vim.org/ "God's gift
") [MPLAB](http://www.microchip.com/mplab/mplab-x-ide "The wiles of the devil") IDE. Also on hard disk needs to be installed [XC32](http://www.microchip.com/mplab/compilers) compiler.

After compilation, the intermediate object files will be in the `build/` folder, and the firmware file in the `dist/` folder.
