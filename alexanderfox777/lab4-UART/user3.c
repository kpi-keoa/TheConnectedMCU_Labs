/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user3.h"            /* variables/params used by user.c               */
#include <sys/attribs.h>
#include "ADC.h"
/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

uint32_t t = 0, t_save = 0, mode = 0;

void InitTimer2AndOC5(void) {
    T2CON = 0; // clear timer settings to defaults
    T2CONbits.TCKPS = 7; // divide clock by 256 with prescaler
    TMR2 = 0;
    // Set period for timer
    PR2 = PWM_PERIOD_COUNTS-1;    
    // Set initial duty cycle to 50%
     OC5R = PWM_PERIOD_COUNTS/2;
    // Set reload duty cycle to 50%
     OC5RS = PWM_PERIOD_COUNTS/2;
    // Configure OC5 control register
     OC5CONbits.ON     = 1;
     OC5CONbits.OC32   = 0;    // 16 bit mode
     OC5CONbits.OCTSEL = 0; // Select timer 2
     OC5CONbits.OCM    = 6; // Select PWM mode without fault pin
    // Map OC5 signal to pin G6
     
    RPG6R = 11; // Select OC5 for LED1
    RPD4R = 11; // Select OC5 for LED2
    // Start Timer 2
    T2CONbits.ON = 1;
}

void  delay(volatile int n) {
    for (; n > 0; n--);
}

void LedState(uint32_t L1, uint32_t L2, uint32_t L3, uint32_t L4)
{
    LD1_PORT_BIT = L1;
    LD2_PORT_BIT = L2;
    LD3_PORT_BIT = L3;
    LD4_PORT_BIT = L4;    
}
void AdjustBrightness(void) {
    InitApp();
    while(1){
    unsigned int pot_pos = 0, on_time_counts=0;
    // Read ADC
    pot_pos = ReadPotentiometerWithADC();
    // Convert value to on-time (counts)
    on_time_counts = (pot_pos*PWM_PERIOD_COUNTS)/MAX_ADC_VALUE;
    // Update OC5
    if(mode == 0)
    OC5RS = on_time_counts;
    else 
    OC5RS = t_save;
    
    if(1 == BTN2_PORT_BIT)
    {
        t = (pot_pos*PWM_PERIOD_COUNTS)/MAX_ADC_VALUE;
        mode = 1;
        if(0 == t_save)
        {   
            t_save = t;
        }
        delay(10000000);
        if(1 == BTN2_PORT_BIT)
        {
            t_save = t;
            LedState (0,0,0,1);
            delay(1000000);
            LedState(0,0,0,0);
        }
        }
            
        if(1 == BTN1_PORT_BIT){
        mode = 0;
        RPG6R = 0; // No connect
        RPD4R = 0; // No connect
        
        if(pot_pos <= 255)       LedState(0,0,0,0);
        else if( pot_pos < 511)  LedState(0,0,0,1);
        else if( pot_pos < 767)  LedState(0,0,1,0);
        else if( pot_pos < 1023) LedState(0,0,1,1);
        else if( pot_pos < 1279) LedState(0,1,0,0);
        else if( pot_pos < 1535) LedState(0,1,0,1);
        else if( pot_pos < 1791) LedState(0,1,1,0);
        else if( pot_pos < 2047) LedState(0,1,1,1);
        else if( pot_pos < 2303) LedState(1,0,0,0);
        else if( pot_pos < 2559) LedState(1,0,0,1);
        else if( pot_pos < 2815) LedState(1,0,1,0);
        else if( pot_pos < 3071) LedState(1,0,1,1);
        else if( pot_pos < 3327) LedState(1,1,0,0);
        else if( pot_pos < 3583) LedState(1,1,0,1);
        else if( pot_pos < 3839) LedState(1,1,1,0);
        else if( pot_pos < 4095) LedState(1,1,1,1);
        }
        else 
        {
            LedState(0,0,0,0);
            RPG6R = 11; // Select OC5
            RPD4R = 11; // Select OC5
        }
    }
}

void InitGPIO(void) {
    /* Setup functionality and port direction */
    // LED output
    // Disable analog mode
    ANSELGbits.ANSG6 = 0;
    ANSELBbits.ANSB11 = 0;
    ANSELGbits.ANSG15 = 0;
    // Set directions to output
    TRISGbits.TRISG6 = 0;
    TRISBbits.TRISB11 = 0;
    TRISGbits.TRISG15 = 0;
    TRISDbits.TRISD4 = 0;

    // Turn off LEDs for initialization
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;

    // Button inputs
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;
    TRISAbits.TRISA4 = 1;
}

void InitApp3(void) {
    // Initialize peripherals
    InitGPIO();
    initWiFIREadc();
    InitTimer2AndOC5();
}