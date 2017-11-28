/*!
 * \brief Funny program))0)
 * 
 *  Just Blinking LED's num of LED's choose by Potentiometer
 * \author Nikita Hutsenko
 * \version 1.0
 * \bug User should to compile this code with andy warnings, because this code
 * doesen't work with SRS interrupt, only with SOFT interrupt
 */
/******************************************************************************/
/*  Files to Include                                                          */
/******************************************************************************/
#ifdef __XC32
    #include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>         /* For uint32_t definition                        */
#include <stdbool.h>        /* For true/false definition                      */

#include "user.h"           /* User funct/params, such as InitApp             */
#include "ADC.h"

/******************************************************************************/
/* Global Variable Declaration                                                */
/******************************************************************************/

/* i.e. uint32_t <variable_name>; */

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/

int32_t main(void)
{
    /* Initialize I/O 
     * and Peripherals
     * for application */
    InitApp();
    ScanLEDs();
    while (1) {
        FlashLED();
    }
}
