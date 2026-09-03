# T12 installed Build 42 API-discovery notes

Status: read-only source inspection; not live validation.

Inspected: 2026-09-03.
Installed source root: standard local Project Zomboid `media/lua/client/ISUI` tree; machine-specific absolute paths are intentionally not recorded as project requirements.

## Candidate native surfaces

| Requirement | Candidate surface observed in installed Lua | Probe obligation |
|---|---|---|
| Movable/resizable window | `ISCollapsableWindow`, `ISResizeWidget`, `setResizable` | Verify minimum size, child relayout and repeated resize behavior live |
| Geometry persistence | `ISCollapsableWindow.SaveLayout/RestoreLayout`, `ISLayoutManager` | Verify mod-owned layout key and off-screen clamping live |
| Long text | `ISRichTextPanel` | Verify plain authored characters, percent signs, scrolling and repagination live; do not reuse unsafe runtime print-media formatting |
| Lists | `ISScrollingListBox` | Verify selection, wheel routing, compact transition and focus live |
| Section controls | `ISButton` or a probe-owned right-edge control group | Do not assume stock `ISTabPanel` supports right-edge tabs; validate custom composition without global overrides |
| Keyboard events | `setWantKeyEvents` patterns and ordinary UI callbacks | Verify Escape and focus return without stealing vanilla controls |
| Controller focus | `ISPanelJoypad`/`ISCollapsableWindowJoypad` conventions and `joypadNavigate` links | Verify discoverability and return path; an explicit unsupported result is acceptable |
| Relayout | Anchor setters, `onResize`/resize-widget callback patterns, `calculateLayout` examples | Verify font-size and resolution changes; source presence is not event-delivery evidence |

## Important design consequence

The stock `ISTabPanel` inspected locally renders horizontal tabs above its content. The approved right-edge Journal/Evidence treatment should therefore be tested as two labeled native buttons controlling two panels, not assumed to be a trivial orientation setting. If that custom composition harms keyboard/controller behavior, the live result must revise the visual treatment rather than introduce a global patch.

## Prohibited shortcuts

- no replacement or modification of installed vanilla Lua;
- no copied/extracted PZ textures committed for redistribution;
- no dependence on browser CSS, DOM focus or ARIA behavior from the HTML prototype;
- no claim that source inspection proves runtime event delivery, clipping, focus or rendering;
- no custom font requirement until glyph, scaling, loading and license behavior pass live validation.
