#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | shadow pass
//  alpha cutout and depth writing
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · shadows.fsh
//  Passe de shadow map — recorte alpha e profundidade
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

uniform sampler2D texture;

varying vec2 texcoord;

void main() {
    if (texture2D(texture, texcoord).a < 0.5) discard;

    gl_FragData[0] = vec4(1.0);
}
