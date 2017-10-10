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

volatile int32_t G_Position = 0; // Allow LEDs to be on initially
volatile int32_t G_Contest = 0; // Allow LEDs to be on initially
volatile int32_t G_Victory = 0;
/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/
void InitApp(void) {
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
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;

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

void Delay(int32_t n) {
    volatile int32_t i;
    for (i = 0; i < n; i++) {
    }
}

void Set_LEDs(int32_t L1, int32_t L2, int32_t L3, int32_t L4) {
    LD1_PORT_BIT = L1;   
    LD2_PORT_BIT = L2;  
    LD3_PORT_BIT = L3;   
    LD4_PORT_BIT = L4;
}

void TASK_Scan_LEDs(void) {
    switch(G_Victory){
        case 0: //game in process
            switch(G_Position){ //G_Position is center position of the rope
                case -3:
                    Set_LEDs(1,0,0,0);
                    break;
                case -2:
                    Set_LEDs(1,1,0,0);
                    break;
                case -1:
                    Set_LEDs(0,1,0,0);
                    break;
                case 0:
                    Set_LEDs(0,1,1,0);
                    break;
                case 1:
                    Set_LEDs(0,0,1,0);
                    break;
                case 2:
                    Set_LEDs(0,0,1,1);
                    break;
                case 3:
                    Set_LEDs(0,0,0,1);
                    break;
            }
            break;
        case 1: //player of button 2 win 
            Set_LEDs(1,0,0,0);
            Delay(FAST_DELAY);
            Set_LEDs(1,0,0,1);
            Delay(FAST_DELAY);
            Set_LEDs(1,0,1,0);
            Delay(FAST_DELAY);
            Set_LEDs(1,1,0,0);
            Delay(FAST_DELAY);
            break;
        case -1: //player of button 1 win
            Set_LEDs(0,0,0,1);
            Delay(FAST_DELAY);
            Set_LEDs(1,0,0,1);
            Delay(FAST_DELAY);
            Set_LEDs(0,1,0,1);
            Delay(FAST_DELAY);
            Set_LEDs(0,0,1,1);
            Delay(FAST_DELAY);
            break;
    }
}



void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SRS) ISR_PortA_Change(void) {
   
    if ((CNSTATAbits.CNSTATA4) || (CNSTATAbits.CNSTATA5)){ //if 1 or 2 button changed
        if (!( (BTN2_PORT_BIT)&&(BTN1_PORT_BIT) )){        //if 1 and 2 buttons not pressed together
        
             if (BTN2_PORT_BIT){ //if button2 pressed
                 G_Contest=G_Contest+1;         //G_Contest is variable for more intensive game
                                                //players may achive CONTEST_WIN_VALUE for change position of rope
             }
             if (BTN1_PORT_BIT){ //if button1 pressed
                 G_Contest=G_Contest-1;
             }
        }
    } else 
        if (!G_Victory) G_Victory=0; //if 1 and 2 buttons  pressed together and game over
                                     // new game will start again
    
    if  (CONTEST_WIN_VALUE ==G_Contest){ //if one of players achive CONTEST_WIN_VALUE position will chenged
        G_Position=G_Position+1;
        G_Contest=0;
    } else if (0==(CONTEST_WIN_VALUE +G_Contest)){
        G_Position=G_Position-1;
        G_Contest=0;
    }
    
    if (4==G_Position){ //Victory check
        G_Victory=1; //player of button2 win
        G_Position=0;
    }
    else if (-4==G_Position){
        G_Victory=-1;   //player of button1 win
        G_Position=0;
    }
    
    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
}


