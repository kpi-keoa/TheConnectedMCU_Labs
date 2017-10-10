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
#include <proc/p32mz2048ecg100.h>

volatile uint32_t win = 0;//win detector 
volatile int32_t g_position = 0;//current leds position position

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
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;

    // BTN1 and BTN2 inputs
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;
    TRISAbits.TRISA4 = 1;

    // 3. Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENAbits.CNIEA5 = 1;
    CNENAbits.CNIEA4 = 1;
    // 4. Configure Interrupt Controller
    // Enable change notification  interrupts
    IEC3bits.CNAIE = 1;
    // Set priority
    IPC29bits.CNAIP = 2;
    // Clear interrupt Flag
    IFS3bits.CNAIF = 0;
    // 5. Set Interrupt Controller for multi-vector mode
    INTCONSET = _INTCON_MVEC_MASK;
    // 6. Globally enable interrupts
    __builtin_enable_interrupts();
    // 7. Enable peripheral
    CNCONAbits.ON = 1;
}

void delay (int32_t n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

void win_leds(void) {
      
        while(0 != win){
        
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
    if(CNSTATAbits.CNSTATA4 || CNSTATAbits.CNSTATA5){
        switch(win){

            case 0:
               g_position = (BTN1_PORT_BIT && !BTN2_PORT_BIT) ? (g_position - 1) : ((!BTN1_PORT_BIT && BTN2_PORT_BIT) ? (g_position + 1) : 0 /*g_position //for test only*/);
                
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
               break;

            case 12:
                if(BTN1_PORT_BIT && BTN2_PORT_BIT){
                    g_position = 0;
                    win = 0;
                }   
                break;
        }
    }
    
    IFS3 |= 0 << 16;
}



void set_leds(uint32_t l1, uint32_t l2, uint32_t l3, uint32_t l4)
{
    volatile int32_t i;
    for(i = 0;i < 3; i++){
    LATG |= l1 << 6;
    LATD |= l2 << 4;
    LATB |= l3 << 11;
    LATG |= l4 << 15;
    
    delay(SLOW_DELAY);
    
    LATG &= !l1 << 6;
    LATD &= !l2 << 4;
    LATB &= !l3 << 11;
    LATG &= !l4 << 15;
    
    delay(SLOW_DELAY);
    }
}

