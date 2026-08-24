#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | final
//  ACES tonemap, color grading and vignette
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · final.fsh
//  Passe final — tonemap ACES, correcao de cor e vinheta
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#include "/lib/settings.glsl"
#include "/lib/constants.glsl"
#include "/lib/tonemap.glsl"

uniform sampler2D colortex0;
uniform vec3 sunPosition;
uniform vec3 upPosition;
uniform int isEyeInWater;

varying vec2 uv;

void main()
{
    vec3 color = texture2D(colortex0, uv).rgb;

    float sunHeight = dot(normalize(sunPosition), normalize(upPosition));
    float horizonFade = smoothstep(SUNSET_HORIZON_MIN, SUNSET_HORIZON_MAX, sunHeight);
    float warmth = exp(-abs(sunHeight) * SUNSET_WIDTH) * horizonFade * SUNSET_PEAK * WARMTH_STRENGTH;

    color = mix(color, color * SUNSET_TINT, warmth);

    color *= EXPOSURE;
    color = acesTonemap(color);

    float luminance = dot(color, vec3(0.2126, 0.7152, 0.0722));

    color = mix(vec3(luminance), color, SATURATION);
    color = (color - 0.5) * CONTRAST + 0.5;

    bool submerged = float(isEyeInWater) == UNDERWATER_EYE;

    if (submerged)
    {
        color *= UNDERWATER_TINT;
    }

    float vignette = smoothstep(VIGNETTE_RANGE.x, VIGNETTE_RANGE.y, distance(uv, vec2(0.5)));

    color *= 1.0 - VIGNETTE_STRENGTH * vignette;

    gl_FragData[0] = vec4(color, 1.0);
}
