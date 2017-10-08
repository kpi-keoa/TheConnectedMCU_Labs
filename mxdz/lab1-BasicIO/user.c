#include "user.h"      

void morse_code_encoding(char msg[], char *res) {
    char *morse_table[] = {
        "13","3111","3131","311","1","1131","331","1111","11","1333","313","1311","33","31","333","1331","3313","131","111","3","113","1113","133","3113","3133","3311"
    };
    for (uint32_t i = 0; msg[i]!='\0'; i++) {
        if (msg[i] == ' ') {
            strcat(res, " ");
        } else {
            int pos = msg[i] - 'a';
            strcat(res, morse_table[pos]);
        }
    }
}

void init_app(void) {
    /* Setup analog functionality and port direction */

    // LED output
    // Disable analog mode for G6
    ANSELGbits.ANSG6 = 0;
    // Set direction to output for G6
    TRISGbits.TRISG6 = 0;

    // Initialize outputs for other LEDs
    ANSELBbits.ANSB11 = 0;
    ANSELGbits.ANSG15 = 0;

    TRISBbits.TRISB11 = 0;
    TRISGbits.TRISG15 = 0;
    TRISDbits.TRISD4 = 0;

    // Turn off LEDs for initialization
    LED_1 = 0;
    LED_2 = 0;
    LED_3 = 0;
    LED_4 = 0;

    // BTN1 input
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;

    // Initialize input for BTN2
    TRISAbits.TRISA4 = 1;    
    
    morse_code_encoding(MSG, encoded_msg);
}

void delay(volatile uint32_t val) {
    while (val --> 0);
}

void blink_leds(uint32_t mode) {
    if (mode == 1) {
        LED_1 = 1;
        delay(BLINK_DELAY);
        LED_1 = 0;
        delay(BLINK_DELAY);
    } else if(mode == 3) {
        LED_2 = LED_3 = LED_4 = 1;
        delay(BLINK_DELAY);
        LED_2 = LED_3 = LED_4 = 0;
        delay(BLINK_DELAY);
    }
}

void display_msg(void) {
    if (BTN_1 == 1) { 
        delay(DEBOUNCE_DELAY);
        for(uint32_t i = 0; encoded_msg[i]!='\0'; i++) {
            if(encoded_msg[i] == '1') {
                blink_leds(1);
            } else if(encoded_msg[i] == '3') {
                blink_leds(3);
            } else {
                delay(BLINK_DELAY);
            }
        }
    }
}