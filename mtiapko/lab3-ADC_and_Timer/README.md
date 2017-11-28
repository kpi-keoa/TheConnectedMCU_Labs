# Lab #3: Timer and PWM

![sin city](img/sin_city_femme_fatale_eva_green.jpg "Femme fatale - Eva Green")

## Content

* [About](#about)
* [Build](#build)

## About

This program uses a timer to clock the software [PWM](https://soundcloud.com/chikujii/lil-wayne-pussy-money-weed-pmw). And with the help of this PWM and 4 LEDs, located on the board, a sinusoid is drawn.

The project was written and tested on a microcontrollers `PIC32MZ2048ECG100` and `PIC32MZ2048EFG100`.

## Build

The project is compiled using the **Makefile**. But Makefile included in this project does not know the location of the compiler on the hard disk. So all these files need to be added to the already created and configured project in the [~~normal~~](http://www.vim.org/ "God's gift
") [MPLAB](http://www.microchip.com/mplab/mplab-x-ide "The wiles of the devil") IDE. Also on hard disk needs to be installed [XC32](http://www.microchip.com/mplab/compilers) compiler.

After compilation, the intermediate object files will be in the `build/` folder, and the firmware file in the `dist/` folder.
