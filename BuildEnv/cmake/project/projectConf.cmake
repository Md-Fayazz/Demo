set(project_json_name      projectConf.json)
set(project_json_file      ${CMAKE_SOURCE_DIR}/projectDefination/${project_json_name})

# read the json file in; requires cmake >= 3.19 with json read support
file(READ ${project_json_file} project_json_content)

# simple getter function to access the variables from the json
function(SET_JSON_MEMBER locator content)
    string(JSON var ERROR_VARIABLE err GET ${content} ${locator})
    if(err)
        message(FATAL_ERROR "Failed to lookup from json: error: ${err}")
    endif()
    string(STRIP ${var} var)
    set(${locator} ${var} PARENT_SCOPE)
    message(STATUS "project: ${locator} -> ${var}")
endfunction()

macro(set_cmake_var_from_json_member member)
    SET_JSON_MEMBER(${member} ${project_json_content})
endmacro()

# here we set the cmake vars based on the project.json
set_cmake_var_from_json_member(usr)
set_cmake_var_from_json_member(pass)

