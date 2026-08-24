#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | clouds
//  vanilla clouds with fog applied
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · gbuffers_clouds.vsh
//  Nuvens do vanilla com nevoa aplicada
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
