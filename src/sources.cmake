# Ether
# 2D Game Engine
#
# CMakeLists.txt file tells cmake how to generate build files
# This CMakeLists.txt is called by the CMakeLists.txt in the parent directory

# Include engine components
include(src/gpu/gpu.cmake)

file(GLOB ROOT_SOURCES "src/*.cpp" "src/*.hpp")
list(APPEND SOURCES ${ROOT_SOURCES})

message(STATUS "Combined sources: ${SOURCES}")