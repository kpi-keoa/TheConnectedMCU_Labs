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
    ANSELGbits.ANSG15 = 0;

    TRISBbits.TRISB11 = 0;
    TRISGbits.TRISG15 = 0;
    TRISDbits.TRISD4 = 0;

    // Turn on LEDs for testing
    LATGbits.LATG6 = 1;
    LATDbits.LATD4 = 1;
    LD4_PORT_BIT = 1;
    LD3_PORT_BIT = 1;

    // BTN1 input
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;

    // Initialize input for BTN2
    TRISAbits.TRISA4 = 1;

}

void delay(uint32_t n) {
    volatile uint32_t i;
    for (i = 0; i < n; i++) 
    {
    }
}
void turnOff()
{
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;
}
// Starter version
void flashLED(void) 
{
    volatile uint32_t delay_counter = 0;
    turnOff();
    while(!PORTAbits.RA4)
    {
        if(PORTAbits.RA5)
        {
            delay(10000000);
            delay_counter += 1000000;
        
        switch(delay_counter)
        {
            case 1000000:
                LD1_PORT_BIT = 1;
                break;
            case 2000000:
                LD2_PORT_BIT = 1;
                break;
            case 3000000:
                LD3_PORT_BIT = 1;
                break;
            case 4000000:
                LD4_PORT_BIT = 1;
                break;
            default:
                turnOff();
                delay_counter = 0;
                break;
        }
        }
    }
    turnOff();
    while(1)
    {
    algorithm(delay_counter);
    }
}

void algorithm(uint32_t delay_counter)
{
    LD1_PORT_BIT = 1;
    delay(delay_counter);
    LD2_PORT_BIT = 1;
    delay(delay_counter);
    LD3_PORT_BIT = 1;
    delay(delay_counter);
    LD4_PORT_BIT = 1;
    delay(delay_counter);
    LD1_PORT_BIT = 0;
    delay(delay_counter);
    LD2_PORT_BIT = 0;
    delay(delay_counter);
    LD3_PORT_BIT = 0;
    delay(delay_counter);
    LD4_PORT_BIT = 0;
    delay(delay_counter);
    LD4_PORT_BIT = 1;
    delay(delay_counter);
    LD3_PORT_BIT = 1;
    delay(delay_counter);
    LD2_PORT_BIT = 1;
    delay(delay_counter);
    LD1_PORT_BIT = 1;
    delay(delay_counter);
    LD4_PORT_BIT = 0;
    delay(delay_counter);
    LD3_PORT_BIT = 0;
    delay(delay_counter);
    LD2_PORT_BIT = 0;
    delay(delay_counter);
    LD1_PORT_BIT = 0;
    delay(delay_counter);
}
