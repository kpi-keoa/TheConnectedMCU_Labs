/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"            /* variables/params used by user.c               */
#include "user1.h" 
#include "user2.h" 
#include "user3.h" 
#include <sys/attribs.h>
#include "UART.h"

void Program_Selection(void) 
{
    UART4_init();
    int choise = 0;
    char c = 0;
    while (1) {
    c = UART4_getc();
    if(c == '6'){
        if(choise < 5)
            choise++;
    }
    if(c == '4'){
        if(choise > -1)
            choise--;
    }
    
    switch(choise){
            case 0: LedState(1,0,0,0);
                    break;
            case 1: LedState(0,1,0,0);
                    break;
            case 2: LedState(0,0,1,0);
                    break;
            case 3: LedState(0,0,0,1);
                    break;
            default: choise = 2;
                    break;
        }
    if(c == 'm'){
        LedState(1,1,1,1);
        delay(1000000);
        UART4_puts("You found Secret Mod.\r\n");
        UART4_puts("But to activate it you need to send 13$.\r\n");
        UART4_puts("to the card 2637-3738-4866-6666.\r\n");
    }
    
     if(c == 'v'){
        LedState(1,0,0,1);
        delay(1000000);
        LedState(0,1,1,0);
        delay(1000000);
        UART4_puts("V-Vendetta?.\r\n");
        UART4_puts("NO!.\r\n");
        UART4_puts("V it VULKAN!.\r\n");
        UART4_puts("Come in and get 100$ on your the demo account.\r\n");
        UART4_puts("Specialy for you referral code - r2sxrtpa.\r\n");
     }
    
    if(c == 13)
        switch(choise){
            case 0: LedState(0,0,0,0);
            UART4_puts("You choise lab 1.\r\n");
                    Blink_LEDs();
                    break;
            case 1: LedState(0,0,0,0);
            UART4_puts("You choise lab 2.\r\n");
                    Update_LEDs();
                    break;
            case 2: LedState(0,0,0,0);
            UART4_puts("You choise lab 3.\r\n");
                    InitApp3();
                    AdjustBrightness();
                    break;
            case 3: LedState(0,0,0,0);
            UART4_puts("You choise game.\r\n");
                    Init();
                    break;
            default: choise = 2;
        }
    }
}
    

