include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
cmake_minimum_required(VERSION 3.14)
project(cmakeproject VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_PATH 	             ${CMAKE_CURRENT_SOURCE_DIR}/BuildEnv/cmake)
set(CMAKE_TOOLCHAIN_FILE     ${CMAKE_PATH}/toolchain/conan_build.cmake)

include(${CMAKE_PATH}/project/projectInclude.cmake)
# include(${CMAKE_PATH}/project/build.cmake)
# include(${CMAKE_PATH}/project/odx_aio.cmake)
# include(${CMAKE_PATH}/project/Testing.cmake)
# include(${CMAKE_PATH}/project/projectConf.cmake)
# include(${CMAKE_PATH}/project/identification.cmake)

add_subdirectory(SW)