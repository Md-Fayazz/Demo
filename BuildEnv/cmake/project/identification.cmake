# identification.json is the source of truth in the cfg directory
set(ident_json_name  Identification.json)
set(ident_json_file ${CMAKE_SOURCE_DIR}/projectDefination/${ident_json_name})

# read the json file in; requires cmake >= 3.19 with json read support
file(READ ${ident_json_file} ident_json_content)

# simple getter function to access the variables from the json
function(SET_JSON_MEMBER locator content)
    string(JSON var ERROR_VARIABLE err GET ${content} ${locator})
    if(err)
        message(FATAL_ERROR "Failed to lookup from json: error: ${err}")
    endif()
    string(STRIP ${var} var)
    set(${locator} ${var} PARENT_SCOPE)
    message(STATUS "Ident: ${locator} -> ${var}")
endfunction()

macro(set_cmake_var_from_json_member member)
    SET_JSON_MEMBER(${member} ${ident_json_content})
endmacro()

# here we set the cmake vars based on the identification.json
set_cmake_var_from_json_member(sample_hw_number)
set_cmake_var_from_json_member(vw_spare_part_number_high)
set_cmake_var_from_json_member(vw_spare_part_number_low)
set_cmake_var_from_json_member(vw_software_version_number_dev)
set_cmake_var_from_json_member(vw_software_version_number_prod)
set_cmake_var_from_json_member(odx_file_identifier_app)
set_cmake_var_from_json_member(odx_file_version_app)
set_cmake_var_from_json_member(system_name_or_engine_type_high)
set_cmake_var_from_json_member(system_name_or_engine_type_low)
set_cmake_var_from_json_member(fds_key)
set_cmake_var_from_json_member(rfs_ver)
set_cmake_var_from_json_member(hsm_odis_ver)
set_cmake_var_from_json_member(marvel_odis_ver)
set_cmake_var_from_json_member(hsm_long_ver)
set_cmake_var_from_json_member(marvel_long_ver)

