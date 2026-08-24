#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | sky textured
//  sun, moon and stars - sun and moon quads are spun 45 degrees
//  around their own axis so they render as diamonds.
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#include "/lib/settings.glsl"
#include "/lib/constants.glsl"

uniform vec3 sunPosition;
uniform vec3 moonPosition;

varying vec2 texcoord;
varying vec4 glcolor;

void main()
{
    vec4 pos = gl_ModelViewMatrix * gl_Vertex;

    vec3 dir = normalize(pos.xyz);
    vec3 sunDir = normalize(sunPosition);
    vec3 moonDir = normalize(moonPosition);

    bool facesSun = dot(dir, sunDir) > CELESTIAL_MATCH_DOT;
    bool facesMoon = !facesSun && dot(dir, moonDir) > CELESTIAL_MATCH_DOT;

    if (facesSun || facesMoon)
    {
        vec3 axis = facesSun ? sunDir : moonDir;

        vec3 center = axis * dot(pos.xyz, axis);
        vec3 offset = pos.xyz - center;

        // 45 degree spin in the quad plane turns the square into a diamond.
        offset = offset * CELESTIAL_SPIN_COS + cross(axis, offset) * CELESTIAL_SPIN_SIN;

        pos.xyz = center + offset;
    }

    gl_Position = gl_ProjectionMatrix * pos;

    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    glcolor = gl_Color;
}
