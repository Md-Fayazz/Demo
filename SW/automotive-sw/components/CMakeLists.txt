
add_subdirectory(BrakeSystem)
add_subdirectory(EngineControl)
add_subdirectory(MainApplication)
add_subdirectory(Navigation)

set(COMPILER_OS_OPTIONS 
    -NO_OPTIMIZATION=oo
    -INC_DBG_INFO=g
)
add_compile_options(${COMPILER_OS_OPTIONS})