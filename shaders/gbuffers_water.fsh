#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | water/translucents
//  fresnel sheen on water surfaces
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · gbuffers_water.fsh
//  Translucidos — agua com ondas e fresnel
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#include "/lib/gbuffer.glsl"

uniform sampler2D texture;

varying vec3 vNormal;
varying vec3 vViewDir;
varying float blockId;

void main()
{
    vec4 tex = texture2D(texture, texcoord);

    vec3 color = tex.rgb * litRGB();
    float alpha = tex.a * glcolor.a;

    bool isWater = abs(blockId - BLOCK_ID_WATER) < 0.5;

    if (isWater)
    {
        vec3 n = normalize(vNormal);
        vec3 v = normalize(vViewDir);

        float rim = 1.0 - clamp(dot(n, v), 0.0, 1.0);
        float fresnel = rim * rim;

        color += WATER_SHEEN_COLOR * (fresnel * WATER_SHEEN);

        alpha = max(alpha, WATER_MIN_ALPHA);
        alpha = mix(alpha, WATER_MAX_ALPHA, fresnel * WATER_FRESNEL_ALPHA);
    }

    gl_FragData[0] = vec4(applyFog(color, fogFade.x), alpha);
}
