#include <stddef.h>

typedef unsigned char byte_t;

static byte_t       mem[50 * 1024];
static unsigned int mem_ptr = 0;

void vPortInitialiseFPSCR(size_t wtf)
{
	(void)wtf;
}

void* pvPortMalloc(size_t size)
{
	return mem + (mem_ptr += size);
}

void vPortFree(void* ptr)
{
	(void)ptr;
}