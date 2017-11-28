/******************************************************************************/
/*  Files to Include                                                          */
/******************************************************************************/
#ifdef __XC32
    #include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif
#include <stdint.h>         /* For uint32_t definition                        */
#include "user.h"           /* User funct/params, such as InitApp             */


int main(void)
{
    init_gpio();            /* GPIOs Initialization */
    init_servo();           /* PWM initialization*/
    initWiFIREadc();
    init_interrupt();
    
    uint16_t angle = SERVO_0;
    while (1) {
        angle = (ReadPotentiometerWithADC() / 6) + 220;
        OC8RS = angle;
    }  
}
