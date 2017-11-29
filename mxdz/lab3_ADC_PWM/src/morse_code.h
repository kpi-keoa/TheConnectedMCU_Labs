#pragma once

#ifdef __XC32
#include <xc.h>          
#endif

#include <stdint.h>       
#include <string.h>
#include <sys/attribs.h>     /* For __ISR definition */
#include "ADC.h"

#define LED_1 LATGbits.LATG6
#define LED_2 LATDbits.LATD4
#define LED_3 LATBbits.LATB11
#define LED_4 LATGbits.LATG15

#define BTN_1 PORTAbits.RA5
#define BTN_2 PORTAbits.RA4

#define BLINK_DELAY 1400
#define DEBOUNCE_DELAY 10

#define PWM_FREQ_HZ (1000)
#define PWM_PERIOD_COUNTS (100000000/(256*PWM_FREQ_HZ))
#define MAX_ADC_VALUE (4095)

#define VR1_AN_CHAN_NUM (8)

typedef enum states 
{
    RESET = 0,
    START,
    PAUSE
    
} STATES;

const uint8_t MSG[] = "test msg";
uint8_t encoded_msg_g[100];
volatile uint32_t cur_state_g, cur_delay_g;


void delay(volatile uint32_t val);
void init_app(void);
void blink_leds(uint32_t mode);
void display_msg(void);
void morse_code_ecoding(const uint8_t msg[], uint8_t *res);
