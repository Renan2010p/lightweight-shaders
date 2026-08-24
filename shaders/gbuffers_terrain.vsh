#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | terrain
//  solid and cutout terrain (leaves, plants)
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · gbuffers_terrain.vsh
//  Terreno solido e cutout (folhas, plantas)
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
