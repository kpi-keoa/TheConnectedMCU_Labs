#ifndef __PWM_SW_H__
#define __PWM_SW_H__

#include "common.h"

#define PWM_SW_MAX_OUTPUTS  6
#define PWM_SW_TIMER_PERIOD 2

enum PWM_SW_output_state_e
{
	PWM_SW_OUTPUT_LOW = 0,
	PWM_SW_OUTPUT_HIGH
};

typedef void (*PWM_SW_callback_func_t)(enum PWM_SW_output_state_e state);

struct PWM_SW_output_data_s
{
	enum PWM_SW_output_state_e state;
	PWM_SW_callback_func_t     func;

	uint32_t curr_val;
	uint32_t off_val;
	uint32_t period;
	uint8_t  duty_cycle;
};

void    PWM_SW_init();
FSTATUS PWM_SW_add_output(uint8_t* id, uint32_t period,
	uint8_t duty_cycle, PWM_SW_callback_func_t func);
void    PWM_SW_set_period(uint8_t id, uint32_t val);
void    PWM_SW_set_duty_cycle(uint8_t id, uint8_t val);

#endif  //  !__PWM_SW_H__