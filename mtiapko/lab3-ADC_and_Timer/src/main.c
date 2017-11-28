#include <math.h>
#include "pin.h"
#include "ADC.h"
#include "PWM_SW.h"
#include "common.h"
#include "interrupt.h"

//  to duty cycle
#define TO_DC(x)  ((x + 1.0f) * 50.0f)
#define TO_RAD(x) (x * 3.1415926 / 180.0)

static uint8_t LED_1_func_id;
static uint8_t LED_2_func_id;
static uint8_t LED_3_func_id;
static uint8_t LED_4_func_id;
static uint8_t loop_func_id;

void LED_1_PWM_SW_callback_func(enum PWM_SW_output_state_e state)
{
	pin_write(LED_1_PIN, (state == PWM_SW_OUTPUT_HIGH
		? HIGH_STATE
		: LOW_STATE));
}

void LED_2_PWM_SW_callback_func(enum PWM_SW_output_state_e state)
{
	pin_write(LED_2_PIN, (state == PWM_SW_OUTPUT_HIGH
		? HIGH_STATE
		: LOW_STATE));
}

void LED_3_PWM_SW_callback_func(enum PWM_SW_output_state_e state)
{
	pin_write(LED_3_PIN, (state == PWM_SW_OUTPUT_HIGH
		? HIGH_STATE
		: LOW_STATE));
}

void LED_4_PWM_SW_callback_func(enum PWM_SW_output_state_e state)
{
	pin_write(LED_4_PIN, (state == PWM_SW_OUTPUT_HIGH
		? HIGH_STATE
		: LOW_STATE));
}

void loop_PWM_SW_callback_func(enum PWM_SW_output_state_e state)
{
	static uint32_t counter = 0;

	(void)state;
	++counter;

	PWM_SW_set_duty_cycle(LED_1_func_id, TO_DC(sinf(TO_RAD(counter + 0))));
	PWM_SW_set_duty_cycle(LED_2_func_id, TO_DC(sinf(TO_RAD(counter + 45))));
	PWM_SW_set_duty_cycle(LED_3_func_id, TO_DC(sinf(TO_RAD(counter + 90))));
	PWM_SW_set_duty_cycle(LED_4_func_id, TO_DC(sinf(TO_RAD(counter + 135))));
}

void update_PWM_SW_callback_func(enum PWM_SW_output_state_e state)
{
	(void)state;

	PWM_SW_set_period(loop_func_id, (ADC_read(ADC_POTENTIOMETER_PIN)
		/ 4096.0f) * 100000.0f);
}

void main()
{
	pin_init();
	ADC_init();
	PWM_SW_init();

	//  update period never change, ignore id
	PWM_SW_add_output((void*)0,       1000, 50, update_PWM_SW_callback_func);
	PWM_SW_add_output(&loop_func_id,  1000, 50, loop_PWM_SW_callback_func);
	PWM_SW_add_output(&LED_1_func_id, 10,   50, LED_1_PWM_SW_callback_func);
	PWM_SW_add_output(&LED_2_func_id, 10,   50, LED_2_PWM_SW_callback_func);
	PWM_SW_add_output(&LED_3_func_id, 10,   50, LED_3_PWM_SW_callback_func);
	PWM_SW_add_output(&LED_4_func_id, 10,   50, LED_4_PWM_SW_callback_func);

	interrupt_init();
	interrupt_set_state(INTERRUPT_ENABLE);

	while (1);
}