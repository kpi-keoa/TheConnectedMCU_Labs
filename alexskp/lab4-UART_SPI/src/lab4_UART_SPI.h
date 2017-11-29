
#ifndef _LAB4_UART_SPI_H    /* Guard against multiple inclusion */
#define _LAB4_UART_SPI_H

#include <stdint.h>

/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/

// Add I/O name macros here

#define LD1_PORT_BIT        LATGbits.LATG6  //!< Macros that used for setting or reseting of LED1
#define LD2_PORT_BIT        LATDbits.LATD4  //!< Macros that used for setting or reseting of LED2
#define LD3_PORT_BIT        LATBbits.LATB11 //!< Macros that used for setting or reseting of LED3
#define LD4_PORT_BIT        LATGbits.LATG15 //!< Macros that used for setting or reseting of LED4

#define BTN1_PORT_BIT       PORTAbits.RA5   //!< Macros for reading button1 state
#define BTN2_PORT_BIT       PORTAbits.RA4   //!< Macros for reading button2 state

#define PWM_FREQ_HZ         (50)            //!< Definition of PWM frequency
#define PWM_PERIOD_COUNTS   (100000000/(256 * PWM_FREQ_HZ)) //!< Definition of PWM period counts

#define SERVO_0             (220)   //!< Definition of servo angle 
#define SERVO_90            (550)   //!< Definition of servo angle 
#define SERVO_180           (880)   //!< Definition of servo angle 


/* I/O and Peripheral Initialization */
void initGPIO(void);
void UART4_init(void);         
void delayMs(int t);
void set_angle(char);

#endif
