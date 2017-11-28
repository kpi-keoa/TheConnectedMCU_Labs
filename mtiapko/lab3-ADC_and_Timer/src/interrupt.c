#include <xc.h>
#include "interrupt.h"

void interrupt_init()
{
	INTCONSET = _INTCON_MVEC_MASK;
}

void interrupt_set_state(enum interrupt_state_e state)
{
	if (state == INTERRUPT_ENABLE)
		__builtin_enable_interrupts();
	else
		__builtin_disable_interrupts();
}