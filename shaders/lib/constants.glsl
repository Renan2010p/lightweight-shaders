// -------------------------------------------------------------
//  Lightweight Shaders | lib/constants.glsl
//  Named constants - no magic numbers anywhere else.
//
//  SPDX-License-Identifier: MPL-2.0
//  https://mozilla.org/MPL/2.0/
// -------------------------------------------------------------

#ifndef CONSTANTS_INCLUDED
#define CONSTANTS_INCLUDED

// --- Fog --------------------------------------------------------
const float FOG_END_SCALE = 0.98;
const float BLINDNESS_FOG_TIGHTEN = 0.93;
const float MIN_WATER_VISIBILITY = 2.0;
const float WATER_FOG_DIST = 20.0;
const float LAVA_FOG_DIST = 2.2;
const float POWDER_FOG_DIST = 6.0;

const int EYE_IN_WATER = 1;
const int EYE_IN_LAVA = 2;
const int EYE_IN_POWDER = 3;

// --- Lightmap (raw coordinate range) ----------------------------
const float LM_RAW_MIN = 1.0 / 32.0;
const float LM_RAW_SPAN = 30.0 / 32.0;

// --- Shadows ----------------------------------------------------
const float SHADOW_NORMAL_OFFSET = 0.02;
const float SHADOW_DEPTH_BIAS = 0.0006;
const float SHADOW_SLOPE_SCALE = 0.0018;
const float SHADOW_LIT_FLOOR = 0.25;
const float SHADOW_FADE_START = 0.9;
const float SHADOW_FADE_END = 1.0;
const float SHADOW_RAIN_SOFTEN = 0.6;
const float SHADOW_LOW_SUN_MIN = 0.05;
const float SHADOW_LOW_SUN_MAX = 0.25;

// --- Celestial reshape ------------------------------------------
// Vanilla draws the sun bigger than the moon (half-size 30 vs 20
// at 100 units away), so its corners sit at ~0.92 dot - the
// threshold must stay below that or the sun never fully rotates.
const float CELESTIAL_MATCH_DOT = 0.90;
const float CELESTIAL_SPIN_COS = 0.70710678;
const float CELESTIAL_SPIN_SIN = 0.70710678;

// --- Water ------------------------------------------------------
const float BLOCK_ID_WATER = 10001.0;
const float WATER_MIN_ALPHA = 0.62;
const float WATER_MAX_ALPHA = 0.97;
const float WATER_FRESNEL_ALPHA = 0.7;
const float WATER_SHEEN = 0.10;
const vec3 WATER_SHEEN_COLOR = vec3(0.90, 0.95, 1.00);

// --- Alpha cutouts ----------------------------------------------
const float CUTOUT_THRESHOLD = 0.102;
const float SHADOW_CUTOUT_THRESHOLD = 0.5;

// --- Sunset / vignette / screen-space water tint -----------------
const float SUNSET_WIDTH = 6.0;
const float SUNSET_PEAK = 0.35;
const float SUNSET_HORIZON_MIN = -0.15;
const float SUNSET_HORIZON_MAX = 0.05;
const vec3 SUNSET_TINT = vec3(1.12, 0.99, 0.87);
const vec2 VIGNETTE_RANGE = vec2(0.45, 0.85);
const vec3 UNDERWATER_TINT = vec3(0.85, 0.94, 1.10);
const float UNDERWATER_EYE = 1.0;

#endif
