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

volatile uint32_t win = 0;//win detector 
volatile int32_t g_position = 0;//current leds position position
volatile uint32_t test = 0;

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/
void InitApp(void) {
    /* Setup analog functionality and port direction */
    // LED outputs
    // Disable analog mode if present
    ANSELG &=~((1 << 6) | (1 << 15));
    ANSELB &=~(1 << 11);
    
    // Set direction to output 
    TRISG &=~((1 << 6) | (1 << 15));
    TRISB &=~(1 << 11);
    TRISD &=~(1 << 4);
    // Turn off LEDs for initialization
    LATG &=~((1 << 6) | (1 << 15));
    LATB &=~(1 << 11);
    LATD &=~(1 <<  4);
    // BTN1 and BTN2 inputs
    // Disable analog mode
    ANSELA &=~(1 << 5);
    // Set directions to input
    TRISA |= (1 << 5) | (1 << 4);
    
    // 3. Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENA |= (1 << 4) | (1 << 5);
    // 4. Configure Interrupt Controller
    // Enable change notification  interrupts
    IEC3 |= (1 << 22);
    // Set priority
    IPC29 |= (1 << 19); 
    IPC29 &= ~(1 << 18); 
    // Clear interrupt Flag
    IFS3 &=~(1 << 22);
    // 5. Set Interrupt Controller for multi-vector mode
    INTCONSET = _INTCON_MVEC_MASK;
    // 6. Globally enable interrupts
    __builtin_enable_interrupts();
    // 7. Enable peripheral
    CNCONA |= (1 << 15);
}

void delay (int32_t n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

void win_leds(void) {
      
    int32_t i;
      for(i = 0; i < 5; i++){  
        if(1 == win){
            set_leds(0,0,0,0);
             delay(FAST_DELAY);
            set_leds(1,0,0,0);
             delay(FAST_DELAY);
            set_leds(0,1,0,0);
             delay(FAST_DELAY);
            set_leds(0,0,1,0);
             delay(FAST_DELAY);
            set_leds(0,0,0,1);
             delay(FAST_DELAY);
            set_leds(0,0,0,0);
             delay(FAST_DELAY);
        }
        else if(2 == win){
            set_leds(0,0,0,0);
             delay(FAST_DELAY);
            set_leds(0,0,0,1);
             delay(FAST_DELAY);
            set_leds(0,0,1,0);
             delay(FAST_DELAY);
            set_leds(0,1,0,0);
             delay(FAST_DELAY);
            set_leds(1,0,0,0);
             delay(FAST_DELAY);
            set_leds(0,0,0,0);
             delay(FAST_DELAY);
        }
    }
        things();
}

void set_led_position(int32_t g_position){
    
    switch(g_position){
                case -3: 
                    set_leds(1,0,0,0);
                    break;
                case -2:
                    set_leds(1,1,0,0);
                    break;
                case -1:
                    set_leds(0,1,0,0);
                    break;
                case 0:
                    set_leds(0,1,1,0);
                    break;
                case 1:
                    set_leds(0,0,1,0);
                    break;
                case 2:
                    set_leds(0,0,1,1);
                    break;
                case 3:
                    set_leds(0,0,0,1);
                    break;
                default:
                    set_leds(0,0,0,0);
                    break;
    }
}

void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SRS) ISR_PortA_Change(void) {
    if(CNSTATAbits.CNSTATA4){
        g_position = BTN2_PORT_BIT ? g_position + 1 : g_position;
        test = (BTN1_PORT_BIT && BTN2_PORT_BIT) ? 1 : 0;
    }
    if(CNSTATAbits.CNSTATA5){
        g_position = BTN1_PORT_BIT ? g_position - 1: g_position;
        test = (BTN1_PORT_BIT && BTN2_PORT_BIT) ? 1 : 0;
    }

    things();

    IFS3 &=~(1 << 22); // reset interaption flag
}

void things(void){
 
     switch(win){

            case 0:
                if(~test){
                switch(g_position){
                    
                    case  4:
                        win = 1;
                        win_leds();
                        break;
                        
                    case  -4:
                        win = 2;
                        win_leds();
                        break;
                        
                    default:
                        set_led_position(g_position);
                        break;
                    }
                }
                test = 0;
               break;

         case 1: case 2:
             if(test){
                    g_position = 0;
                    win = 0;
                    test = 0;
             }
                break;
        }
}

void set_leds(uint32_t l1, uint32_t l2,uint32_t l3,uint32_t l4)
{
   LD1_PORT_BIT = l1;
   LD2_PORT_BIT = l2;
   LD3_PORT_BIT = l3;
   LD4_PORT_BIT = l4;
}