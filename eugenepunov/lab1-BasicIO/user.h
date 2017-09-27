/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/

// Add I/O name macros here
#define led1    LATGbits.LATG6
#define led2    LATDbits.LATD4
#define led3    LATBbits.LATB11
#define led4    LATGbits.LATG15

#define btn1   PORTAbits.RA5
#define btn2   PORTAbits.RA4

/* TODO Application specific user parameters used in user.c may go here */

/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */

void InitApp(void);         /* I/O and Peripheral Initialization */

void Flash_LED(void);

void Scan_LEDs (void);

void Scan_LEDs2(void);