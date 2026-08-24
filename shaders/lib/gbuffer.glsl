// -------------------------------------------------------------
//  Lightweight Shaders | lib/gbuffer.glsl
//  Gbuffers aggregator - shared varyings, vertex assembly and
//  lighting wrappers.
//
//  SPDX-License-Identifier: MPL-2.0
//  https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#ifndef GBUFFER_INCLUDED
#define GBUFFER_INCLUDED

#include "/lib/settings.glsl"
#include "/lib/constants.glsl"
#include "/lib/fog.glsl"
#include "/lib/shadows.glsl"
#include "/lib/lighting.glsl"

varying vec2 texcoord;
varying vec2 lmcoord;
varying vec4 glcolor;
varying vec2 fogFade; // x = fog factor, y = shadow edge fade

uniform mat4 gbufferModelViewInverse;

#ifdef VERTEX_STAGE

// Single vertex assembly point: texture, lightmap, fog and
// shadow coordinates all in one place.
void setupVertex(in vec4 position)
{
    vec4 viewPos = gl_ModelViewMatrix * position;

    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    glcolor = gl_Color;

    float dist = length(viewPos.xyz);

    fogFade.x = computeFogFactor(dist);

#ifdef SHADOWS
    // Shadows fade out while the light source (sun or moon) sits
    // low on the horizon, otherwise they stretch across the world.
    float edge = 1.0 - smoothstep(shadowDistance * SHADOW_FADE_START, shadowDistance * SHADOW_FADE_END, dist);

    vec3 worldLight = normalize(mat3(gbufferModelViewInverse) * shadowLightPosition);
    float sunUp = smoothstep(SHADOW_LOW_SUN_MIN, SHADOW_LOW_SUN_MAX, worldLight.y);

    fogFade.y = edge * sunUp;

    setupVertexShadow(viewPos, gbufferModelViewInverse);
#endif

    gl_Position = gl_ProjectionMatrix * viewPos;
}

#endif

vec3 litRGB()
{
    return litColor(lmcoord, glcolor, 1.0, fogFade.y);
}

vec3 litRGBNoShadow()
{
    return litColor(lmcoord, glcolor, 0.0, fogFade.y);
}

vec3 litFragment(in vec3 albedo)
{
    return applyFog(albedo * litRGB(), fogFade.x);
}

#endif
