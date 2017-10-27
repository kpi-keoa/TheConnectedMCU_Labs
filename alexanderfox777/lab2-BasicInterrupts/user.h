/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/
#pragma once
#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include <stdlib.h>
#include <sys/attribs.h>
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

void Set_LEDs(int L1, int L2, int L3, int L4);
void ScanLEDs(int dir_lr);
void Update_LEDs(void);
