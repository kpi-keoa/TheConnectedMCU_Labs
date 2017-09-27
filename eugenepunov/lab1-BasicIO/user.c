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

void InitApp(void) {
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

    // Turn on LEDs for testing
    
    led1 = 0;
    led2 = 0;
    led3 = 0;
    led4 = 0;
    

    // Stop program here
    
    // while (1);

    // BTN1 input
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;

    // Initialize input for BTN2
   // ANSELAbits.ANSA4 = 0; hasnt analog mode
    TRISAbits.TRISA4 = 1;

    // Test switches
    
    /*while (1) {
      led1 = btn1;
      led2 = btn2;
    };*/
    
    Scan_LEDs();
}

void Delay(int n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}


void Flash_LED(void) {
    int delay_count;
    while (1) {
        if (PORTAbits.RA5 == 1) {
            // switch is pressed
            delay_count = 1000000;
        } else {
            // switch is not pressed
            delay_count = 4000000;
        }
        PORTGbits.RG6 = 1; // Turn on LED
        Delay(delay_count);
        PORTGbits.RG6 = 0; // Turn off LED
        Delay(delay_count);
    }
}

#define VER 1

#if VER==1 
void Scan_LEDs(void) {
    int LED_state = 1; // 1 on (initial value), 0 off
    int delay_count=1000000;

    while (1) {
        if (btn1 == 1) { // btn1 pressed
            delay_count = 300000;
        } else {    // btn1 not pressed
            delay_count = 1000000;
        }

        if (btn2 == 1) { // btn 2 pressed
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
            LED_state = 1 - LED_state; 
        }
    }
}
#elif VER==2
void Scan_LEDs(void) {
    int LED_state = 1; // 1 on (initial value), 0 off
    int delay_count = 1000000; //time to push the button
    int btn_counter = 0;    //clamping protection
    int counter = 0;        //times to turn on LED
    if (btn1 == 1) {        //go into the cycle of counting blinks
        counter++;
        for (int i = 0; i < 2000000; i++) {     //waiting about 2 seconds 
            if (btn1 == 1 && btn_counter = 0) {
                counter++;
                btn_counter = 1;        //clamping protection
                i = 0;
            }
            if (btn_counter == 1 && btn1 == 0) { //inspection for button releasing
                btn_counter = 0;
            }
        }
    }
    
    if (counter > 0) {      //condition for go into blink n times
        counter *= 2;       //turn on and turn off there are two iterations of cycle
        for (int i = 0; i <= counter; i++) {
             led1 = LED_state;  //turn on or turn off led
             Delay(delay_count);
             LED_state = 1 - LED_state; 
        }
        counter = 0;        //return to begin
    }
   
}
#endif
