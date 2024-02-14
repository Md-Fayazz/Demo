set(SRC_PATH                    ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(EXECUTABLE_OUTPUT_PATH      ${CMAKE_BINARY_DIR}/out)

add_executable(Appl ${SRC_PATH}/main.c)

target_link_libraries(Appl PRIVATE 
    BrakeSystem 
    EngineControl 
    Navigation
)