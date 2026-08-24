#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | water/translucents
//  surface wave displacement
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · gbuffers_water.vsh
//  Translucidos — deslocamento de ondas na superficie
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#define VERTEX_STAGE

#include "/lib/gbuffer.glsl"

attribute vec4 mc_Entity;

uniform vec3 cameraPosition;
uniform float frameTimeCounter;

varying vec3 vNormal;
varying vec3 vViewDir;
varying float blockId;

void main()
{
    vec4 position = gl_Vertex;

    blockId = mc_Entity.x;

    bool isWater = abs(blockId - BLOCK_ID_WATER) < 0.5;
    bool isTopFace = gl_Normal.y > 0.5;

#ifdef WATER_WAVES
    if (isWater && isTopFace)
    {
        vec4 viewPos = gl_ModelViewMatrix * gl_Vertex;
        vec3 worldPos = (gbufferModelViewInverse * viewPos).xyz + cameraPosition;
        float t = frameTimeCounter;

        position.y += (sin(worldPos.x * 1.4 + t * 1.6) + cos(worldPos.z * 1.1 + t * 1.2)) * 0.5 * WAVE_AMPLITUDE;
    }
#endif

    setupVertex(position);

    vNormal = normalize(gl_NormalMatrix * gl_Normal);
    vViewDir = -(gl_ModelViewMatrix * position).xyz;
}
