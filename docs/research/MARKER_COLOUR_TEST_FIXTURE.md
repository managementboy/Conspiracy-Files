# Temporary marker colour fixture — 2026-09-06

Owner exhausted the current one-case save and explicitly chose temporary test notes over integrating further investigations. Fixture is developer-only, manually started, bounded to two physical Base.Note items at the current player square. It is not new conspiracy content and does not write discovered evidence or markers to canonical saves. Temporary annotations last for the session; leftover physical test notes may be discarded. Colour tests exercise the shared production palette selection and rendering, not normal pickup-source capture or persistence (already separately tested).

Installed Build 42.20.4 sources verify `character:getCurrentSquare():AddWorldInventoryItem(item,xOffset,yOffset,zOffset)` in `media/lua/shared/ActionManager.lua:16`; `square:AddWorldInventoryItem(item,0.0,0.0,0.0)` also occurs in `media/lua/server/Camping/SCampfireGlobalObject.lua:143`. Use bounded local square placement without world search. No Lua API existence is inferred from a web reference.

The existing Notebook hot-load bundle hosts an explicit fixture-start function so a running game need not index a newly installed Lua file before the owner can start it. Loading Notebook alone does not spawn notes.

Return-value verification: installed `shared/Items/OnBreak.lua:35` immediately treats the string-overload return as InventoryItem; `shared/TimedActions/ISDropWorldItemAction.lua:81` calls getWorldItem on its returned inventory item. Fixture uses the returned item directly, not getItem().
