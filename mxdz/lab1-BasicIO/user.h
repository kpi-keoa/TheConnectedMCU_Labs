#pragma once

#ifdef __XC32
#include <xc.h>          
#endif

#include <stdint.h>       
#include <string.h>
#define LED_1        LATGbits.LATG6
#define LED_2       LATDbits.LATD4
#define LED_3        LATBbits.LATB11
#define LED_4      LATGbits.LATG15

#define BTN_1       PORTAbits.RA5
#define BTN_2       PORTAbits.RA4

#define DELAY_TIME 1000000
#define MSG "test msg"

char encoded_msg[100];

void delay(uint32_t val);
void init_app(void);         // I/O and Peripheral Initialization 
void blink_leds(uint32_t mode);
void display_msg(void);
void morse_code_ecoding(char msg[], char *res);
