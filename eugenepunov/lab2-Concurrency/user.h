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

/******************************************************************************/
/* User Function Prototypes                                                    /
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */

void init_app(void);         /* I/O and Peripheral Initialization */

void scan_leds(void);          /* testing program in the begining */

int task_scan_leds(uint32_t dir_lr); /* function runs when one of player wins */

void set_leds (uint32_t l1, uint32_t l2, uint32_t l3, uint32_t l4); /* shows "scores" in the game */

void task_update_leds (void);   /* function for testing G_Position - scores of players */

