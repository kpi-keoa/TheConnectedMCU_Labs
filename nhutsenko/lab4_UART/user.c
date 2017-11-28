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


/*!
 * \brief This function is using for setting GPIO
 * 
 * This function is setting LED's 1-4 to digital work mode and output
 * And set BTN's 1-2 to Digital input mode
 * \param NONE
 * \return NONE
 */
void InitGPIO(void) 
{
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
}

/*!
 * \brief This function is using for setting all used devices
 * 
 * This function is using for setting all used devices
 * \param NONE
 * \return NONE
 */
void InitApp(void) 
{
    InitGPIO();
    UART4_init();
}

  /*!
 * \brief Delay function
 * 
 * Software realization of delay function, using empty for cycle
 * \param [in] n The MAX count number 
 * \return NONE
 */  
void Delay(uint32_t n) 
{
    volatile uint32_t i;
    for (i = 0; i < n; i++) {
    }
}
