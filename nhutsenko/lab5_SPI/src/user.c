/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"            /* variables/params used by user.c               */
#include "OLED.h"
#include <sys/attribs.h>

/******************************************************************************/
/* User Functions                                                             */

/******************************************************************************/

/*!
 * \brief Delay function
 * 
 * This function is using for delay between operations
 * @param [in] delay in ms
 * \return NONE
 */
void DelayMs(int t) {
    volatile long int count = t*33356;
    
    while (count--)
        ;
}
/*!
 * \brief This function is using for setting buttons on I/O shield
 * 
 * This function is using for setting all used devices
 * \param NONE
 * \return NONE
 */
void InitGPIO(void) {
    // Button inputs
    // Disable analog mode
    ANSELA &= ~(1 << 5);
    // Set directions to input
    TRISA |= (1 << 3);
    TRISD |= (1 << 5);
    TRISF |= (1 << 1);
}
/*!
 * \brief This function is using for setting all used devices
 * 
 * This function is using for setting all used devices
 * \param NONE
 * \return NONE
 */
void InitApp(void) {
    // Initialize peripherals
    InitGPIO();
    OledHostInit();
    OledDspInit();
}

/*!
 * \brief This function is using for chhose a number for game
 * 
 * This function is using for chhose a number for game
 * @param [out] integer number from 0 to 9 
 * \return integer number from 0 to 9
 */
int32_t SetNum()
{
    int32_t ret_num = 0;
    while (!BTN3_PORT_BIT)
    {
        DelayMs(200);
        if(BTN1_PORT_BIT)
        {
            DelayMs(200);
            if(ret_num <= 0)
            {
                ret_num = 0;
            }
            else
            {
                ret_num -= 1;
            }
        }
        if(BTN2_PORT_BIT)
        {
            DelayMs(200);
            if(ret_num >= 9)
            {
                ret_num = 9;
            }
            else
            {
                ret_num += 1;
            }
        }
        OledSetCursor(0, 2);
        char num_c [2];
        num_c[0] = ret_num + 48;
        num_c[1] = '\0';
        OledPutString(num_c);
    }
    return ret_num;
}
