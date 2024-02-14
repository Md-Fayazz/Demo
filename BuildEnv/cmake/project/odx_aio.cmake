
set(python_file ${CMAKE_SOURCE_DIR}/Tools/odx/demo.py)

add_custom_target(odx_aio
    COMMAND python ${python_file}
)