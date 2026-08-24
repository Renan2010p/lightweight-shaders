// -------------------------------------------------------------
//  Lightweight Shaders | lib/tonemap.glsl
//  ACES tonemap (Narkowicz approximation) - smooth highlight
//  rolloff at minimal cost.
//
//  SPDX-License-Identifier: MPL-2.0
//  https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#ifndef TONEMAP_INCLUDED
#define TONEMAP_INCLUDED

vec3 acesTonemap(in vec3 x)
{
    return clamp((x * (2.51 * x + 0.03)) / (x * (2.43 * x + 0.59) + 0.14), 0.0, 1.0);
}

#endif
