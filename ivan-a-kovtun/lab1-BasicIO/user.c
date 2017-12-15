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
    ANSELBbits.ANSB11 = 0;
    TRISBbits.TRISB11 = 0;
    
    ANSELGbits.ANSG15 = 0;
    TRISGbits.TRISG15 = 0;
    
    /* ANSELDbits.ANSD4 = 0;
       we don't write this string because
       it is no analog mode for port D
     */
    TRISDbits.TRISD4 = 0;

    // Turn on LEDs for testing
    LD1_PORT_BIT = 1;
    LD2_PORT_BIT = 1;
    LD3_PORT_BIT = 1;
    LD4_PORT_BIT = 1;
    
    //test LEDs by this loop
    /*
    int j = 0;
    for (j=0; j<20; j++) {
        Delay(8000000);
        LD1_PORT_BIT = ~ LD1_PORT_BIT;
        LD2_PORT_BIT = ~ LD2_PORT_BIT;
        LD3_PORT_BIT = ~ LD3_PORT_BIT;
        LD4_PORT_BIT = ~ LD4_PORT_BIT;
    }
    */
    
    // Stop program here
    //while (1);
    
    // BTN1 input
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;

    // Initialize input for BTN2
    //ANSELAbits.ANSA4 = 0; As for D4
    TRISAbits.TRISA4 = 1;

    // Test switches
    /*
    while (1) {
        LD1_PORT_BIT = BTN1_PORT_BIT;
        LD2_PORT_BIT = BTN2_PORT_BIT;
    };
    */
}

void Delay(int n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

void Flash_LED(void) {
    int delay_count;
    while (1) {
        if (1 == PORTAbits.RA5) {
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

void Scan_LEDs(void) {
    int LED_state = 1; // 1 on (initial value), 0 off
    int delay_count=1000000;

    while (1) {
        if (1 == BTN1_PORT_BIT) { // button 1 is pressed
            delay_count = 300000;
        } else {    // button 1 is not pressed
            delay_count = 1000000;
        }

        if (1 == BTN2_PORT_BIT) { // button 2 is pressed
            // Turn off all LEDs
            LD1_PORT_BIT = 0;
            LD2_PORT_BIT = 0;
            LD3_PORT_BIT = 0;
            LD4_PORT_BIT = 0;
        } else {
            LD1_PORT_BIT = LED_state;
            Delay(delay_count);
            LD2_PORT_BIT = LED_state;
            Delay(delay_count);
            LD3_PORT_BIT = LED_state;
            Delay(delay_count);
            LD4_PORT_BIT = LED_state;
            Delay(delay_count);

// next time, set LEDs to opposite state
            LED_state = 1 - LED_state; 
        }
    }
}
