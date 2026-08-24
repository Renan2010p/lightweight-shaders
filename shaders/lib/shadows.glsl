// -------------------------------------------------------------
//  Lightweight Shaders | lib/shadows.glsl
//  Shadows - shadow map space and sampling.
//
//  The normal offset pushes the sampled point away from the
//  surface (prevents acne) and the bias grows on surfaces
//  slanted away from the light, where acne is strongest.
//  This keeps shadows glued to the feet of players and
//  entities instead of floating apart.
//
//  SPDX-License-Identifier: MPL-2.0
//  https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#ifndef SHADOWS_INCLUDED
#define SHADOWS_INCLUDED

#ifdef SHADOWS

varying vec4 shadowPos;

uniform mat4 shadowModelView;
uniform mat4 shadowProjection;
uniform sampler2DShadow shadowtex1;
uniform vec3 shadowLightPosition;
uniform float rainStrength;

#ifdef VERTEX_STAGE

// position must already be in VIEW space: gbufferModelViewInverse
// maps view -> player, and skipping that step makes shadows
// slide around whenever the camera rotates.
void setupVertexShadow(in vec4 viewPos, in mat4 playerToShadow)
{
    vec3 worldNormal = normalize(mat3(playerToShadow) * (gl_NormalMatrix * gl_Normal));
    vec3 worldLight = normalize(mat3(playerToShadow) * shadowLightPosition);

    float ndotl = clamp(dot(worldNormal, worldLight), 0.0, 1.0);
    float bias = SHADOW_DEPTH_BIAS + SHADOW_SLOPE_SCALE * (1.0 - ndotl);

    vec4 feetPos = playerToShadow * viewPos;
    feetPos.xyz += worldNormal * SHADOW_NORMAL_OFFSET;

    vec4 sp = shadowProjection * (shadowModelView * feetPos);

    sp.z -= bias;
    shadowPos = sp;
}

#endif

bool insideShadowMap(in vec3 p)
{
    bool inXy = all(greaterThanEqual(p.xy, vec2(0.0))) && all(lessThanEqual(p.xy, vec2(1.0)));
    bool inZ = p.z < 1.0;

    return inXy && inZ;
}

float sampleShadowMap(in vec4 spos, in float edgeFade)
{
    vec3 p = (spos.xyz / spos.w) * 0.5 + 0.5;

    if (!insideShadowMap(p))
    {
        return 1.0;
    }

    float sh = shadow2D(shadowtex1, p).r;

    sh = mix(1.0, sh, edgeFade);

    return mix(sh, 1.0, rainStrength * SHADOW_RAIN_SOFTEN);
}

#endif
#endif
