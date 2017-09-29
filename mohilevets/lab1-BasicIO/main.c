/******************************************************************************/
/*  Files to Include                                                          */
/******************************************************************************/
#ifdef __XC32
    #include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>         /* For uint32_t definition                        */
#include <stdbool.h>        /* For true/false definition                      */

#include "system.h"         /* System funct/params, like osc/periph config    */
#include "user.h"           /* User funct/params, such as InitApp             */

/******************************************************************************/
/* Global Variable Declaration                                                */
/******************************************************************************/

#define delay_max 8000000
#define delay_change 1000000


uint32_t i = 0;
uint32_t LED_state = 1; // 1 on (initial value), 0 off
uint32_t delay_count = delay_max;

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/

int32_t main(void)
{
    /* Initialize I/O 
     * and Peripherals
     * for application */
    
    
    
    InitApp();
    
    while (1){
        if (16 == i){
            i=0;
        } else {
            i=i+1;
        }
        
        Scan_LEDs(i,delay_count,LED_state);
    }
}
