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

void InitApp(void)
{
    // LED output
    // Disable analog mode
    ANSELBbits.ANSB9 = 0;
    // Set direction to output
    TRISBbits.TRISB9 = 0;
    // LED off
    LATBbits.LATB9 = 0;
    // Button input
    // Disable analog mode
    ANSELBbits.ANSB13 = 0;
    // Set directions to input
    TRISBbits.TRISB13 = 1;
}

void Delay(int n) {
    volatile int i;
    for (i=0; i<n; i++) {
    }
 }

#define VER 3

#if VER==1
void Flash_LED(void) {
    while (1) {
        LATGbits.LATG6 = 1; // Turn on LED
        LATGbits.LATG6 = 0; // Turn off LED
    }
}
#elif VER==2
void Flash_LED(void) {
    while (1) {
        LATBbits.LATB8 = 1; // Turn on LED
        Delay(20000000);
        LATBbits.LATB8 = 0; // Turn off LED
        Delay(10000000);
    }
}
#elif VER==3
void Flash_LED(void) {
    int delay_count;
    while (1) {
        if (PORTBbits.RB13 == 1) {
            // switch is pressed
            delay_count = 10000000;
        } else {
            // switch is not pressed
            delay_count = 40000000;
        }
        LATBbits.LATB9 = 1; // Turn on LED
        Delay(delay_count);
        LATBbits.LATB9 = 0; // Turn off LED
        Delay(10000000);
    }
}
#endif