# Ether
# 2D Game Engine

# Glob source files
file(GLOB GPU_SOURCES "src/gpu/*.cpp" "src/gpu/*.hpp")

message(STATUS "GPU Sources: ${GPU_SOURCES}")

# Add to global source list
list(APPEND SOURCES ${GPU_SOURCES})