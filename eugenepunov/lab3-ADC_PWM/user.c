

/*!
 *  \pre       Main programm
 */

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"            /* variables/params used by user.c               */
#include <sys/attribs.h>
#include "ADC.h"

uint8_t mode = 0;   //!< Different modes of programm



/*!
 Initialize Timer2
\param[out] none
\param[in] none
\return none
*/

void init_timer2_and_oc5(void) {
    // Initialize Timer2. See details in Section 14 (Timers) 
    // of the PIC32 Family Reference Manual
    // clear timer settings to defaults
    T2CON = 0; 
    

    T2CONbits.TCKPS = 7;  //divide clock by 256 with prescaler 
    TMR2 = 0;  // clear counter to 0
    //Set period for timer using symbol PWM_PERIOD_COUNTS from user.h
    PR2 = PWM_PERIOD_COUNTS - 1;

    // Initialize OC5. See details in Section 16 (Output Compare) 
    // of the PIC32 Family Reference Manual. Use Pulse Width Modulation, which 
    // is described in Section 16.3.3.
    // Set initial duty cycle to 50%
    OC5R = PWM_PERIOD_COUNTS >> 2;
    // Set reload duty cycle to 50%
    OC5RS = PWM_PERIOD_COUNTS >> 2;
    // Configure OC5 control register
    OC5CONbits.ON = 1;  // Turn on OC5
    OC5CONbits.OC32 = 0;    // Select 16 bit mode
    OC5CONbits.OCTSEL = 0; // Select timer 2
    OC5CONbits.OCM = 6; // Select PWM mode without fault pin
    
    // Configure Peripheral Pin Select to connect OC5 output signal to pin G6,
    // which drives LED LD1.
    // See details in Section 12.4 of the PIC32MZ EF Data Manual.
    // There is also general information in Section 12.3.1 of the PIC32 Family 
    // Reference Manual.
    RPG6R = 11; //!< Select OC5

    // Start Timer 2
    T2CONbits.ON = 1;
}
/*!
 * for control led brightness
\param[out] none
\param[in] none
\return none
*/
void adjust_led1_brightness(void) {
    unsigned int pot_pos = 0, on_time_counts=0;
    
    // Read potentiometer value using ADC
    pot_pos = read_potentiometer_with_adc();
    // Convert potentiometer value to on-time (counts)
    on_time_counts = (pot_pos*PWM_PERIOD_COUNTS)/MAX_ADC_VALUE;
    // Update OC5RS with new on-time count  
    OC5RS = on_time_counts;
    
    LD1_PORT_BIT = on_time_counts;
    
}
/*!
 initialize gpio
\param[out] none
\param[in] none
\return none
*/
void init_gpio(void) {
    /* Setup analog functionality and port direction */
    ANSELBbits.ANSB13 = 1;
    // LED outputs
    // Disable analog mode if present
    ANSELG &= ~(1 << 15);
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

    // 3. Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENA |= (1 << 5);
    CNENA |= (1 << 4);
    // 4. Configure Interrupt Controller
    // Enable change notification  interrupts
    IEC3bits.CNAIE = 1;
    // Set priority
    IPC29bits.CNAIP = 2;
    // Clear interrupt Flag
    IFS3bits.CNAIF = 0;
    // 5. Set Interrupt Controller for multi-vector mode
    INTCONSET = _INTCON_MVEC_MASK;
    // 6. Globally enable interrupts
    __builtin_enable_interrupts();
    // 7. Enable peripheral
    CNCONAbits.ON = 1;
}
/*!
 begins program
\param[out] none
\param[in] none
\return none
*/
void init_app(void) {
    // Add code to call functions which initialize peripherals: GPIO, ADC, Timer2, OC5
    init_gpio();
    init_wifire_adc();
    init_timer2_and_oc5();
    
}
/*!
 function for control blinking speed
\param[out] none
\param[in] none
\return none
*/
void blink(void) {
    static uint32_t on_time_counts = 0;
    static int8_t step = 1;
    
    on_time_counts += step;
    
    if (0 > on_time_counts) {
        on_time_counts = 0;
        step = 1;
    } 
    else if ((PWM_PERIOD_COUNTS - 1) < on_time_counts) {
        on_time_counts = PWM_PERIOD_COUNTS - 1;
        step = -1;
    } 
    OC5RS = on_time_counts;
} 
/*!
 delay function
\param[out] none
\param[in] uint32_t n dellay in mills
\return none
*/
void delay(uint32_t n) {
    volatile uint32_t i;
    for (; n >0; n--){
         for (i = 0; i < 10000; i++);
    }
}
/*!
 choose one of two modes
\param[out] none
\param[in] none
 \return none
*/
void choose_mode () {
    if (mode) {
      adjust_led1_brightness();  
    } 
    else if (!mode) {
       blink();
       delay(50);
    }
}


/*!
\param[out] none
\param[in] interruption
 \return none
*/
void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SRS) isr_port_a_change(void) {
    if (CNSTATAbits.CNSTATA4) { // Bit 4 (BTN2) changed
        if (BTN2_PORT_BIT)  { // Switch is pressed
            mode = 1;
        } 
    } else if (CNSTATAbits.CNSTATA5) { // Bit 4 (BTN1) changed
        if (BTN1_PORT_BIT)  { // Switch is pressed
            mode = 0;
        } 
    }
     IFS3bits.CNAIF = 0;
    // Reset interrupt flag
    
}



