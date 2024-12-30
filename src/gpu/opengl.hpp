/*
 * ether
 * 2D Game Engine
 * 
 * opengl.hpp
 * 
 * Provides opengl support
 */

#pragma once

#include "gapi.hpp"
#include "glew.hpp"

namespace ether::gpu {

class ETHER_API OpenGL : public GAPI, GLEW {
private:
    OpenGL();

public:
    ~OpenGL(); // Keep the deconstructor public so that instances can be destroyed by anyone, usually shared_ptr

    OpenGL* Create();
};

} // namespace ether::gpu