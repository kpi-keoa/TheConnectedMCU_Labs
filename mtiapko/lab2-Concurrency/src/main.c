#include "common.h"
#include "game.h"
#include "pin.h"

void main()
{
	FCHECK(pin_init_all());
	FCHECK(interrupt_init());

	while (1) {
		game_play();
	}
}
