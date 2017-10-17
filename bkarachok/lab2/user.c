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

int32_t G_position = 0; /*Initializing idle state LEDs*/
int32_t count_l = 0; /* Quantity wins for left side*/
int32_t count_r = 0; /* Quantity wins for right side*/

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/
void InitApp(void) {
    /* Setup analog functionality and port direction */
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

void delay(volatile uint32_t n) {
    for (; n > 0; n--) {
    }
}

void Set_LEDs(uint32_t L1, uint32_t L2, uint32_t L3, uint32_t L4)
{
    LD1_PORT_BIT = L1; /*on/off 1st LED */
    LD2_PORT_BIT = L2; /*on/off 2st LED */
    LD3_PORT_BIT = L3; /*on/off 3st LED */
    LD4_PORT_BIT = L4; /*on/off 4st LED */
}

void TASK_Update_LEDs(void) {
    switch(G_position) { /* checking G_position value */
        case -3 : 
            Set_LEDs(1, 0, 0, 0); /* LED_mode if G_position == -3 */
            break;
        case -2 : 
            Set_LEDs(1, 1, 0, 0); /* LED_mode if G_position == -2 */
            break;
        case -1 : 
            Set_LEDs(0, 1, 0, 0); /* LED_mode if G_position == -1 */
            break;
        case 0 :  
            Set_LEDs(0, 1, 1, 0); /* LED_mode if G_position == 0 */
            break;
        case 1 :  
            Set_LEDs(0, 0, 1, 0); /* LED_mode if G_position == 1 */
            break;
        case 2 :  
            Set_LEDs(0, 0, 1, 1); /* LED_mode if G_position == 2 */
            break;
        case 3 :  
            Set_LEDs(0, 0, 0, 1); /* LED_mode if G_position == 3 */
            break;
        default : 
            if (G_position <= -4) { /* LED_mode if G_position <= -4 */
                for (uint32_t k = 5;  k > 0;  k--) { /* running LED string from right to left */
                   for (int32_t m = 3;  m >= 0;  m--) {
                       switch(m) { 
                           case 0 : 
                                LD2_PORT_BIT = 0;
                                LD1_PORT_BIT = 1; 
                                delay(1000000);
                                break;
                           case 1 : 
                                LD3_PORT_BIT = 0;
                                LD2_PORT_BIT = 1;
                                delay(1000000);
                                break;
                           case 2 : 
                                LD4_PORT_BIT = 0;
                                LD3_PORT_BIT = 1;
                                delay(1000000);
                                break;
                           case 3 : 
                                LD1_PORT_BIT = 0; 
                                LD4_PORT_BIT = 1;
                                delay(1000000);
                                break;
                       }
                   }
                 
               }
                if (-4 == G_position) { /* win of left side, counter_left + 1 */
                    count_l++;
                }
                else {
                }
               G_position = 0; /* jump to idle state */
            }
           else { /* LED_mode if G_postition >= 4 */
                for (uint32_t k = 5; k > 0; k--) { /* running LED string from left to right */
                   for (int32_t m = 3; m >= 0; m--) {
                       switch(m) {
                           case 0 : 
                                LD3_PORT_BIT = 0;
                                LD4_PORT_BIT = 1; 
                                delay(1000000);
                                break;
                           case 1 : 
                                LD2_PORT_BIT = 0;
                                LD3_PORT_BIT = 1;
                                delay(1000000);
                                break;
                           case 2 : 
                                LD1_PORT_BIT = 0;
                                LD2_PORT_BIT = 1;
                                delay(1000000);
                                break;
                           case 3 : 
                                LD4_PORT_BIT = 0; 
                                LD1_PORT_BIT = 1;
                                delay(1000000);
                                break;
                       }
                   }
                   
                 
               }
                if (4 == G_position) { /* win of right side, counter_right + 1 */
                    count_r++;
                }
                else {
                }
                G_position = 0; /* jump to idle state */
           }
          
        }
    }

void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SOFT) ISR_PortA_Change(void) {
    if (CNSTATAbits.CNSTATA4) { // Bit 4 (BTN2) changed
        if (BTN2_PORT_BIT)  { // Switch 2 is pressed
            G_position++; // move to right
        } else {    // Switch isn't pressed
            
        }
    }
    else if (CNSTATAbits.CNSTATA5) { // Bit 5 (BTN1) changed
        if (BTN1_PORT_BIT)  { // Switch 1 is pressed and:
            if (!BTN2_PORT_BIT)  {  // Switch 2 is not pressed
              G_position--;  // move to left
            }
            else if (BTN2_PORT_BIT) { // Switch 2 is  pressed
                if (count_l > count_r)  { //quantity of left wins more than right
                    count_r = 0; //counters are cleared
                    count_l = 0;
                    G_position = -5; // jump to running LED string right-left
                } 
                else if (count_l < count_r)  { //quantity of right wins more than left
                    count_r = 0; //counters are cleared
                    count_l = 0;
                    G_position = 5; // jump to running LED string left-right
                }  
                else { //quantity of right wins equal left
                    count_r = 0; //counters are cleared
                    count_l = 0;
                    G_position = 0; // jump to idle state
                }
            }
        }
        else { // Switch isn't pressed
            
        }
    }

    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
    TASK_Update_LEDs();
}
