#include "UART.h"
#include "print.h"

FRESULT print_create()
{
	UART4_init();
	return FUNC_OK;
}

FRESULT print_message(const char* msg)
{
	UART4_puts(msg);
	return FUNC_OK;
}