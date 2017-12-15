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

    
    // Disable analog mode 
    ANSELGbits.ANSG15 = 0;//LD4
    ANSELBbits.ANSB11 = 0;//LD3
    //ANSELDbits.ANSD4 = 0;//For LED2 on PORTD pin 4 there is no analog option (Refer to pin definitions in wiring table - with port RD04 there is no ANx) so ANSELDbits.ANSD4 = 0 is not required and will give compile errors.
    ANSELGbits.ANSG6 = 0;//LD1

    // Set direction to output
    TRISGbits.TRISG15 = 0;
    TRISBbits.TRISB11 = 0;
    TRISDbits.TRISD4 = 0;
    TRISGbits.TRISG6 = 0;
   
    
    
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;//BTN1
    //ANSELAbits.ANSA4 = 0;//BTN2
    
    // Set directions to input
    TRISAbits.TRISA5 = 1;
    TRISAbits.TRISA4 = 1;
    
}


#endif

void Delay(int n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

void Scan_LEDs(void) {
   
     
    while (1) {
        if (BTN1_PORT_BIT == 1) { // switch 1 is pressed
            LD1_PORT_BIT = 1;
            LD2_PORT_BIT = 1;
            Delay(5000);
        } else {    // switch 1 is not pressed
            
            LD1_PORT_BIT = 0;
            LD2_PORT_BIT = 0;
        }
        
        if (BTN2_PORT_BIT == 1) { // switch 2 is pressed
            LD3_PORT_BIT = 1;
            LD4_PORT_BIT = 1;
            Delay(5000);
        } else {
             LD3_PORT_BIT = 0;
             LD4_PORT_BIT = 0;
        }
    }
}