// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#include <stdint.h>          /* For uint32_t definition                       */
#include <sys/attribs.h>

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

#include "user.h"            /* variables/params used by user.c               */
#include "OLED.h"
#include "OledChar.h"
#include "OledGrph.h"
#include "UART.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************


/******************************************************************************/
/* User Functions                                                             */

/******************************************************************************/

void InitGPIO(void) {
    // LED output
    // Disable analog mode for G6
    ANSELGbits.ANSG6 = 0;
    // Set direction to output for G6
    TRISGbits.TRISG6 = 0;

    // Initialize outputs for other LEDs
    ANSELBbits.ANSB11 = 0;
    ANSELGbits.ANSG15 = 0;

    TRISBbits.TRISB11 = 0;
    TRISGbits.TRISG15 = 0;
    TRISDbits.TRISD4 = 0;

    // Turn off LEDs for initialization
    LD1_PORT_BIT = 0;
    LD2_PORT_BIT = 0;
    LD3_PORT_BIT = 0;
    LD4_PORT_BIT = 0;

    // Initilalize input for BTN1
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set direction to input
    TRISAbits.TRISA5 = 1;

    // Initialize input for BTN2
    TRISAbits.TRISA4 = 1;
}

void InitBIOSGPIO(void) {
    /* Setup functionality and port direction */
    // LED outputs
    // Disable analog mode
    // Set directions to output
    TRISE = 0;
   
    // Test LEDs
    LATE = 0xff;        
    
    // Turn off LEDs for initialization
    LATE = 0;

    // Button inputs
    ANSELGbits.ANSG7 = 0;
    
    ANSELEbits.ANSE8 = 0;
    ANSELEbits.ANSE9 = 0;
    ANSELCbits.ANSC1 = 0;
    
    // Set directions to input
    TRISGbits.TRISG7 = 1;
    TRISDbits.TRISD5 = 1;
    TRISFbits.TRISF1 = 1;
    TRISAbits.TRISA2 = 1;  
    
    TRISEbits.TRISE8 = 1;
    TRISEbits.TRISE9 = 1;
    TRISAbits.TRISA14 = 1;
    TRISCbits.TRISC1 = 1;
}

void InitApp(void) {
    // Initialize peripherals
    InitGPIO();
    InitBIOSGPIO();
    
    OledHostInit();
    OledDspInit();
    OledDvrInit();
    
    // TODO: Add UART4 Initialization call here
    UART4_init();
}

void Task1(void * pvParameters) {
    int n=0; 
    char buff[20];
    
    while (1) {
        xSemaphoreTake(xMutexOLED, portMAX_DELAY);
        if (1 == BIOS_SW4_PORT_BIT) {
            sprintf(buff, "Chasik ", n++);
            // TODO: Take mutex here
            OledSetDrawColor (1);
            OledSetCursor(0,1);
            OledPutString(buff); 
        }
        else {
            sprintf (buff, "      " , n++);
            OledSetDrawColor (0);
            OledSetCursor(0,1);
            OledPutString(buff);
        }
        
        if (1 == BIOS_SW3_PORT_BIT) {
            sprintf(buff, "v radost'", n++);
            // TODO: Take mutex here
            OledSetDrawColor (1);
            OledSetCursor(7,1);
            OledPutString(buff); 
        }
        else {
            sprintf (buff, "         " , n++);
            OledSetDrawColor (0);
            OledSetCursor(7,1);
            OledPutString(buff);
        }
        
        if (1 == BIOS_SW2_PORT_BIT) {
            sprintf(buff, "chifir ", n++);
            // TODO: Take mutex here
            OledSetDrawColor (1);
            OledSetCursor(0,2);
            OledPutString(buff); 
        }
        else {
            sprintf (buff, "       " , n++);
            OledSetDrawColor (0);
            OledSetCursor(0,2);
            OledPutString(buff);
        }
        
        if (1 == BIOS_SW1_PORT_BIT) {
            sprintf(buff, "v sladost", n++);
            // TODO: Take mutex here
            OledSetDrawColor (1);
            OledSetCursor(7,2);
            OledPutString(buff); 
        }
        else {
            sprintf (buff, "         " , n++);
            OledSetDrawColor (0);
            OledSetCursor(7,2);
            OledPutString(buff);
        }
        
        xSemaphoreGive(xMutexOLED);
        vTaskDelay(10);     
    }
}

void Task2(void * pvParameters) {
    int n=0; 
    char buff[20];
   
    while (1) {
        // TODO: Add trigger code here   
        xSemaphoreTake(xMutexOLED, portMAX_DELAY);
        if (0 == BIOS_SW1_PORT_BIT & 0 == BIOS_SW2_PORT_BIT & 0 == BIOS_SW3_PORT_BIT & 0 == BIOS_SW4_PORT_BIT  ) {
            sprintf(buff, "Firmennaya", n++);
            // TODO: Take mutex here
            OledSetDrawColor (1);
            OledSetCursor(0,1);
            OledPutString(buff); 
        }
        else {
            sprintf (buff, "          " , n++);
            OledSetDrawColor (0);
            OledSetCursor(0,1);
            OledPutString(buff);
        }
        if (0 == BIOS_SW1_PORT_BIT & 0 == BIOS_SW2_PORT_BIT & 0 == BIOS_SW3_PORT_BIT & 0 == BIOS_SW4_PORT_BIT  ) {
            sprintf(buff, "Dvoechka", n++);
            // TODO: Take mutex here
            OledSetDrawColor (1);
            OledSetCursor(0,2);
            OledPutString(buff); 
        }
        else {
            sprintf (buff, "        " , n++);
            OledSetDrawColor (0);
            OledSetCursor(0,2);
            OledPutString(buff);
        }
            // TODO: Give mutex here
        xSemaphoreGive(xMutexOLED);
        vTaskDelay(10);
        
    }
}

// TODO: Define function ClockTask here

// TODO: Define SerialInTask here

void DelayMs(int t) {
    volatile long int count = t*33356;
    
    while (count--)
        ;
}