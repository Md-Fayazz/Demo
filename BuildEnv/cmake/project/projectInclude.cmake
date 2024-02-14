set(json_file_name      projectInc.json)
set(include_json_file   ${CMAKE_SOURCE_DIR}/projectDefination/${json_file_name})

# Read the contents of your JSON file into a CMake variable
file(READ ${include_json_file} JSON_CONTENT)

# Get the list of .cmake files from the parsed JSON
string(JSON var GET ${JSON_CONTENT} projectDefinationFiles)
string(REGEX REPLACE "\\[|\\]" "" var "${var}")
string(REPLACE "\"" "" var "${var}")
string(REPLACE "," ";" var "${var}")
string(REPLACE "\n" "" var "${var}")

# message(${var})
foreach(CMAKE_FILE ${var})
    string(STRIP "${CMAKE_FILE}" CMAKE_FILE)
    # message(${CMAKE_PATH}/project/${CMAKE_FILE})
    include(${CMAKE_PATH}/project/${CMAKE_FILE})
endforeach()
