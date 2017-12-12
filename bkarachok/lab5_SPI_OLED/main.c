/******************************************************************************/
/*  Files to Include                                                          */
/******************************************************************************/
#ifdef __XC32
    #include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>         /* For uint32_t definition                        */
#include <stdbool.h>        /* For true/false definition                      */

#include "user.h"           /* User funct/params, such as InitApp             */
#include "OLED.h"
#include "stdio.h"
#include <math.h>
#include "user.h"
/******************************************************************************/
/* Global Variable Declaration                                                */
/******************************************************************************/

/* i.e. uint32_t <variable_name>; */

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/

int32_t main(void)
{
    char buffer[32];
    int x = 96;
    int y = 16;
    int n;
    int stb3 = 0;
    int stb2 = 0;
    int stb4 = 0;
    int stb1 = 0;
    /* Initialize I/O 
     * and Peripherals
     * for application */
    InitApp();
    
    OledDvrInit();
    
    OledSetCursor(0,0); // displaying text 
    OledPutString("Graph");
    OledSetCursor(0,1);
    OledPutString("Control");
    
    OledMoveTo(x,y); // setup initial coordinates for painting
    
    while (1) {
        if (BTN2) // go to the right pixel if the button was pressed
        {
            if(!stb2)
            {
                stb2 = !stb2;
                OledMoveRight();
            }
        }
        
        if (!BTN2)
        {
                stb2 = 0;
        }
        
         if (BTN3) // go to the left pixel if the button was pressed
        {
            if(!stb3)
            {
                stb3 = !stb3;
                OledMoveLeft();
            }
        }
        
        if (!BTN3)
        {
                stb3 = 0;
        }
        
        if (BTN4) // go to the top pixel if the button was pressed
        {
            if(!stb4)
            {
                stb4 = !stb4;
                OledMoveUp();
            }
        }
        
        if (!BTN4)
        {
                stb4 = 0;
        }
        
          if (BTN1) // go to the lower pixel if the button was pressed
        {
            if(!stb1)
            {
                stb1 = !stb1;
                OledMoveDown();
            }
        }
        
        if (!BTN1) 
        {
                stb1 = 0;
        }

        if (SW1) // if switch is on
        {
            OledSetDrawColor(1); //set white color
        }
        
        if (!SW1) // if switch is off
        {
            OledSetDrawColor(0); //set black color
        }
        OledDrawPixel(); // draw pixel with the selected color
    }

}
