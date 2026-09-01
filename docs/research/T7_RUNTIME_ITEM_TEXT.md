# Spike T7 — Runtime item text and native readers

- **Status:** Proven
- **Project Zomboid build tested:** Stable 42.20.4 b0bbce05d5; Steam build 24909800
- **Platform:** Windows 11 build 26200, single-player `-nosteam`
- **Probe path/commit:** `dev/t7-runtime-item-text/`; commit recorded by the enclosing T7 branch
- **API/event/classes used:** `InventoryItem`, `Literature`, `Key`, `MapItem`, item ModData, `ISUIWriteJournal`, `PZAPI.UI.PrintMedia`, `ISMap`

## Question

Which Build 42 item fields and vanilla reader paths safely carry world-specific resolved names, descriptions and bodies across save/reload for literature, photos, generic objects, keys and maps?

## Method

An isolated nine-item matrix stamped a disposable copied character save. Every item received a runtime custom name, `description`, and ModData title/description/body. Notebook, Note, LetterHandwritten and Photo also received two locked `Literature.customPages`; two further Literature items exercised translated-key and raw-runtime `printMedia`; Paperclip, Key1 and MuldraughMap exercised ordinary-object paths. The probe saved normally, reloaded, asserted every carrier, displayed the inventory, and opened the vanilla journal and print-media surfaces. Installed jar signatures and the exact vanilla Lua routes were inspected separately.

## Observed behaviour

- Runtime `setName` plus `setCustomName(true)` persisted and drove `getDisplayName()` for all nine item classes.
- Item ModData title, description and body persisted exactly for all nine classes.
- `setDescription` appeared before save but returned nil for every item after reload. It is not a persistence carrier.
- Runtime-enabled `Literature.customPages` persisted exactly on Notebook, Note, LetterHandwritten and Photo. A foreign `lockedBy` produced a read-only native journal with two pages.
- The native journal rendered plain text/newlines but displayed `<LINE>` and `<RGB:...>` literally. Its installed path limits each page to 15 lines / 1,200 characters.
- Translated `printMedia` keys resolved, and its translated title appeared in the native reader, but the tested runtime-shaped payload produced a blank document canvas/transcript. Raw runtime strings behave as translation keys rather than as an opaque body carrier: a plain title round-tripped, while a body containing `100%.` raised `UnknownFormatConversionException` and returned no text.
- Generic InventoryItem and Key retained names/ModData but offered no native body reader. MapItem retained names/ModData and its normal map action, but the map UI does not display the stored story body.
- All nine custom names were visible together after reload without breaking their normal inventory categories.

## Measurements

- 9/9 names persisted.
- 9/9 ModData title/description/body payloads persisted.
- 4/4 custom-page Literature carriers preserved two exact pages and lock state.
- 0/9 `InventoryItem.description` values persisted.
- The explicit save returned successfully in 300 ms.

## Limitations

- This was single-player `-nosteam` on one exact stable build and one English-language live run; German translation data was packaged but not independently launched.
- The print-media test used a minimal runtime-defined layout rather than every shipped brochure/newspaper definition. It proves that this runtime-shaped route is unsafe, not that shipped static media is broken.
- T10 later proved the cooperative custom `Inspect` action in player and Ground/loot inventory panes; direct-world-item right-click is unsupported. T7 supplies the storage and native-reader constraints that action consumes.
- The probe used representative vanilla types, not final production definitions or the complete Dead Air prose lengths.

## Verdict

Adopt the hybrid, but make its boundary explicit: custom name plus ModData is the canonical runtime carrier for every evidence object; the production custom `Inspect` reader renders world-specific bodies. Locked `customPages` are an optional native plain-text presentation only for deliberately short page-like artifacts, not the universal body store. Do not use `InventoryItem.description`, raw strings in `printMedia`, generic/key/map native UI, or runtime-shaped `printMedia` as the authoritative reader. Static pre-baked vanilla print media may remain decoration/content only after an asset-specific test.

## Decision links

- Resolves and supersedes the provisional wording of **P2-Q152-Q159 / P4-R08** with the explicit hybrid boundary above.
- Converts `CF-V01-E06` from spike-blocked to an executable production-adapter acceptance matrix.
- T10 remains required for the cooperative custom `Inspect` entry.
