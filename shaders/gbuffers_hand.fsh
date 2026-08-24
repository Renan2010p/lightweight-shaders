#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | hand
//  held item - no shadow sampling
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · gbuffers_hand.fsh
//  Item na mao — sem amostragem de sombra
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

    gl_FragData[0] = vec4(applyFog(tex.rgb * litRGBNoShadow(), fogFade.x), tex.a * glcolor.a);
}
