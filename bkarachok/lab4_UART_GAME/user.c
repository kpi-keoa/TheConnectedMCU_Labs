/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"            /* variables/params used by user.c               */
#include <sys/attribs.h>

/******************************************************************************/
/* User Functions                                                             */

/******************************************************************************/

void InitGPIO(void) {

    // Setup functionality and port direction 
    // LED output
 // Disable analog mode if present
    ANSELG &= ~((1 << 6) | (1 << 15));
    ANSELB &= ~(1 << 11);
    // Set direction to output 
    TRISG &= ~((1 << 6) | (1 << 15));
    TRISB &= ~(1 << 11);
    TRISD &= ~(1 << 4);
    // Turn off LEDs for initialization
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;
    // Button inputs
    // Disable analog mode
    ANSELA &= ~(1 << 5);
    // Set directions to input
    TRISA |= (1 << 5)|(1 << 4);
     
    TRISDCLR = 1<<11;

}

void InitApp(void) {

    // Initialize peripherals
    InitGPIO();
    UART4_init();

}
