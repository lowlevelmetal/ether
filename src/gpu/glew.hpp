/*
 * ether
 * 2D Game Engine
 * 
 * glew.hpp
 * 
 * Inherit this and your class will always have GLEW initialized
 */

#pragma once

namespace ether::gpu {

class GLEW {
public:
    GLEW();

private:
    static bool m_initialized;
};

} // namespace ether::gpu