#include "lab1.h"


//INITIALIZATION

void init(void){
	
	//turning off analog mode for used ports
	LD1_ANSEL &= ~(1 << LD1);
	LD2_ANSEL &= ~(1 << LD2);
	LD3_ANSEL &= ~(1 << LD3);
	LD4_ANSEL &= ~(1 << LD4);
	BTN1_ANSEL &= ~(1 << BTN1);
	BTN2_ANSEL &= ~(1 << BTN2);
	
	//setting directions for each port
	
	//led ports to output (TRIS = 0)
	LD1_TRIS &= ~(1 << LD1);
	LD2_TRIS &= ~(1 << LD2);
	LD3_TRIS &= ~(1 << LD3);
	LD4_TRIS &= ~(1 << LD4);
	
	//button ports to input (TRIS = 1)
	BTN1_TRIS |= 1 << BTN1;
	BTN2_TRIS |= 1 << BTN2;
	
	//setting default conditions for leds (OFF = LAT=0)
	LD1_LAT &= ~(1 << LD1);
	LD2_LAT &= ~(1 << LD2);
	LD3_LAT &= ~(1 << LD3);
	LD4_LAT &= ~(1 << LD4);
}