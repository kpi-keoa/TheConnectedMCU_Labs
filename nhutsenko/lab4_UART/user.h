/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/

/*!
 *  Definig  constants for port bits operations
 */
// Add I/O name macros here
#define LD1_PORT_BIT        LATGbits.LATG6
/*!
 *  Definig  constants for port bits operations
 */
#define LD2_PORT_BIT        LATDbits.LATD4
/*!
 *  Definig  constants for port bits operations
 */
#define LD3_PORT_BIT        LATBbits.LATB11
/*!
 *  Definig  constants for port bits operations
 */
#define LD4_PORT_BIT        LATGbits.LATG15

/*!
 *  Definig  constants for port bits operations
 */
#define BTN1_PORT_BIT       PORTAbits.RA5
/*!
 *  Definig  constants for port bits operations
 */
#define BTN2_PORT_BIT       PORTAbits.RA4

/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */

void InitApp(void);         /* I/O and Peripheral Initialization */

void Delay(uint32_t);
