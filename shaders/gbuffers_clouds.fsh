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
//  Lightweight Shaders · gbuffers_clouds.fsh
//  Nuvens do vanilla com nevoa aplicada
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

    gl_FragData[0] = vec4(applyFog(tex.rgb * glcolor.rgb, fogFade.x), tex.a * glcolor.a);
}
