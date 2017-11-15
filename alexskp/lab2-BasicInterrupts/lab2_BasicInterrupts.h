
#ifndef _LAB1_BASIC_INTERRUPTS_H          /* Guard against multiple inclusion */
#define _LAB1_BASIC_INTERRUPTS_H


#include <xc.h>              /* Defines system registers                      */
#include <stdint.h>          /* For uint32_t definition                       */
#include <sys/attribs.h>     /* For __ISR definition                          */

#define LED1_BIT    6
#define LED2_BIT    4
#define LED3_BIT    11
#define LED4_BIT    15

#define LED1_LAT    LATG
#define LED2_LAT    LATD
#define LED3_LAT    LATB
#define LED4_LAT    LATG

#define LED1_ANSEL  ANSELG
#define LED2_ANSEL  ANSELD
#define LED3_ANSEL  ANSELB
#define LED4_ANSEL  ANSELG

#define LED1_TRIS   TRISG
#define LED2_TRIS   TRISD
#define LED3_TRIS   TRISB
#define LED4_TRIS   TRISG

#define BTN1_BIT    5
#define BTN2_BIT    4
#define BTN1_PORT   PORTA
#define BTN2_PORT   PORTA
#define BTN1_ANSEL  ANSELA
#define BTN2_ANSEL  ANSELA
#define BTN1_TRIS   TRISA
#define BTN2_TRIS   TRISA

/* macroses for turning on/off LEDs */
#define SET_LED1(state) ((state) ? (LED1_LAT |= 1 << LED1_BIT) : (LED1_LAT &= ~(1 << LED1_BIT)))
#define SET_LED2(state) ((state) ? (LED2_LAT |= 1 << LED2_BIT) : (LED2_LAT &= ~(1 << LED2_BIT)))
#define SET_LED3(state) ((state) ? (LED3_LAT |= 1 << LED3_BIT) : (LED3_LAT &= ~(1 << LED3_BIT)))
#define SET_LED4(state) ((state) ? (LED4_LAT |= 1 << LED4_BIT) : (LED4_LAT &= ~(1 << LED4_BIT)))

/* macroses for reading buttons state */
#define BTN1 (BTN1_PORT >> BTN1_BIT) & 1
#define BTN2 (BTN2_PORT >> BTN2_BIT) & 1

#define LED_DELAY               15

#define LIGHT_MODE              0
#define SPEED_DISPLAYING_MODE   1
#define MAX_BRIGHT               15
/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

extern volatile uint8_t mode;
extern volatile uint8_t bright;

/* I/O and Peripheral Initialization */
void init(void);

/* function that generate delays for pwm and light up LEDs*/
void pwm_light(uint8_t);

/* displaying the bright of LEDs light in binary code */
void display_bright(uint8_t);

#endif
