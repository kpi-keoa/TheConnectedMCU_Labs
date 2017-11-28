/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"            /* variables/params used by user.c               */
#include "ADC.h"
#include <sys/attribs.h>

/*! This vars is using for setting count of blinking LEDs*/
int32_t Gtemp_buff = 1;
/*! This var is using for setting count Delay*/
int32_t Gld_counter = 0;
/******************************************************************************/
/* User Functions                                                            */

/******************************************************************************/

/*!
 * \brief This function is using for setting Timer
 * 
 * This function is reset Timer 2, set clock divider, set interrupts for timer
 * \param NONE
 * \return NONE
 */
void InitTimer2(void) {
    T2CON = 0; // clear timer settings to defaults
    T2CONbits.TCKPS = 7; // divide clock by 32 with prescaler
    TMR2 = 0;
    PR2 = 39062; // 100 MHz / (256 * 10 Hz)
    
    IPC2bits.T2IP = 3; // Priority level 3
    IPC2bits.T2IS = 0;
    
    IFS0bits.T2IF = 0; // Clear interrupt request flag
    IEC0bits.T2IE = 1; // Enable timer interrupt
}


/*!
 * \brief Interrupt handler
 * 
 * Every time, whet timer is generate interrut, interrupt is checking val of 
 * Gtemp_buff and if Gtemp_buff greater than 10, Gtemp_buff = 0 and incrementing
 * else Gtemp_buff just incrementing
 * \param NONE
 * \return NONE
 */
void __ISR(_TIMER_2_VECTOR, IPL3SOFT) ISR_Timer_2 (void) {
    if (Gtemp_buff > 10)
    {
        Gtemp_buff = 0;
    }
    else
    {
        Gtemp_buff++;
    }
    IFS0bits.T2IF = 0;
}
/*!
 * \brief This function is using for setting GPIO
 * 
 * This function is setting LED's 1-4 to digital work mode and output
 * And set BTN's 1-2 to Digital input mode
 * \param NONE
 * \return NONE
 */
void InitGPIO(void) {
    /* Setup analog functionality and port direction */
    // LED outputs
    // Disable analog mode if present
    ANSELG &= ~( (1 << 6) | (1 << 15) );
    ANSELB &= ~(1 << 11);
    // Set direction to output 
    TRISG &= ~( (1 << 6) | (1 << 15) );
    TRISB &= ~( (1 << 11) );
    TRISD &= ~( (1 << 4) );
    // Turn off LEDs for initialization
    LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT = LD4_PORT_BIT = 0;

    // BTN1 and BTN2 inputs
    // Disable analog mode
    ANSELA &= ~(1 << 5);
    // Set directions to input
    TRISA |= (1 << 5);
    TRISA |= (1 << 4);
}

/*!
 * \brief This function is using for setting all used devices
 * 
 * This function is using for setting all used devices
 * \param NONE
 * \return NONE
 */
void InitApp(void) {
    InitGPIO();
    InitTimer2();
    initWiFIREadc();
    
    // Set Interrupt Controller for multi-vector mode
    INTCONSET = _INTCON_MVEC_MASK;
    // Globally enable interrupts
    __builtin_enable_interrupts();
    // Enable peripherals which can generate an interrupt
    T2CONbits.ON = 1;

}

/*!
 * \brief Delay function
 * 
 * Software realization of delay function, using empty for cycle
 * \param NONE
 * \return NONE
 */
void Delay(int n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

/*!
 * \brief This function is using for choose num of LEDs
 * 
 * This function is using for choose num of LED's whitch will be blinking
 * Don't return any vars, because using Global var Gld_counter
 * \param NONE
 * \return NONE
 */
void ScanLEDs(void) {
    uint32_t pot_val = 0;
    while (1) {
        if(BTN1_PORT_BIT == 0)
        {
            pot_val = ReadPotentiometerWithADC();
            if (pot_val >= 0 && pot_val <= 1024)
            {
                LD1_PORT_BIT = 1;
                LD2_PORT_BIT = LD3_PORT_BIT = LD4_PORT_BIT = 0;
                Gld_counter = 1;
            }
            if (pot_val > 1024 && pot_val <= 2048)
            {
                LD1_PORT_BIT = LD2_PORT_BIT = 1;
                LD3_PORT_BIT = LD4_PORT_BIT = 0;
                Gld_counter = 2;
            }
            if (pot_val > 2048 && pot_val <= 3072)
            {
                LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT = 1;
                LD4_PORT_BIT = 0;
                Gld_counter = 3;
            }
            if (pot_val > 3072 && pot_val <= 4096)
            {
                LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT = LD4_PORT_BIT = 1;
                Gld_counter = 4;
            }
        }
        else
        {
            LD1_PORT_BIT = LD2_PORT_BIT = LD3_PORT_BIT = LD4_PORT_BIT = 0;
            break;
        }
    }   
}

/*!
 * \brief This function is setting delay param
 * 
 * This function is setting delay param, multiplying Gtemp_buff by 500000
 * \param NONE
 * \return Gtemp_buff * 500000
 */
int32_t SetDelayTime()
{
    return Gtemp_buff * 500000;
}

/*!
 * \brief This function is start LED's blinking
 * 
 * If user choose 1 LED, it will be blinking
 * If 2 or more LED's, it will ON one by one and OFF like previous 
 * \param NONE
 * \return NONE
 */
void FlashLED()
{
    
    int32_t delay = SetDelayTime();
    if (Gld_counter == 1)
    {
        LD1_PORT_BIT = 1;
        Delay(delay);
        LD1_PORT_BIT = 0;
        Delay(delay);
    }
    if (Gld_counter == 2)
    {
        LD1_PORT_BIT = 1;
        Delay(delay);
        LD2_PORT_BIT = 1;
        Delay(delay);
        LD1_PORT_BIT = 0;
        Delay(delay);
        LD2_PORT_BIT = 0;
        Delay(delay);
        LD2_PORT_BIT = 1;
        Delay(delay);
        LD1_PORT_BIT = 1;
        Delay(delay);
        LD2_PORT_BIT = 0;
        Delay(delay);
        LD1_PORT_BIT = 0;
        Delay(delay);
    }
    if (Gld_counter == 3)
    {
        LD1_PORT_BIT = 1;
        Delay(delay);
        LD2_PORT_BIT = 1;
        Delay(delay);
        LD3_PORT_BIT = 1;
        Delay(delay);
        LD1_PORT_BIT = 0;
        Delay(delay);
        LD2_PORT_BIT = 0;
        Delay(delay);
        LD3_PORT_BIT = 0;
        Delay(delay);
        LD3_PORT_BIT = 1;
        Delay(delay);
        LD2_PORT_BIT = 1;
        Delay(delay);
        LD1_PORT_BIT = 1;
        Delay(delay);
        LD3_PORT_BIT = 0;
        Delay(delay);
        LD2_PORT_BIT = 0;
        Delay(delay);
        LD1_PORT_BIT = 0;
        Delay(delay);
    }
    if (Gld_counter == 4)
    {
        LD1_PORT_BIT = 1;
        Delay(delay);
        LD2_PORT_BIT = 1;
        Delay(delay);
        LD3_PORT_BIT = 1;
        Delay(delay);
        LD4_PORT_BIT = 1;
        Delay(delay);
        LD1_PORT_BIT = 0;
        Delay(delay);
        LD2_PORT_BIT = 0;
        Delay(delay);
        LD3_PORT_BIT = 0;
        Delay(delay);
        LD4_PORT_BIT = 0;
        Delay(delay);
        LD4_PORT_BIT = 1;
        Delay(delay);
        LD3_PORT_BIT = 1;
        Delay(delay);
        LD2_PORT_BIT = 1;
        Delay(delay);
        LD1_PORT_BIT = 1;
        Delay(delay);
        LD4_PORT_BIT = 0;
        Delay(delay);
        LD3_PORT_BIT = 0;
        Delay(delay);
        LD2_PORT_BIT = 0;
        Delay(delay);
        LD1_PORT_BIT = 0;
        Delay(delay);
    }
}