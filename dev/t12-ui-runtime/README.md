# T12 Build 42 ISUI runtime-feasibility probe

Current deployed debug build: **DEV-0.5-document-scrollbar**. The notebook title shows
this label so an attended run can confirm which probe file is loaded.

Status: attended iteration in progress, unresolved scrollbar/contrast failures; current DEV-0.5 candidate not live-proven. See [T12 report](../../docs/research/T12_UI_RUNTIME.md) for archived DEV-0.4 callbacks and direct owner observations. Verify version/hash and static corrections before requesting another retest.

This disposable probe validates the minimum UI capabilities required by the approved v0.1 design. Synthetic known-state content is sufficient; no story state or production adapter is required.

The candidate implementation is `common/media/lua/client/ConspiracyFilesT12Probe.lua`. It is guarded to a non-empty save with this probe as the sole enabled mod, and exposes one privately keyed `T12: Open UI capability probe` inventory-context action. PZ does not expose a reliable in-game save-name field, so the probe does not require renaming or editing the save folder.

## Local API-discovery baseline

Read-only inspection of the installed Build 42 Lua sources confirms candidate native surfaces including `ISCollapsableWindow`, resize widgets and layout persistence hooks, `ISRichTextPanel`, scrolling list controls, buttons and joypad-focus conventions. These names justify a probe implementation but do not prove live behavior or the approved visual geometry.

## Entry conditions

- Installed build identity is captured independently.
- The disposable save has only the T12 probe enabled.
- No extracted PZ asset is copied into the repository or redistributed.
- The test operator controls all keyboard, mouse and controller input manually.

## Capability matrix

| ID | Capability | Pass evidence |
|---|---|---|
| UI-01 | Movable/resizable notebook | Repeated move/resize with bounded minimum size and no broken children |
| UI-02 | Wide master-detail layout | List and detail remain usable at the approved desktop footprint |
| UI-03 | Compact layout | Resize triggers list-then-detail and explicit Back without clipped controls |
| UI-04 | Right-edge sections | Journal/Evidence labels remain readable, selectable and visibly active |
| UI-05 | Long-body scrolling | Body scrolls independently; title and local actions remain fixed; a visible dedicated scrollbar tracks wheel, page-click and drag position |
| UI-06 | Separate Help | Utility window is distinct; native X buttons close windows and the configurable Toggle Notebook binding opens/closes the notebook |
| UI-07 | Font/resolution relayout | Essential text survives tested PZ font settings and target resolutions |
| UI-08 | Keyboard focus | Predictable route and visible focus across all required controls; Escape remains reserved for the game options flow |
| UI-09 | Controller route | Discoverable open/navigate/activate/return path, or explicit unsupported verdict |
| UI-10 | Geometry persistence | Supported position/size fields restore without off-screen trapping |
| UI-11 | Coexistence | Vanilla and one additive foreign UI/menu listener remain functional |
| UI-12 | High contrast | Labels, boundaries and state geometry remain understandable without color/texture |

## Stop conditions

Stop on a security alert, unsupported build, non-disposable profile/save state, focus trap that prevents safe closure, unexplained vanilla UI suppression, or any need for a vanilla-file replacement/global monkey patch.

## Completion

Populate `docs/research/T12_UI_RUNTIME.md` and the evidence template with observed behavior at every tested resolution/font/input combination. Feed limitations back into the wireframe and visual specification before Issue #31 begins.
