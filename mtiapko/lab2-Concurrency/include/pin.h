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

enum LED_ENABLE_E
{
	LED_1_ENABLE = 0b0001,
	LED_2_ENABLE = 0b0010,
	LED_3_ENABLE = 0b0100,
	LED_4_ENABLE = 0b1000,
};

enum PIN_STATE_E pin_read(enum PIN_E pin);
FSTATUS          pin_write(enum PIN_E pin, enum PIN_STATE_E state);
FSTATUS          pin_init_all();
void             pin_LEDs_enable(uint8_t leds);

#endif  //  !__PIN_H__
