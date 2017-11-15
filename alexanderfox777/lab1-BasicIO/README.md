# LAB #1: Basic of peripheral I/O ports

## Content
* [About](#about)
* [Example](#example)

## About
By pressing button1 we increase the counter (which is initially 0) by one. When the counter is successfully enlarged the fourth LED lights up. Now pressing button2 we will start flashing LEDs. LEDs light up as much as recorded in the counter. Each counter value that is a multiple to two will light up two LEDs. Each counter value that is a multiple to three will light up three LEDs. In all other cases one LED light up

## Example
For example, the counter is 6 and we pressed button 2

| # |LEDs blinc           |
|:-:|:-----:              |
|1. |`LED_1`              |
|2. |`LED_1``LED_2`       |
|3. |`LED_1``LED_2``LED_3`|
|4. |`LED_1``LED_2`       |
|5. |`LED_1`              |
|6. |`LED_1``LED_2``LED_3`|

The project was written and tested on a microcontroller `PIC32MZ2048EFG100`.