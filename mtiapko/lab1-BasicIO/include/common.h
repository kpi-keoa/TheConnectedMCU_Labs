#ifndef __COMMON_H__
#define __COMMON_H__

#define DEBUG

#ifdef DEBUG
#	define FCHECK(func) if ((func) > WARNING_FSTATUS) prog_abort()
#else
#	define FCHECK(func) func
#endif

typedef signed char        int8_t;
typedef signed short       int16_t;
typedef signed int         int32_t;
typedef signed long long   int64_t;


typedef unsigned char      uint8_t;
typedef unsigned short     uint16_t;
typedef unsigned int       uint32_t;
typedef unsigned long long uint64_t;

//  result of execution functions
typedef enum FSTATUS_E
{
	OK_FSTATUS = 0,
	WARNING_FSTATUS,
	ERROR_FSTATUS,
	ABORT_FSTATUS
} FSTATUS;

void delay(uint32_t val);
void prog_abort() __attribute__ ((noreturn));  //  never return from this function

#endif  //  !__COMMON_H__
