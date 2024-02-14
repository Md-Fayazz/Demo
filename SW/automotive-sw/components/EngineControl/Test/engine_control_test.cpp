extern "C"{
    #include "../Inc/engine_control.h"
}
#include <gtest/gtest.h>

TEST(EngineControlTest, get_engine_speed) {
    // Arrange
    int throttle_position = 5;
    int expected_speed = 500;

    // Act
    int speed = get_engine_speed(throttle_position);

    // Assert
    ASSERT_EQ(expected_speed, speed);
}

TEST(EngineControlTest, control_engine) {

    // Act
    int status = control_engine();

    // Assert
    ASSERT_TRUE(status==0);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
