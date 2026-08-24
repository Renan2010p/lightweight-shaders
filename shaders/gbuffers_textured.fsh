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
//  Lightweight Shaders · gbuffers_textured.fsh
//  Particulas e geometria texturizada generica
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

    gl_FragData[0] = vec4(litFragment(tex.rgb), tex.a * glcolor.a);
}
