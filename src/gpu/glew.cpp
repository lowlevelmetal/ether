/*
 * ether
 * 2D Game Engine
 * 
 * glew.cpp
 * 
 * Inherit this and your class will always have GLEW initialized
 */

#include "glew.hpp"

#include  <GL/glew.h>

#include <system_error>

namespace ether::gpu {

bool GLEW::m_initialized = false;

// We need to create a custom error category for GLEW
// so we can build a std::runtime_error
class glew_error_category : public std::error_category {
public:
    const char* name() const noexcept override {
        return "glew";
    }

    std::string message(int condition) const override {
        return reinterpret_cast<const char *>(glewGetErrorString(condition));
    }
};

// Instead of building a bunch of new categories we can just have one
// that is fetchable when we need it.
inline const std::error_category& glew_category() noexcept {
    static glew_error_category instance;
    return instance;
}

GLEW::GLEW() {
    if(m_initialized)
        return;

    GLenum err = glewInit();
    if(err != GLEW_OK) {
        std::error_code ec(static_cast<int>(err), glew_category());
        throw std::system_error(ec, "Failed to initialize GLEW");
    }

    m_initialized = true;
}

} // namespace ether::gpu