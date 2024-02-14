set(SRC_PATH                        ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(HEADER_PATH                     ${CMAKE_CURRENT_SOURCE_DIR}/Inc)
set(CMAKE_C_STANDARD                99)
set(CMAKE_CXX_STANDARD              11)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

set(SRCS 
    ${SRC_PATH}/engine_control.c 
)

set(HEADERS 
    ${HEADER_PATH}/engine_control.h
)

add_library(EngineControl ${SRCS} ${HEADERS})
target_include_directories(EngineControl PUBLIC Inc/)
# target_link_libraries(EngineControl PRIVATE BrakeSystem)
add_subdirectory(Test)