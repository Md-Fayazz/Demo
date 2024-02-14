set(application ${CMAKE_BINARY_DIR}/out/Appl.exe)

add_custom_target(build
	DEPENDS Appl
	COMMAND ${application}
)

add_custom_target(OBJECT_FILES
	DEPENDS BrakeSystem EngineControl Navigation
)