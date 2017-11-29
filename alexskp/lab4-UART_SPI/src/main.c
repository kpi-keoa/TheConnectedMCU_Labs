/**
 *  \file
 *  \brief Main project file 
 *  \author Alexandr Skopets
 *  \date 28.11.2017
 */


#ifdef __XC32
    #include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>         /* For uint32_t definition                        */
#include "lab4_UART_SPI.h"  /* User funct/params, such as InitApp             */
#include "OLED/OLED.h"
#include "UART.h"

/**
 *  \brief main function
 *  
 *  Contains GPIO and peripherals initialization
 *  and infinite loop.
 */
void main(void)
{
    /* Initialize I/O 
     * and Peripherals
     * for application */
    initGPIO();
    UART4_init();
    init_servo();
    
    OledHostInit();
    OledDspInit();
    OledDvrInit();
    
    OledSetDrawColor(1);
    OledSetDrawMode(modOledSet);
    OledSetFillPattern(OledGetStdPattern(3));
    
    OledSetCursor(0,0);
    OledPutString("UART Servo");
    OledSetCursor(0,1);
    
    char mode = 0;
    
    while (1)
    {
        mode = UART4_getc();
        set_angle(mode);
    }
}
