# lab3-ADC_PWM

lab3-ADC_PWM is a university laboratory project for PIC32 WiFire kit written in C language for studying basic configuring and usage of ADC and PWM.

In project was implemented controlling an angle of the servo by chaging an angle of potentiometer. By chaging an angle of potentiometer voltage on its output also changes. To convert analog voltage to digital value ADC is used. Then digital value from ADC is used to calculate duty cycle for servo's PWM.

Project was documented using doxygen, so if you have "latex" on your machine you can simply generate project's reference manual in pdf by using "make pdf" command in your console.
