/*
 * ether
 * 2D Game Engine
 * 
 * macro.hpp
 * 
 * Provides default macro
 */

#pragma once

#include <cstdio>

#ifdef ETHER_EXPORTS
#define ETHER_API __declspec(dllexport)
#else
#define ETHER_API __declspec(dllimport)
#endif

#define HIGH_LOG(str, ...) printf("[DBG %d:" __FILE__ "] " str "\n", __LINE__, ##__VA_ARGS__);
#define ERR(str, ...) fprintf(stderr, "[ERR %d:" __FILE__ "] " str "\n", __LINE__, ##__VA_ARGS__);