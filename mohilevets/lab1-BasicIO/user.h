/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/

// Add I/O name macros here

#define LED1_PORT        LATGbits.LATG6
#define LED2_PORT        LATDbits.LATD4
#define LED3_PORT        LATBbits.LATB11
#define LED4_PORT        LATGbits.LATG15


#define BTN1_PORT_BIT       PORTAbits.RA5
#define BTN2_PORT_BIT       PORTAbits.RA4

/* TODO Application specific user parameters used in user.c may go here */

/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */

void InitApp(void);         /* I/O and Peripheral Initialization */

void Flash_LED(void);
void Scan_LEDs(void);
