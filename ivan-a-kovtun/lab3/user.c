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
    // Initialize Timer2. See details in Section 14 (Timers) 
    // of the PIC32 Family Reference Manual
    T2CON = 0; // clear timer settings to defaults
    T2CONbits.TCKPS = 7; // divide clock by 256 with prescaler
    TMR2 = 0;  // clear counter to 0
    // Set period for timer using symbol PWM_PERIOD_COUNTS from user.h
    PR2 = PWM_PERIOD_COUNTS - 1;

    // Initialize OC5. See details in Section 16 (Output Compare) 
    // of the PIC32 Family Reference Manual. Use Pulse Width Modulation, which 
    // is described in Section 16.3.3.
    // Set initial duty cycle to 50%
    OC5R = PWM_PERIOD_COUNTS / 2;
    // Set reload duty cycle to 50%
    OC5RS = PWM_PERIOD_COUNTS / 2;
    // Configure OC5 control register
    OC5CONbits.ON = 1;  // Turn on OC5
    OC5CONbits.OC32 = 0;    // Select 16 bit mode
    OC5CONbits.OCTSEL = 0; // Select timer 2
    OC5CONbits.OCM = 6; // Select PWM mode without fault pin
    
    // Configure Peripheral Pin Select to connect OC5 output signal to pin G6,
    // which drives LED LD1.
    // See details in Section 12.4 of the PIC32MZ EF Data Manual.
    // There is also general information in Section 12.3.1 of the PIC32 Family 
    // Reference Manual.
    RPG6R = 11;

    // Start Timer 2
    T2CONbits.ON = 1;
}

void AdjustLED1Brightness(void) {
    //it is full because interrupt and peripheral units do everything
}

void InitGPIO(void) {
    /* Setup functionality and port direction */
    // potentiometer analog input config
    ANSELBbits.ANSB13 = 1;
    
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

void InitApp(void) {
    // Add code to call functions which initialize peripherals: GPIO, ADC, Timer2, OC5
    InitGPIO();
    initWiFIREadc();
    InitTimer2AndOC5();
}

void __ISR(_TIMER_2_VECTOR, IPL3SOFT) ISR_Timer_2 (void) {
    // change OC5RS for changing time when LED is ON for changing its brightness
    // I want LED to change its brightness with time
    if (OC5RIncDec) { OC5RS += incValue; }
    else  { OC5RS -= incValue; }
    if (  (OC5RS > 5/6 * PWM_PERIOD_COUNTS) | (OC5RS < 1/6 * PWM_PERIOD_COUNTS)  ) incValue = ~ incValue;
    // incValue = readPotentiometerWithADC()/10+10;
    // It is better to try without ADC at first time
}