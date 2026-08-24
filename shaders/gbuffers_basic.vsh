#version 120

// -------------------------------------------------------------
//  Lightweight Shaders | basic
//  lines and outlines (block selection, guides)
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

// -------------------------------------------------------------
//  Lightweight Shaders · gbuffers_basic.vsh
//  Linhas e contornos (selecao de bloco, guias)
//
//  SPDX-License-Identifier: MPL-2.0
//  This Source Code Form is subject to the terms of the Mozilla
//  Public License, v. 2.0. https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

varying vec4 glcolor;

void main()
{
    gl_Position = ftransform();
    glcolor = gl_Color;
}
