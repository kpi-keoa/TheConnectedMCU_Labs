/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h> 
#include <stdlib.h> /* For true/false definition                     */
#include "user.h"   
#include "user1.h"             
#include <sys/attribs.h>
#include "UART.h"

/******************************************************************************/
/* User Functions                                                             */

/******************************************************************************/

void program_selection(void) {
    UART4_init();
    int choise = 0;
    char c = 0;
    while(1){
    c = UART4_getc();
    if(c=='a'){
        
        if(choise<4)
            choise++;
        
    }
    if(c=='d'){
        
        if(choise>-1)
            choise--;
        
      
    }
     switch(choise){
         case 0: Set_LEDs (1,0,0,0);
         break;
         case 1: Set_LEDs (0,1,0,0);
         break;
         case 2: Set_LEDs (0,0,1,0);
         break;
         case 3: Set_LEDs (0,0,0,1);
         break;
         default: choise = 3; 
         break;
        }
    
    if(c == 13)
        switch(choise){
         case 0: Set_LEDs (0,0,0,0); 
         choise = rand() % 3+1; 
         break;
         case 1: Set_LEDs (0,0,0,0);
             Scan_LEDs();    
         break;
         case 2: Set_LEDs (0,0,0,0); 
         UART4_puts("Coming soon...\r\n");
         break;
         case 3: Set_LEDs (0,0,0,0);   
             Init();
         break;    
            default: choise =3 ;   
        }
}
}
