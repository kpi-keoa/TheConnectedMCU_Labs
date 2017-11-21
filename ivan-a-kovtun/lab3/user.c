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
    // Set initial duty cycle to 20%
    OC5R = PWM_PERIOD_COUNTS / 5;
    // Set reload duty cycle to 20%
    OC5RS = PWM_PERIOD_COUNTS / 5;
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
    valuePot = ReadPotentiometerWithADC();
    int32_t q = (valuePot - valuePotOld);
    if ((q < 10) && (q > -10)) { // defence from noises
        LD4_PORT_BIT = 0;
    }
    else {
        LD4_PORT_BIT = 1;
    }
    valuePotOld = valuePot;
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
    LD2_PORT_BIT = 1;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;

    // Button inputs
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;
    TRISAbits.TRISA4 = 1;
    
    // 3. Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENAbits.CNIEA5 = 1;
    CNENAbits.CNIEA4 = 1;
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

void InitApp(void) {
    // Add code to call functions which initialize peripherals: GPIO, ADC, Timer2, OC5
    InitGPIO();
    initWiFIREadc();
    InitTimer2AndOC5();
}
