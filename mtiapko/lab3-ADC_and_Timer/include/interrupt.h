#ifndef __INTERRUPT_H__
#define __INTERRUPT_H__

enum interrupt_state_e
{
	INTERRUPT_ENABLE = 0,
	INTERRUPT_DISABLE
};

void interrupt_init();
void interrupt_set_state(enum interrupt_state_e state);

#endif  //  !__INTERRUPT_H__