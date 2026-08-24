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
//  Lightweight Shaders · gbuffers_terrain.fsh
//  Terreno solido e cutout (folhas, plantas)
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#include "/lib/gbuffer.glsl"

uniform sampler2D texture;

void main()
{
    vec4 tex = texture2D(texture, texcoord);

    if (tex.a < CUTOUT_THRESHOLD)
    {
        discard;
    }

    gl_FragData[0] = vec4(litFragment(tex.rgb), 1.0);
}
