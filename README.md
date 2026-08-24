# Lightweight Shaders

A minimal shaderpack for Minecraft Java (Iris), built to run smoothly on weak
hardware — integrated GPUs like the Intel HD Graphics 4400 (i3-4170) and other
low-end PCs — while keeping an elegant, clean look.

**License: [MPL-2.0](LICENSE)**

## Why it is lightweight

- **Zero extra passes**: only the gbuffers + a single final pass
- **Optimized shadows**: hardware PCF (1 tap), compact map, casters culled
  outside the shadow range, translucents excluded from the shadow pass
- **Per-vertex fog**: the fragment shader only does one `mix`
- No bloom, no SSAO, no TAA, no volumetrics

## What it does for the visuals

- ACES tonemap with adjustable exposure, saturation and contrast
- Subtle warm tint at sunrise/sunset
- Soft shadows that follow the player and entities
  (slope-scaled bias: no acne, no detached shadows)
- Water with surface waves and fresnel at grazing angles
- Torches stay lit inside shadows; nights are never pitch black
- Elegant fog that hides chunk loading
- Optional light vignette
- Sun and moon rendered as diamonds

## Installation

1. Install **Iris** (with Sodium) — recommended for extra FPS.
2. Zip the `shaders` folder (the zip must have `shaders/` at its root):

   ```bash
   cd lightweight-shaders
   zip -r ../lightweight-shaders.zip shaders
   ```

   Or just download a ready-made zip from the
   [Releases](https://github.com/Renan2010p/lightweight-shaders/releases)
   page.

3. Drop the `.zip` (or the pack folder) into `.minecraft/shaderpacks/`.
4. In game: Options → Video Settings → Shader Packs → select the pack.

## Code structure

```
shaders/
├── lib/
│   ├── settings.glsl    User options (Iris settings menu)
│   ├── constants.glsl   Named constants (no magic numbers anywhere)
│   ├── fog.glsl         Fog factor + application
│   ├── shadows.glsl     Shadow map: setup and sampling
│   ├── lighting.glsl    Lightmap × shadow × tint
│   ├── tonemap.glsl     ACES (Narkowicz)
│   └── gbuffer.glsl     Aggregator: varyings, setupVertex, wrappers
├── gbuffers_*           Geometry programs (terrain, water, entities…)
├── shadows.*            Shadow map pass (depth only)
└── final.*              Single post-processing pass
```

Code conventions: braces on the next line, explicit `in` parameters,
dependencies passed as arguments, clearly named guard clauses.

## In-game options

Options → Video Settings → Shader Packs → Shader Pack Settings:

| Option | Description |
|---|---|
| Exposure / Saturation / Contrast | Color grading |
| Vignette | Darken screen edges |
| Sunset warmth | Warm tint at dusk |
| Fog start | Distance where fog begins |
| Night minimum light | Minimum visibility in the dark |
| Water waves / Wave height | Water surface animation |
| Shadows / Resolution / Distance | Toggle and tune the shadow map |

## Performance tips for low-end PCs

- Iris + Sodium: 8–10 chunk render distance
- If you need every last FPS: turn Shadows OFF and clouds OFF
- Keep Mesa drivers up to date (Linux) or use the latest Intel driver
  (Windows)

## License

Distributed under the **Mozilla Public License 2.0**. Every shader file
carries the SPDX header; the full text is in [LICENSE](LICENSE).
