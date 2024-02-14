set(this                    engine_control_test)
set(SOURCE                  engine_control_test.cpp)
set(EXECUTABLE_OUTPUT_PATH  ${CMAKE_BINARY_DIR}/out/Test)

add_executable(${this} ${SOURCE})
target_link_libraries(${this} PUBLIC 
    gtest_main
    EngineControl
)

add_test(
    NAME ${this}
    COMMAND ${this}
)
add_custom_target(execute_engine_control_test 
    COMMAND ${this}
)