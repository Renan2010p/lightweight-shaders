#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | textured
//  particles and generic textured geometry
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · gbuffers_textured.vsh
//  Particulas e geometria texturizada generica
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#define VERTEX_STAGE

#include "/lib/gbuffer.glsl"

void main()
{
    setupVertex(gl_Vertex);
}
