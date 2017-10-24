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

/******************************************************************************/
/* Global data                                                                */
/******************************************************************************/

int32_t gPosition = 0;

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/
void init_app(void) {
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
    PORTG &= (  ~ (1<<LD1_POS)  )  &  (  ~ (1<<LD4_POS)  );
    PORTD &= ~ (1 << LD2_POS);
    PORTB &= ~ (1 << LD3_POS);

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

void delay1(int n) {
    volatile int32_t i;
    for (i = 0; i < n; i++) {
    }
}

void TASK_decode_gPosition(void) {
    static int32_t LD1_value, LD2_value, LD3_value, LD4_value;
    LD1_value = LD2_value =  LD3_value = LD4_value = 0;
    switch (gPosition) {
        case 0:
            LD2_value = 1;
        case 1:
            LD3_value = 1;
            break;
        case 2:
            LD3_value = 1;
        case 3:
            LD4_value = 1;
            break;
        case -1:
            LD2_value = 1;
            break;
        case -2:
            LD2_value = 1;
        case -3:
            LD1_value = 1;
            break;
        case 4:
            player1_win();
            break;
        case -4:
            player2_win();
            break;
        default: gPosition = 0;
    }
    
    PORTG |= (LD1_value << LD1_POS) | (LD4_value << LD4_POS);
    PORTG &= ~ (  ((~LD1_value)<<LD1_POS) | ((~LD4_value)<<LD4_POS)  );
    
    PORTD |= (LD2_value << LD2_POS);
    PORTD &= ~ ((~LD2_value) << LD2_POS);
    
    PORTB |= (LD3_value << LD3_POS);
    PORTB &= ~ ((~LD3_value) << LD3_POS);
}

void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SOFT) ISR_PortA_Change(void) {
    // Set interrupt flag
    IFS3bits.CNAIF = 1;
    if (CNSTATAbits.CNSTATA4) { // Bit 4 (BTN2) changed
        if (BTN2_PORT_BIT)  { // Switch is pressed
            gPosition ++;
            delay1(10000);
        }
    }
    if (CNSTATAbits.CNSTATA5) { // Bit 4 (BTN1) changed
        if (BTN1_PORT_BIT)  { // Switch is pressed,
            gPosition --;
            delay1(10000);
        }
    }
    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
}

void scan_LEDs_with_tasks(void) {
    while (1) {
        TASK_decode_gPosition();
    }
}

void player1_win() {
    static int k;
    for(k=0; k<5; k++) {
        PORTG &= ~ (1 << LD4_POS);
        delay1(WIN_DELAY);
        PORTG |= (1 << LD1_POS);
        delay1(WIN_DELAY);
        PORTG &= ~ (1 << LD1_POS);
        PORTD |= (1 << LD2_POS);
        delay1(WIN_DELAY);
        PORTD &= ~ (1 << LD2_POS);
        PORTB |= (1 << LD3_POS);
        delay1(WIN_DELAY);
        PORTB &= ~ (1 << LD3_POS);
        PORTG |= (1 << LD4_POS);
        delay1(WIN_DELAY);
        PORTG &= ~ (1 << LD4_POS);
        delay1(WIN_DELAY);
    }
    gPosition = 0;
}

void player2_win() {
    static int32_t k;
    for(k=0; k<5; k++) {
        PORTG &= ~ (1 << LD1_POS);
        delay1(WIN_DELAY);
        PORTG |= (1 << LD4_POS);
        delay1(WIN_DELAY);
        PORTG &= ~ (1 << LD4_POS);
        PORTB |= (1 << LD3_POS);
        delay1(WIN_DELAY);
        PORTB &= ~ (1 << LD3_POS);
        PORTD |= (1 << LD2_POS);
        delay1(WIN_DELAY);
        PORTD &= ~ (1 << LD2_POS);
        PORTG |= (1 << LD1_POS);
        delay1(WIN_DELAY);
        PORTG &= ~ (1 << LD1_POS);
        delay1(WIN_DELAY);
    }
    gPosition = 0;
}