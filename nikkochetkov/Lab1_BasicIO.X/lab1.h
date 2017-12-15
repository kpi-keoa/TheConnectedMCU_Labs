
#ifndef _LAB1_H     
#define _LAB1_H

#include <p32xxxx.h>         // Defines system registers
#include <stdint.h>          // For uint32_t definition 


//defining bits of each used led and button
#define LD1		6   //led 1 pin
#define LD2		4   //led 2 pin
#define LD3		11  //led 3 pin
#define LD4		15  //led 4 pin
#define BTN1    5   //button 1 pin
#define BTN2	4   //button 2 pin


//defining ANSELx for turning off analog mode for ports 
#define LD1_ANSEL	 ANSELG
#define LD2_ANSEL	 ANSELD
#define LD3_ANSEL	 ANSELB
#define LD4_ANSEL	 ANSELG
#define BTN1_ANSEL	 ANSELA
#define BTN2_ANSEL	 ANSELA


//defining TRISx to select I/O mode of every port 
#define LD1_TRIS	TRISG
#define LD2_TRIS 	TRISD
#define LD3_TRIS	TRISB
#define LD4_TRIS 	TRISG
#define BTN1_TRIS	TRISA
#define BTN2_TRIS 	TRISA


//defining LATx for leds to write a value to them
#define LD1_LAT 	LATG
#define LD2_LAT 	LATD
#define LD3_LAT 	LATB
#define LD4_LAT 	LATG


//defining PORTx for buttons to read values from buttons
#define BTN1_PORT 	PORTA
#define BTN2_PORT 	PORTA

//making macros for easier buttons read
//shifting button bits for easier use than
#define BTN1_READ ((BTN1_PORT >> BTN1) & 1)
#define BTN2_READ ((BTN2_PORT >> BTN2) & 1)


//defining some constants that will be used
#define DEBOUNCE		3000000 // delay to avoid button debounce
#define DELAY 			1000000 
#define DELAY_BLOW      4000000 


//function prototypes

//initialization of hardware that will be used
void init(void);

//function that we use to check buttons state, and reply on each of it
void buttons_read(void);

//function for every delay we're making, includes a loop with loadable counter
void delay(volatile uint32_t n); 

//function to randomize the value for the game
int random(void);

//function that visualizes waiting for your turn process 
void wait(void);

//function that visualizes defused bomb (succses)
void blink(void);

//function that visualizes blow (failure)
void blow(void);

//function called when you won the game
void win(void);

//function called when you lost the game 
void lose(void);

//visualiztion of drumroll process on leds, after you press the button
void drum(void);


#endif