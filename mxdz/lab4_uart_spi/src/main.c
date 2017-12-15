#include "scrolling_text.h"   
#include "OLED/OLED.h"
#include <string.h>

/*!
     * \brief this is where the magic happens
*/      
void main(void) 
{
    init_app();
    UART4_puts("Hello!\r\n");
    uint8_t displayed_str[16] = "";
   
    while (1) {
        if (BTN_4_SCHLD) {
            cur_state_g = PAUSE;
        }
        if (BTN_3_SCHLD) {
            delay_g += 100; 
        }
        if (BTN_2_SCHLD) {
            delay_g -= 100; 
        }
        if (cur_state_g == START) {    
            for (int i = 0; i < 16; i++) {
                displayed_str[i] = msg_g[i];
            }
            while (strlen(displayed_str) < 16) {
                strcat(displayed_str, " ");
            }
            OledSetCursor(0,1);
            OledPutString(displayed_str);
            DelayMs(delay_g);
            shift_str(displayed_str);
        } else if (cur_state_g == PAUSE) {
            OledSetCursor(0,1);
            OledPutString("new string input");
            for (uint32_t i = 0; i < strlen(msg_g); i++) {
                msg_g[i] = " ";
            }
            UART4_puts("input new string\r\n");
            uint8_t input_ch, i=0;
            while(input_ch!='\n') {
                input_ch = UART4_getc();
                if (input_ch!='\n') {
                    UART4_putc (input_ch);
                    UART4_puts("\r\n"); 
                    msg_g[i] = input_ch;
                    i++;
                } 
            }
            UART4_puts("\r\n\n");
            cur_state_g == START;
        }
    }
}

