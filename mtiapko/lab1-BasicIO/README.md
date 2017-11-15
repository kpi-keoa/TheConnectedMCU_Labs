# LAB #1: Basic of peripheral I/O ports

## Content
* [About](#about)
* [Build](#build)

## About

Programs written in this work by pressing the button `BTN_1` lights one of the four LEDs on the board. LEDs lights occurs cyclically.

| # |LED off|LED on |
|:-:|:-----:|:-----:|
|1. |   -   |`LED_1`|
|2. |`LED_1`|`LED_2`|
|3. |`LED_2`|`LED_3`|
|4. |`LED_3`|`LED_4`|
|5. |`LED_4`|`LED_1`|
|6. |`LED_1`|  ...  |

The project was written and tested on a microcontroller `PIC32MZ2048EFG100`.

## Build

![build img](./build.jpg "Building process")

The project is compiled using the **Makefile**. But Makefile included in this project does not know the location of the compiler on the hard disk. So all these files need to be added to the already created and configured project in the [~~normal~~](http://www.vim.org/ "God's gift
") [MPLAB](http://www.microchip.com/mplab/mplab-x-ide "The wiles of the devil") IDE. Also on hard disk needs to be installed [XC32](http://www.microchip.com/mplab/compilers) compiler.

After compilation, the intermediate object files will be in the `build/` folder, and the firmware file in the `dist/` folder.