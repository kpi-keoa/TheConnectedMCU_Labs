#include <xc.h>
#include <sys/attribs.h>
#include "timer.h"

static timer_callback_func_t timer_callback_func_g = (void*)0;

void timer_init()
{
    IPC2bits.T2IP = 3;  //  priority level 3
    IPC2bits.T2IS = 0;  //  subpriority level 0
    IFS0bits.T2IF = 0;  //  clear interrupt request flag
    IEC0bits.T2IE = 1;  //  enable timer interrupt

	TMR2 = 0;          //  current timer value
	T2CON = 0;         //  clear timer settings to defaults
	T2CONbits.ON = 1;  //  enable timer
}

void timer_set_period(uint32_t val)
{
	uint8_t divider = 0;

	while (val > (uint16_t)-1 && val < 7) {
		++divider;
		val >>= 1;
	}

	PR2 = (uint16_t)val;
	T2CONbits.TCKPS = divider;  //  divide clock by	divider
}

void timer_set_callback_func(timer_callback_func_t func)
{
	timer_callback_func_g = func;
}

static void __ISR(_TIMER_2_VECTOR, IPL3SOFT) timer_ISR()
{
	if (timer_callback_func_g != (void*)0)
		timer_callback_func_g();

    IFS0bits.T2IF = 0;  //  reset interrupt flag
}