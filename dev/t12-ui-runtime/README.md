# T12 Build 42 ISUI runtime-feasibility probe

Status: preparation scaffold; not live-proven.

This disposable probe validates the minimum UI capabilities required by the approved v0.1 design. Synthetic known-state content is sufficient; no story state or production adapter is required.

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
| UI-05 | Long-body scrolling | Body scrolls independently; title and local actions remain fixed |
| UI-06 | Separate Help | Utility window is distinct; topmost Escape/close behavior is consistent |
| UI-07 | Font/resolution relayout | Essential text survives tested PZ font settings and target resolutions |
| UI-08 | Keyboard focus | Predictable route and visible focus across all required controls |
| UI-09 | Controller route | Discoverable open/navigate/activate/return path, or explicit unsupported verdict |
| UI-10 | Geometry persistence | Supported position/size fields restore without off-screen trapping |
| UI-11 | Coexistence | Vanilla and one additive foreign UI/menu listener remain functional |
| UI-12 | High contrast | Labels, boundaries and state geometry remain understandable without color/texture |

## Stop conditions

Stop on a security alert, unsupported build, non-disposable profile/save state, focus trap that prevents safe closure, unexplained vanilla UI suppression, or any need for a vanilla-file replacement/global monkey patch.

## Completion

Populate `docs/research/T12_UI_RUNTIME.md` and the evidence template with observed behavior at every tested resolution/font/input combination. Feed limitations back into the wireframe and visual specification before Issue #31 begins.
