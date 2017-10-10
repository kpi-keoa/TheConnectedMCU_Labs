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
volatile uint32_t G_Position = 0; // Position of rope

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
    LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT = LD4_PORT_BIT = 0;

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
    
    scan_leds();
}

void delay(uint32_t n) {
    volatile uint32_t i;
    n = n * 10000;
    for (i = 0; i < n; i++) {
    }
}


int task_scan_leds(uint32_t dir_lr) {    //function of win 
    volatile uint32_t repeat = 4;        //count of repeats cycles
    if (1 == dir_lr) {      //who win
        for (repeat; repeat > 0; repeat--){ //right player
            set_leds(1, 0, 0, 0);
            delay(100);
            set_leds(0, 1, 0, 0);
            delay(100);
            set_leds(0, 0, 1, 0);
            delay(100);
            set_leds(0, 0, 0, 1);
            delay(100);
        }
        G_Position = 0;     //return to begining
    } else if (0 == dir_lr) {  //left player
        for (repeat; repeat > 0; repeat--){
            set_leds(0, 0, 0, 1);
            delay(100);
            set_leds(0, 0, 1, 0);
            delay(100);
            set_leds(0, 1, 0, 0);
            delay(100);
            set_leds(1, 0, 0, 0);
            delay(100);
        G_Position = 0;     //return to begining
        }
    }
}

void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SRS) isr_port_a_change(void) {
    if (1 == CNSTATAbits.CNSTATA4) { // Bit 4 (BTN2) changed
        if (BTN2_PORT_BIT)  { // Switch is pressed
            // Turn off LEDs as soon as possible
            LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT =LD4_PORT_BIT = 0;
            // Don't allow LEDs to be lit
            G_Allow_Lit_LEDs = 0;
            G_Position += 1;    // plus 1 to right player
        } else {    // Switch isn't pressed
            // Allow LEDs to be lit
            G_Allow_Lit_LEDs = 1;
        }
    } else if (1 == CNSTATAbits.CNSTATA5) { // Bit 4 (BTN1) changed
        if (BTN1_PORT_BIT)  { // Switch is pressed, so use fast scan
            LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT =LD4_PORT_BIT = 0;
            G_Allow_Lit_LEDs = 0;
            G_Position -= 1;    //plus one to left player
        } else { 
            G_Allow_Lit_LEDs = 1;
        }
    }
    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
}

void scan_leds(void) {
    LD1_PORT_BIT = LD2_PORT_BIT = LD2_PORT_BIT = LD2_PORT_BIT = 1;
    delay(500);
    LD1_PORT_BIT = LD2_PORT_BIT = LD2_PORT_BIT = LD2_PORT_BIT = 0;
}

void set_leds (uint32_t l1, uint32_t l2, uint32_t l3, uint32_t l4) {    //function to setting right leds on
    LD1_PORT_BIT = l1;
    LD2_PORT_BIT = l2;
    LD2_PORT_BIT = l3;
    LD2_PORT_BIT = l4;
}

void task_update_leds (void) {      //function for testing G_Position
    if(1 == G_Allow_Lit_LEDs) { //if nothing pressed
    if(-4 >= G_Position) {      //test for left player win
        task_scan_leds(0);
    } else if (4 <= G_Position) {  //test for right player win
        task_scan_leds(1);
    } else {
    switch(G_Position){
            case (-3): 
                set_leds(1, 0, 0, 0);
                break;
            case (-2): 
                set_leds(1, 1, 0, 0);
                break;  
            case (-1): 
                set_leds(0, 1, 0, 0);
                break;    
            case 0: 
                set_leds(0, 1, 1, 0);
                break;
            case 1: 
                set_leds(0, 0, 1, 0);
                break; 
            case 2: 
                set_leds(0, 0, 1, 1);
                break;  
            case 3: 
                set_leds(0, 0, 0, 1);
                break;  
        default: 
            break;    
    }
    }
    }
}
