
#include "lab2_BasicInterrupts.h"


void delay(volatile uint32_t n) {
    for (; n > 0; n--);
}

void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SOFT) ISR_PortA_Change(void) {
    if (CNSTATAbits.CNSTATA5 == 1) {    // Bit 5 (BTN1) changed
        if (BTN1) {                     // Switch is pressed
            mode = !mode;               // changing displaying mode
        }
    } 
    else if (CNSTATAbits.CNSTATA4 == 1) {   // Bit 4 (BTN1) changed
        if (BTN2) {                         // Switch is pressed
            if (bright < MAX_BRIGHT) {      // if bright value is less then 15, increment it */
                bright += 1;
            } 
            else {                          // if bright value is >= 15, reset it to 1 */
                bright = 1;
            }
        }
    }
    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
}

void pwm_light(uint8_t on_delay) {
    uint8_t off_delay;
    
    off_delay = LED_DELAY - on_delay;
    
    SET_LED1(1);
    SET_LED2(1);
    SET_LED3(1);
    SET_LED4(1);
    delay(on_delay);
    
    SET_LED1(0);
    SET_LED2(0);
    SET_LED3(0);
    SET_LED4(0);
    delay(off_delay);
}

void display_bright(uint8_t bright) {       
    SET_LED1(0);
    SET_LED2(0);
    SET_LED3(0);
    SET_LED4(0);
            
    SET_LED4((bright >> 3) & 1);
    SET_LED3((bright >> 2) & 1);
    SET_LED2((bright >> 1) & 1);
    SET_LED1(bright & 1);
}
