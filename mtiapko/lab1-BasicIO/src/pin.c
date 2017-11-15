#include <xc.h>
#include "pin.h"

enum PIN_STATE_E pin_read(enum PIN_E pin)
{
	switch (pin)
	{
		case LED_1_PIN: return LATGbits.LATG6  ? HIGH_STATE : LOW_STATE;
		case LED_2_PIN: return LATDbits.LATD4  ? HIGH_STATE : LOW_STATE;
		case LED_3_PIN: return LATBbits.LATB11 ? HIGH_STATE : LOW_STATE;
		case LED_4_PIN: return LATGbits.LATG15 ? HIGH_STATE : LOW_STATE;
		case BTN_1_PIN: return PORTAbits.RA5   ? HIGH_STATE : LOW_STATE;
		case BTN_2_PIN: return PORTAbits.RA4   ? HIGH_STATE : LOW_STATE;
	}
	return LOW_STATE;
}

FSTATUS pin_write(enum PIN_E pin, enum PIN_STATE_E state)
{
	switch (pin)
	{
		case LED_1_PIN: LATGbits.LATG6  = state; break;
		case LED_2_PIN: LATDbits.LATD4  = state; break;
		case LED_3_PIN: LATBbits.LATB11 = state; break;
		case LED_4_PIN: LATGbits.LATG15 = state; break;
		default: return ERROR_FSTATUS;
	}
	return OK_FSTATUS;
}

FSTATUS pin_init_all()
{
	//  set output mode for LED_1
	ANSELGbits.ANSG6 = 0;  // disable analog mode
	TRISGbits.TRISG6 = 0;  // set direction to output
	LATGbits.LATG6 = 0;    // LED_1 off

	//  set output mode for LED_2
	TRISDbits.TRISD4 = 0;  // set direction to output
	LATDbits.LATD4 = 0;    // LED_2 off

	//  set output mode for LED_3
	ANSELBbits.ANSB11 = 0;  // disable analog mode
	TRISBbits.TRISB11 = 0;  // set direction to output
	LATBbits.LATB11 = 0;    // LED_3 off

	//  set output mode for LED_4
	ANSELGbits.ANSG15 = 0;  // disable analog mode
	TRISGbits.TRISG15 = 0;  // set direction to output
	LATGbits.LATG15 = 0;    // LED_4 off

	//  set input mode for BTN_1
	ANSELAbits.ANSA5 = 0;  // disable analog mode
	TRISAbits.TRISA5 = 1;  // set direction to input

	//  set input mode for BTN_2
	TRISAbits.TRISA4 = 1;  // set direction to input

	return OK_FSTATUS;
}
