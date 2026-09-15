# Observed identity documents — Build42.20.4

P4-R65 development slice: journal records for cards the player actually sees. Occupation assignment and corpse evidence planting remain separate work. Known candidate corpse:10792,10287,0 from the identity probe; never expose its hidden descriptor in these journal entries.

## Verified installed source

`media/lua/client/ISUI/ISInventoryPane.lua`: render at2755 invokes details rendering; renderdetails builds self.items from displayed stack rows when doDragged=false, stores stack representative versus individual items, and stops at collapsed groups. It draws row text at rowIndex*itemHgt+headerHgt+scroll and clips to the pane. The observer cooperatively calls the original render first, then uses only self.items in details mode. It requires the pane and parent really visible, parent not collapsed, no active drag, and a fully visible row below the header. Icons mode fails closed. Hidden items are excluded by vanilla refresh and checked again. A closed wallet yields only its wallet row; contents are read only as displayed rows of the selected opened wallet container. No recursive item enumeration, descriptor lookup, loot generation or item mutation.

Installed generated/items/literature.txt defines IDcard, IDcard_Stolen, IDcard_Female, IDcard_Male, IDcard_Blank. generated/items/normal.txt defines CreditCard and CreditCard_Stolen. Blank IDs are excluded. Only existing getDisplayName is captured, as in the read-only identity probe; no parsing/invention of a person's identity or profession. Item IDs distinguish physical cards with the same name; native item-ID persistence still needs acceptance testing. Missing/zero/nonfinite IDs fail closed.

## Implementation

Pure IdentityObservations validates schema1 and up to128 strict scalar records, snapshots first observation and deduplicates by fullType:itemID. IdentityObserver reads up to16 displayed rows per render and queues up to16 observations, writes one per10 ticks with protected errors. No full world or inventory scan. Persisted root ConspiracyFiles.IdentityObservations.canonical is validated before replacement and counted by every SaveBudget writer inside the500KB combined budget. Existing cases are untouched; no old-save migration. Runtime-only seen/queue caches reset on game start. Requires current debug single-player generated trial to be active, matching current mod scope.

Journal adds a separate factual row per observed card, currently appended after generated investigation rows (not a merged chronological timeline). Evidence list and map markers are unchanged. Coordinates represent the player's observation position, not an inferred residence or corpse identity. A wallet picked up unopened can be opened later and observed as a wallet; corpse origin is not invented retrospectively.

## Verification and native acceptance

Pure Lua5.1 checks cover strict fields, scalar/finite values, sparse arrays, cap128, immutable input, duplicate physical IDs versus duplicate names, named variants and blank exclusion. Mock native adapter checks visible/hidden/collapsed panels, unsupported icons, closed/open wallet, clipped/scrolled rows, save-cache reset/dedup, missing IDs, failed writes, peer save-budget refusal, bounded queue and MP guard. Existing generated runtime, notebook-menu and save-budget checks pass. These are not native play acceptance.

Restart PZ fully for the new Lua modules. In a generated trial, open a corpse's inventory containing a named ID/credit card and display its row: Journal should add it without pickup/right-click. Reopen: no duplicate. Closed wallet: no entry for its contents. Open wallet and display card: one entry. Save/quit/reload and reopen: same entry count and label. The player inventory's direct contents (including their starting ID) are excluded. Existing world containers and selected bags are supported; floor loot is excluded. Test with actual existing cards; no fixture was planted by this implementation.

Installed2026-09-06: IdentityObservations.lua, IdentityObserver.lua, SaveBudget.lua and Notebook.lua, all source/live hashes matched. Backup20260906-170746-identity-observations. Actual Notebook rows integration also mock-tested to append journal observations without changing the evidence list. No native acceptance claimed yet.

Follow-up: visible tickets and all three installed business-card variants (BusinessCard, BusinessCard_Personal, BusinessCard_Nolans) are supported. Business-card definitions verified in generated/items/literature.txt at2591/2604/2617. Same visibility gate and factual displayed-label capture; do not equate a business card with the identity or job of whoever carried it.

Native acceptance2026-09-06: screenshots show Found ID Card: Damian McGowan, source corpse belongings, observed near10799,10280 (floor0). Owner subsequently confirms transfer to own inventory plus save/reload retain the original entry/source/location without duplication. Card was manually placed on the corpse for this test, so this does not establish original ownership. Direct corpse observation/persistence passes; nested wallet provenance and other document variants remain unverified. Visible journal numbering collision (#1 identity following#1–#3 case entries) remains a UI issue.
