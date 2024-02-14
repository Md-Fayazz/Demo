set(this                    Navigation_test)
set(SOURCE                  navigation_test.cpp)
set(EXECUTABLE_OUTPUT_PATH  ${CMAKE_BINARY_DIR}/out/Test)

add_executable(${this} ${SOURCE})
target_link_libraries(${this} PUBLIC 
    gtest_main
    Navigation
)

add_test(
    NAME ${this}
    COMMAND ${this}
)

add_custom_target(execute_Navigation_test 
    COMMAND ${this}
)