
#ifndef _LAB1_BASIC_INTERRUPTS_H          /* Guard against multiple inclusion */
#define _LAB1_BASIC_INTERRUPTS_H


#include <xc.h>              /* Defines system registers                      */
#include <stdint.h>          /* For uint32_t definition                       */
#include <sys/attribs.h>     /* For __ISR definition                          */

#define LED1_BIT    6
#define LED2_BIT    4
#define LED3_BIT    11
#define LED4_BIT    15

#define LED1_ANSEL  ANSELG
#define LED2_ANSEL  ANSELD
#define LED3_ANSEL  ANSELB
#define LED4_ANSEL  ANSELG

#define LED1_TRIS   TRISG
#define LED2_TRIS   TRISD
#define LED3_TRIS   TRISB
#define LED4_TRIS   TRISG


#define LAT_LED_1 LATGbits.LATG6
#define LAT_LED_2 LATDbits.LATD4
#define LAT_LED_3 LATBbits.LATB11
#define LAT_LED_4 LATGbits.LATG15

#define BTN1_BIT    5
#define BTN2_BIT    4
#define BTN1_PORT   PORTA
#define BTN2_PORT   PORTA
#define BTN1_ANSEL  ANSELA
#define BTN2_ANSEL  ANSELA
#define BTN1_TRIS   TRISA
#define BTN2_TRIS   TRISA

/* macroses for reading buttons state */
#define BTN1 BTN1_PORT & (1 << 5)
#define BTN2 BTN2_PORT & (1 << 4)

#define DEBOUNCE 50000
#define DELAY_B 1000000


void init_app(void);         /* I/O and Peripheral Initialization */

void count(void);

void sum_error(void);

#endif
