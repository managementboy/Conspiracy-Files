# T12 installed Build 42 API-discovery notes

**DEV-0.6 source correction:** installed ISRichTextPanel.paginate resets rgbCurrent to white; body text now starts with an explicit RGB command, with user/content angle brackets escaped using the renderer's &lt;/&gt; support. A 22 px sibling scrollbar reads the same body's scroll metrics. Source inspection establishes the rationale only; the owner must verify wheel, thumb, track, drag and contrast on the deployed version.

Status: source inspection with subsequently reported attended observations; final runtime feasibility remains unresolved. The [T12 report](../../docs/research/T12_UI_RUNTIME.md) separates archived DEV-0.4 callbacks and owner-reported failures from the unverified DEV-0.5 candidate fix. Statements below about wheel/scrollbar behavior apply to that earlier composition, not a universal ISRichTextPanel limitation or a passing result for the replacement control.

Inspected: 2026-09-03.
Installed source root: standard local Project Zomboid `media/lua/client/ISUI` tree; machine-specific absolute paths are intentionally not recorded as project requirements.

## Candidate native surfaces

| Requirement | Candidate surface observed in installed Lua | Probe obligation |
|---|---|---|
| Movable/resizable window | `ISCollapsableWindow`, `ISResizeWidget`, `setResizable` | Verify minimum size, child relayout and repeated resize behavior live |
| Geometry persistence | `ISCollapsableWindow.SaveLayout/RestoreLayout`, `ISLayoutManager` | Verify mod-owned layout key and off-screen clamping live |
| Long text | `ISRichTextPanel` plus a probe-owned sibling scrollbar | Wheel scrolling and repagination work live, but repeated attended runs showed that `ISRichTextPanel:addScrollBars()` did not paint a visible scrollbar in this resizable composition. Verify the dedicated control against the panel's live scroll metrics; do not reuse unsafe runtime print-media formatting. |
| Lists | `ISScrollingListBox` | Verify selection, wheel routing, compact transition and focus live |
| Section controls | `ISButton` or a probe-owned right-edge control group | Do not assume stock `ISTabPanel` supports right-edge tabs; validate custom composition without global overrides |
| Keyboard events | PZ `keyBinding` entries, `getCore():getKey()` and ordinary UI callbacks | Verify configurable Toggle Notebook binding and native X close behavior without stealing Escape or vanilla controls |
| Controller focus | `ISPanelJoypad`/`ISCollapsableWindowJoypad` conventions and `joypadNavigate` links | Verify discoverability and return path; an explicit unsupported result is acceptable |
| Relayout | Anchor setters, `onResize`/resize-widget callback patterns, `calculateLayout` examples | Verify font-size and resolution changes; source presence is not event-delivery evidence |

## Important design consequence

The stock `ISTabPanel` inspected locally renders horizontal tabs above its content. The approved right-edge Journal/Evidence treatment should therefore be tested as two labeled native buttons controlling two panels, not assumed to be a trivial orientation setting. If that custom composition harms keyboard/controller behavior, the live result must revise the visual treatment rather than introduce a global patch.

The inherited `addScrollBars()` route is also no longer a viable assumption for
the document panel: Build 42 accepted the child and retained wheel scrolling,
but no scrollbar was visible in the attended T12 window. The probe therefore
uses a separate, always-visible scrollbar control whose thumb is derived from
the rich-text panel's `getScrollHeight()`, `getScrollAreaHeight()` and
`getYScroll()` values. A dim full-height thumb denotes content that fits; a
shorter bright thumb denotes overflow.

## Prohibited shortcuts

- no replacement or modification of installed vanilla Lua;
- no copied/extracted PZ textures committed for redistribution;
- no dependence on browser CSS, DOM focus or ARIA behavior from the HTML prototype;
- no claim that source inspection proves runtime event delivery, clipping, focus or rendering;
- no custom font requirement until glyph, scaling, loading and license behavior pass live validation.
