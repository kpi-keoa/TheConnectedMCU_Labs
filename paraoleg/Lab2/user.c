#ifdef __XC32
#include <xc.h>              // Defines special function registers, CP0 regs 
#endif

#include <stdint.h>          // For uint32_t definition                     
#include <stdbool.h>         // For true/false definition                     
#include "user.h"            // variables/params used by user.c               
#include <sys/attribs.h>

volatile int G_Position = 0; // position is balanced initially

void InitApp(void) {        //Setup analog functionality and port direction
    // LED outputs
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

    // BTN1 and BTN2 inputs
    // Disable analog mode
    ANSELA &= ~(1 << 5);
    // Set directions to input
    TRISA |= (1 << 5)|(1 << 4);
    
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


void Delay(int n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

void Scan_LEDs(int dir_lr) {
    int LED_state = 1;
    int num_scans = 5;

    while (num_scans--) {
        if (dir_lr == 1) {
            LD1_PORT_BIT = LED_state;
            Delay(LONG_DELAY);
            LD2_PORT_BIT = LED_state;
            !LD1_PORT_BIT;
            Delay(LONG_DELAY);
            LD3_PORT_BIT = LED_state;
            !LD2_PORT_BIT;
            Delay(LONG_DELAY);
            LD4_PORT_BIT = LED_state;
            !LD3_PORT_BIT;
            Delay(LONG_DELAY);
            !LD4_PORT_BIT;
        } else {
            LD4_PORT_BIT = LED_state;
            Delay(LONG_DELAY);
            LD3_PORT_BIT = LED_state;
            !LD4_PORT_BIT;
            Delay(LONG_DELAY);
            LD2_PORT_BIT = LED_state;
            !LD3_PORT_BIT;
            Delay(LONG_DELAY);
            LD1_PORT_BIT = LED_state;
            !LD2_PORT_BIT;
            Delay(LONG_DELAY);
            !LD1_PORT_BIT;
        }

        LED_state = !LED_state; // next time, invert LEDs
    }
 }

void Set_LEDs(int L1, int L2, int L3, int L4)
{
    LD1_PORT_BIT = L1;
    LD2_PORT_BIT = L2;
    LD3_PORT_BIT = L3;
    LD4_PORT_BIT = L4;
}


void TASK_Update_LEDs(void) {
    switch (G_Position) {
        case -3:
            Set_LEDs(1, 0, 0, 0);
            break;
        case -2:
            Set_LEDs(1, 1, 0, 0);
            break;
        case -1:
            Set_LEDs(0, 1, 0, 0);
            break;
        case 0:
            Set_LEDs(0, 1, 1, 0);
            break;
        case 1:
            Set_LEDs(0, 0, 1, 0);
            break;
        case 2:
            Set_LEDs(0, 0, 1, 1);
            break;
        case 3:
            Set_LEDs(0, 0, 0, 1);
            break;
        default:
            if (G_Position < -3) {
                Scan_LEDs(0);
            } else {
                Scan_LEDs(1);
            }

            G_Position = 0;
            break;
    }
}

void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SOFT) ISR_PortA_Change(void) {
    if (CNSTATAbits.CNSTATA4 == 1) {    // Bit 4 (BTN2) changed
        
        if (BTN2_PORT_BIT == 1)  {      // Switch is pressed, move right
            G_Position++;
        }
    }
    if (CNSTATAbits.CNSTATA5 == 1) {    // Bit 5 (BTN1) changed
        
        if (BTN1_PORT_BIT == 1)  {      // Switch is pressed, move left
            G_Position--;
        }
    }
    
    IFS3bits.CNAIF = 0;     // Reset interrupt flag
}

void Run_Game_Tasks(void) {
    
    while (1) {
        TASK_Update_LEDs();
    }
}



