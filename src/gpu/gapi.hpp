/*
 * ether
 * 2D Game Engine
 * 
 * gapi.hpp
 * 
 * GAPI, Graphics API, is used as a generic class to marshal data between the game, and the graphics api(ogl, dx, vk).
 */

#pragma once

#include "macro.hpp"
#include <memory>

namespace ether::gpu {

class ETHER_API GAPI {
public:
    virtual ~GAPI() = default;

    //virtual float* ConvertToIndicies(const float* vb) = 0;
    //virtual void LoadVertecies(const float* vb) = 0;
    //virtual void LoadIndicies(const float* ib) = 0;

};

} // namespace ether::gpu