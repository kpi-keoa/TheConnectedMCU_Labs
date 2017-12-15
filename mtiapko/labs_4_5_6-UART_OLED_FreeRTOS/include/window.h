#ifndef __WINDOW_H__
#define __WINDOW_H__

#include "types.h"

#define WINDOW_WIDTH  128
#define WINDOW_HEIGHT 32

typedef uint8_t color_t;

typedef struct window_s
{
	uint32_t width;
	uint32_t height;
	color_t* data;
} window_t;

FRESULT window_create(window_t* wnd);
void    window_set_pixel(window_t* wnd, uint32_t x, uint32_t y);
void    window_clear(window_t* wnd);
void    window_draw(const window_t* wnd);

#endif
