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
    // Disable analog mode for G6, G15
	ANSELG &= ~(BIT6 | BIT15);
	// Disable analog mode for B11
	ANSELB &= ~BIT11;
    // Set direction to output for G6, D4, B11, G15
    TRISG &= ~(BIT6 | BIT15);
	// Set direction to output for D4
	TRISD &= ~BIT4 ;
	// Set direction to output for B11
	TRISB &= ~BIT11;
    // Turn on LEDs for testing
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;
    // Stop program here
    
    //while(1); 
    
    // BTN1 input
    // Disable analog mode
    ANSELA &= ~BIT5;
    // Set directions to input
    TRISA |= BIT5;

    // Initialize input for BTN2
    
    TRISA |= BIT4;
    
    // Test switches
    
   /* while (1) {
        LATGbits.LATG6  = PORTAbits.RA5;
        LATDbits.LATD4  = PORTAbits.RA4;
    };
   */   
}

void delay(volatile uint32_t n) {
    for (; n > 0; n--) {
    }
}

void Flash_LED(void) {
    uint32_t delay_count;
        if (BTN1_PORT_BIT) {
            // switch is pressed
            delay_count = 1000000;
        } else {
            // switch is not pressed
            delay_count = 4000000;
        }
        LD1_PORT_BIT = 1; // Turn on LED
        delay(delay_count);
        LD1_PORT_BIT = 0; // Turn off LED
        delay(delay_count);
}

void Scan_LEDs(void) {
    uint32_t LED_state = 1; // 1 on (initial value), 0 off
    uint32_t delay_count=10000000;

        if (BTN1_PORT_BIT) { // button 1 pushed
            delay_count = 300000;
        } else {    // button 1 not pushed
            delay_count = 10000000;
        }

        if (BTN2_PORT_BIT) { // button 2 pushed
            // switch off all LEDs
            LD1_PORT_BIT = 0;
            LD2_PORT_BIT = 0;
            LD3_PORT_BIT = 0;
            LD4_PORT_BIT = 0;
        } else {
            LD1_PORT_BIT = LED_state;
            delay(delay_count);
            LD2_PORT_BIT = LED_state;
            delay(delay_count);
            LD3_PORT_BIT = LED_state;
            delay(delay_count);
            LD4_PORT_BIT = LED_state;
            delay(delay_count);

// next time, set LEDs to opposite state
            LED_state = ! LED_state; 
        }
 
}

void Sel_mode_LEDs(void) {
    uint32_t LED_state = 1; // 1 on (initial value), 0 off
    uint32_t delay_count = 10000000;
   
        if ((! BTN1_PORT_BIT) && (! BTN2_PORT_BIT)) { // buttons not pressed
            //1st mode
            LD1_PORT_BIT = LED_state;
            delay(delay_count);
            LD2_PORT_BIT = LED_state;
            delay(delay_count);
            LD3_PORT_BIT = LED_state;
            delay(delay_count);
            LD4_PORT_BIT = LED_state;
            delay(delay_count);
        } 

        else if ((! BTN1_PORT_BIT) && BTN2_PORT_BIT) { // button 2 pressed
            //2nd mode
            LD4_PORT_BIT = LED_state;
            delay(delay_count);
            LD3_PORT_BIT = LED_state;
            delay(delay_count);
            LD2_PORT_BIT = LED_state;
            delay(delay_count);
            LD1_PORT_BIT = LED_state;
            delay(delay_count);
        }
        
        else if (BTN1_PORT_BIT && (! BTN2_PORT_BIT)) { // button 1 pressed
            // 3rd mode
            LD4_PORT_BIT = LED_state;
            LD1_PORT_BIT = LED_state;
            delay(delay_count);
            LD3_PORT_BIT = LED_state;
            LD2_PORT_BIT = LED_state;
            delay(delay_count);
        }
        else { //1st and 2nd buttons pushed & Running LED (4th mode)
          if(LED_state) {
            LD1_PORT_BIT = LED_state;
            LD2_PORT_BIT = !LED_state;
            LD3_PORT_BIT = !LED_state;
            LD4_PORT_BIT = !LED_state;
            delay(delay_count);
            LD1_PORT_BIT = !LED_state;
            LD2_PORT_BIT = LED_state;
            LD3_PORT_BIT = !LED_state;
            LD4_PORT_BIT = !LED_state;
            delay(delay_count);
            LD1_PORT_BIT = !LED_state;
            LD2_PORT_BIT = !LED_state;
            LD3_PORT_BIT = LED_state;
            LD4_PORT_BIT = !LED_state;
            delay(delay_count);
            LD1_PORT_BIT = !LED_state;
            LD2_PORT_BIT = !LED_state;
            LD3_PORT_BIT = !LED_state;
            LD4_PORT_BIT = LED_state;
            delay(delay_count);
          }
          else {
           LD1_PORT_BIT = 0;
           LD2_PORT_BIT = 0;
           LD3_PORT_BIT = 0;
           LD4_PORT_BIT = 0; 
          }
        }
    // next time, set LEDs to opposite state
            LED_state = ! LED_state; 
}
