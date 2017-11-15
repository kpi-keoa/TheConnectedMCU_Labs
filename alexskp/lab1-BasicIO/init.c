
#include "lab1_basicIO.h" 

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
}