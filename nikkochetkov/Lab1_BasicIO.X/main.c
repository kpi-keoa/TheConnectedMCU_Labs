#include "lab1.h"

void main(void){
	
	init(); //calling init() function, to initialize hardware
	
	// main program in an infinite loop, to sart over and over
	while (1) {
        buttons_read(); 
    }
}