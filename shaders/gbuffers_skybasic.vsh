#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | sky basic
//  sky gradient and void plane
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · gbuffers_skybasic.vsh
//  Ceu basico — gradiente e plano do void
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

varying vec4 glcolor;

void main() {
    gl_Position = ftransform();
    glcolor = gl_Color;
}
