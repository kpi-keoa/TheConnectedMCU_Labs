#ifndef USER_H
#define USER_H

// Add I/O name macros here
#define LD1_PORT_BIT        LATGbits.LATG6
#define LD2_PORT_BIT        LATDbits.LATD4

#define BTN1_PORT_BIT       PORTAbits.RA5

/* Application specific user parameters used in user.c may go here */
#define PWM_FREQ_HZ         (50)
#define PWM_PERIOD_COUNTS   (100000000/(256 * PWM_FREQ_HZ))
#define MAX_ADC_VALUE       (4095)
#define VR1_AN_CHAN_NUM     (8)

#define SERVO_0             (220)
#define SERVO_90            (550)
#define SERVO_180           (880)

void init_gpio(void);                    /* GPIOs Initialization */
void init_servo(void);                   /* PWM Initialization */
void delay(volatile uint32_t n);

#endif
