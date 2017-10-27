#include "user.h"            /* variables/params used by user.c               */


//volatile int G_Allow_Lit_LEDs = 1; // Allow LEDs to be on initially
//volatile int G_LED_Scan_delay = SLOW_delay; // Scan LEDs slowly initially
volatile int G_Position = 0; // for understanding who is in the lead
volatile int G_Bonus = 0; //Inverts the glow of the LEDs 
volatile int GameMod = 0; // Enables the game mode of the computer against the computer
volatile int Tap = 0; // for counting clicks

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

void delay(volatile uint32_t n) {
    for (; n > 0; n--);
}

void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SOFT) ISR_PortA_Change(void) {
    if (CNSTATAbits.CNSTATA4 == 1) { // Bit 4 (BTN2) changed
        if (BTN2_PORT_BIT == 1)  { // Switch is pressed
            G_Position = G_Position + 1;
            GameMod = 0; 
            delay(5000);
        }
    }
    if (CNSTATAbits.CNSTATA5 == 1) { // Bit 4 (BTN1) changed
        if (BTN1_PORT_BIT == 1)  { // Switch is pressed, so use fast scan
            G_Position = G_Position - 1;
            GameMod = 0;
            delay(5000);
        } 
    }
        if(BTN1_PORT_BIT == 1 && BTN2_PORT_BIT == 1) {
            G_Bonus = !G_Bonus;
            delay(1000000);
            Tap = Tap + 1;
            if(BTN1_PORT_BIT == 1 && Tap == 3) {
                GameMod = !GameMod;
                Tap = 0;
                G_Bonus = 0;
                delay(10000000);
            }
        }
    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
}


void Set_LEDs(int L1, int L2, int L3, int L4) //light the needfull LEDs
{
    delay(1000000);
    if(G_Bonus == 0) {
    LD1_PORT_BIT = L1;
    LD2_PORT_BIT = L2;
    LD3_PORT_BIT = L3;
    LD4_PORT_BIT = L4;
    }
        
    if(G_Bonus == 1){
    LD1_PORT_BIT = !L1;
    LD2_PORT_BIT = !L2;
    LD3_PORT_BIT = !L3;
    LD4_PORT_BIT = !L4;
    }
        
}

void ScanLEDs(int dir_lr){ // winning flashing
    volatile int i;
    if(dir_lr == 0){
        for(i = 0; i<6; i++){
        Set_LEDs(1,0,0,0);
        Set_LEDs(1,1,0,0);
        Set_LEDs(1,1,1,0);
        Set_LEDs(1,1,1,1);
        Set_LEDs(0,1,1,1);
        Set_LEDs(0,0,1,1);
        Set_LEDs(0,0,0,1);
        }
    }
        
    if(dir_lr == 1){
        for(i = 0; i<6; i++){
        Set_LEDs(0,0,0,1);
        Set_LEDs(0,0,1,1);
        Set_LEDs(0,1,1,1);
        Set_LEDs(1,1,1,1);
        Set_LEDs(1,1,1,0);
        Set_LEDs(1,1,0,0);
        Set_LEDs(1,0,0,0);
        Set_LEDs(0,0,0,0);
        }
    }
}

void Update_LEDs()
{
    if(GameMod)
    {
        G_Position = G_Position + (rand() % 3 - 1); // Provides a game without user intervention
        delay(10000000);
    }
    switch(G_Position){
    case -4:
        ScanLEDs(1);
        G_Position = 0;
        break;
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
            
    case 4: 
            ScanLEDs(0);
            G_Position = 0;
            break;
    
    default:
             Set_LEDs(1,1,1,1);
             break;
    }
}


