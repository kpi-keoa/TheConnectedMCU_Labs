#include "user.h"            /* variables/params used by user.c               */

void init_app(void)
{
    // set output mode for LED_1
    ANSELGbits.ANSG6 = 0;   // disable analog mode
    TRISGbits.TRISG6 = 0;   // set direction to output
    LATGbits.LATG6 = 0;     // show state LED_1 on start

    //set output mode for LED_2
    TRISDbits.TRISD4 = 0;   // set direction to output
    LATDbits.LATD4 = 0;     // show state LED_2 on start

    //set output mode for LED_3
    ANSELBbits.ANSB11 = 0;  // disable analog mode
    TRISBbits.TRISB11 = 0;  // set direction to output
    LATBbits.LATB11 = 0;    // show state LED_3 on start

    //set output mode for LED_4
    ANSELGbits.ANSG15 = 0;  // disable analog mode
    TRISGbits.TRISG15 = 0;  // set direction to output
    LATGbits.LATG15 = 0;    // show state LED_4 on start

    //set output mode for Button_1
    ANSELAbits.ANSA5 = 0;   // disable analog mode
    TRISAbits.TRISA5 = 1;

    //set output mode for Button_1
    TRISAbits.TRISA4 = 1;
}

void delay(volatile uint32_t n)
{
    for(; n > 0; n--);
}


void flash_LED(void)
{
    int32_t delay_count_1 = 10000000;
    int32_t delay_count_2 = 50000000;
    int32_t delay_count_3 = 90000000;
    uint32_t count = 0;
    if (BTN_BIT_1)
    {
        count = 1;
        LAT_LED_1 = 1;  // LED_1 switch on. show, that OK!
        delay(delay_count_1);
        LAT_LED_1 = 0;  // LED_1 switch off
    }
    if (BTN_BIT_2)
    {
        count = 2;
        LAT_LED_2 = 1;  // LED_2 switch on. show, that OK!
        delay(delay_count_1);
        LAT_LED_2 = 0;  // LED_2 switch off
    }
    if (BTN_BIT_1 && BTN_BIT_2)
    {
        count = 3;
        LAT_LED_3 = 1;  // LED_3 switch on. show, that OK!
        LAT_LED_4 = 1;  // LED_4 switch on. show, that OK!
        delay(delay_count_1);
        LAT_LED_3 = 0;  // LED_3 switch off
        LAT_LED_4 = 0;  // LED_4 switch off
    }
    switch (count)
    {
        case 1:
            LAT_LED_1 = 1;
            LAT_LED_3 = 1;
            delay(delay_count_2);
            LAT_LED_1 = 0;
            LAT_LED_3 = 0;
            break;
        case 2:
            LAT_LED_2 = 1;
            LAT_LED_4 = 1;
            delay(delay_count_3);
            LAT_LED_2 = 0;
            LAT_LED_4 = 0;
            break;
        case 3:
            LAT_LED_1 = 1;
            LAT_LED_2 = 1;
            LAT_LED_3 = 1;
            LAT_LED_4 = 1;
            delay(delay_count_2);
            LAT_LED_1 = 0;
            LAT_LED_2 = 0;
            LAT_LED_3 = 0;
            LAT_LED_4 = 0;
            break;
    }
}
