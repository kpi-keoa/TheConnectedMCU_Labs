/* Microchip Technology Inc. and its subsidiaries.  You may use this software 
 * and any derivatives exclusively with Microchip products. 
 * 
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".  NO WARRANTIES, WHETHER 
 * EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED 
 * WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A 
 * PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION 
 * WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION. 
 *
 * IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
 * INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
 * WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS 
 * BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE 
 * FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS 
 * IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF 
 * ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE 
 * TERMS. 
 */

/*******************************************************************************
  This source file has NOT been generated by the MHC
 *******************************************************************************/

/* 
 * File:   
 * Author: Based on main.c by Yuri Panchul 
 * Comments: Modified by Alex Dean
 * Revision history: 
 */

#include "UART.h"

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
