# lab4-UART_SPI

lab4-UART_SPI is a university laboratory project for PIC32 WiFire kit written in C language for studying basic configuring and usage of UART and SPI protocols.

In project was implemented controlling an angle of the servo through UART and displaying setted angle of the servo on OLED SPI display. Using COM port terminal you can turn servo to one of three defined angles (0, 90, 180) by sending '1', '2' or '3' respectively. It uses 115200 baud rate.

Project was documented using doxygen, so if you have "latex" on your machine you can simply generate project's reference manual in pdf by using "make pdf" command in your console.

![WiFire](img/WiFire.png)