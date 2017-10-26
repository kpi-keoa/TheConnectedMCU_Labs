#include "common.h"

void delay(volatile uint32_t val)
{
	while (val --> 0);
}

void prog_abort()
{
	//  go into the eternal cycle in unexpected situations
	while (1);
}
