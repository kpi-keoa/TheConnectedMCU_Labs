
#include "lab2_BasicInterrupts.h" 

void init(void) {
    // LED initialization
    // Disable analog mode
    LED1_ANSEL &= ~(1 << LED1_BIT);
    LED2_ANSEL &= ~(1 << LED2_BIT);
    LED3_ANSEL &= ~(1 << LED3_BIT);
    LED4_ANSEL &= ~(1 << LED4_BIT);
    // Set direction to output
    LED1_TRIS &= ~(1 << LED1_BIT);
    LED2_TRIS &= ~(1 << LED2_BIT);
    LED3_TRIS &= ~(1 << LED3_BIT);
    LED4_TRIS &= ~(1 << LED4_BIT);
    // LED off
    SET_LED1(0);
    SET_LED2(0);
    SET_LED3(0);
    SET_LED4(0);
    
    // Button input
    // Disable analog mode
    BTN1_ANSEL &= ~(1 << BTN1_BIT);
    BTN2_ANSEL &= ~(1 << BTN2_BIT);
    // Set directions to input
    BTN1_TRIS |= 1 << BTN1_BIT;
    BTN2_TRIS |= 1 << BTN2_BIT;
    
    // Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENAbits.CNIEA5 = 1;
    CNENAbits.CNIEA4 = 1;
    // Configure Interrupt Controller
    // Enable change notification  interrupts
    IEC3bits.CNAIE = 1;
    // Set priority
    IPC29bits.CNAIP = 2;
    // Clear interrupt Flag
    IFS3bits.CNAIF = 0;
    // Set Interrupt Controller for multi-vector mode
    INTCONSET = _INTCON_MVEC_MASK;
    // Globally enable interrupts
    __builtin_enable_interrupts();
    // Enable peripheral
    CNCONAbits.ON = 1;
}
