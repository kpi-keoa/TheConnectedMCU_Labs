#ifndef __PRINT_H__
#define __PRINT_H__

#include "types.h"

#define PRINT_MESSAGE(msg) print_message(msg)

FRESULT print_create();
FRESULT print_message(const char* msg);

#endif  //  !__PRINT_H__
