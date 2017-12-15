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
    ANSELG |= (0 << 6);
    // Set direction to output for G6
    TRISG |= (0 << 6) ;

    // Initialize outputs for other LEDs
    
    ANSELG |= (0 << 15);
    ANSELB |= (0 << 11);  
    
    TRISG |= (0 << 15);
    TRISD |= (0 << 4);
    TRISB |= (0 << 11);
    
    // Turn on LEDs for testing
    
    LATG |= (0 << 6);
    LATD |= (0 << 4)
    LATB |= (0 << 11)
    LATG |= (0 << 15);
    
    led_test();
    
    // BTN1 input
    // Disable analog mode
    ANSELA |= (0 << 5);
    // Set directions to input
    TRISA |= (1 << 5);

    // Initialize input for BTN2
    TRISA |= (1 << 4);
}

void delay(int n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

void led_test(void){
    
    volatile int32_t i;
    
    for(i = 0; i < 4; i += 1){
        
    LATG |= ~(BIT_6);
    LATD |= ~(BIT_4)
    LATB |= ~(BIT_11)
    LATG |= ~(BIT_15);
    
    delay(STD_DELAY);
    
    LATG |= ~(BIT_6);
    LATD |= ~(BIT_4)
    LATB |= ~(BIT_11)
    LATG |= ~(BIT_15);
    
    delay(STD_DELAY);
    
    }
}

void play_led(void)
{
    
    uint32_t num_led = 0;
    uint32_t delay_count = 1000000;
        
        if(BTN1_PORT_BIT && BTN2_PORT_BIT){
            delay(STD_DELAY);
            delay_count = (300000 == delay_count) ? 1000000 : 300000;// if buttons has been pressed
                                                                     // then change the freq
        }
        
        if(BTN1_PORT_BIT){
            num_led = (5 == num_led) ? 1 : (num_led += 1) ; // shift light to the right
        }else if(BTN2_PORT_BIT && (num_led > 0)){
            num_led = (0 == num_led) ? 4 : (num_led -= 1); // shift light to the left
        }
        
        switch(num_led){
            case 1:
                    LATG |= BIT_6; // Turn on LED 1
                    delay(delay_count);
                    LATG |= ~BIT_6; // Turn off LED 1
                    delay(delay_count);
                    break;
            case 2:
                    LATD |= BIT_4; // Turn on LED 2
                    delay(delay_count);
                    LATD |= ~BIT_4; // Turn off LED 2
                    delay(delay_count);
                    break;
            case 3:
                    LATB |= BIT_11; // Turn on LED 3
                    delay(delay_count);
                    LATB |= ~BIT_11; // Turn off LED 3
                    delay(delay_count);
                    break;
            case 4:
                    LATG |= BIT_15; // Turn on LED 4
                    delay(delay_count);
                    LATG |= ~BIT_15; // Turn off LED 4
                    delay(delay_count);
                    break;
            default:
                num_led = 1;
                break;
        }
        
    }

