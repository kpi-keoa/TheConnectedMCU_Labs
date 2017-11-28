/******************************************************************************/
/*  Files to Include                                                          */
/******************************************************************************/
#ifdef __XC32
    #include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

/*!
 * \brief Array length calculator
 * 
 * Software realization of delay function, using empty for cycle
 * \param [in] x type of vars into array
 * \return array length
 */
#define NELEMS(x)  (sizeof(x) / sizeof((x)[0]))

#include <stdint.h>         /* For uint32_t definition                        */
#include <stdbool.h>        /* For true/false definition                      */
#include <time.h>
#include <stdlib.h>

#include "user.h"           /* User funct/params, such as InitApp             */
#include "UART.h"

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/

/*!
 * \brief Bulls and Cows game
 * 
 * the main program generate 4 random numbers, after that start to speak with 
 * player trough UART. Player enter 4 numbers too, if player trying to input 
 * NaN, programm tell him or her about error and number need to enter again.
 * After that programm checks if random array and player array has the same
 * numbers, count of cows will be increment, if this numbers has the same
 * indexes, count of cows will be increment
 */
int32_t main(void)
{
    InitApp();
    srand(time(NULL));
    int32_t random_mass[4];
    int32_t my_mass[4];
    int cows = 0, bulls = 0;
    int32_t i, j, num;
     // Enable transmitter
    U4STAbits.UTXEN = 1;
    UART4_puts ("Polling Test.. \n");
    UART4_puts ("Generating random numbers... \n");
    for(i = 0; i < NELEMS(random_mass); i++)
    {
        random_mass[i] = 0 + rand() % 9;
    }
    bool correct_char = false;
    UART4_puts ("Input your numbers from 0 to 9: \n");
    for (i = 0; i < NELEMS(my_mass); i++)
    {
        while (!correct_char)
        {
            char a = UART4_getc();
            if(a < '0' || a > '9')
            {
                UART4_puts("Wrong data. Enter a number please \n");
            }
            else
            {
                UART4_putc(a);
                num = a - 48;
                my_mass[i] = num;
                correct_char = true;
            }
        }
        correct_char = false;
    }
    UART4_puts ("\n");
    UART4_puts ("Calculating... \n");
    for (i = 0; i < NELEMS(random_mass); i++)
    {
        for (j = 0; j < NELEMS(random_mass); j++)
        {
            if(my_mass[j] == random_mass[i] && j != i)
            {
                cows++;
            }
            if (my_mass[j] == random_mass[i] && j == i)
            {
                bulls++;
            }
        }
    }
    
    char bulls_char [2];
    bulls_char[0] = bulls + 48;
    bulls_char[1] = '\0';
    
    char cows_char [2];
    cows_char[0] = cows + 48;
    cows_char[1] = '\0';
    
    UART4_puts("Congradulations! You have ");
    UART4_puts (bulls_char);
    UART4_puts (" bulls and ");
    UART4_puts (cows_char);
    UART4_puts (" cows\n");
    while(1)
    {}
}
