#ifndef __TIMER_H__
#define __TIMER_H__

#include "common.h"

typedef void (*timer_callback_func_t)(void);

void timer_init();
void timer_set_period(uint32_t val);
void timer_set_callback_func(timer_callback_func_t func);

#endif  //  __TIMER_H__