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

#define BIT0 ((uint32_t)0x01)
#define BIT1 ((uint32_t)0x02)
#define BIT2 ((uint32_t)0x04)
#define BIT3 ((uint32_t)0x08)
#define BIT4 ((uint32_t)0x10)
#define BIT5 ((uint32_t)0x20)
#define BIT6 ((uint32_t)0x40)
#define BIT7 ((uint32_t)0x80)
#define BIT8 ((uint32_t)0x100)
#define BIT9 ((uint32_t)0x200)
#define BIT10 ((uint32_t)0x400)
#define BIT11 ((uint32_t)0x800)
#define BIT12 ((uint32_t)0x1000)
#define BIT13 ((uint32_t)0x2000)
#define BIT14 ((uint32_t)0x4000)
#define BIT15 ((uint32_t)0x8000)


volatile int32_t G_Position = 0; // Allow LEDs to be on initially
volatile int32_t G_Contest = 0; // Allow LEDs to be on initially
volatile int32_t G_Victory = 0;
/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

void Set_LEDs(uint32_t L) {
    //led1
    if (L & BIT0){  //LD1_PORT_BIT == LATGbits.LATG6
        LATG |= BIT6; //Set 1   
    } else
        LATG &= ~(BIT6); //Set 0
    //led2
    if (L & BIT1){  //LD2_PORT_BIT == LATDbits.LATD4
        LATD |= BIT4; //Set 1   
    } else
        LATD &= ~(BIT4); //Set 0
    //led3
    if (L & BIT2){  //LD3_PORT_BIT == LATBbits.LATB11
        LATB |= BIT11; //Set 1   
    } else
        LATB &= ~(BIT11); //Set 0
    //led4
    if (L & BIT3){  //LD4_PORT_BIT == LATGbits.LATG15
        LATG |= BIT15; //Set 1   
    } else
        LATG &= ~(BIT15); //Set 0
}


void InitApp(void) {
    /* Setup analog functionality and port direction */
    // LED outputs
    // Disable analog mode if present
    
    ANSELG &= ~( BIT6 | BIT11 | BIT15 );
    
    // Set direction to output 
    TRISG &= ~( BIT6 | BIT15 );
    TRISB &= ~(BIT11);
    TRISD &= ~(BIT4);
    
    // Turn LEDs in start position  for initialization
    Set_LEDs(0b0110);

    // BTN1 and BTN2 inputs
    // Disable analog mode
    ANSELA &= ~(BIT5);
    
    // Set directions to input
    TRISA |= (BIT4 |  BIT5) ;    
    
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

void delay(int32_t n) {
    volatile int32_t i;
    for (i = 0; i < n; i++) {
    }    
}



void TASK_Scan_LEDs(void) {
    switch(G_Victory){
        case 0: //game in process
            switch(G_Position){ //G_Position is center position of the rope
                case -3:
                    Set_LEDs(0b1000);
                    //Set_LEDs(1,0,0,0);

                    break;
                case -2:
                    Set_LEDs(0b1100);
                    break;
                case -1:
                    Set_LEDs(0b0100);
                    break;
                case 0:
                    Set_LEDs(0b0110);
                    break;
                case 1:
                    Set_LEDs(0b0010);
                    break;
                case 2:
                    Set_LEDs(0b0011);
                    break;
                case 3:
                    Set_LEDs(0b0001);
                    break;
            }
            break;
        case 1: //player of button 2 win - blinking 
            Set_LEDs(0b1000);
            delay(FAST_DELAY);
            Set_LEDs(0b1001);
            delay(FAST_DELAY);
            Set_LEDs(0b1010);
            delay(FAST_DELAY);
            Set_LEDs(0b1100);
            delay(FAST_DELAY);
            Set_LEDs(0b1000);
            delay(FAST_DELAY);
            break;
        case -1: //player of button 1 win - blinking
            Set_LEDs(0b0001);
            delay(FAST_DELAY);
            Set_LEDs(0b1001);
            delay(FAST_DELAY);
            Set_LEDs(0b0101);
            delay(FAST_DELAY);
            Set_LEDs(0b0011);
            delay(FAST_DELAY);
            Set_LEDs(0b0001);
            delay(FAST_DELAY);
            break;
    }
}



void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SRS) ISR_PortA_Change(void) {
    
    //if  game  over  and 1 and 2 buttons  pressed together new game will start again
    if (G_Victory!=0) { 
            if (BTN1_PORT_BIT  & BTN2_PORT_BIT  ){
                G_Victory=0;
                G_Position=0;
            }            
        } 

    //BUTTONS check
   if (CNSTATAbits.CNSTATA4) { // Bit 4 (BTN2) changed
        if ( (BTN2_PORT_BIT ) &(!BTN1_PORT_BIT) & (!G_Victory))  { // only Switch 2 is pressed and game in process
            G_Contest=G_Contest-1;
        }
    } else if (CNSTATAbits.CNSTATA5 ) { // Bit 5 (BTN1) changed
        if ((BTN1_PORT_BIT ) &(!BTN2_PORT_BIT) &(!G_Victory))  { // only Switch 1 is pressed and game in process
            G_Contest=G_Contest+1;
        }
    }
   
    //contest check
    if  (CONTEST_WIN_VALUE ==G_Contest){ //if one of players achive CONTEST_WIN_VALUE position will chenged
        G_Position=G_Position+1;
        G_Contest=0;
    } else if (0==(CONTEST_WIN_VALUE +G_Contest)){
        G_Position=G_Position-1;
        G_Contest=0;
    }
    
    //Victory check 
    if (4==G_Position){ 
        G_Victory=-1; //player of button2 win
    }
    else if (-4==G_Position){
        G_Victory=1;   //player of button1 win
    }
    
    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
    
    //display
    TASK_Scan_LEDs();
}
