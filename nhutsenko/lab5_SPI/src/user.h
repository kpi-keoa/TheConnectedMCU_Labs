#include <stdint.h>
/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/
/// Define name for BTN1 on I/O shield
#define BTN1_PORT_BIT       PORTAbits.RA3
/// Define name for BTN2 on I/O shield
#define BTN2_PORT_BIT       PORTDbits.RD5
/// Define name for BTN3 on I/O shield
#define BTN3_PORT_BIT       PORTFbits.RF1

// typedef uint8_t BYTE;

/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */
/*! I/O and Peripheral Initialization */
void InitApp(void);         
void DelayMs(int t);
/*! function for choosing a number for game by buttons*/
int32_t SetNum(void);      
