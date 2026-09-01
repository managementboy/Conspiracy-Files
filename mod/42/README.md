# Build 42 Mod Tree

`mod/` is the installable `ConspiracyFiles` mod root. For a local Build 42
installation, place or link it at:

```text
Zomboid/mods/ConspiracyFiles/
├── common/media/lua/shared/...
└── 42/mod.info
```

For Workshop packaging the same root belongs below
`Contents/mods/ConspiracyFiles/`.

The current shell targets the verified `42.20.x` minor line. Its engine-facing
surface is deliberately limited to additive `OnInitGlobalModData`,
`OnGameStart`, and `OnTick` listeners plus the exposed Global ModData facade.
Live production-adapter acceptance is still required on Build 42.20.4; the
presence of this package does not claim CF-V01-E09/E11/E12/E13 passed.
