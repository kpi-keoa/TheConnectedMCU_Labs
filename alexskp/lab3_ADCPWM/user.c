
#ifdef __XC32
#include <xc.h>              /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include "user.h"            /* variables/params used by user.c               */
#include <sys/attribs.h>


void init_servo(void) {
    T2CON = 0; // clear timer settings to defaults
    T2CONbits.TCKPS = 7; // divide clock by 256 with prescaler
    TMR2 = 0;
    // Set period for timer
    PR2 = PWM_PERIOD_COUNTS-1;    
    // Set initial duty cycle to 50%
    OC8R = PWM_PERIOD_COUNTS/2;
    // Set reload duty cycle to 50%
    OC8RS = PWM_PERIOD_COUNTS/2;
    // Configure OC5 control register
    OC8CONbits.ON = 1;
    OC8CONbits.OC32 = 0;    // 16 bit mode
    OC8CONbits.OCTSEL = 0; // Select timer 2
    OC8CONbits.OCM = 6; // Select PWM mode without fault pin
    // Map OC8 signal to pin D4 (LED LD2)
    RPD12R = 12; // Select OC8
    RPD4R = 12; // Select OC8
    // Start Timer 2
    T2CONbits.ON = 1;
}

void init_gpio(void) 
{
    /* Setup functionality and port direction */
    // LED output
    // Disable analog mode
    ANSELGbits.ANSG6 = 0;
    // Set directions to output
    TRISGbits.TRISG6 = 0;
    TRISDbits.TRISD4 = 0;
    
    TRISDbits.TRISD12 = 0;
    
    // Turn off LEDs for initialization
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;

    // Button inputs
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;
}

void init_interrupt(void)
{
    // Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENAbits.CNIEA5 = 1;
    // Configure Interrupt Controller
    // Enable change notification  interrupts
    IEC3bits.CNAIE = 1;
    // Set priority
    IPC29bits.CNAIP = 6;
    // Clear interrupt Flag
    IFS3bits.CNAIF = 0;
    // Set Interrupt Controller for multi-vector mode
    INTCONSET = _INTCON_MVEC_MASK;
    // Globally enable interrupts
    __builtin_enable_interrupts();
    // Enable peripheral
    CNCONAbits.ON = 1;
}

void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SOFT) ISR_PortA_Change(void) {
    if (CNSTATAbits.CNSTATA5 == 1) {    // Bit 5 (BTN1) changed
        if (BTN1_PORT_BIT) {                     // Switch is pressed
            LD2_PORT_BIT = 1;
        }
    }
    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
}
