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
#define PWM_FREQ_HZ (100) // we want timer to work with this frequency
#define PWM_PERIOD_COUNTS (100000000/(256*PWM_FREQ_HZ))
#define MAX_ADC_VALUE (4095)

#define VR1_AN_CHAN_NUM (8)

/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */

void InitApp(void);         /* I/O and Peripheral Initialization */

void AdjustLED1Brightness(void);

//bool OC5RIncDec = 0;
int32_t potentiometerValue, incValue = 1, OC5R_val = PWM_PERIOD_COUNTS / 5;
int32_t valuePot = 2000, valuePotOld = 2000;