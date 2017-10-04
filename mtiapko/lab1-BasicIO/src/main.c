#include "pin.h"
#include "common.h"

void main()
{
	enum PIN_E current_led = LED_1_PIN;

	FCHECK(pin_init_all());
	FCHECK(pin_write(current_led, HIGH_STATE));

	while (1)
	{
		if (pin_read(BTN_1_PIN) == HIGH_STATE)
		{
			FCHECK(pin_write(current_led, LOW_STATE));

			if (current_led == LED_4_PIN)
				current_led = LED_1_PIN;
			else
				++current_led;

			FCHECK(pin_write(current_led, HIGH_STATE));
			delay(1000);
		}
	}
}
