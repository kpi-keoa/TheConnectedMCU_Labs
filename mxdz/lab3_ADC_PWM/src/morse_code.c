#include "morse_code.h"      

void morse_code_encoding(const uint8_t msg[], uint8_t *res) 
{
    uint8_t *morse_table[] = {
        "13","3111","3131","311","1","1131","331","1111","11","1333",
        "313","1311","33","31","333","1331","3313","131","111",
        "3","113","1113","133","3113","3133","3311"
    };
    for (uint32_t i = 0; msg[i]!='\0'; i++) {
        if (' ' == msg[i]) {
            strcat(res, " ");
        } else {
            int pos = msg[i] - 'a';
            strcat(res, morse_table[pos]);
        }
    }
}

void init_timer(void) {
    T2CON = 0; // clear timer settings to defaults
    T2CONbits.TCKPS = 7; // divide clock by 256 with prescaler
    TMR2 = 0;
    // Set period for timer
    PR2 = PWM_PERIOD_COUNTS-1;    
    // Set initial duty cycle to 50%
    OC8R = PWM_PERIOD_COUNTS/2;
    // Set reload duty cycle to 50%
    OC8RS = PWM_PERIOD_COUNTS/2;
    // Configure OC5 control register
    OC8CONbits.ON = 1;
    OC8CONbits.OC32 = 0;    // 16 bit mode
    OC8CONbits.OCTSEL = 0; // Select timer 2
    OC8CONbits.OCM = 6; // Select PWM mode without fault pin
    // Start Timer 2
    T2CONbits.ON = 1;
}

void init_gpio(void) 
{
    // Disable LEDs analog mode if present
    ANSELG &= ~((1 << 6) | (1 << 15));
    ANSELBbits.ANSB11 = 0;
    // Set direction to output 
    TRISG &= ~((1 << 6) | (1 << 15));
    TRISB &= ~(1 << 11);
    TRISD &= ~(1 << 4);
    // Turn off LEDs for initialization
    LED_1 = LED_2 = LED_3 = LED_4 = 0;
    // BTN1 and BTN2 inputs
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISA |= (1 << 5) | (1 << 4);
    // Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENA |= (1 << 5) | (1 << 4);
    // Configure Interrupt Controller
    // Enable change notification  interrupts
    IEC3bits.CNAIE = 1;
    // Set priority
    IPC29bits.CNAIP = 2;
    // Clear interrupt Flag
    IFS3bits.CNAIF = 0;
    // Set Interrupt Controller for multi-vector mode
    INTCONSET = _INTCON_MVEC_MASK;
    // Globally enable interrupts
    __builtin_enable_interrupts();
    // Enable peripheral
    CNCONAbits.ON = 1;

    morse_code_encoding(MSG, encoded_msg_g);
    cur_state_g = RESET;
    cur_delay_g = BLINK_DELAY;
   
}

void init_app(void) {
    init_gpio();
    initWiFIREadc();
    init_timer();
}

void delay(volatile uint32_t val) 
{
    uint32_t delay_mult;
    while (val --> 0) {
    	for(delay_mult = 10000; delay_mult > 0; delay_mult--);
    }
}
 
void blink_leds(uint32_t mode) 
{
    uint32_t pot_val = ReadPotentiometerWithADC();
    OC8RS = (pot_val*PWM_PERIOD_COUNTS)/ MAX_ADC_VALUE;
    if (1 == mode) {
        RPG6R = 12; // Select OC8 for LD1
        delay(cur_delay_g);
        while(PAUSE == cur_state_g);
        RPG6R = 0;// disconect LD1 from OC8
        LED_1 = 0;
        delay(cur_delay_g);
    } else if (3 == mode) {
        RPD4R = RPG6R = 12; // Select OC8 for LD1-LD2
        delay(cur_delay_g);
        while(PAUSE == cur_state_g);
        RPD4R = RPG6R = 0;// disconect LD1-LD2 from OC8
        LED_2 = 0;
        delay(cur_delay_g);
    }
}


void display_msg(void) 
{
    cur_delay_g = BLINK_DELAY;
    cur_state_g = START;
    if (START == cur_state_g) { 
        for(uint32_t i = 0; encoded_msg_g[i]!='\0'; i++) {
            if (RESET == cur_state_g) {
                break;
            }
            if ('1' == encoded_msg_g[i]) {
                blink_leds(1);
            } else if ('3' == encoded_msg_g[i]) {
                blink_leds(3);
            } else {
                delay(cur_delay_g);
            }
        }
        delay(BLINK_DELAY);
        cur_state_g = RESET;
    }
}

void __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SOFT) ISR_PortA_Change(void) 
{
    if (CNSTATAbits.CNSTATA4) { // Bit 4 (BTN2) changed
        if (BTN_2)  { 
            delay(DEBOUNCE_DELAY);
            cur_state_g = PAUSE;
        }
    }
    if (CNSTATAbits.CNSTATA5) { // Bit 5 (BTN1) changed
        if (BTN_1)  { 
            delay(DEBOUNCE_DELAY);
            if (START == cur_state_g) {
                cur_delay_g -= 200;
            } else {
                cur_state_g = START;
            }
        }
    }
    // Reset interrupt flag
    IFS3bits.CNAIF = 0;
}
