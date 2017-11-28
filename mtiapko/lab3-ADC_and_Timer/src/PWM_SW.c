#include "pin.h"
#include "timer.h"
#include "PWM_SW.h"

static struct PWM_SW_output_data_s PWM_SW_data[PWM_SW_MAX_OUTPUTS];
static uint8_t PWM_SW_count = 0;

static void PWM_SW_timer_callback_func()
{
	for (uint8_t i = 0; i < PWM_SW_count; ++i) {
		if (!PWM_SW_data[i].period)
			continue;

		if (PWM_SW_data[i].curr_val >= PWM_SW_data[i].period) {
			if (PWM_SW_data[i].off_val != 0) {
				PWM_SW_data[i].state = PWM_SW_OUTPUT_HIGH;
				PWM_SW_data[i].func(PWM_SW_OUTPUT_HIGH);
			}

			PWM_SW_data[i].curr_val = 0;
			continue;
		} else if (PWM_SW_data[i].curr_val == PWM_SW_data[i].off_val
			&& PWM_SW_data[i].state != PWM_SW_OUTPUT_LOW) {
			PWM_SW_data[i].state = PWM_SW_OUTPUT_LOW;
			PWM_SW_data[i].func(PWM_SW_OUTPUT_LOW);
		}

		++PWM_SW_data[i].curr_val;
	}
}

void PWM_SW_init()
{
	timer_init();
	timer_set_period(PWM_SW_TIMER_PERIOD);
	timer_set_callback_func(PWM_SW_timer_callback_func);
}

FSTATUS PWM_SW_add_output(uint8_t* id, uint32_t period, uint8_t duty_cycle,
	PWM_SW_callback_func_t func)
{
	uint8_t curr = PWM_SW_count;

	if (curr == PWM_SW_MAX_OUTPUTS
		|| func == (void*)0
		|| duty_cycle > 100)
		return ERROR_FSTATUS;

	PWM_SW_data[curr].state = PWM_SW_OUTPUT_HIGH;
	PWM_SW_data[curr].func = func;
	PWM_SW_data[curr].curr_val = 0;
	PWM_SW_data[curr].off_val = period * (duty_cycle / 100.0f);
	PWM_SW_data[curr].period = period;
	PWM_SW_data[curr].duty_cycle = duty_cycle;

	if (id != (void*)0)
		*id = curr;

	++PWM_SW_count;
	return OK_FSTATUS;
}

void PWM_SW_set_period(uint8_t id, uint32_t val)
{
	if (id < PWM_SW_count) {
		PWM_SW_data[id].off_val = val * (PWM_SW_data[id].duty_cycle / 100.0f);
		PWM_SW_data[id].period = val;
	}
}

void PWM_SW_set_duty_cycle(uint8_t id, uint8_t val)
{
	if (id < PWM_SW_count) {
		PWM_SW_data[id].off_val = PWM_SW_data[id].period * (val / 100.0f);
		PWM_SW_data[id].duty_cycle = val;
	}
}