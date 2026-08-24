// -------------------------------------------------------------
//  Lightweight Shaders | lib/fog.glsl
//  Fog - factor computed per-vertex (cheap on iGPUs), applied
//  per-fragment with a single mix.
//
//  SPDX-License-Identifier: MPL-2.0
//  https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#ifndef FOG_INCLUDED
#define FOG_INCLUDED

#include "/lib/settings.glsl"
#include "/lib/constants.glsl"

uniform vec3 fogColor;
uniform float far;
uniform int isEyeInWater;
uniform float blindness;

// Smoothstep curve from fog start to fog end.
float computeFogFactor(in float dist)
{
    float start = far * FOG_START;
    float end = far * FOG_END_SCALE;

    end *= 1.0 - blindness * BLINDNESS_FOG_TIGHTEN;

    if (isEyeInWater == EYE_IN_WATER)
    {
        start = 0.0;
        end = max(WATER_FOG_DIST * (1.0 - blindness), MIN_WATER_VISIBILITY);
    }
    else if (isEyeInWater == EYE_IN_LAVA)
    {
        start = 0.0;
        end = LAVA_FOG_DIST;
    }
    else if (isEyeInWater == EYE_IN_POWDER)
    {
        start = 0.0;
        end = POWDER_FOG_DIST;
    }

    if (end <= start)
    {
        end = start + 0.01;
    }

    float t = clamp((dist - start) / (end - start), 0.0, 1.0);

    return t * t * (3.0 - 2.0 * t);
}

vec3 applyFog(in vec3 color, in float fogFactor)
{
    return mix(color, fogColor, fogFactor);
}

#endif
