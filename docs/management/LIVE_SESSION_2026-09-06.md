# Live session — 2026-09-06

## Fresh-case first clue

Owner reported the overhead proximity hint appeared. Screenshot shows Dispatch copy / R-727 in inventory and inspected in DEV-0.8.1-markers notebook. Route text uses 103 4th St to 102 3rd St. MAP NOTE: finding location remembered; map marking waits for a pen or pencil. Console confirms source capture. This supports live pickup-source capture and pending-tool notebook state. Actual absence of the map X, moving away before inspection, pen catch-up, and mark persistence remain unverified by this screenshot. Earlier owner confirmed existing-save notebook/address regression.


## Pencil catch-up and font request

Owner confirmed no clue mark without a tool, then acquired a pencil. Screenshots show X #1 Dispatch copy / R-727 at 103 4th St while the player is elsewhere. Live no-tool suppression and pencil catch-up at the original finding location pass. Tool loss, second-clue catch-up and save/reload remain pending.

Owner requested vanilla Add Note lettering. ClueMarkers now obtains the same default map text-layer font through getSymbolsAPIv2/getDefaultTextLayerID and getStyleAPI/getLayerByName/getFont, matching installed ISWorldMapSymbols.lua lines259–261,1873–1874. UIFont.Handwritten fallback, then Small for incomplete mocks. Draw and measurement share the selected font; house numbers unchanged. This remains a mod overlay, not a native editable map annotation. Font appearance awaits live verification.

## Annotation placement preference

Owner permits smaller note lettering and rotation for improved placement. Native ISWorldMapSymbols sets symbol scale and rotation; the current clue overlay is not a native symbol and does not yet expose those controls. Screenshot still shows plain clue text. Console has a nil-call error after catch-up, without a marker-reload confirmation; earlier dofile reload instruction is not accepted as successful. Installed vanilla scripts use reloadLuaFile for reloads. Verify installed font change first using supported reload path before selecting further layout changes. No native-symbol conversion or rotation implementation claimed.

## Writing-tool ink and question symbol

Owner screenshot confirms handwritten font reload succeeded. Requested vanilla tool colour and question mark replacing X. Implemented optional validated ink identifier on written records, using installed ISWorldMapSymbols palette. Tool selection uses the vanilla palette order: black pen, pencil, red, blue, green; inventory type/tag recursive eligibility unchanged. Colour freezes at catch-up, including individually coloured labels at a shared source. Existing records without ink display neutral graphite, without claiming their historical tool is known. First known clue determines shared question colour.

Uses vanilla MapSymbolDefinitions Question texture (media/ui/LootableMaps/map_question.png), scaled to a compact maximum 28px and centred on original finding square; handwritten '?' fallback. Label spacing reserves symbol width. Still an overlay, not a draggable/rotatable native annotation. Verified ISUIElement drawTextureScaled signature locally. Marker and layout tests pass, including mixed ink, reload, legacy fallback and native texture centring; Notebook syntax passes; bundle synced.

Installed only ClueMarkers.lua and Notebook.lua with SHA256 verification. Backup: C:/Users/elkin.fricke/Zomboid/ConspiracyFiles-backups/20260906-112553-tool-ink-question. Live appearance pending reloadLuaFile("media/lua/client/ConspiracyFiles/ClueMarkers.lua"); ConspiracyFiles.ClueMarkers.start(). Do not use dofile.

## Writing-tool removal — live pass

Owner confirms removing the writing tool leaves existing map annotations intact. Persistence of already written marks across tool removal passes. New-clue queuing without a tool, subsequent catch-up, and save/reload remain separate checks.


## Marker appearance and shared location — live pass

Owner approved screenshot showing graphite handwritten labels and native question symbols: Dispatch copy / R-727 separately, File review / R-727 and Receiving copy / R-727 stacked at their shared finding location. Visual appearance and shared-location label layout pass. This screenshot alone does not establish the no-tool acquisition/reacquisition sequence or save/reload persistence; those remain unconfirmed.


## Map annotation save/reload — live pass

After being asked to save and reload to verify all three annotations survive, the owner confirmed success. Save/reload persistence of all three existing annotations passes. The separate new-clue-without-tool then reacquisition sequence remains unconfirmed.


## New-clue queue and tool reacquisition — live pass

Owner confirmed the requested sequence: finding a new clue without a writing tool leaves its map annotation pending; reacquiring a writing tool adds the queued mark. The core found-clue marker live checks now pass: initial no-tool suppression/catch-up, existing marks retained on tool removal, subsequent clue queuing/reacquisition, shared-location layout, approved handwritten graphite/question-symbol appearance, and persistence of all three annotations through save/reload. Other pen colours and pending-state persistence across save/reload were not separately confirmed by these reports.


## Explored areas and town maps — live pass

Owner confirmed the requested checks: unexplored neighbourhood house numbers remain hidden; exploring reveals house numbers; reading a Muldraugh map reveals numbers on houses exposed by that map. Undiscovered clues remain hidden; map reading does not reveal their markers. Runtime cost remains a separate, unmeasured gate.

## Pending marks across save/reload — live pass

Owner confirms completing the requested sequence: find and inspect a new clue without a writing tool, save and reload, then acquire a pencil. The pending annotation appears at the original finding location. Pending-state persistence and post-reload catch-up now pass live testing. Other pen colours, broader road coverage and measured runtime cost remain separate checks.

## Temporary colour-test notes — installed, not yet run live

Owner exhausted the case at approximately 10995,9700 and explicitly chose temporary test notes over multi-case integration. Added manually started two-note fixture at current player square, no changes to canonical case/journal/marker roots. Uses shared production drawRecords and writingTool. Fixture annotations are memory-only; physical TEMP TEST notes can remain and be discarded after the session. Both notes share a location; each label retains its individual ink, with shared question mark using the first known label's ink.

Primary corrected native placement return handling using installed OnBreak.lua:35 and ISDropWorldItemAction.lua:81 (returns InventoryItem directly). Mock tests pass for bounded spawn/reload, pending tool catch-up, red/blue freeze and inventory gating; existing marker regression and Notebook syntax pass. Updated bundle sync adds explicit UI.enableMarkerColourTest, without automatic spawning. Installed ClueMarkers.lua, Notebook.lua and MarkerColourTest.lua, SHA256 verified; backup C:/Users/elkin.fricke/Zomboid/ConspiracyFiles-backups/20260906-115559-temporary-colour-notes. No other offline features deployed. Usage checkpoint: 60% weekly used / 40% remaining before this bounded change.

Owner command: close notebook/map, then `reloadLuaFile("media/lua/client/ConspiracyFiles/Notebook.lua"); ConspiracyFiles.NotebookUI.enableClueMarkers(); ConspiracyFiles.NotebookUI.enableMarkerColourTest()`. Pick up TEMP TEST A and B; with only red pen inspect A via Inspect Temporary Marker Test, then with only blue pen inspect B. Wait an unpaused second after each. This is colour/render testing, not a new investigation or persistence test.

## Blue ink and temporary ground-note visibility — owner observations

Owner confirms blue marker colour. Screenshot shows TEMP TEST B text and question symbol in blue while real investigation annotations remain graphite: shared-renderer blue appearance passes live. Red ink and red-to-blue retention are not confirmed by this screenshot.

Temporary notes were accessible in the item list but initially not visually drawn on the floor. Owner reports picking up and dropping them makes the papers appear; screenshot shows visible papers. Track as a temporary fixture ground-placement rendering issue, cause unproven. This does not establish a production container-clue defect. No fix claimed; pickup/drop is an observed workaround.

## Red ink and blue retention — live pass

Owner confirmed both checks requested immediately beforehand: inspecting TEMP TEST A with only a red pen produces red annotation text, while TEMP TEST B retains its existing blue annotation. Red/blue tool colour selection and retention when switching tools pass live. Earlier graphite marks were also unchanged in the preceding screenshot. Green ink remains untested live. Temporary ground-paper initial visibility issue remains open with pickup/drop workaround.

## Map navigation and visible stability — live pass

Owner reports no issues and explicitly passes the requested pan, zoom-out/in, and repeated close/reopen checks. No observed flickering, duplicate annotations, misplaced labels, noticeable pauses or Lua errors during this check; zoom-dependent house-number visibility behaved as expected. This is an owner-observed usability/stability pass, not a measured frame-time or runtime-cost result.

## Notebook shortcut initial live feedback

Owner's fresh-save screenshot confirms icon beside Investigate Area and says journal opens. Requested hover-only reveal and click-to-close toggle. Initial always-visible behavior and open-only callback do not meet this refined interaction; scoped correction delegated to original UI task. Generic menu absence and native tooltip/scale acceptance not separately confirmed in this report.


## Notebook shortcut hover/toggle — fresh-game live pass

Owner reports flawless operation after requested fresh-game checks: hover-only reveal, pointer transition, click open/close and paused behavior. Supplied icon appears, but owner reports softness and requests exact asset dimensions. Visual sharpness remains to refine; no interaction defect reported.


## Inventory-menu regression — live pass

Owner passes all requested checks: ordinary inventory items no longer offer Open Journal/Open Survivor Notebook; collected investigation clues retain working Inspect Investigation Document; the inspected clue appears in the notebook opened via its toolbar icon. Prior hover/toggle acceptance was also explicitly reconfirmed. Icon sharpness remains a separate asset refinement awaiting the owner replacement.

## Replacement notebook icon — live pass

Owner confirms the supplied 64x48 transparent replacement icon looks correct and works. The notebook shortcut's requested interaction, inventory-menu regression and replacement asset are accepted live.

## Successive investigation R-208 and basement placement — live pass

After full game restart, nextCase(20260906) returned true and the log confirmed generation and placement activity. Owner explicitly confirms basement clue spawning passes. Screenshots show the basement proximity hint "Could this mean something?" and inspected R-208 entries #1 Dispatch copy, #2 File review and #3 Receiving copy together in the notebook. The latter two display map-marked status; their actual map placement is not independently shown in these screenshots. Earlier R-208 screenshot showed the handwritten #1 map marker.

Owner accepts "near Wood St" as the fallback while those street addresses are unavailable. Upper-floor placement, retention of evidence from two different investigations together, and successive-campaign save/reload remain pending; this basement pass does not establish those results.
## Wood St missing house number — pending, budget checkpoint

Owner screenshot codex-clipboard-f5d5f333-1b95-4375-815b-5a1291e48442.png shows an unnumbered large house opposite the #1 R-208 marker, northwest of Wood St / Perrine St intersection. Cause unverified: no address audit for this view in the inspected log. AddressMap.audit() is the existing read-only diagnostic for last close-zoom view; distinguish unassigned address from visibility/collision filtering before changing code. Screenshot also confirms #2/#3 R-208 handwritten markers with floor -1 labels. No save/reload acceptance inferred.

Usage check reached 70% weekly used / 30% remaining: stop development under owner's reserve rule. No fix or new worker dispatched. Resume with address view audit when budget permits; upstairs and multi-case persistence tests remain pending.

Owner subsequently lowered reserve to 25% remaining; development may resume. Next evidence needed: AddressMap.audit() for the close-zoom Wood St viewport, followed by unpaused ticks. No cause inferred from screenshot alone.
## Full viewport address audit installed

Owner cannot zoom closer; closing the map to use Lua console is expected. Audit's 60-detail cap omitted relevant buildings (25 drawn, 75 other footprints). Terra Low worker removed detail truncation, preserving 256-building/1 ms scan budget and draining queued details one per tick. PM reviewed source/live comparison: only audit function differs in AddressMap.lua and its Notebook bundle. Regression passes for 63 details including final audit-61, at most one detail per tick and no saved root replacement. Lua syntax passed. Installed both files with backup/hash verification: C:/Users/elkin.fricke/Zomboid/ConspiracyFiles-backups/20260906-150455-address-audit-complete. Missing house cause still pending fresh full audit. Load AddressMap with reloadLuaFile, start restored address service, view map, close, audit, unpause; no new save required.
## Evidence from two investigations together — native pass

Owner screenshot codex-clipboard-ff9a63a5-c395-4e96-bdfa-388d56a5fac2.png confirms R-208 entries #1-#3 remain while File review / R-781 appears as #4, inspected and showing its own District Maintenance Service text. This passes cross-investigation notebook retention and global discovery numbering, including discovering the earlier-generated investigation after the later one. Notebook reports finding location marked; actual #4 map annotation and persistence after save/reload remain to confirm. No claim that all R-781 documents have been inspected.
## Two-investigation map and persistence — native pass

Screenshot codex-clipboard-2ceceeb5-fc63-4ea5-8090-905d213b3a3e.png confirms #4 File review / R-781 alongside R-208 map annotations #1-#3, including floor -1 for basement findings. Following the explicit save/quit/reload request, owner reports "all working perfectly": accept retention of all four notebook entries and map annotations across reload. Core successive-investigation live acceptance passes for generation, physical discovery, cross-case evidence retention/global numbering, map annotations and save/reload. Upper-floor placement remains untested; Wood St missing number remains deferred. Automatic successive scheduling is not covered by this manual nextCase test.
## Mixed-evidence R-487 — seven discoveries and inspection pass

Owner screenshots confirm all seven entries in DEV-0.8.2-mixed-evidence: dispatch copy, receiving copy, private diary, press clipping, shift notebook, tagged key and file review. Rich what-found/story/possible-implication sections display, with resolved338 Perrine St and106 Chenault St addresses. User found a pen; screenshot818917f8 confirms catch-up annotations #1-#4, including diary/clipping, at their two finding locations. Key and review screenshots report marked status; actual map appearance of #5-#7 remains to confirm. Final screenshot9ec337f8 shows File review as#7 with all earlier entries retained. Discovery/inspection and notebook type projection pass for the mixed set. Save/reload of this seven-item revision and key-in-keyring inspection remain pending; do not infer these from earlier three-item revision passes.
## Mixed-evidence R-487 persistence — native pass

Screenshot1f9ed079 confirms all seven handwritten map annotations at338 Perrine St and106 Chenault St, including key/notebook. Owner then explicitly confirmed the requested save/quit/reload check: all seven notebook entries and map annotations survive. Mixed-evidence placement/discovery/inspection, seven-entry notebook retention, pen catch-up and map/save persistence are accepted live. Upper-floor placement and key-inside-keyring inspection remain untested. Automatic investigation scheduling is still not implemented. Minor label overlap with native road text is visible but no new fix requested; missing Wood St number remains deferred.
