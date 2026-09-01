# Build 42 Mod Tree

`mod/` is the installable `ConspiracyFiles` mod root. For a local Build 42
installation, place or link it at:

```text
Zomboid/mods/ConspiracyFiles/
├── common/media/lua/client/...
├── common/media/lua/shared/...
├── common/media/lua/shared/Translate/...
└── 42/mod.info
```

For Workshop packaging the same root belongs below
`Contents/mods/ConspiracyFiles/`.

The package targets the verified `42.20.x` minor line. Its engine-facing
surface uses additive `OnInitGlobalModData`, `OnGameStart`, `LoadGridsquare`
and `OnTick` listeners, the exposed Global ModData facade, exact P2/R2
container/building resolution, vanilla `Base.Note` instances and bounded
inventory/world identity observations. Binding signature changes fail closed.
The client surface adds one inventory-pane context listener, one configurable
notebook key listener, a custom reader and journal/evidence/help notebook UI.

These production surfaces are implemented offline, but live Build 42.20.4
acceptance is still required. Package presence does not claim the E02–E14 live
matrices have passed. It contains no graph, AI, packs, retrofit, migration or
multiplayer support.
