
#include "lab1_basicIO.h"           /* User funct/params, such as InitApp             */

void main(void)
{
    init();     /* initializing GPIOs */  
    
    uint8_t mode = SPEED_DISPLAYING_MODE;
    uint8_t speed = 1;
    
    while (1) {
        check_buttons(&mode, &speed);
        if (mode == SPEED_DISPLAYING_MODE) {
            display_speed(speed);
        } 
        else if (mode == BLINKING_MODE) {
            blink(speed);
        }
    }
}