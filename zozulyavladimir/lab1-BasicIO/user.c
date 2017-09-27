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
    
    ANSELGbits.ANSG15 = 0;
    ANSELBbits.ANSB11 = 0;
    
    TRISGbits.TRISG15 = 0;
    TRISDbits.TRISD4 = 0;
    TRISBbits.TRISB11 = 0;
    
    // Turn on LEDs for testing
    
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;
    
    // Stop program here
    
//    while (1);

    // BTN1 input
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;

    // Initialize input for BTN2
    TRISAbits.TRISA4 = 1;
    // Test switches
    
//    while (1) {
//        LATGbits.LATG6 = BTN1_PORT_BIT;
//        LATDbits.LATD4 = BTN2_PORT_BIT;
//    };
}

void Delay(int n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

void Flash_LED(void) {
    int delay_count;
    while (1) {
        if (1 == BTN1_PORT_BIT) {
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
int delay_count=1000000;

while (1) {
if (1 == BTN1_PORT_BIT) { 
delay_count = 300000;
        } else{    
delay_count = 1000000;
        }

if (1 == BTN2_PORT_BIT) { 

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

void Play_LED(void)
{
    
    int num_led = 0;
    int delay_count = 1000000;
    
    while (1){
        
       // delay_count = BTN1_PORT_BIT && BTN2_PORT_BIT ? 300000 : 1000000;
       // num_led = BTN1_PORT_BIT ? num_led++ : (BTN2_PORT_BIT ? num_led-- : num_led);
        
        if(BTN1_PORT_BIT && BTN1_PORT_BIT){
            Delay(std_delay);
            delay_count = (300000 == delay_count) ? 1000000 : 300000;// if buttons has been pressed
                                                                     // then change the freq
        }
        
        if(BTN1_PORT_BIT){
            num_led = (5 == num_led) ? 1 : num_led ++; // shift light to the right
        }else if(BTN2_PORT_BIT && num_led > 0){
            num_led = (0 == num_led) ? 4 : num_led --; // shift light to the left
        }
        
        switch(num_led){
            case 1:
                    LD1_PORT_BIT = 1; // Turn on LED 1
                    Delay(delay_count);
                    LD1_PORT_BIT = 0; // Turn off LED 1
                    Delay(delay_count);
                    break;
            case 2:
                    LD2_PORT_BIT = 1; // Turn on LED 2
                    Delay(delay_count);
                    LD2_PORT_BIT = 0; // Turn off LED 2
                    Delay(delay_count);
                    break;
            case 3:
                    LD3_PORT_BIT = 1; // Turn on LED 3
                    Delay(delay_count);
                    LD3_PORT_BIT = 0; // Turn off LED 3
                    Delay(delay_count);
                    break;
            case 4:
                    LD4_PORT_BIT = 1; // Turn on LED 4
                    Delay(delay_count);
                    LD4_PORT_BIT = 0; // Turn off LED 4
                    Delay(delay_count);
                    break;
            default:
                num_led = 1;
                break;
        }
        
    }
}
