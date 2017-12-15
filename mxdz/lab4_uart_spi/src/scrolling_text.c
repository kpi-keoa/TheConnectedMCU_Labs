/**
     *\file
     *\brief initialization and system functions, inter
*/

#include "scrolling_text.h"
#include <string.h>
#include <xc.h>  
#include <sys/attribs.h>     /* For __ISR definition */
#include "uart.h"
#include "OLED/OLED.h"

uint32_t delay_g = 200;

void DelayMs(int t)
{
    volatile long int count = t*33356;
    while (count--);
}

/*!
    * \brief GPIO initialization,
    * Initialization for buttons and LEDs
    * Disabling analog mode and setting pins directions
*/   
void init_gpio(void) 
{
    // Disable LEDs analog mode if present
    ANSELG &= ~((1 << 6) | (1 << 15));
    ANSELB &= ~(1 << 11);
    // Set direction to output 
    TRISG &= ~((1 << 6) | (1 << 15));
    TRISB &= ~(1 << 11);
    TRISD &= ~(1 << 4);
    // Turn off LEDs for initialization
    LED_1 = LED_2 = LED_3 = LED_4 = 0;
    // BTN inputs
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input for buttons
    TRISA |= (1 << 5) | (1 << 4) | (1 << 2) | (1 << 3);
    TRISD |= (1 << 5);
    TRISF |= (1 << 1);
    // Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENA |= (1 << 5) | (1 << 4);
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
    
    cur_state_g = START;
}

/*!
    * \brief App initialization, 
    * Calling initialization functions for UART, GPIO and OLED
    * Basic OLED configuration
*/ 
void init_app(void) 
{
    UART4_init();
    init_gpio();
    OledHostInit();
    OledDspInit();
    OledDvrInit();
    OledSetDrawColor(1);
    OledSetDrawMode(modOledSet);
    OledSetFillPattern(OledGetStdPattern(3));
}

/*!
     * \brief Circular shift of array to the left 
     * \param[in] array
*/ 
void shift_str(uint8_t *str) 
{
    uint8_t tmp = str[0];
    for (int i = 0; i<strlen(str)-1; i++) {
        str[i] = str[i+1];
    }
    str[strlen(str)-1] = tmp;
}

/*!
    * \brief Buttons interrupt handler, 
    * Changes program state when button is pressed
*/ 
void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SOFT) ISR_PortA_Change(void) 
{
    if (CNSTATAbits.CNSTATA5) { // Bit 5 (BTN1) changed
        if (BTN_1)  { 
            cur_state_g = PAUSE;
        }
    }
    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
}
