#include "lab1.h"
#include <stdlib.h>

//loop for simulating delay
void delay(volatile uint32_t n) 
{
    for (; n > 0; n--);
}


// function that gives random value from 0 to 1
int random(void)
{
	int rand_n;
	
	rand_n = rand() %2;
	return rand_n;
}

// visualization of waiting process
// turning all leds by rotation
// this process continues till the button is pressed
void wait(void)
{
    
// expression " LDx_LAT | = 1 << LDx "- writes 1 to LEDx bit (turning it on)
	LD1_LAT |= 1 << LD1;
    
	delay(DELAY);
// exprssion " LDx_LAT &= ~( 1 << LDx ) "- writes 0 to LEDx bit (turning it off)	
    LD1_LAT &= ~(1 << LD1);
	LD2_LAT |= 1 << LD2;
	
    delay(DELAY);
	
    LD2_LAT &= ~(1 << LD2);
	LD3_LAT |= 1 << LD3;
	
    delay(DELAY);
	
    LD3_LAT &= ~(1 << LD3);
	LD4_LAT |= 1 << LD4;

	delay(DELAY);
	delay(DELAY);
	
	LD4_LAT &= ~(1 << LD4);
	LD3_LAT |= 1 << LD3;
	
    delay(DELAY);
	
    LD3_LAT &= ~(1 << LD3);
	LD2_LAT |= 1 << LD2;
	
    delay(DELAY);
	
    LD2_LAT &= ~(1 << LD2);
	LD1_LAT |= 1 << LD1;
	
    delay(DELAY);
	
    LD1_LAT &= ~(1 << LD1);
}


// this function makes the drumroll effect, after you've pressed the button
void drum(void){
	LD1_LAT |= 1 << LD1;
	
    delay(DELAY_BLOW);
	
    LD1_LAT &= ~(1 << LD1);
	LD2_LAT |= 1 << LD2;
	
    delay(DELAY_BLOW);
	
    LD2_LAT &= ~(1 << LD2);
	LD3_LAT |= 1 << LD3;
	
    delay(DELAY_BLOW);
	
    LD3_LAT &= ~(1 << LD3);
	LD4_LAT |= 1 << LD4;

	delay(DELAY_BLOW);
	delay(DELAY_BLOW);
	
	LD4_LAT &= ~(1 << LD4);
	LD3_LAT |= 1 << LD3;
	
    delay(DELAY_BLOW);
	
    LD3_LAT &= ~(1 << LD3);
	LD2_LAT |= 1 << LD2;
	
    delay(DELAY_BLOW);
	
    LD2_LAT &= ~(1 << LD2);
	LD1_LAT |= 1 << LD1;
	
    delay(DELAY_BLOW);
	
    LD1_LAT &= ~(1 << LD1);
}


// visualisation of succsesfull bomd defusing
void blink(void){
	LD1_LAT |= 1 << LD1;
	LD2_LAT |= 1 << LD2;
	LD3_LAT |= 1 << LD3;
	LD4_LAT |= 1 << LD4;
	
    delay(DELAY_BLOW);
	
    LD1_LAT &= ~(1 << LD1);
	LD2_LAT &= ~(1 << LD2);	
	LD3_LAT &= ~(1 << LD3);	
	LD4_LAT &= ~(1 << LD4);	
	
    delay(DELAY_BLOW);
}


// visualisation of bombs explosion if ou choose incorrect button
void blow(void){
	LD2_LAT |= 1 << LD2;
	LD3_LAT |= 1 << LD3;
	
    delay(DELAY_BLOW);
	
    LD2_LAT &= ~(1 << LD2);
	LD3_LAT &= ~(1 << LD3);
	LD1_LAT |= 1 << LD1;
	LD4_LAT |= 1 << LD4;
	
    delay(DELAY_BLOW);
	
    LD1_LAT &= ~(1 << LD1);
	LD4_LAT &= ~(1 << LD4);
	
    delay(DELAY_BLOW);
}
	
	
	
// this will happen if you "cut the right wire"
// this function takes place if the button you've chosen is correct
void win(void){
	uint8_t i;
	for (i = 0; i < 2; i++) {
		drum();
	}
	for (i = 0; i < 8; i++) {
		blink();
	}
}
	
// this will happen if you "cut wrong wire"
// this happens if chosen button is incorrect
void lose(void){
	uint8_t i;
	for (i = 0; i < 2; i++) {
		drum();
	}
	for (i = 0; i < 8; i++) {
		blow();
	}
}	
	
	


//checking if buttons are pressed
void buttons_read(void){
	
    
//    if non of the buttons are pressed, program will be waiting 
	if(!BTN1_READ && !BTN2_READ){
		wait();
	}
	
	
//	if BTN1 pressed, check if lose or win
	if(BTN1_READ && !BTN2_READ){
		delay(DEBOUNCE);
		if (random()){
			win();
		}
		else{
			lose();
		}
	}
	
//	if BTN2 pressed, check if lose or win
	if(!BTN1_READ && BTN2_READ){
		delay(DEBOUNCE);
		if (random()){
			win();
		}
		else{
			lose();
		}
	}
//	if both are pressed it will blow!
	if(BTN1_READ && BTN2_READ){
		delay(DEBOUNCE);
		blow();
		
	}
	

}
	