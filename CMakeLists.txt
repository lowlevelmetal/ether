# Ether
# 2D Game Engine
#
# CMakeLists.txt file tells cmake how to generate build files

# The only confirmed working version builds with 3.31.3
# Use this for now
cmake_minimum_required(VERSION 3.31.3)

# Sets the project name. This will be refered to by other CMake projects that use this engine, like a game...
project(ether)

# We want this to be a C++ 20 project
set(CMAKE_CXX_VERSION 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Ensure exceptions are enabled on MSVC
if (MSVC)
    # /EHsc = enable C++ exceptions without Async
    add_compile_options("/EHsc" "/std:c++20")
endif()

# We want these for the intellisense
set(CMAKE_EXPORT_COMPILE_COMMANDS "ON")

# Look for CMake modules in cmake/
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Look for glew
find_package(GLEWStatic REQUIRED)

# Configure sources and get glob of source files.
include(src/sources.cmake)

# Build the library
add_library(ether SHARED ${SOURCES})

# Define export symbol for Windows
target_compile_definitions(ether PRIVATE ETHER_EXPORTS GLEW_STATIC)

# Set include directories
target_include_directories(ether PUBLIC src/)
target_include_directories(ether PRIVATE ${GLEW_INCLUDE_DIRS})

# Link with glew
target_link_libraries(ether PRIVATE ${GLEW_LIBRARIES} opengl32)