
#include "lab1_basicIO.h"    /* variables/params used by user.c               */

void delay(volatile uint32_t n) 
{
    for (; n > 0; n--);
}

void check_buttons(uint8_t *mode, uint8_t *speed) 
{
    if (BTN1) {
        delay(DEBOUNCE_DELAY);      /* a little delay after pressing the button */
        (*mode) = !(*mode);         /* changing displaying mode */
    }
    if (BTN2) {
        delay(DEBOUNCE_DELAY);
        if ((*speed) < MAX_SPEED) {     /* if speed value is less then 15, increment it */
            (*speed) += 1;
        } else {                        /* if speed value is >= 15, reset it to 1 */
            (*speed) = 1;
        }
    }
}

void blink(uint8_t speed) {
    uint32_t led_delay;
    led_delay = speed * BASE_LED_DELAY;
    
    SET_LED1(1);
    SET_LED2(1);
    SET_LED3(1);
    SET_LED4(1);
    delay(led_delay);
    
    SET_LED1(0);
    SET_LED2(0);
    SET_LED3(0);
    SET_LED4(0);
    delay(led_delay);
}

/* display_speed func dislaying the speed of blinking in binary code using 4 onboard LEDs*/
void display_speed(uint8_t speed) 
{   
    SET_LED4((speed >> 3) & 1);
    SET_LED3((speed >> 2) & 1);
    SET_LED2((speed >> 1) & 1);
    SET_LED1(speed & 1);
}
