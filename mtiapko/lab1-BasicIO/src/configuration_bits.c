/******************************************************************************/
/* Configuration Bits                                                         */
/*                                                                            */
/* Refer to 'C32 Configuration Settings' under the Help > Contents            */
/* > C32 Toolchain in MPLAB X IDE for available C32 PIC32 Configurations. For */
/* additional information about what the hardware configurations mean in      */
/* terms of device operation, refer to the device datasheet 'Special Features'*/
/* chapter. XC32 documentation is available under Help > Contents >           */
/* XC32 C Compiler.                                                           */
/*                                                                            */
/* A feature of MPLAB X is the 'Generate Source Code to Output' utility in    */
/* the Configuration Bits window.  Under Window > PIC Memory Views >          */
/* Configuration Bits, a user controllable configuration bits window is       */
/* available to Generate Configuration Bits source code which the user can    */
/* paste into this project.                                                   */
/******************************************************************************/

/******************************************************************************/
/* Device Configuration                                                       */
/******************************************************************************/

//  DEVCFG3
//  USERID = No Setting
#pragma config FMIIEN = OFF             //  Ethernet RMII/MII Enable (RMII Enabled)
#pragma config FETHIO = ON              //  Ethernet I/O Pin Select (Default Ethernet I/O)
#pragma config PGL1WAY = ON             //  Permission Group Lock One Way Configuration (Allow only one reconfiguration)
#pragma config PMDL1WAY = ON            //  Peripheral Module Disable Configuration (Allow only one reconfiguration)
#pragma config IOL1WAY = ON             //  Peripheral Pin Select Configuration (Allow only one reconfiguration)
#pragma config FUSBIDIO = OFF           //  USB USBID Selection (Controlled by Port Function)

//  DEVCFG2
#pragma config FPLLIDIV = DIV_3          //  System PLL Input Divider (3x Divider)
#pragma config FPLLRNG  = RANGE_8_16_MHZ //  System PLL Input Range (8-16 MHz Input)
#pragma config FPLLICLK = PLL_POSC       //  System PLL Input Clock Selection (POSC is input to the System PLL)
#pragma config FPLLMULT = MUL_50         //  System PLL Multiplier (PLL Multiply by 50)
#pragma config FPLLODIV = DIV_2          //  System PLL Output Divider (divided by 2)
#pragma config UPLLFSEL = FREQ_24MHZ     //  USB PLL Input Frequency Selection (USB PLL input is 24 MHz)
#pragma config UPLLEN   = OFF            //  USB PLL Enable (USB PLL is disabled)

//  DEVCFG1
#pragma config FNOSC = SPLL             //  Oscillator Selection Bits (SPLL)
#pragma config FSOSCEN = OFF            //  Secondary Oscillator Enable (Disable SOSC)
#pragma config POSCMOD = EC             //  Primary Oscillator Configuration (External Clock mode)
#pragma config OSCIOFNC = ON            //  CLKO Output Signal Active on the OSCO Pin (Enabled)
#pragma config FCKSM = CSECME           //  Clock Switching and Monitor Selection (Clock Switch Enabled, FSCM Enabled)
#pragma config IESO = OFF               //  Internal/External Switch Over (Disabled)
#pragma config DMTINTV = WIN_127_128    //  DMT Count Window Interval (Window/Interval value is 127/128 counter value)
#pragma config WDTPS = PS1048576        //  Watchdog Timer Postscaler (1:1048576)
#pragma config WDTSPGM = STOP           //  Watchdog Timer Stop During Flash Programming (WDT stops during Flash programming)
#pragma config WINDIS = NORMAL          //  Watchdog Timer Window Mode (Watchdog Timer is in non-Window mode)
#pragma config FWDTEN = OFF             //  Watchdog Timer Enable (WDT Disabled)
#pragma config FWDTWINSZ = WINSZ_25     //  Watchdog Timer Window Size (Window size is 25%)
#pragma config FDMTEN = OFF             //  Deadman Timer Enable (Deadman Timer is disabled)
#pragma config DMTCNT = DMT31

//  DEVCFG0
#pragma config EJTAGBEN = NORMAL        //  Normal EJTAG Functionality
#pragma config DBGPER = PG_ALL          //  Allow CPU access to all permission groups in debug mode
#pragma config FSLEEP = OFF             //  Flash is not power-down during device sleep mode
#pragma config FECCCON = OFF_UNLOCKED   //  ECC enabled
#pragma config BOOTISA = MIPS32         //  MIPS32 ISA selected
#pragma config TRCEN = OFF              //  Trace function is OFF
#pragma config ICESEL = ICS_PGx2        //  2-wire debug is doen through PGx2 pins
#pragma config JTAGEN = OFF             //  JTAG pins disabled
#pragma config DEBUG = ON               //  Debug is ON

//  DEVCP0
#pragma config CP = OFF                 //  Code Protect (Protection Disabled)