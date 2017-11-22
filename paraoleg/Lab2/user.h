#define LD1_PORT_BIT        LATGbits.LATG6		// I/O name macros
#define LD2_PORT_BIT        LATDbits.LATD4
#define LD3_PORT_BIT        LATBbits.LATB11
#define LD4_PORT_BIT        LATGbits.LATG15

#define BTN1_PORT_BIT       PORTAbits.RA5
#define BTN2_PORT_BIT       PORTAbits.RA4


#define LONG_DELAY          5000000


void InitApp(void);         // I/O and Peripheral Initialization 
void Run_Game_Tasks(void);
