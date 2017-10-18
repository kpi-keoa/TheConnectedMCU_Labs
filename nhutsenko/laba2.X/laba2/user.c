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

volatile uint32_t G_Allow_Lit_LEDs = 1; // Allow LEDs to be on initially
volatile uint32_t G_LED_Scan_Delay = SLOW_DELAY; // Scan LEDs slowly initially
volatile int32_t G_Position = 0;

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/
void InitApp(void) {
       /* Setup analog functionality and port direction */
    // LED outputs
    // Disable analog mode if present
    ANSELG &= ~( (1 << 6) | (1 << 15) );
    ANSELB &= ~(1 << 11);
    // Set direction to output 
    TRISG &= ~( (1 << 6) | (1 << 15) );
    TRISB &= ~( (1 << 11) );
    TRISD &= ~( (1 << 4) );
    // Turn off LEDs for initialization
    LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT = LD4_PORT_BIT = 0;

    // BTN1 and BTN2 inputs
    // Disable analog mode
    ANSELA &= ~(1 << 5);
    // Set directions to input
    TRISA |= (1 << 5);
    TRISA |= (1 << 4);

    // 3. Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENA |= (1 << 5);
    CNENA |= (1 << 4);
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

void Delay(int n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

void TaskScanLEDs(uint32_t ld_dir) {
    volatile uint32_t i;
    if (0 == ld_dir){
        for(i = 0; i < 5; i += 1){
            SetLeds(1, 0, 0, 0);
            Delay(100000);
            SetLeds(0, 1, 0, 0);
            Delay(100000);
            SetLeds(0, 0, 1, 0);
            Delay(100000);
            SetLeds(0, 0, 0, 1);
            Delay(100000);
            SetLeds(0, 0, 0, 0);
            Delay(100000);
        }
        G_Position = 0;
    } else if (1 == ld_dir){
        for(i = 0; i < 5; i += 1){
            SetLeds(0, 0, 0, 1);
            Delay(100000);
            SetLeds(0, 0, 1, 0);
            Delay(100000);
            SetLeds(0, 1, 0, 0);
            Delay(100000);
            SetLeds(1, 0, 0, 0);
            Delay(100000);
            SetLeds(0, 0, 0, 0);
            Delay(100000);
        }
        G_Position = 0;
    }
    UpdateLeds();
}

void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SRS) ISRPortAChange(void) {
    Delay(500000);
    if (CNSTATAbits.CNSTATA4) { // Bit 4 (BTN2) changed
        if (BTN2_PORT_BIT)  { // Switch is pressed
            G_Position += 1; // Right player result + 1
        }
    }
    Delay(500000);
    if (CNSTATAbits.CNSTATA5) { // Bit 4 (BTN1) changed
        if (BTN1_PORT_BIT == 1)  { // Switch is pressed, so use fast scan
            G_Position -= 1;    // Left player result +1
        }
    }
    UpdateLeds();
    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
}

void SetLeds(uint32_t ld1, uint32_t ld2, uint32_t ld3, uint32_t ld4){
    Delay(1000000);
    LD1_PORT_BIT = ld1;
    Delay(1000000);
    LD2_PORT_BIT = ld2;
    Delay(1000000);
    LD3_PORT_BIT = ld3;
    Delay(1000000);
    LD4_PORT_BIT = ld4;
}

void UpdateLeds(void){
    switch(G_Position){
        case(-4):
            TaskScanLEDs(1);
            break;
        case(-3):
            SetLeds(1, 0, 0, 0);
            break;
        case(-2):
            SetLeds(1, 1, 0, 0);
            break;
        case(-1):
            SetLeds(0, 1, 0, 0);
            break;
        case(0):
            SetLeds(0, 1, 1, 0);
            break;
        case(1):
            SetLeds(0, 0, 1, 0);
            break;
        case(2):
            SetLeds(0, 0, 1, 1);
            break;
        case(3):
            Delay(1000000);
            SetLeds(0, 0, 0, 1);
            break;
        case(4):
            TaskScanLEDs(0);
        default:
            break;
    }
}

