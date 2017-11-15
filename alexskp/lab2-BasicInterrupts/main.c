
#include "lab2_BasicInterrupts.h"       /* User funct/params, such as init() */


volatile uint8_t mode = SPEED_DISPLAYING_MODE;
volatile uint8_t bright = 1;

void main(void) {
    init();             /* initializing GPIOs */  
    
    while (1) {
        if (mode == SPEED_DISPLAYING_MODE) {
            display_bright(bright);
        } 
        else if (mode == LIGHT_MODE) {
            pwm_light(bright);
        }
    }
}
