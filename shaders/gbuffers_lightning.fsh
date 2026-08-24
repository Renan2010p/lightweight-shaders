#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | lightning
//  fullbright, unlit
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · gbuffers_lightning.fsh
//  Raio — fullbright, sem iluminacao
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

uniform sampler2D texture;

varying vec2 texcoord;
varying vec4 glcolor;

void main()
{
    vec4 tex = texture2D(texture, texcoord);

    gl_FragData[0] = vec4(tex.rgb * glcolor.rgb, tex.a * glcolor.a);
}
