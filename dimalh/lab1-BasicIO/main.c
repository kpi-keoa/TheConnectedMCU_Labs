#include "user.h"           /* User funct/params, such as InitApp             */

void main(void)
{
    /* Initialize I/O 
     * and Peripherals
     * for application */
    
    init_app();
    while (1)
    {
        flash_LED();
    }
}
