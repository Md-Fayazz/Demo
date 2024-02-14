set(SRC_PATH                        ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(HEADER_PATH                     ${CMAKE_CURRENT_SOURCE_DIR}/Inc)
set(CMAKE_C_STANDARD                99)
set(CMAKE_CXX_STANDARD              11)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

set(SRCS 
    ${SRC_PATH}/navigation.c 
)

set(HEADERS 
    ${HEADER_PATH}/navigation.h
)

add_library(Navigation ${SRCS} ${HEADERS})
target_include_directories(Navigation PUBLIC Inc/)
# target_link_libraries(Navigation PRIVATE EngineControl)
add_subdirectory(Test)