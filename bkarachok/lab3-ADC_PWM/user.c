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
#include "ADC.h"

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/
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
    OC5CONbits.ON = 1;
    OC5CONbits.OC32 = 0;    // 16 bit mode
    OC5CONbits.OCTSEL = 0; // Select timer 2
    OC5CONbits.OCM = 6; // Select PWM mode without fault pin
    // Map OC5 signal to pin G6
    RPG6R = 11; // Select OC5
    // Start Timer 2
    T2CONbits.ON = 1;
}

#define MODE 2   //MODE 1 - potentiometer, MODE 2 - external voltage regulator (microphone or photoresistor)

#if MODE==1 

void AdjustLED1Brightness(void) {
    unsigned int pot_pos = 0, on_time_counts=0, mode=0;

    if(BTN2_PORT_BIT) { // if button2 pressed, then LEDs indicate bright level
         if (ReadPotentiometerWithADC() <= 1365) // indicating bright level using 3 another LEDs
        {
        LD2_PORT_BIT = 0;
        LD3_PORT_BIT = 0;
        LD4_PORT_BIT = 1;
        }
        else if (ReadPotentiometerWithADC() <= 2730) 
        {
        LD2_PORT_BIT = 0;
        LD3_PORT_BIT = 1;
        LD4_PORT_BIT = 1;
        }
        else  
        {
        LD2_PORT_BIT = 1;
        LD3_PORT_BIT = 1;
        LD4_PORT_BIT = 1;
        }
    }
               // Read ADC
         pot_pos = ReadPotentiometerWithADC();
         // Convert value to on-time (counts).
        on_time_counts = (pot_pos*PWM_PERIOD_COUNTS)/MAX_ADC_VALUE;
        // Update OC5
        OC5RS = on_time_counts;
}

#elif MODE==2

void AdjustLED1Brightness(void) {
    unsigned int ext_level = 0, counts=0;
	 if(BTN2_PORT_BIT) { // if button2 pressed, then LEDs indicate bright level
         if (ReadExternalRegulatorWithADC() <= 1024)  // indicating bright level using 3 another LEDs
        {
        LD2_PORT_BIT = 0;
        LD3_PORT_BIT = 0;
        LD4_PORT_BIT = 1;
        }
        else if (ReadExternalRegulatorWithADC() <= 2048) 
        {
        LD2_PORT_BIT = 0;
        LD3_PORT_BIT = 1;
        LD4_PORT_BIT = 1;
        }
        else  
        {
        LD2_PORT_BIT = 1;
        LD3_PORT_BIT = 1;
        LD4_PORT_BIT = 1;
        }
    }
               // Read ADC
         ext_level = ReadExternalRegulatorWithADC();
         // Convert value to on-time (counts).
        counts = (ext_level*PWM_PERIOD_COUNTS)/MAX_ADC_VALUE;
        // Update OC5
        OC5RS = counts;
}

#endif
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
}

void InitApp(void) {
    // Initialize peripherals
    InitGPIO();
    initWiFIREadc();
    InitTimer2AndOC5();
}