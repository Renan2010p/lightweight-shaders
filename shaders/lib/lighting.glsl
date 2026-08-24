// -------------------------------------------------------------
//  Lightweight Shaders | lib/lighting.glsl
//  Lighting - samples the vanilla lightmap (so night, rain and
//  dimension dimming stay correct) and applies the shadow term
//  only to the sky portion; torches stay lit inside shadows.
//
//  SPDX-License-Identifier: MPL-2.0
//  https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#ifndef LIGHTING_INCLUDED
#define LIGHTING_INCLUDED

#include "/lib/settings.glsl"
#include "/lib/constants.glsl"
#include "/lib/shadows.glsl"

uniform sampler2D lightmap;

// shadowMul = 1.0 receives shadows; 0.0 ignores them (hand, entities).
vec3 litColor(in vec2 lmcoord, in vec4 tint, in float shadowMul, in float shadowEdgeFade)
{
    vec3 lightCol = texture2D(lightmap, lmcoord).rgb;

    float sky = clamp((lmcoord.y - LM_RAW_MIN) / LM_RAW_SPAN, 0.0, 1.0);

#ifdef SHADOWS
    float shade = sampleShadowMap(shadowPos, shadowEdgeFade);

    lightCol *= mix(1.0, SHADOW_LIT_FLOOR + (1.0 - SHADOW_LIT_FLOOR) * shade, sky * sky * shadowMul);
#endif

    return max(lightCol, vec3(NIGHT_MIN_LIGHT)) * tint.rgb;
}

#endif
