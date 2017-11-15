	In this lab, a program was created to manage I / O ports, specifically, to control LEDs with the help of clock buttons on the chipKIT Wi-FIRE (REV B) board.
	The program has a standard function to initialize the used I / O ports (buttons, LEDs), where their direction, mode of operation (analog or digital) and the
initial value are specified.
	There are standard: the delay count function and the LED control function by means of the buttons.
	A new function has been created for controlling the blinking modes of the LEDs with the help of two buttons. Unlike the standard function, there are more
blinking modes of the LEDs (it was 3, now 4), there was no possibility to increase the blinking frequency. Of the four flash modes, only one was in the
standard function, this is the first mode. The second mode is based on the first, only the flashing order of the LEDs changed to the opposite one (the first
one was from left to right, now from the right to the left). In the third mode, the LEDs blink from the edges to the center, and in the fourth mode the 
running LED is implemented from left to right (at the same time only one LED is lit , the other LEDs do not glow).