#include "wolf3d.h"
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

/* Hardware specific includes. */
#include "ConfigPerformance.h"

void main()
{
	wolf3d_create();
	wolf3d_run();

	/* Configure the hardware for maximum performance. */
	vHardwareConfigurePerformance();

	/* Setup to use the external interrupt controller. */
	vHardwareUseMultiVectoredInterrupts();

	xTaskCreate(wolf3d_run, "Wolf3D", configMINIMAL_STACK_SIZE, NULL, 1, NULL);
    xTaskCreate(input_read, "Input read", configMINIMAL_STACK_SIZE, NULL, 2, NULL);
	vTaskStartScheduler();

	while(1);
}
