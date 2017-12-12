/******************************************************************************/
/*  Files to Include                                                          */
/******************************************************************************/
#ifdef __XC32
    #include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>         /* For uint32_t definition                        */
#include <stdbool.h>        /* For true/false definition                      */
#include <time.h>

#include "user.h"           /* User funct/params, such as InitApp             */
#include "OLED.h"
#include "stdio.h"
#include <math.h>

/*!
 * \brief Array length calculator
 * 
 * Software realization of delay function, using empty for cycle
 * @param [in] x type of vars into array
 * @param [out] length of mass
 * \return array length
 */
#define NELEMS(x)  (sizeof(x) / sizeof((x)[0]))
/******************************************************************************/
/* Global Variable Declaration                                                */
/******************************************************************************/

/* i.e. uint32_t <variable_name>; */

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
    /* Initialize I/O 
     * and Peripherals
     * for application */
    InitApp();
    
    OledDvrInit();
    
    OledSetDrawColor(1);
    OledSetDrawMode(modOledSet);
    OledSetFillPattern(OledGetStdPattern(3));
    
    OledSetCursor(0,0);
    OledPutString("Bulls and Cows");
    OledSetCursor(0,1);
    OledPutString("GAME");
    int32_t random_mass[4];
    int32_t my_mass[4];
    int cows = 0, bulls = 0;
    int32_t i, j, num;
    for(i = 0; i < NELEMS(random_mass); i++)
    {
        random_mass[i] = 0 + rand() % 9;
    }
    OledClear();
    OledSetCursor(0,0);
    OledPutString("Generating random numbers...");
    for(i = 0; i < NELEMS(random_mass); i++)
    {
        random_mass[i] = 0 + rand() % 9;
    }
    OledClear();
    OledSetCursor(0,0);
    OledPutString("Input your numbers from 0 to 9:");
    for (i = 0; i < NELEMS(my_mass); i++)
    {
        my_mass[i] = SetNum();
        OledSetCursor(1, i);
        char num [2];
        num[0] = my_mass[i] + 48;
        num[1] = '\0';
        OledPutString(num);
    }
    OledClear();
    OledSetCursor(0,0);
    OledPutString("Calculating...");
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
    OledClear();
    char bulls_char [2];
    bulls_char[0] = bulls + 48;
    bulls_char[1] = '\0';
    
    char cows_char [2];
    cows_char[0] = cows + 48;
    cows_char[1] = '\0';
    OledSetCursor(0,0);
    OledPutString("Congradulations! You have");
    OledSetCursor(1,0);
    OledPutString(bulls + " bulls and");
    OledSetCursor(2,0);
    OledPutString(cows + "cows");
}
