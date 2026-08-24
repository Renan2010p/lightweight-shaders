# Lightweight Shaders

Shaderpack minimalista para Minecraft Java (Iris), feito para rodar liso em
iGPU fracas — como a Intel HD Graphics 4400 do i3-4170 — mantendo um visual
elegante e limpo.

**Licença: [MPL-2.0](LICENSE)**

## Por que ele é leve

- **Zero passes extras**: só os gbuffers + um único passe final
- **Sombras otimizadas**: hardware PCF (1 tap), mapa compacto, culling de
  quem está fora do alcance, translúcidos fora do passe de sombra
- **Névoa por vértice**: o fragment shader só faz um `mix`
- Sem bloom, sem SSAO, sem TAA, sem volumetria

## O que ele faz pelo visual

- Tonemap ACES + exposição, saturação e contraste ajustáveis
- Toque quente sutil no nascer/pôr do sol
- Sombras suaves que acompanham o jogador e as entidades
  (bias por inclinação: sem acne nem "sombra solta")
- Água com ondas na superfície e fresnel nos ângulos rasantes
- Tocha acesa dentro da sombra; noite nunca totalmente escura
- Névoa elegante que esconde o carregamento de chunks
- Vinheta leve (opcional)

## Instalação

1. Instale o **Iris** (com Sodium) — recomendado para ganhar FPS extra.
2. Compacte a pasta `shaders` (o zip precisa ter `shaders/` na raiz):

   ```bash
   cd lighweight-shaders
   zip -r ../lightweight-shaders.zip shaders
   ```

3. Coloque o `.zip` (ou a pasta do pack) em `.minecraft/shaderpacks/`.
4. No jogo: Opções → Vídeo → Pacotes de Shader → selecione o pack.

## Estrutura do código

```
shaders/
├── lib/
│   ├── settings.glsl    Opções do usuário (menu do Iris)
│   ├── constants.glsl   Constantes nomeadas (zero números mágicos)
│   ├── fog.glsl         Fator de névoa + aplicação
│   ├── shadows.glsl     Shadow map: setup e amostragem
│   ├── lighting.glsl    Lightmap × sombra × tint
│   ├── tonemap.glsl     ACES (Narkowicz)
│   └── gbuffer.glsl     Agregador: varyings, setupVertex, wrappers
├── gbuffers_*           Programas de geometria (terrain, water, entities…)
├── shadows.*            Passe de shadow map (profundidade)
└── final.*              Único passe de pós-processamento
```

Convenções do código: chaves na linha seguinte, parâmetros `in` explícitos,
dependências passadas como argumento, guard clauses com nomes claros.

## Opções dentro do jogo

Opções → Vídeo → Pacotes de Shader → Configurar:

| Opção | Descrição |
|---|---|
| Exposição / Saturação / Contraste | Acabamento de cor |
| Vinheta | Escurecer bordas da tela |
| Calor no pôr do sol | Tonalidade quente ao entardecer |
| Início da névoa | Distância onde a névoa começa |
| Luz mínima noturna | Visibilidade mínima no escuro |
| Ondas na água / Altura | Animação da superfície da água |
| Sombras / Resolução / Alcance | Liga/desliga e ajusta o shadow map |

## Dicas de desempenho para o i3-4170 (HD 4400)

- Iris + Sodium: render distance 8–10 chunks
- Se precisar do último FPS: Sombras OFF e nuvens desligadas
- Mantenha o driver Mesa atualizado (Linux) ou o driver Intel mais recente
  (Windows)

## Licença

Este projeto é distribuído sob a **Mozilla Public License 2.0**. Os arquivos
de shader carregam o cabeçalho SPDX correspondente; o texto completo está em
[LICENSE](LICENSE).
