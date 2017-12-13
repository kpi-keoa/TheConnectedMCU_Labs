#include "uart.h"

/**
 *  \brief UART initialization
 *  
 *  Setting pins for UART usage and UART speed 
 */
void UART4_init (void)
{
    RPF8R = 2;  // PPS for U4RX from pin F2
    U4RXR = 11; // PPS for U4TX to pin F8
    
    U4STAbits.UTXEN = 1;   // enable transmit pin
    U4STAbits.URXEN = 1;   // enable receive pin
    U4BRG           = ((100 * 1000000) / (16 * 115200)) - 1;
    U4MODEbits.ON   = 1;   // enable UART
}

/**
 *  \brief Reading char from UART
 *  
 *  It waits until character received and returns it
 * 
 *  \return U4RXREG readed character
 */
char UART4_getc(void) {
    while (!U4STAbits.URXDA); // wait until character received
    return U4RXREG; // read character
}

/**
 *  \brief Sending char by UART
 *  
 *  It waits until transmit buffer not full and transmits char
 * 
 *  \param[in] c char to send
 */
void UART4_putc (char c)
{
    while (U4STAbits.UTXBF);  // wait until transmit buffer not full
    U4TXREG = c;  // transmit character
}

/**
 *  \brief Sending string by UART
 *  
 *  It sends chars from string while it's not end symbol
 * 
 *  \param[in] s pointer for string to send
 */
void UART4_puts (char *s)
{
    while (*s != '\0')
        UART4_putc (*s++);
}
