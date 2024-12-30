/*
 * ether
 * 2D Game Engine
 * 
 * opengl.cpp
 * 
 * Provides opengl support
 */

#include "opengl.hpp"
#include <system_error>

namespace ether::gpu {

OpenGL::OpenGL() {
    HIGH_LOG("Initializing OpenGL");
}

OpenGL::~OpenGL() {
    HIGH_LOG("Destroying OpenGL");
}

// In current year C++ still insists you throw exceptions from inside constructors.
// So now you have this ugly garbage.
OpenGL* OpenGL::Create() {
    try {
        return new OpenGL;
    } catch(std::system_error &err) {
        ERR("%s", err.what());
        return nullptr;
    }
}

} // namespace ether::gpu