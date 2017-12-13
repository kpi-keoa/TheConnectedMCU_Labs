#pragma once
#include <xc.h>

void UART4_init(void);
char UART4_getc(void);
void UART4_putc (char c);
void UART4_puts (char *s);