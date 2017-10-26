#include <sys/attribs.h>
#include <xc.h>
#include "common.h"
#include "pin.h"
#include "game.h"

volatile int position_g;  //  midpoint of the rope

//  BTN1 and BTN2 press interrupt handler
void  __ISR(_CHANGE_NOTICE_A_VECTOR, IPL2SOFT) game_interrupt_input(void)
{
	//  if BTN1 is pressed - move rope to left
	if (CNSTATAbits.CNSTATA5 == 1 && pin_read(BTN_1_PIN) == HIGH_STATE) {
			delay(500000);
			if (pin_read(BTN_1_PIN) == HIGH_STATE)
				position_g--;
	}

	//  if BTN2 is pressed - move rope to right
	if (CNSTATAbits.CNSTATA4 == 1 && pin_read(BTN_2_PIN) == HIGH_STATE) {
			delay(500000);
			if (pin_read(BTN_2_PIN) == HIGH_STATE)
				position_g++;
	}

	//  reset interrupt flag
	IFS3bits.CNAIF = 0;
}

void game_win(enum TEAM_E team)
{
	uint32_t i;
	uint32_t j;

	if (team == RIGHT_TEAM) {
		for (i = 0; i < 3; ++i) {  //  run leds 3 times
			j = 0;
			while (j < 5) {
				pin_LEDs_enable(1 << (j++));
				delay(3000000);
			}
		}
	} else {
		for (i = 0; i < 3; ++i) {  //  run leds 3 times
			j = 5;
			while (j --> 0) {
				pin_LEDs_enable(1 << j);
				delay(3000000);
			}
		}
	}
}

void game_play()
{
	position_g = 0;  //  initial position

	//  play until someone wins
	while (1) {
		switch (position_g) {
			case -3: pin_LEDs_enable(LED_1_ENABLE);                break;
			case -2: pin_LEDs_enable(LED_1_ENABLE | LED_2_ENABLE); break;
			case -1: pin_LEDs_enable(LED_2_ENABLE);                break;
			case 0:  pin_LEDs_enable(LED_2_ENABLE | LED_3_ENABLE); break;
			case 1:  pin_LEDs_enable(LED_3_ENABLE);                break;
			case 2:  pin_LEDs_enable(LED_3_ENABLE | LED_4_ENABLE); break;
			case 3:  pin_LEDs_enable(LED_4_ENABLE);                break;
			default:
				game_win(position_g > 3 ? LEFT_TEAM : RIGHT_TEAM);
				return;
		}
	}
}
