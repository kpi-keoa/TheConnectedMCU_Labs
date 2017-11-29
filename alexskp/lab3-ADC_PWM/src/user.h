/**
 *  \file
 *  \brief contains definitions, macroses and function prototypes
 */

#ifndef USER_H
#define USER_H

// Add I/O name macros here
#define LD1_PORT_BIT        LATGbits.LATG6  //!< Macros that used for setting or reseting of LED1
#define LD2_PORT_BIT        LATDbits.LATD4  //!< Macros that used for setting or reseting of LED2

#define BTN1_PORT_BIT       PORTAbits.RA5   //!< Macros for reading button1 state

/* Application specific user parameters used in user.c may go here */
#define PWM_FREQ_HZ         (50)            //!< Definition of PWM frequency
#define PWM_PERIOD_COUNTS   (100000000/(256 * PWM_FREQ_HZ))  //!< Definition of PWM period counts
#define MAX_ADC_VALUE       (4095)          //!< Definition of maximum ADC value
#define VR1_AN_CHAN_NUM     (8)

#define SERVO_0             (220)           //!< Definition of servo angle 
#define SERVO_90            (550)           //!< Definition of servo angle 
#define SERVO_180           (880)           //!< Definition of servo angle 

void init_gpio(void);                    /* GPIOs Initialization */
void init_servo(void);                   /* PWM Initialization */
void delay(volatile uint32_t n);

#endif
