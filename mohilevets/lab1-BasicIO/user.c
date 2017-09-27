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

#define Delay_max 8000000
#define Delay_change 100000

void InitApp(void) {
    /* Setup analog functionality and port direction */
    // LED output
    // Disable analog mode for Led ports
    ANSELGbits.ANSG6 = 0;
    ANSELBbits.ANSB11 = 0;
    ANSELGbits.ANSG15 = 0;
    // Set direction to outputs  
    TRISGbits.TRISG6 = 0;
    TRISBbits.TRISB11 = 0;
    TRISGbits.TRISG15 = 0;
    TRISDbits.TRISD4 = 0;

    // Turn off LEDs for initialization
    LED1_PORT = 0;
    LED2_PORT = 0;
    LED3_PORT = 0;
    LED4_PORT = 0;
 
    // BTN1 input
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;
    // Initialize input for BTN2
    TRISAbits.TRISA4 = 1;
}


void Delay(int n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}





void Scan_LEDs(void) {
    int LED_state = 1; // 1 on (initial value), 0 off
    int delay_count = Delay_max;
    int iterator = 0;
    while (1) {
        
        //count to 16
        if (16 == iterator){
            iterator=0;
        } else {
            iterator=iterator+1;
        }
        
        if (BTN1_PORT_BIT == 1) { // switch 1 is pressed
            
            //if press delay time will be decrement by constant
            if (Delay_change <= delay_count){
                delay_count = Delay_max;    //if too small set it to max constant
            } else {
                delay_count = delay_count - Delay_change; 
            }
        } 
        
        if (BTN2_PORT_BIT == 1) { // switch 2 is pressed
            // if pressed - blink with all leds
            LED1_PORT = LED_state;            
            LED2_PORT = LED_state;            
            LED3_PORT = LED_state;        
            LED4_PORT = LED_state;
            Delay(delay_count);

            LED_state = 1 - LED_state; // next time, set LEDs to opposite state
            
            
        } else { 
 //if not pressed leds will display binary code of iterator
            
            if ((iterator & 1 )>0){ //bitmask to know if digit is 1
                LED1_PORT = 1;
            } else {
                LED1_PORT = 0;
            }
            
            if ((iterator & 2 )>0){
                LED2_PORT = 1;
            } else {
                LED2_PORT = 0;
            }
            
            if ((iterator & 4 )>0){
                LED3_PORT = 1;
            } else {
                LED3_PORT = 0;
            }
            
            if ((iterator & 8 )>0){
                LED4_PORT = 1;
            } else {
                LED4_PORT = 0;
            }
            
            Delay( delay_count );    
       
        }
    }
}