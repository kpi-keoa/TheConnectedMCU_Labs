 #ifdef __XC32
    #include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>         /* For uint32_t definition                        */


//#define LED_DELAY       (1000000)

#define LAT_LED_1 LATGbits.LATG6
#define LAT_LED_2 LATDbits.LATD4
#define LAT_LED_3 LATBbits.LATB11
#define LAT_LED_4 LATGbits.LATG15
#define BTN_BIT_1 PORTAbits.RA5
#define BTN_BIT_2 PORTAbits.RA4


void init_app(void);         /* I/O and Peripheral Initialization */

//void Echo_Buttons(void);
//void Scan_LEDs(void);
void flash_LED(void);
