/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"            /* variables/params used by user.c               */

/******************************************************************************/
/* User Functions                                                             */

/******************************************************************************/

void init_app(void) {
    /* Setup analog functionality and port direction */

    // LED output
    // Disable analog mode for G6
    ANSELGbits.ANSG6 = 0;
    // Set direction to output for G6
    TRISGbits.TRISG6 = 0;

    // Initialize outputs for other LEDs
    ANSELGbits.ANSG15 = 0;
    TRISGbits.TRISG15 = 0;
    
    ANSELBbits.ANSB11 = 0;
    TRISBbits.TRISB11 = 0;
    
    TRISDbits.TRISD4 = 0; //D4 hasnt analog mode

    // Turn off LEDs for beginning
    
    led1 = led2 = led3 = led4 = 0;
    
     
    // BTN1 input
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;

    // Initialize input for BTN2
   // ANSELAbits.ANSA4 = 0; hasnt analog mode
    TRISAbits.TRISA4 = 1;
    
    flash_led();        //it turn on all leds and then turn off for cheking the board


}

void delay(int n) {
    n = 10000 * n;      // n - in milliseconds
    for (; n > 0; n--) {
    }
}


void flash_led(void) {
    uint32_t delay_count = 1000;//in milliseconds
        led1 = 1; // Turn on LED
        delay(delay_count);
        led1 = 0; // Turn off LED
        delay(delay_count);
}

#define VER 2   //in VER1 we have standart task for lab1, in VER2 my own idea and its realization

#if VER==1 
void Scan_LEDs(void) {
    int LED_state = 1; // 1 on (initial value), 0 off

    while (1) {
        if (btn1) { // btn1 pressed
            delay_count = 300000;
        } else {    // btn1 not pressed
            delay_count = 1000;
        }

        if (btn2) { // btn 2 pressed
            // turn off all leds
            led1 = 0;
            led2 = 0;
            led3 = 0;
            led4 = 0;
        } else {
            led1 = LED_state;
            Delay(delay_count);
            led2 = LED_state;
            Delay(delay_count);
            led3 = LED_state;
            Delay(delay_count);
            led4 = LED_state;
            Delay(delay_count);

// next time, set LEDs to opposite state
            LED_state = !LED_state; 
        }
    }
}
#elif VER==2
void scan_leds(void) {
    
    bool LED_state = 1; // 1 on (initial value), 0 off
    uint32_t delay_count = 1000; 
    uint32_t btn_counter = 0;    //clamping protection
    uint32_t counter = 0;        //times to turn on LED
    
    if (1 == btn1) {        //go into the cycle of counting blinks
        counter++;
        uint32_t i = 0;
        for (i; i < 20000000; i++) {     //waiting about 2 seconds 
            if ((btn1) && (0 == btn_counter)) {
                counter++;
                btn_counter = 1;        //clamping protection
                i = 0;
            }
            if ((1 == btn_counter) && (!btn1)) { //inspection for button releasing
                btn_counter = 0;
            }
        }
    }
    
    if (counter > 0) {      //condition for go into blink n times
        counter <<= 1;       //turn on and turn off there are two iterations of cycle
        uint32_t i = 0;
        for (i = 0; i <= counter; i++) {
             led1 = LED_state;  //turn on or turn off led
             delay(delay_count);
             LED_state = !LED_state; 
        }
        counter = 0;        //return to begin
    }
   
}
#endif
