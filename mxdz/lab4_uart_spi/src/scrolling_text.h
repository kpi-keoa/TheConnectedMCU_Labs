/**
 *  \file
 *  \brief contains definitions, macroses and function prototypes
 */
#pragma once

#include <stdint.h>       

#define LED_1 LATGbits.LATG6
#define LED_2 LATDbits.LATD4
#define LED_3 LATBbits.LATB11
#define LED_4 LATGbits.LATG15

#define BTN_1 PORTAbits.RA5
#define BTN_2 PORTAbits.RA4

#define BTN_4_SCHLD PORTAbits.RA2
#define BTN_3_SCHLD PORTFbits.RF1
#define BTN_2_SCHLD PORTDbits.RD5 
#define BTN_1_SCHLD PORTAbits.RA3

typedef enum states 
{
    RESET = 0,
    START,
    PAUSE
    
} STATES;

void DelayMs(int t);
void delay(volatile uint32_t val);
void init_app(void);
void shift_str(uint8_t *str);

volatile uint32_t cur_state_g;
uint8_t msg_g[120] = "test msg ";
extern uint32_t delay_g;