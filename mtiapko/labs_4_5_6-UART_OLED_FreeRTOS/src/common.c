#include "common.h"
#include "FreeRTOS.h"
#include "task.h"

void prog_abort()
{
	//  go into the eternal cycle in unexpected situations
	while (1);
}

void vApplicationMallocFailedHook( void )
{
	/* vApplicationMallocFailedHook() will only be called if
	configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h.  It is a hook
	function that will get called if a call to pvPortMalloc() fails.
	pvPortMalloc() is called internally by the kernel whenever a task, queue,
	timer or semaphore is created.  It is also called by various parts of the
	demo application.  If heap_1.c or heap_2.c are used, then the size of the
	heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
	FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
	to query the size of free heap space that remains (although it does not
	provide information on how the remaining heap might be fragmented). */
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationIdleHook( void )
{
	/* vApplicationIdleHook() will only be called if configUSE_IDLE_HOOK is set
	to 1 in FreeRTOSConfig.h.  It will be called on each iteration of the idle
	task.  It is essential that code added to this hook function never attempts
	to block in any way (for example, call xQueueReceive() with a block time
	specified, or call vTaskDelay()).  If the application makes use of the
	vTaskDelete() API function (as this demo application does) then it is also
	important that vApplicationIdleHook() is permitted to return to its calling
	function, because it is the responsibility of the idle task to clean up
	memory allocated by the kernel to any task that has since been deleted. */
}
/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook( TaskHandle_t pxTask, char *pcTaskName )
{
	( void ) pcTaskName;
	( void ) pxTask;

	/* Run time task stack overflow checking is performed if
	configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook	function is
	called if a task stack overflow is detected.  Note the system/interrupt
	stack is not checked. */
	taskDISABLE_INTERRUPTS();
	for( ;; );
}
/*-----------------------------------------------------------*/

void vApplicationTickHook( void )
{
	/* This function will be called by each tick interrupt if
	configUSE_TICK_HOOK is set to 1 in FreeRTOSConfig.h.  User code can be
	added here, but the tick hook is called from an interrupt context, so
	code must not attempt to block, and only the interrupt safe FreeRTOS API
	functions can be used (those that end in FromISR()). */
}
/*-----------------------------------------------------------*/

void vAssertCalled( const char * pcFile, unsigned long ulLine )
{
volatile char *pcFileName;
volatile unsigned long ulLineNumber;

	/* Prevent things that are useful to view in the debugger from being
	optimised away. */
	pcFileName = ( char * ) pcFile;
	( void ) pcFileName;
	ulLineNumber = ulLine;

	/* Set ulLineNumber to 0 in the debugger to break out of this loop and
	return to the line that triggered the assert. */
	while( ulLineNumber != 0 )
	{
		__asm volatile( "NOP" );
		__asm volatile( "NOP" );
		__asm volatile( "NOP" );
		__asm volatile( "NOP" );
		__asm volatile( "NOP" );
	}
}
/*-----------------------------------------------------------*/

/* This function overrides the normal _weak_ generic handler. */
void _general_exception_handler(void)
{
static enum {
	EXCEP_IRQ = 0, 	/* interrupt */
	EXCEP_AdEL = 4, /* address error exception (load or ifetch) */
	EXCEP_AdES, 	/* address error exception (store) */
	EXCEP_IBE, 		/* bus error (ifetch) */
	EXCEP_DBE, 		/* bus error (load/store) */
	EXCEP_Sys, 		/* syscall */
	EXCEP_Bp, 		/* breakpoint */
	EXCEP_RI, 		/* reserved instruction */
	EXCEP_CpU, 		/* coprocessor unusable */
	EXCEP_Overflow,	/* arithmetic overflow */
	EXCEP_Trap, 	/* trap (possible divide by zero) */
	EXCEP_FPE = 15, /* floating point exception */
	EXCEP_IS1 = 16,	/* implementation specfic 1 */
	EXCEP_CEU, 		/* CorExtend Unuseable */
	EXCEP_C2E, 		/* coprocessor 2 */
	EXCEP_DSPDis = 26   /* DSP module disabled */
} _excep_code;

static unsigned long _epc_code;
static unsigned long _excep_addr;

	_excep_code = ( _epc_code & 0x0000007C ) >> 2;

    for( ;; )
	{
		/* prevent compiler warning */
		(void) _excep_code;

		/* Examine _excep_code to identify the type of exception.  Examine
		_excep_addr to find the address that caused the exception */
		Nop();
		Nop();
		Nop();
	}
}