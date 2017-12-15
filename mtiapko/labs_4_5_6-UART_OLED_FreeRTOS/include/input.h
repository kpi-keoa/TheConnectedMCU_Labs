#ifndef __INPUT_H__
#define __INPUT_H__

#include "types.h"
#include "window.h"

enum keyboard_key_e
{
	FORWARD_KEY  = 0,
	BACKWARD_KEY = 1
};

typedef struct input_s
{
	int32_t dx;
	int32_t dy;
	bool    key[2];
} input_t;

FRESULT input_create(input_t* in);
void    input_read();

#endif  //  !__INPUT_H__
