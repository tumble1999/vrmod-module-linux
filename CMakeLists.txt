cmake_minimum_required(VERSION 3.0.0)
project(vrmod VERSION 0.0.1)

#include(CTest)
#enable_testing()
# set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/arch)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/run)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/install/GarrysMod/garrysmod/lua/bin)


#deps

set(BUILD_SHARED_LIBS TRUE)
find_package(PkgConfig REQUIRED)

# OpenGL
cmake_policy(SET CMP0072 NEW)
find_package(OpenGL REQUIRED)
include_directories(${OPENGL_INCLUDE_DIR})
set(OPENGL_LIBRARY ${OPENGL_opengl_LIBRARY})
message(NOTICE "OPENGL_LIBRARY " ${OPENGL_LIBRARY})
message(NOTICE "OPENGL_LIBRARIES " ${OPENGL_LIBRARIES})
message(NOTICE "OPENGL_INCLUDE_DIR " ${OPENGL_INCLUDE_DIR})

# glew
find_package(GLEW REQUIRED)
include_directories(${GLEW_INCLUDE_DIRS})
message(NOTICE "GLEW_LIBRARIES " ${GLEW_LIBRARIES})
message(NOTICE "GLEW_INCLUDE_DIRS " ${GLEW_INCLUDE_DIRS})

# mod setup
function(setup_gmod_mod NAME)
	target_link_libraries(${NAME}
	${OPENGL_LIBRARY}
	)

	include_directories(${NAME}
	${OPENGL_INCLUDE_DIR}
	${CMAKE_SOURCE_DIR}/deps
	)

	set_target_properties(${NAME} PROPERTIES PREFIX "gmcl_")
	set_target_properties(${NAME} PROPERTIES SUFFIX "_linux.dll")
endfunction()


# SRC
add_library(vrmod SHARED "src/vrmod.cpp")
setup_gmod_mod(vrmod)


