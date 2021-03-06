/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/

// Add I/O name macros here
#define LD1_PORT_BIT        LATGbits.LATG6
#define LD2_PORT_BIT        LATDbits.LATD4
#define LD3_PORT_BIT        LATBbits.LATB11
#define LD4_PORT_BIT        LATGbits.LATG15

#define BTN1_PORT_BIT       PORTAbits.RA5
#define BTN2_PORT_BIT       PORTAbits.RA4

/* TODO Application specific user parameters used in user.c may go here */
#define PWM_FREQ_HZ (1000)
#define PWM_PERIOD_COUNTS (100000000/(256*PWM_FREQ_HZ))
#define MAX_ADC_VALUE (4095)

#define VR1_AN_CHAN_NUM (8)

/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */
void InitTimer2AndOC5(void);

/*!
Lights the LEDs
\param L1 lights the first LED
\param L2 lights the secon LED
\param L3 lights the third LED
\param L4 lights the fourth LED
*/
void LedState(uint32_t L1, uint32_t L2, uint32_t L3, uint32_t L4);

/*!
Creates a delay
\param n delay
*/
void  delay(volatile int n);

/*!
Controlling the level of bright, maintaining the level of bright, demonstrating the level of bright
*/
void AdjustBrightness(void);

/*!
Setup functionality and port direction
*/
void InitGPIO(void);

/*!
// Initialize peripherals
*/
void InitApp3(void);         /* I/O and Peripheral Initialization */



