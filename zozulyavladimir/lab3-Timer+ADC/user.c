/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"            /* variables/params used by user.c               */
#include <sys/attribs.h>
#include "ADC.h"
#include <math.h>

int32_t capture_val;
int32_t tmr_val;
int32_t writeADC_flag;
/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/
void initTimer2AndIC3(void) {
    T2CON = 0; // clear timer settings to defaults
    T2CONbits.TCKPS = 7; // divide clock by 256 with prescaler
    TMR2 = 0;
    PR2 = 39062;
    
    IPC2bits.T2IP = 3;
    IPC2bits.T2IS = 0;
    IFS0bits.T2IF = 0;
    IEC0bits.T2IE = 1;
 
    IC3R = 4;
    // Configure IC3 control register
    IC3CONbits.C32 = 0;    // 16 bit mode
    IC3CONbits.FEDGE = 0;
    IC3CONbits.ICTMR = 1; // Select timer 2
    IC3CONbits.ICM = 3;
    IC3CONbits.ICI = 0;
    IC3CONbits.SIDL = 1;
    IC3CONbits.ON = 1;
     
    
    IPC4bits.IC3IP = 2;
    IPC4bits.IC3IS = 2;
    IFS0bits.IC3IF = 0;
    IEC0bits.IC3IE = 1;
    
}

void delay (int32_t n) {
    volatile int i;
    for (i = 0; i < n; i++) {
    }
}

uint32_t getADCpos(void) {
    uint32_t i = ReadPotentiometerWithADC();
    return ceil(i/256);
}

void initGPIO(void) {
    /* Setup functionality and port direction */
    // LED output
    // Disable analog mode
    ANSELGbits.ANSG6 = 0;
    ANSELBbits.ANSB11 = 0;
    ANSELGbits.ANSG15 = 0;
    ANSELEbits.ANSE4 = 0;
    // Set directions to output
    TRISGbits.TRISG6 = 0;
    TRISBbits.TRISB11 = 0;
    TRISGbits.TRISG15 = 0;
    TRISDbits.TRISD4 = 0;
    
    led_test();
    // Button inputs
    // Disable analog mode
    ANSELAbits.ANSA5 = 0;
    // Set directions to input
    TRISAbits.TRISA5 = 1;
    TRISAbits.TRISA4 = 1;
    TRISFbits.TRISF1 = 1;
    ////////////////
     // 3. Configure peripheral to generate interrupts
    // Enable change notification interrupt in CN
    CNENA |= (1 << 4) | (1 << 5);
    // 4. Configure Interrupt Controller
    // Enable change notification  interrupts
    IEC3 |= (1 << 22);
    // Set priority
    IPC29 |= (1 << 19); 
    IPC29 &= ~(1 << 18); 
    // Clear interrupt Flag
    IFS3 &=~(1 << 22);
    // 5. Set Interrupt Controller for multi-vector mode
    INTCONSET = _INTCON_MVEC_MASK;
    // 6. Globally enable interrupts
    __builtin_enable_interrupts();
    // 7. Enable peripheral
    CNCONA |= (1 << 15);
}

void __ISR(_CHANGE_NOTICE_A_VECTOR,IPL3SRS) ISR_PortA_Change(void){
    if(CNSTATAbits.CNSTATA5)//button has been changed
    {
        if(PORTAbits.RA5){//button pressed at the moment
            T2CONbits.ON = 1;   
            tmr_val = 1;
        }
    }else if(CNSTATAbits.CNSTATA4){
        if(PORTAbits.RA4){
            writeADC_flag = 1;
        }   
    }
    IFS3CLR = _IFS3_CNAIF_MASK;
    }

void __ISR(_INPUT_CAPTURE_3_VECTOR,IPL2SRS) Capture3(void){
    int32_t temp_buff = 0;
    if(PORTFbits.RF1){
    T2CONbits.ON = 0;//stop timer
    if((tmr_val > (capture_val-2)) && (tmr_val < (capture_val+2))){
        set_leds(0x1100b);
        tmr_val = 1;
    }
    else 
        set_leds(0x0011b);
    }
   
    temp_buff = IC3BUF;
    IFS0CLR = _IFS0_IC3IF_MASK;
    
}

void __ISR(_TIMER_2_VECTOR,IPL3SRS) ISR_Timer_2(void){
    static uint32_t leds = 1, time = 0;
    
    time += 1;
    if(time <= 5)
    tmr_val += 1;
    
    if(time <= 10){
        if(leds)
        set_leds(0x1111b);
        else
        set_leds(0x0000b);    
    leds = ~leds;
    }
    
    if(time = 10) time = 1;
    IFS0CLR = _IFS0_T2IF_MASK;
}

void led_test(void){
    int s;
    set_leds(0x0000b);
    for(s=0;s<4;s++){
        set_leds(0x1111b);
        delay(5000000);
        set_leds(0x1111b);
        delay(5000000);
    }
}

void set_leds(uint32_t leds)
{
   LD1_PORT_BIT = (leds & (1 << 0));
   LD2_PORT_BIT = (leds & (1 << 1));
   LD3_PORT_BIT = (leds & (1 << 2));
   LD4_PORT_BIT = (leds & (1 << 3));
}

void setADCpos(void){
    uint32_t tmp_val;
    tmp_val = getADCpos();
 
    if(writeADC_flag){
        capture_val = getADCpos();
        writeADC_flag = 0;
    }
    set_leds(tmp_val);
}