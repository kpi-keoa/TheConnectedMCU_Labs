#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "my.h"              /* Functions and params from my.h                */

void InitApp(void)
{
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
    
    //Set all LEDs off
    turnOff();
}

void turnOff()
{
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;
}

void delay(int n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

uint32_t upSpeed(uint32_t counter)
{   
    if(1 == BTN1_PORT_BIT)
    {
        delay(200000);
        counter += 1000000;
    }
    return counter;
}

void flashLED()
{
    volatile uint32_t delay_counter = 0;
    while(BTN2_PORT_BIT != 1)
    {
        delay_counter = upSpeed(delay_counter);
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
                break;
        }
        turnOff();
        algorithm(delay_counter);
    }
}

void algorithm(int delay_counter)
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
