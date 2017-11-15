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
#define SLOW_DELAY          10000000
#define FAST_DELAY          300000

/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */

void InitApp(void);         /* I/O and Peripheral Initialization */

/* Set LEDs by defined vars*/
void SetLeds(uint32_t, uint32_t, uint32_t, uint32_t);
void UpdateLeds(void); /* Updating LEDs  by G_Position var*/
void TaskScanLEDs(uint32_t); /* Show who win and restart game*/