cmake_minimum_required(VERSION 3.6)
project(StarterProject)

set(CMAKE_C_STANDARD 11)

set(SOURCE_FILES HelloCommandLine.c)

# Include Directories
include_directories("include")

# Executables
add_executable(StarterProject ${SOURCE_FILES})

# Linked Libraries
target_link_libraries(StarterProject ${CMAKE_CURRENT_SOURCE_DIR}/lib/libcs.a)
target_link_libraries(StarterProject m)
target_link_libraries(StarterProject shlwapi)