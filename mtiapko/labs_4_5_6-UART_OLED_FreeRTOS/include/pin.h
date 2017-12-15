#ifndef __PIN_H__
#define __PIN_H__

#include "common.h"

enum pin_e
{
	LED_1_PIN = 0,
	LED_2_PIN,
	LED_3_PIN,
	LED_4_PIN,

	BTN_1_PIN,
	BTN_2_PIN,

	BTN_1_SHIELD_PIN,
	BTN_2_SHIELD_PIN,
	BTN_3_SHIELD_PIN,
	BTN_4_SHIELD_PIN
};

enum pin_state_e
{
	LOW_STATE = 0,
	HIGH_STATE
};

enum led_enable_e
{
	LED_1_ENABLE = 0b0001,
	LED_2_ENABLE = 0b0010,
	LED_3_ENABLE = 0b0100,
	LED_4_ENABLE = 0b1000,
};

FSTATUS          pin_init();
FSTATUS          pin_write(enum pin_e pin, enum pin_state_e state);
void             pin_LEDs_enable(uint8_t leds);
enum pin_state_e pin_read(enum pin_e pin);

#endif  //  !__PIN_H__
