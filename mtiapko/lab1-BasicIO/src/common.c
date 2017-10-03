#include "common.h"

void delay(uint32_t val)
{
	val *= 1000;
	while (val --> 0);
}

void prog_abort()
{
	//  go into the eternal cycle in unexpected situations
	while (1);
}