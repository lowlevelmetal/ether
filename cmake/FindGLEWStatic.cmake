# - Find GLEW
# This module will search for the GLEW library and header files.
#
# Once done, this will define:
#  GLEW_FOUND          - system has GLEW
#  GLEW_INCLUDE_DIRS   - the GLEW include directory
#  GLEW_LIBRARIES      - the libraries to link against
#
# Usage example:
#   find_package(GLEW REQUIRED)
#   target_include_directories(MyTarget PRIVATE ${GLEW_INCLUDE_DIRS})
#   target_link_libraries(MyTarget PRIVATE ${GLEW_LIBRARIES})

# Reset variable checks in case they're set
unset(GLEW_FOUND CACHE)
unset(GLEW_INCLUDE_DIRS CACHE)
unset(GLEW_LIBRARIES CACHE)

# 1. Locate the header.
#    GLEW typically installs headers in:
#    - /usr/include/GL/glew.h (Linux)
#    - /usr/local/include/GL/glew.h (Linux/Unix)
#    - C:/.../include/GL/glew.h (Windows, depending on your installation)
#
#    We try to find "GL/glew.h" because that's how it's usually included.
find_path(
    GLEW_INCLUDE_DIR
    NAMES GL/glew.h glew.h
    HINTS
      $ENV{GLEW_ROOT}/include
      ${CMAKE_SOURCE_DIR}/external/glew/include
      ${CMAKE_SOURCE_DIR}/include
      ${CMAKE_INSTALL_PREFIX}/include
      ${CMAKE_CURRENT_SOURCE_DIR}/../glew/include
    PATH_SUFFIXES GL
)

message(STATUS "GLEW include dir ${GLEW_INCLUDE_DIR}")

# 2. Locate the library.
#    GLEW library names can differ by platform. Typically:
#    - GLEW (Linux / Unix)
#    - libGLEW, glew32, libglew32, etc. (Windows)
#
#    Feel free to add more if your system uses a different naming pattern.
find_library(
    GLEW_LIBRARY
    NAMES glew32s
    HINTS
      $ENV{GLEW_ROOT}/lib
      ${CMAKE_SOURCE_DIR}/external/glew/lib
      ${CMAKE_SOURCE_DIR}/lib
      ${CMAKE_INSTALL_PREFIX}/lib
      ${CMAKE_CURRENT_SOURCE_DIR}/../glew/lib/
      ${CMAKE_CURRENT_SOURCE_DIR}/../glew/lib/Release/x64
)

message(STATUS "GLEW libraries ${GLEW_LIBRARY}")

# 3. Check if both the library and the header were found.
if (GLEW_INCLUDE_DIR AND GLEW_LIBRARY)
    set(GLEW_FOUND TRUE)
else ()
    set(GLEW_FOUND FALSE)
endif ()

# 4. Provide the variables to the parent scope if found.
if (GLEW_FOUND)
    # It's good practice to name them consistently:
    set(GLEW_INCLUDE_DIRS "${GLEW_INCLUDE_DIR}" CACHE PATH "GLEW include directory" FORCE)
    set(GLEW_LIBRARIES "${GLEW_LIBRARY}" CACHE FILEPATH "GLEW libraries" FORCE)

    message(STATUS "Found GLEW: ${GLEW_LIBRARY}")
else ()
    set(GLEW_INCLUDE_DIRS "" CACHE PATH "GLEW include directory" FORCE)
    set(GLEW_LIBRARIES "" CACHE FILEPATH "GLEW libraries" FORCE)

    message(STATUS "Could NOT find GLEW")
endif ()

mark_as_advanced(
    GLEW_INCLUDE_DIR
    GLEW_LIBRARY
)