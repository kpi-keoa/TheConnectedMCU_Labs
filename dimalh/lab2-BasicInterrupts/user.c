
#include "user.h"

// initialization global 
int32_t counter = 0;
int32_t number_save_1;
int32_t number_save_2;
int8_t flag = 0;

void delay(volatile uint32_t n) {
    for (; n > 0; n--);
}

void init_app (void) {
    // LED initialization
    // Disable analog mode
    LED1_ANSEL &= ~(1 << LED1_BIT);
    LED2_ANSEL &= ~(1 << LED2_BIT);
    LED3_ANSEL &= ~(1 << LED3_BIT);
    LED4_ANSEL &= ~(1 << LED4_BIT);
    // Set direction to output
    LED1_TRIS &= ~(1 << LED1_BIT);
    LED2_TRIS &= ~(1 << LED2_BIT);
    LED3_TRIS &= ~(1 << LED3_BIT);
    LED4_TRIS &= ~(1 << LED4_BIT);
    // LED off
    LAT_LED_1 = 1;
    LAT_LED_2 = 1;
    LAT_LED_3 = 1;
    LAT_LED_4 = 1;
    // Button input
    // Disable analog mode
    BTN1_ANSEL &= ~(1 << BTN1_BIT);
    BTN2_ANSEL &= ~(1 << BTN2_BIT);
    // Set directions to input
    BTN1_TRIS |= 1 << BTN1_BIT;
    BTN2_TRIS |= 1 << BTN2_BIT;
    
    // Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENAbits.CNIEA5 = 1;
    CNENAbits.CNIEA4 = 1;
    // Configure Interrupt Controller
    // Enable change notification  interrupts
    IEC3bits.CNAIE = 1;
    // Set priority
    IPC29bits.CNAIP = 6;
    // Clear interrupt Flag
    IFS3bits.CNAIF = 0;
    // Set Interrupt Controller for multi-vector mode
    INTCONSET = _INTCON_MVEC_MASK;
    // Globally enable interrupts
    __builtin_enable_interrupts();
    // Enable peripheral
    CNCONAbits.ON = 1;
}


void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SOFT) ISR_PortA_Change(void) {
    if (CNSTATAbits.CNSTATA5 == 1)          // Bit 5 (BTN1) changed
    {    
        if (BTN1)    
        {
            if (counter == 15) 
                counter = -1;
            counter++;             
        }
        
    } 
    else if (CNSTATAbits.CNSTATA4 == 1) {   // Bit 4 (BTN1) changed                
        if (BTN2)                           // Switch is pressed
        {
             //switch a few mods by BTN2
            if (flag == 0)                 
                number_save_1 = counter;    //save first value
            if (flag == 1)
                number_save_2 = counter;    //save second value
            if (flag == 2)
            {
                counter = number_save_1 + number_save_2;    //creat result
                if (counter > 15)           //check overflow
                {
                    sum_error();        
                    counter = 0;
                }
            }  
            flag++;                         // increment flag
            if (flag > 2)
                flag = 0;                   // return star value of flag
        }
    }
    delay(DEBOUNCE);                        //debounce
    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
}

void sum_error(void)
{
    int16_t i;
    for (i = 0; i < 50; i++)
    {
        // switch on all LEDs
        LAT_LED_1 = 1;
        LAT_LED_2 = 1;
        LAT_LED_3 = 1;
        LAT_LED_4 = 1;
        delay(DELAY_B);
        
        // switch off all LEDs
        LAT_LED_1 = 0;
        LAT_LED_2 = 0;
        LAT_LED_3 = 0;
        LAT_LED_4 = 0;
        delay(DELAY_B);
    }
}

void count(void)
{
    switch (counter)
    {
        // check value of counter, start one of this mode, using LEDs
        case 0:
            LAT_LED_1 = 0;
            LAT_LED_2 = 0;
            LAT_LED_3 = 0;
            LAT_LED_4 = 0;
            break;
        case 1:
            LAT_LED_1 = 1;
            LAT_LED_2 = 0;
            LAT_LED_3 = 0;
            LAT_LED_4 = 0;
            break;
        case 2:
            LAT_LED_1 = 0;
            LAT_LED_2 = 1;
            LAT_LED_3 = 0;
            LAT_LED_4 = 0;
            break;
        case 3:
            LAT_LED_1 = 1;
            LAT_LED_2 = 1;
            LAT_LED_3 = 0;
            LAT_LED_4 = 0;
            break;
        case 4:
            LAT_LED_1 = 0;
            LAT_LED_2 = 0;
            LAT_LED_3 = 1;
            LAT_LED_4 = 0;
            break;
        case 5:
            LAT_LED_1 = 1;
            LAT_LED_2 = 0;
            LAT_LED_3 = 1;
            LAT_LED_4 = 0;
            break;
        case 6:
            LAT_LED_1 = 0;
            LAT_LED_2 = 1;
            LAT_LED_3 = 1;
            LAT_LED_4 = 0;
            break;
        case 7:
            LAT_LED_1 = 1;
            LAT_LED_2 = 1;
            LAT_LED_3 = 1;
            LAT_LED_4 = 0;
            break;
        case 8:
            LAT_LED_1 = 0;
            LAT_LED_2 = 0;
            LAT_LED_3 = 0;
            LAT_LED_4 = 1;
            break;
        case 9:
            LAT_LED_1 = 1;
            LAT_LED_2 = 0;
            LAT_LED_3 = 0;
            LAT_LED_4 = 1;
            break;
        case 10:
            LAT_LED_1 = 0;
            LAT_LED_2 = 1;
            LAT_LED_3 = 0;
            LAT_LED_4 = 1;
            break;
        case 11:
            LAT_LED_1 = 1;
            LAT_LED_2 = 1;
            LAT_LED_3 = 0;
            LAT_LED_4 = 1;
            break;
        case 12:
            LAT_LED_1 = 0;
            LAT_LED_2 = 0;
            LAT_LED_3 = 1;
            LAT_LED_4 = 1;
            break;
        case 13:
            LAT_LED_1 = 1;
            LAT_LED_2 = 0;
            LAT_LED_3 = 1;
            LAT_LED_4 = 1;
            break;
        case 14:
            LAT_LED_1 = 0;
            LAT_LED_2 = 1;
            LAT_LED_3 = 1;
            LAT_LED_4 = 1;
            break;
        case 15:
            LAT_LED_1 = 1;
            LAT_LED_2 = 1;
            LAT_LED_3 = 1;
            LAT_LED_4 = 1;
            break;
    }
}

