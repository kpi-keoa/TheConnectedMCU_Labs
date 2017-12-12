#include "print.h"
#include "window.h"
#include "memset_zero.h"
#include "OLED/OLED.h"

FRESULT window_create(window_t* wnd)
{
	wnd->width = WINDOW_WIDTH;
	wnd->height = WINDOW_HEIGHT;
	wnd->data = (color_t*)rgbOledBmp;

	OledHostInit();
    OledDspInit();

	return FUNC_OK;
}

void window_set_pixel(window_t* wnd, uint32_t x, uint32_t y)
{
	wnd->data[(y / 8) * wnd->width + x] &= ~(1 << (y & 0x7));
}

void window_clear(window_t* wnd)
{
	memset_zero(wnd->data, sizeof(rgbOledBmp));
}

void window_draw(const window_t* wnd)
{
	(void)wnd;
	OledUpdate();
}
