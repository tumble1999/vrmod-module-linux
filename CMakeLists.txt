cmake_minimum_required(VERSION 3.0.0)
project(gmcl_vrmod VERSION 0.0.1)

#include(CTest)
#enable_testing()
# set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(CMAKE_CXX_STANDARD 14)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/arch)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/install/GarrysMod/garrysmod/lua/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/run)

file(GLOB_RECURSE SRC
"src/vrmod.cpp"
)

add_library(${PROJECT_NAME}
SHARED
${SRC}
)

#target_link_libraries

include_directories(${PROJECT_NAME}
${CMAKE_SOURCE_DIR}/deps
)
