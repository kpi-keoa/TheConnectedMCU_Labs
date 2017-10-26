#include <xc.h>
#include "interrupt.h"

FSTATUS interrupt_init()
{
	//  configure peripheral to generate interrupts
	//  enable change notification interrupts in CN
	CNENAbits.CNIEA5 = 1;
	CNENAbits.CNIEA4 = 1;

	//  configure interrupt controller
	//  enable change notification interrupts
	IEC3bits.CNAIE = 1;

	//  set priority
	//  7 - highest
	//  0 - disable interrupts
	IPC29bits.CNAIP = 2;

	//  clear interrupt flag
	IFS3bits.CNAIF = 0;

	//  set multi-vector mode
	INTCONSET = _INTCON_MVEC_MASK;

	//  globally enable interrupts
	__builtin_enable_interrupts();

	//  enable peripheral
	CNCONAbits.ON = 1;

	return OK_FSTATUS;
}
