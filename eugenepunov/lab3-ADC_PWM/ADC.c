/*!
* \file Analog to digital converter                                                                  
*/
/* 
 *
 * Copyright (c) 2015, Digilent <www.digilentinc.com>
 * Contact Digilent for the latest version.
 *
 * This program is free software; distributed under the terms of 
 * BSD 3-clause license ("Revised BSD License", "New BSD License", or "Modified BSD License")
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1.    Redistributions of source code must retain the above copyright notice, this
 *        list of conditions and the following disclaimer.
 * 2.    Redistributions in binary form must reproduce the above copyright notice,
 *        this list of conditions and the following disclaimer in the documentation
 *        and/or other materials provided with the distribution.
 * 3.    Neither the name(s) of the above-listed copyright holder(s) nor the names
 *        of its contributors may be used to endorse or promote products derived
 *        from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/************************************************************************/
/*  Module Description:                                                 */
/*                                                                      */
/*      Implements the WiFIRE EF ADC                                    */
/*                                                                      */
/************************************************************************/
/*  Revision History:                                                   */
/*                                                                      */
/*      6/8/2011(KeithV): Created                                     */
/*      1/8/2016(Alex Dean): Modified to support EC and EF ADCs using preprocessor for code selection */
/************************************************************************/

/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#ifdef __XC32
#include <xc.h>          /* Defines special function registers, CP0 regs  */
#endif

#include <stdint.h>          /* For uint32_t definition                       */
#include <stdbool.h>         /* For true/false definition                     */
#include "user.h"

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

void init_wifire_adc(void) {
#if defined(__32MZ2048ECG100__)    
    /* Configure AD1CON1 */
    AD1CON1 = 0; // No AD1CON1 features are enabled including: Stop-in-Idle, early
    // interrupt, filter delay Fractional mode and scan trigger source.

    /* Configure AD1CON2 */
    AD1CON2 = 0; // Boost, Low-power mode off, SAMC set to min, set up the ADC Clock
    AD1CON2bits.ADCSEL = 1; // 1 = SYSCLK, 2 REFCLK03, 3 FRC
    AD1CON2bits.ADCDIV = 10; // DIV_20 TQ = 1/200 MHz; Tad = 10 * (TQ * 2) = 100 ns; 10 MHz ADC clock; the sweet spot
    AD1CON2bits.SAMC = 75; // settling time is 76 TADs  ((samc +1) + 4) * TAD <= 8000    (125Kbps is max, time 1/125000 = 8000 ns) => ((75  + 1) + 4) * 100 ns = 8000

    /* Configure AD1CON3 */
    AD1CON3 = 0; // ADINSEL is not configured for this example. VREFSEL of ?0?
    // selects AVDD and AVSS as the voltage reference.

    // AD1CON3bits.VREFSEL = 0b011; // set external VRef+/-

    /* Configure AD1GIRGENx */
    AD1GIRQEN1 = 0; // No global interrupts are used.
    AD1GIRQEN2 = 0;

    /* Configure AD1CSSx */
    AD1CSS1 = 0; // No channel scanning is used.
    AD1CSS2 = 0;

    /* Configure AD1CMPCONx */
    AD1CMPCON1 = 0; // No digital comparators are used. Setting the AD1CMPCONx
    AD1CMPCON2 = 0; // register to ?0? ensures that the comparator is disabled. Other
    AD1CMPCON3 = 0; // registers are ?don?t care?.
    AD1CMPCON4 = 0;
    AD1CMPCON5 = 0;
    AD1CMPCON6 = 0;

    /* Configure AD1FLTRx */
    AD1FLTR1 = 0; // No oversampling filters are used.
    AD1FLTR2 = 0;
    AD1FLTR3 = 0;
    AD1FLTR4 = 0;
    AD1FLTR5 = 0;
    AD1FLTR6 = 0;

    /* Set up the trigger sources */
    AD1TRG1 = 0; // Initialize all sources to no trigger.
    AD1TRG2 = 0;
    AD1TRG3 = 0;

    /* Set up the CAL registers */
    // AD1CAL1 = DEVADC1;          // Copy the configuration data to the
    // AD1CAL2 = DEVADC2;          // AD1CALx special function registers.
    // AD1CAL3 = DEVADC3;
    // AD1CAL4 = DEVADC4;
    // AD1CAL5 = DEVADC5;

    // comply to the errata
    AD1CAL1 = 0xF8894530;
    AD1CAL2 = 0x01E4AF69;
    AD1CAL3 = 0x0FBBBBB8;
    AD1CAL4 = 0x000004AC;
    AD1CAL5 = 0x02000002;

    /* Turn the ADC on, start calibration */
    AD1IMODbits.SH0MOD = 2; // put in differiential mode for self calibration
    AD1IMODbits.SH1MOD = 2; // put in differiential mode for self calibration
    AD1IMODbits.SH2MOD = 2; // put in differiential mode for self calibration
    AD1IMODbits.SH3MOD = 2; // put in differiential mode for self calibration
    AD1IMODbits.SH4MOD = 2; // put in differiential mode for self calibration
    AD1IMODbits.SH5MOD = 2; // put in differiential mode for self calibration
    AD1CON1bits.ADCEN = 1; // enable, start calibration
    while (AD1CON2bits.ADCRDY == 0); // wait for calibration to complete
    AD1IMODbits.SH0MOD = 0; // put in unipolar encoding
    AD1IMODbits.SH1MOD = 0; // put in unipolar encoding
    AD1IMODbits.SH2MOD = 0; // put in unipolar encoding
    AD1IMODbits.SH3MOD = 0; // put in unipolar encoding
    AD1IMODbits.SH4MOD = 0; // put in unipolar encoding
    AD1IMODbits.SH5MOD = 0; // put in unipolar encoding
#elif defined(__32MZ2048EFG100__)  
    // initialize configuration registers
    ADCCON1 = ADCCON2 = ADCCON3 = ADCANCON = 0;
    // resolution 0 - 6bits, 1 - 8bits, 2 - 10bits, 3 - 12bits
    ADCCON1bits.SELRES = 3; // shared ADC, 12 bits resolution (bits+2 TADs, 12bit resolution = 14 TAD).
    // 0 - no trigger, 1 - clearing software trigger, 2 - not clearing software trigger, the rest see datasheet
    ADCCON1bits.STRGSRC = 1; //Global software trigger / self clearing.
    // 0 - internal 3.3, 1 - use external VRef+, 2 - use external VRef-
    ADCCON3bits.VREFSEL = 0; // use internal 3.3 reference
    // set up the TQ and TAD and S&H times
    // TCLK: 00- pbClk3, 01 - SysClk, 10 - External Clk3, 11 - interal 8 MHz clk
    ADCCON3bits.ADCSEL = 0b01; // TCLK clk == Sys Clock == F_CPU  
    // Global ADC TQ Clock: Global ADC prescaler 0 - 63; Divide by (CONCLKDIV*2) However, the value 0 means divide by 1
    ADCCON3bits.CONCLKDIV = 0; // Divide by 1 == TCLK == SYSCLK == F_CPU
    ADCCON2bits.ADCDIV = 8;
    ADCCON2bits.SAMC = 10;
    // the warm up count is 2^^X where X = 0 -15
    ADCANCONbits.WKUPCLKCNT = 9; // Wakeup exponent = 2^^15 * TADx   
    /* Configure ADCIRQENx */
    ADCCMPEN1 = ADCCMPEN2 = 0; // No interrupts are used
    /* Configure ADCCSSx */
    ADCCSS1 = ADCCSS2 = 0; // No scanning is used
    /* Configure ADCCMPxCON */
    ADCCMP1 = ADCCMP2 = ADCCMP3 = 0; // No digital comparators are used. Setting the ADCCMPxCON
    ADCCMP4 = ADCCMP5 = ADCCMP6 = 0; // register to '0' ensures that the comparator is disabled.
    /* Configure ADCFLTRx */
    ADCFLTR1 = ADCFLTR2 = ADCFLTR3 = 0; // Clear all bits
    ADCFLTR4 = ADCFLTR5 = ADCFLTR6 = 0; // Clear all bits
    // disable all global interrupts
    ADCGIRQEN1 = ADCGIRQEN2 = 0;
    /* Early interrupt */
    ADCEIEN1 = ADCEIEN2 = 0; // No early interrupt
    // no dedicated trigger sources
    ADCTRGMODE = 0;
    // put everything in single ended unsigned mode
    ADCIMCON1 = ADCIMCON2 = ADCIMCON3 = 0;
    // triggers are all edge trigger
    ADCTRGSNS = 0;
    // turn on the ADC
    ADCCON1bits.ON = 1;
    /* Wait for voltage reference to be stable */
    while (!ADCCON2bits.BGVRRDY); // Wait until the reference voltage is ready
    while (ADCCON2bits.REFFLT); // Wait if there is a fault with the reference voltage
    /* Enable clock to analog circuit */
    ADCANCONbits.ANEN7 = 1; // Enable the clock to analog bias and digital control
    /* Wait for ADC to be ready */
    while (!ADCANCONbits.WKRDY7); // Wait until ADC0 is ready
    /* Enable the ADC module */
    ADCCON3bits.DIGEN7 = 1; // Enable shared ADC
#else
#error  Unsupported processor type, please add to ADC.c. 
#endif
}

/* ------------------------------------------------------------ */

/***	convertWiFIREadc
 **
 **	Parameters:
 **		channelNumber - The PIC32 analog channel number as in the PIC32 datasheet
 **
 **	Return Value:
 **      The converted value for that channel
 **
 **	Errors:
 **     If return value of zero an error may have occurred
 **
 **	Description:
 **      Converts the analog signal to a digital value on the 
 **      given pic32 analog channel number
 */
int convert_wifire_adc(uint8_t channelNumber) {
#if defined(__32MZ2048ECG100__)  
    // EC uses old ADC, requires work-around to eliminate noise
    // Samples ADC 17 times, discarding first 16 results.
    // Uses DMA to reduce management overhead.
    
    int i, k = 0;
    uint8_t vcn = channelNumber;
    int analogValue = 0;
    volatile unsigned td;

#define KVA_2_PA(v)             (((uint32_t) (v)) & 0x1fffffff)
    static uint16_t __attribute__((coherent)) ovsampValue;

    // set the channel trigger for GSWTRG source triggering
    if (channelNumber == 43 || channelNumber == 44 || channelNumber >= 50) {
        return (0);
    } else if (channelNumber >= 45) {
        vcn = channelNumber - 45;
        AD1IMOD |= 1 << ((vcn * 2) + 16); // say use the alt; set SHxALT
    }

    AD1CON3bits.ADINSEL = vcn; // manually trigger the conversion
    AD1CON1bits.FILTRDLY = AD1CON2bits.SAMC + 5; // strictly not needed, but set the timing anyway

    // set up for 16x oversample
    AD1FLTR6 = 0; // clear oversampling
    AD1FLTR6bits.OVRSAM = 1; // say 16x oversampling
    AD1FLTR6bits.CHNLID = vcn; // the ANx channel

    // setup DMA
    IEC4bits.DMA7IE = 0; // disable DMA channel 4 interrupts
    IFS4bits.DMA7IF = 0; // clear existing DMA channel 4 interrupt flag

    // setup DMA channel x
    DMACONbits.ON = 1; // make sure the DMA is ON
    DCH7CON = 0; // clear DMA channel CON
    DCH7ECON = 0; // clear DMA ECON
    DCH7ECONbits.CABORT = 1; // reset the DMA channel
    while (DCH7CONbits.CHEN == 1); // make sure DMA is not enabled
    while (DCH7CONbits.CHBUSY == 1); // make sure DMA is not busy
    DCH7CONbits.CHPRI = 3; // use highest priority
    DCH7ECONbits.CHSIRQ = _ADC1_DF6_VECTOR; // say the ADC filter complete triggers the DMA
    DCH7ECONbits.SIRQEN = 1; // enable the IRQ event for triggering
    DCH7SSA = KVA_2_PA(&AD1FLTR6); // address of the source
    DCH7SSIZ = 2; // source size is 2 bytes
    DCH7CSIZ = 2; // cell size transfer
    DCH7DSA = KVA_2_PA(&ovsampValue); // destination address
    DCH7DSIZ = sizeof (ovsampValue); // destination size

    // must throw out first 16 samples
    // keep the 17th. We can not access any ADC registers
    // however we can look at the DMA to see when things complete
    for (i = 0; i < 17; i++) {
        do {

            DCH7ECONbits.CABORT = 1; // reset the DMA channel
            AD1FLTR6bits.AFEN = 0; // make sure oversampling is OFF
            while (DCH7CONbits.CHEN == 1); // wait for DMA to stop
            while (DCH7CONbits.CHBUSY == 1); // wait for DMA not to be busy
            DCH7INT = 0; // clear all interrupts
            DCH7CONbits.CHEN = 1; // enable the DMA channel
            AD1FLTR6bits.AFEN = 1; // enable oversampling

            AD1CON3bits.RQCONVRT = 1; // start conversion

            // we have noticed problems that the DMA channel is not always
            // triggered, so after a time out value, just try again.
            // fundamentally the problem is that AD1FLTR6bits.AFEN must
            // be reset for each oversample conversion, disable and reenabled.

            // we know a conversion is going to take 8000ns * 16, or 128 us
            // we don't want to check too often so DMA and ADC can work
            // but we don't want to wait too long and hold things up

            for (k = 0; k < 20; k++) // this is more than enough time for the conversion, 
            { // really 8 should be good enough
                for (td = 0; td < 16 * 200; td++) // Time delay
                    ;
                if (DCH7INTbits.CHBCIF == 1) {
                    break; // DMA completed and copied the oversampled result
                }
            }
        } while (DCH7INTbits.CHBCIF == 0); // if the conversion did not finish, try again
    }
    analogValue = ovsampValue >> 2; // 16 oversample gets you 2 extra bits

    // we are done, clean up the DMA, oversampling filter, and ADC
    DCH7CON = 0;
    while (DCH7CONbits.CHBUSY == 1);
    AD1CON3bits.ADINSEL = 0;
    AD1FLTR6 = 0;

    if (channelNumber >= 45) {
        AD1IMOD &= ~(0b11 << ((vcn * 2) + 16)); // don't use alt
    }

    return (analogValue);
#elif defined(__32MZ2048EFG100__)  
    uint32_t mask;

    if (channelNumber >= 32) // this code only supports channels 0 to 31
        return 0;

    // Select channel to convert
    ADCCON3bits.ADINSEL = channelNumber;
    // Manually trigger conversion
    ADCCON3bits.RQCNVRT = 1;

    // wait for completion of the conversion
    mask = 0x1 << channelNumber;
    while ((ADCDSTAT1 & mask) == 0)
        ;

    // return the converted data
    return ((int) ((uint32_t *) & ADCDATA0)[channelNumber]);
#else
#error  Unsupported processor type, please add to ADC.c. 
#endif
}


int read_potentiometer_with_adc(void) {
#if defined(__32MZ2048ECG100__)  
    // EC uses old ADC, requires work-around to eliminate noise
    return convert_wifire_adc(VR1_AN_CHAN_NUM);
#elif defined(__32MZ2048EFG100__)  
    // Select channel to convert
    ADCCON3bits.ADINSEL = VR1_AN_CHAN_NUM;
    // Manually trigger conversion
    ADCCON3bits.RQCNVRT = 1;
    // wait for completion of the conversion
    while (ADCDSTAT1bits.ARDY8 == 0)
        ;
    // return the converted data
    return ADCDATA8;
#else
#error  Unsupported processor type, please add to ADC.c. 
#endif
}
