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
 * Author: 
 * Comments:
 * Revision history: 
 */

// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

#include "game.h"
#include "UART.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************



// *****************************************************************************
// *****************************************************************************
// Section: User Functions
// *****************************************************************************
// *****************************************************************************

// Comment a function definition and leverage automatic documentation 
/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
 */
// TODO Insert function definitions (right here) to leverage live documentation

int Get_Guess(void) {
    char c;
    int n=0, done=0;
    
    while (1) {
        c = UART4_getc();
        UART4_putc(c);
        
        if ((c >= '0') && (c <= '9')) {
            n *= 10;
            n += c-'0';
        } else {
            if (c == '\r')
                return n;
            else
                return ILLEGAL_CHAR;
        }
    }
}

void GuessingGame(void) {
    int guess, number, guesses_left, won=0, num_won=0, num_lost=0;
    char buffer[80];
    
    UART4_puts("\r\nWelcome to the guessing game!\r\n");
    
    while (1) { // new game
        UART4_puts("\r\nI am thinking of an integer between 0 and 99.\r\n");
        number = 33; // PickANumber();
        won = 0;
        for (guesses_left=NUM_GUESSES; (guesses_left>0) && (!won); guesses_left--) {
            sprintf(buffer, "You have %d guesses left.\r\n", guesses_left);
            UART4_puts(buffer);
            UART4_puts("What is my number? Please type it and press enter.\r\n");
            guess = Get_Guess();
            UART4_puts("\r\n");
            if (guess == ILLEGAL_CHAR) {
                UART4_puts("That's not a number! You lost your guess.\r\n");
            } else {
                if (guess == number) {
                    UART4_puts("Congratulations! You guessed it!\r\n");
                    won = 1;
                } else if (guess < number) {
                    UART4_puts("Too low!\r\n");
                } else {
                    UART4_puts("Too high!\r\n");
                }
            }
        }
        if (won == 1) {
            num_won++;
        } else {
            sprintf(buffer, "My number was %d.\r\n", number);
            UART4_puts(buffer);
            num_lost++;
        }
        sprintf(buffer, "Won: %d\r\nLost: %d\r\n", num_won, num_lost);
        UART4_puts(buffer);
    }  
}