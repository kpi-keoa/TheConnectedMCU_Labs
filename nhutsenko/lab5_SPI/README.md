# Laboratory work 5 basic SPI.
## Bulls and Cows game

Bulls and Cows (also known as Cows and Bulls or Pigs and Bulls or Bulls and Cleots) is an old code-breaking mind or paper and pencil game for two or more players, predating the commercially marketed board game Mastermind.

This program implements the game bulls and cows. The first step generates an array of 4 random numbers from 1 to 9. Then, using the SPI and GPIO, the program asks the user to enter 4 numbers. If both arrays have matching numbers, then the number of cows is equal to the number of matches. If the ordinal numbers of the numbers coincide, then the number of coincidences is equal to the number of bulls. The program is implemented for controllers PIK32MZ2048EFG100 and PIK32MZ2048ECG100