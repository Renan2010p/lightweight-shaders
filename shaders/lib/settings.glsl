// -------------------------------------------------------------
//  Lightweight Shaders | lib/settings.glsl
//  User options - exposed in the Iris "Shader Pack Settings" menu.
//
//  SPDX-License-Identifier: MPL-2.0
//  https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#ifndef SETTINGS_INCLUDED
#define SETTINGS_INCLUDED

// --- Lighting ---------------------------------------------------
#define NIGHT_MIN_LIGHT 0.05 // [0.00 0.02 0.05 0.08 0.12]

// --- Fog --------------------------------------------------------
#define FOG_START 0.55 // [0.35 0.45 0.55 0.65 0.75]

// --- Shadows ----------------------------------------------------
#define SHADOWS
const int shadowMapResolution = 1024; // [512 1024 2048]
const float shadowDistance = 80.0; // [64.0 80.0 96.0 112.0 128.0]
const bool shadowHardwareFiltering = true;

// --- Water ------------------------------------------------------
#define WATER_WAVES
#define WAVE_AMPLITUDE 0.035 // [0.015 0.025 0.035 0.050 0.070]

// --- Color grading ----------------------------------------------
#define EXPOSURE 1.12 // [0.90 1.00 1.12 1.25 1.40]
#define SATURATION 1.14 // [1.00 1.08 1.14 1.22 1.30]
#define CONTRAST 1.05 // [1.00 1.05 1.10]
#define WARMTH_STRENGTH 1.00 // [0.00 0.50 1.00 1.50]
#define VIGNETTE_STRENGTH 0.18 // [0.00 0.09 0.18 0.28]

#endif
