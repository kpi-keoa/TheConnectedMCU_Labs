#ifndef __COMMON_H__
#define __COMMON_H__

#include <stdint.h>

#define DEBUG

#ifdef DEBUG
#	define FCHECK(func) if ((func) > WARNING_FSTATUS) prog_abort()
#else
#	define FCHECK(func) func
#endif

//  result of execution functions
typedef enum FSTATUS_E
{
	OK_FSTATUS = 0,
	WARNING_FSTATUS,
	ERROR_FSTATUS,
	ABORT_FSTATUS
} FSTATUS;

void prog_abort() __attribute__ ((noreturn));  //  never return from this function

#endif  //  !__COMMON_H__
