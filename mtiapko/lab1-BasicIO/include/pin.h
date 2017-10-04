#ifndef __PIN_H__
#define __PIN_H__

#include "common.h"

enum PIN_E
{
	LED_1_PIN = 0,
	LED_2_PIN,
	LED_3_PIN,
	LED_4_PIN,

	BTN_1_PIN,
	BTN_2_PIN
};

enum PIN_STATE_E
{
	LOW_STATE = 0,
	HIGH_STATE
};

enum PIN_STATE_E pin_read(enum PIN_E pin);
FSTATUS          pin_write(enum PIN_E pin, enum PIN_STATE_E state);
FSTATUS          pin_init_all();

#endif  //  !__PIN_H__
