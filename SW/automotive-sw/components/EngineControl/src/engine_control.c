#include <stdio.h>
#include "../Inc/engine_control.h"

int control_engine() {
    // printf("Controlling the engine...\n"); SRC Update.
    return 0;
}

int get_engine_speed(int throttle_position) {
    return throttle_position * 100;
}
