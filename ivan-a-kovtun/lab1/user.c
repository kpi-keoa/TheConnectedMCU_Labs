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
    // LED outputs
    // Disable analog mode if present
    ANSELGbits.ANSG6 = 0;
    ANSELBbits.ANSB11 = 0;
    ANSELGbits.ANSG15 = 0;
    // Set direction to output 
    TRISGbits.TRISG6 = 0;
    TRISBbits.TRISB11 = 0;
    TRISGbits.TRISG15 = 0;
    TRISDbits.TRISD4 = 0;
    // Turn off LEDs for initialization
    PORTG &= (  ~ (1<<LD1_POS)  )  &  (  ~ (1<<LD4_POS)  );
    PORTD &= ~ (1 << LD2_POS);
    PORTB &= ~ (1 << LD3_POS);

    // BTN1 and BTN2 inputs
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;
    TRISAbits.TRISA4 = 1;

}

void Delay(int n) {
    volatile int32_t i;
    for (i = 0; i < n; i++) {
    }
}

void Flash_LED(void) {
    int32_t delay_count = 1000000;
    while (1) {
        if (BTN1_PORT_BIT) {
            // switch is pressed
            delay_count = 1000000;
        } else {
            // switch is not pressed
            delay_count = 4000000;
        }
        if (BTN2_PORT_BIT) {
            PORTG &= ~ (  (1<<LD1_POS)  |  (1<<LD4_POS)  );
            PORTD &= ~ (1 << LD2_POS);
            PORTB &= ~ (1 << LD3_POS);
        }
        else {
            PORTG ^= (1<<LD1_POS);
            Delay(delay_count);
            PORTD ^= (1<<LD2_POS);
            Delay(delay_count);
            PORTB ^= (1<<LD3_POS);
            Delay(delay_count);
            PORTG ^= (1<<LD4_POS);
            Delay(delay_count);
        }
    }
}
