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
#define VR2_AN_CHAN_NUM (45)
/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */
/* I/O and Peripheral Initialization */
void InitApp(void);         
/* LED1 brightness adjusting */
void AdjustLED1Brightness(void);

