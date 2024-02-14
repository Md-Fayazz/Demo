#include<stdio.h>
#include "../../EngineControl/Inc/engine_control.h"
#include "../../BrakeSystem/Inc/brake_system.h"
#include "../../Navigation/Inc/navigation.h"

int main() {
    control_engine();
    apply_brakes();
    navigate();
    return 0;
}