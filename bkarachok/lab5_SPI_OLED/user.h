#include <stdint.h>
/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/

// Add I/O name macros here
#define LD1_PORT_BIT        LATGbits.LATG6
#define LD2_PORT_BIT        LATDbits.LATD4
#define LD3_PORT_BIT        LATBbits.LATB11
#define LD4_PORT_BIT        LATGbits.LATG15

//#define SW1      PORTFbits.RD8
#define SW1      PORTEbits.RE8
#define BTN1     PORTCbits.RC3
#define BTN2     PORTDbits.RD5
#define BTN3     PORTFbits.RF1
#define BTN4     PORTAbits.RA2

// typedef uint8_t BYTE;

/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */

void InitApp(void);         /* I/O and Peripheral Initialization */
void DelayMs(int t);
