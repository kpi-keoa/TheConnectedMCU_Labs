/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/

// Add I/O name macros here
#define LD1_POS             6
#define LD2_POS             4
#define LD3_POS             11
#define LD4_POS             15

#define BTN1_PORT_BIT       PORTAbits.RA5
#define BTN2_PORT_BIT       PORTAbits.RA4

/* TODO Application specific user parameters used in user.c may go here */

/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */

void InitApp(void);         /* I/O and Peripheral Initialization */

void Flash_LED(void);

