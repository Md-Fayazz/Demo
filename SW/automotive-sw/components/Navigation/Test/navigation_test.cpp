extern "C"{
    #include "../Inc/navigation.h"
}
// #include "src/Navigation/navigation.h"
#include <gtest/gtest.h>

TEST(NavigationTest, calculate_route) {
    // Arrange
    int start = 0;
    int destination = 100;
    int expected_route_length = 100;

    // Act
    int route_length = calculate_route(start, destination);

    // Assert
    ASSERT_EQ(expected_route_length, route_length);
}
TEST(NavigationTest, navigate) {

    // Act
    int status = navigate();

    // Assert
    ASSERT_TRUE(status==0);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
