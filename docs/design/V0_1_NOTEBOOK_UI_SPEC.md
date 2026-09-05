# v0.1 usable notebook UI specification

Status: conditional implementation target; T12 runtime feasibility is in progress with unresolved scrollbar/contrast failures, and T11 composition is unaccepted. These gates cover functional correctness as well as visual/input usability. See [PM audit](../management/PM_TAKEOVER_AUDIT_2026-09-05.md).

## Goal

Provide one small, durable retrieval surface for everything the survivor has actually encountered. The player can open it from an explicit inventory-pane action, browse Journal or Evidence in discovery order, read complete known documents, and see only knowledge-bounded leads or connections. Inspect and Mark Interesting update an already-open notebook immediately.

## First usable surface

- `Open Survivor Notebook` is a cooperative inventory-pane context-menu action. The production UI also exposes an unassigned-by-default, configurable `Conspiracy-Files: Toggle Survivor Notebook` binding; it opens or closes the notebook when the player chooses a keyboard/controller button, while native X buttons close individual windows. Escape remains reserved for the game options flow.
- P4-R47 records the owner-approved X/configurable-toggle behavior. The implemented keyBinding path does not establish controller mapping/support; that requires an explicit T12 observation.
- The notebook is one movable, resizable `ISCollapsableWindow` with `Journal` and `Evidence` buttons, a list, a detail panel, and Close.
- At wide widths the list and detail appear together. At compact widths selection opens detail and `Back to list` returns to the list.
- Journal and Evidence are always ordered oldest to newest, using canonical ordinals rather than authored asset order.
- Empty Journal and Evidence states are useful and non-quest-like.

## Evidence row and detail contract

Every acquired record shows:

1. player-known title;
2. type (`Document` or `Marked object`);
3. discovery ordinal;
4. found-location label when recorded, otherwise `Location not recorded`;
5. state (`Inspected` for authored documents or `Marked interesting` for player-marked objects);
6. immutable original context;
7. complete authored body for known documents, or an explicit explanation that a marked object has no document text;
8. a short authored `What this is` context line for known documents, expanding abbreviations and identifying the document's practical purpose; the same context appears at the top of the immediate Inspect reader;
9. unresolved leads derived from known evidence and still-unconfirmed locations;
10. derived connections whose labels are disclosed by this evidence, plus contradiction/recontextualisation notes only when the related evidence is already known.

No evidence title, body, context line, lead, connection, or relation is read from an undiscovered asset. Static authored content is resolved only through a canonical Evidence record. Context lines explain terms such as CSS when the player first encounters them; they do not reveal hidden conclusions.

## Journal contract

Each journal row shows its canonical ordinal, `Major`/`Journal`, and deterministic rendered wording. Detail repeats the full wording and event kind. The UI never adds objectives, solved state, progress, truth claims, or hidden diagnostics.

Content follow-up: the current event wording is intentionally a compact
development pass. Before the story-facing release, expand each selected Journal
detail into atmospheric prose that gives the survivor sensory, human and
practical context. Keep the row title and state label concise for scanning, and
do not add facts or conclusions that are not supported by the evidence already
known to the player.

## Inspect contract

`Inspect Document` performs an idempotent domain discovery and persistence commit before opening a reader. The reader shows the resolved title, contextual introduction and complete authoritative body. If the notebook is already open it refreshes immediately and selects the resulting evidence record. Repeat inspection opens the same body without duplicating Evidence or Journal entries. Internal thread identifiers remain diagnostic/logging details rather than player-facing labels.

## Refresh and failure behavior

- Opening or refocusing the notebook rebuilds its view from `Runtime.state`.
- Successful Inspect and Mark Interesting call the same refresh function synchronously after persistence.
- Selection is retained by stable entry/evidence ID where possible.
- Every PZ-facing action is contained by `pcall`; a UI failure logs one concise boundary error and does not roll back already-committed discovery truth.
- The implementation uses only the `ConspiracyFiles` namespace and additive event handlers.

## Explicit deferrals

- live validation of the existing configurable global keybind;
- attention/read-state behavior; the separate Help utility remains an approved requirement and is missing from the current production candidate;
- keyboard/controller focus graph and controller opening;
- geometry persistence and off-screen recovery;
- final fonts, textures, icons, sounds, and visual polish;
- player-facing physical availability/conflict states;
- graph, search, sort, filters, theories, objectives, and map markers.

## Acceptance checks for this increment

1. A plain-Lua projection test discovers documents in non-authored order and observes the same order in Evidence.
2. Document and marked-object details contain type, status, context, and appropriate body behavior.
3. Found locations use current derived labels and missing locations remain explicit.
4. Leads disappear once their location is confirmed.
5. Contradiction and B-37 recontextualisation appear only after their known prerequisites.
6. Existing domain tests remain green.
7. Live Build 42 rendering/input remains unclaimed until T12 and the production integration matrix are run.
