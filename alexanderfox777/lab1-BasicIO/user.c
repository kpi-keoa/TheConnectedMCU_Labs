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

#if 1  // First version without #define names
void InitApp(void) {
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

    // Turn on LEDs for testing
    LATBbits.LATB11 = 0;
    LATGbits.LATG6 = 0;
    LATGbits.LATG15 = 0;
    LATDbits.LATD4 = 0;

    
    // Stop program here
    // while (1);

    // BTN1 input
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;

    // Initialize input for BTN2
    TRISAbits.TRISA4 = 1;
  
    // Test switches
  //  while (1) {
    //    LATGbits.LATG6 = PORTAbits.RA5;
      //  LATDbits.LATD4 = PORTAbits.RA4;
    //}
}
#endif

void  delay(volatile int n) {
    for (; n > 0; n--);
}

void Blink_LEDs(void) {
    uint32_t delay_count= 10000000; // delay
    uint32_t count = 0; // counter that shows how many times LED will flash
    uint32_t i; //

    while (1) {
        if (BTN1_PORT_BIT) { // switch 1 is pressed
            count++;
            LD4_PORT_BIT = 1; // This LED indicates that the information is read
            delay(delay_count);
            LD4_PORT_BIT = 0; //
            continue;
        }
        
        if(BTN2_PORT_BIT){  //switch 2 is pressed
        for(i = 1; i <= count; i++) { //LEDs will light up as many times as we pressed the button1, 
                                      //and if a multiple of two then the two LEDs will light, 
                                      //if the multiple is three, then three
            LD1_PORT_BIT = 1; // Turn on LED
            if(i % 2 == 0 || i % 3 == 0)
            LD2_PORT_BIT = 1; // Turn on LED if a multiple of two
            if(i % 3 == 0)
            LD3_PORT_BIT = 1; //Turn on LED if a multiple of three
            delay(delay_count);
         
            LD1_PORT_BIT = 0; // Turn off all the LEDS
            LD2_PORT_BIT = 0;
            LD3_PORT_BIT = 0;
            delay(delay_count);
        }
        count = 0; 
        } 
        }
    }
