#include "pin.h"
#include "input.h"
#include "memset_zero.h"

extern input_t input_g;

FRESULT input_create(input_t* in)
{
	in->dx = 0;
	in->dy = 0;
	memset_zero(in->key, sizeof(in->key));

	return pin_init();
}

void input_read()
{
	input_g.dx  = pin_read(BTN_4_SHIELD_PIN) == HIGH_STATE ? -1 : 0;
	input_g.dx += pin_read(BTN_1_SHIELD_PIN) == HIGH_STATE ? +1 : 0;

	input_g.key[FORWARD_KEY]  = pin_read(BTN_3_SHIELD_PIN) == HIGH_STATE ? 1 : 0;
	input_g.key[BACKWARD_KEY] = pin_read(BTN_2_SHIELD_PIN) == HIGH_STATE ? 1 : 0;
}
