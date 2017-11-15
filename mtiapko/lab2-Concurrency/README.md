# LAB #2: Concurrency

## Content

* [About](#about)
* [Build](#build)

## About

Tug-of-war game. The burning LEDs indicate the position of the center of the rope. The team that pulled the rope wins. Victory is symbolized by running lights. The advantage of this code is that the processing of keystrokes occurs through interrupts, which minimizes the ability to skip pressing a button.

The project was written and tested on a microcontroller `PIC32MZ2048ECG100`.

## Build

The project is compiled using the **Makefile**. But Makefile included in this project does not know the location of the compiler on the hard disk. So all these files need to be added to the already created and configured project in the [~~normal~~](http://www.vim.org/ "God's gift
") [MPLAB](http://www.microchip.com/mplab/mplab-x-ide "The wiles of the devil") IDE. Also on hard disk needs to be installed [XC32](http://www.microchip.com/mplab/compilers) compiler.

After compilation, the intermediate object files will be in the `build/` folder, and the firmware file in the `dist/` folder.
