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
    
    // D4 hasn't analog mode
    // Set direction to output for D4
    TRISDbits.TRISD4 = 0;
    
    // Disable analog mode for B11
    ANSELBbits.ANSB11 = 0;
    // Set direction to output for B11
    TRISBbits.TRISB11 = 0;
    
    // Disable analog mode for G15
    ANSELGbits.ANSG15 = 0;
    // Set direction to output for G15
    TRISGbits.TRISG15 = 0;
 
    // Turn on LEDs for testing
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;
    // Stop program here
    
    //while(1); 
    
    // BTN1 input
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;

    // Initialize input for BTN2
    
    TRISAbits.TRISA4 = 1;
    
    // Test switches
    
   /* while (1) {
        LATGbits.LATG6  = PORTAbits.RA5;
        LATDbits.LATD4  = PORTAbits.RA4;
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
        if (1 == BTN1_PORT_BIT ) {
            // switch is pressed
            delay_count = 1000000;
        } else {
            // switch is not pressed
            delay_count = 4000000;
        }
        LD1_PORT_BIT = 1; // Turn on LED
        Delay(delay_count);
        LD1_PORT_BIT = 0; // Turn off LED
        Delay(delay_count);
    }
}

void Scan_LEDs(void) {
    int LED_state = 1; // 1 on (initial value), 0 off
    int delay_count=10000000;

    while (1) {
        if (1 == BTN1_PORT_BIT) { // button 1 pushed
            delay_count = 300000;
        } else {    // button 1 not pushed
            delay_count = 10000000;
        }

        if (1 == BTN2_PORT_BIT) { // button 2 pushed
            // switch off all LEDs
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

void Sel_mode_LEDs(void) {
    int LED_state = 1; // 1 on (initial value), 0 off
    int delay_count = 10000000;
    int i;
    while (1) {
        if (0 == BTN1_PORT_BIT && 0 == BTN2_PORT_BIT) { // buttons not pressed
            //1st mode
            LD1_PORT_BIT = LED_state;
            Delay(delay_count);
            LD2_PORT_BIT = LED_state;
            Delay(delay_count);
            LD3_PORT_BIT = LED_state;
            Delay(delay_count);
            LD4_PORT_BIT = LED_state;
            Delay(delay_count);
        } 

        else if (0 == BTN1_PORT_BIT && 1 == BTN2_PORT_BIT) { // button 2 pressed
            //2nd mode
            LD4_PORT_BIT = LED_state;
            Delay(delay_count);
            LD3_PORT_BIT = LED_state;
            Delay(delay_count);
            LD2_PORT_BIT = LED_state;
            Delay(delay_count);
            LD1_PORT_BIT = LED_state;
            Delay(delay_count);
        }
        
        else if (1 == BTN1_PORT_BIT && 0 == BTN2_PORT_BIT) { // button 1 pressed
            // 3rd mode
            LD4_PORT_BIT = LED_state;
            LD1_PORT_BIT = LED_state;
            Delay(delay_count);
            LD3_PORT_BIT = LED_state;
            LD2_PORT_BIT = LED_state;
            Delay(delay_count);
        }
        else { //1st and 2nd buttons pushed & Running LED (4th mode)
          if(LED_state) {
            LD1_PORT_BIT = LED_state;
            LD2_PORT_BIT = !LED_state;
            LD3_PORT_BIT = !LED_state;
            LD4_PORT_BIT = !LED_state;
            Delay(delay_count);
            LD1_PORT_BIT = !LED_state;
            LD2_PORT_BIT = LED_state;
            LD3_PORT_BIT = !LED_state;
            LD4_PORT_BIT = !LED_state;
            Delay(delay_count);
            LD1_PORT_BIT = !LED_state;
            LD2_PORT_BIT = !LED_state;
            LD3_PORT_BIT = LED_state;
            LD4_PORT_BIT = !LED_state;
            Delay(delay_count);
            LD1_PORT_BIT = !LED_state;
            LD2_PORT_BIT = !LED_state;
            LD3_PORT_BIT = !LED_state;
            LD4_PORT_BIT = LED_state;
            Delay(delay_count);
          }
          else {
           LD1_PORT_BIT = 0;
           LD2_PORT_BIT = 0;
           LD3_PORT_BIT = 0;
           LD4_PORT_BIT = 0; 
          }
        }
    // next time, set LEDs to opposite state
            LED_state = 1 - LED_state; 
    }
}
