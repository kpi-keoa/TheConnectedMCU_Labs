/* 
 * File:   ADC.h
 * Author: Alex
 *
 * Created on January 8, 2016, 10:38 AM
 */

#ifndef ADC_H
#define	ADC_H

#include "common.h"

#define ADC_POTENTIOMETER_PIN 8
#define ADC_KVA_2_PA(v)       (((uint32_t) (v)) & 0x1FFFFFFF)

FSTATUS           ADC_init();
volatile uint32_t ADC_read(uint8_t channel);

#endif	/* ADC_H */

