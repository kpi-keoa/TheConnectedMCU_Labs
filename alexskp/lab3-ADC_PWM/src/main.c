/**
 *  \file
 *  \author Alexandr Skopets
 *  \date 28.11.2017
 *  \brief Main project file 
 */

#ifdef __XC32
    #include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif
#include <stdint.h>         /* For uint32_t definition                        */
#include "user.h"           /* User funct/params, such as InitApp             */

/**
 *  \brief main function
 *  
 *  Contains GPIO and peripherals initialization
 *  and infinite loop.
 */
int main(void)
{
    init_gpio();            /* GPIOs Initialization */
    init_servo();           /* PWM initialization*/
    initWiFIREadc();
    
    uint16_t angle = SERVO_0;
    while (1) {
        angle = (ReadPotentiometerWithADC() / 6) + 220;
        OC8RS = angle;
    }  
}
