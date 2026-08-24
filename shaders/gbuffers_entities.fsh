#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | entities
//  mobs, item drops and item frames
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · gbuffers_entities.fsh
//  Entidades — mobs, drops e item frames
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#include "/lib/gbuffer.glsl"

uniform sampler2D texture;
uniform vec4 entityColor;

void main()
{
    vec4 tex = texture2D(texture, texcoord);

    vec3 tinted = mix(tex.rgb, entityColor.rgb, entityColor.a);

    gl_FragData[0] = vec4(applyFog(tinted * litRGBNoShadow(), fogFade.x), tex.a * glcolor.a);
}
