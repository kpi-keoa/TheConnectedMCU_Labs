
#include "user.h"       /* User funct/params, such as init() */

void main(void) {
    init_app();             /* initializing GPIOs */  
    
    while (1) {
        count();
    }
}
