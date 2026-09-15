# Notebook toolbar shortcut — development handoff

## Delivered offline increment

- Removed the generic inventory context-menu entries that opened the notebook:
  `Open Investigation Journal` (generated mode) and `Open Survivor Notebook`
  (legacy menu). Item-specific `Inspect Investigation Document`, `Inspect
  Document`, and `Mark Interesting` actions are unchanged.
- Added `NotebookToolbar.lua`, an additive top-level `ISButton` positioned to
  the right of `ISEquippedItem.instance.searchBtn` (the verified Build 42.20.4
  Investigate Area control). It opens the existing `Notebook` in its Evidence
  view, so the current generated/legacy projection continues to choose the
  appropriate notebook content.
- The button has no vanilla override: it is managed by one cooperative
  `OnTick` listener, follows the live sidebar/search position and dimensions,
  hides with the anchor, and removes/recreates its own instance if the sidebar
  is recreated. It is debug single-player generated-mode only, matching the
  supported G2 gate. Tooltip: `Open Survivor Notebook`.

## Visual/reference basis

The owner-provided Project Cook screenshot was inspected after the initial
handoff. It shows a frying-pan button as a same-size floating sibling directly
to the right of Crafting in the left vertical sidebar. This implementation
uses that arrangement, anchored specifically to Investigate Area/Search as
requested. The notebook is code-rendered rather than a copied asset: muted
paper, dark outline, ruled lines and a small red evidence pin, designed to
remain legible at the native square toolbar size.

## Verification and remaining manual gate

Run Lua syntax and mock tests before review. Mock checks can verify that the
generic menu option is absent, Inspect remains, and a single button follows a
recreated sidebar; they cannot prove native clipping, hover/tooltip ordering,
sidebar scale, controller navigation or visual acceptance. A manual owner run
must verify those points at the supported Build 42.20.4 UI scales, including
reload/hot-load without duplicate buttons. No live deployment or game input
was performed by this task.

## PM review and isolated live install — 2026-09-06

PM ran test/notebook_toolbar.lua and test/notebook_menu.lua successfully. Added reload/listener reuse, hidden-anchor and T12 gate coverage; generic generated journal menu removed while item Inspect still activates. Added T11/T12 gating and a one-shot failure boundary to toolbar. Verified native searchBtn positioning/ignoreWidthChange/tooltip methods in installed ISUI source. No native visual acceptance claimed.

UI-only files staged under artifacts/notebook-toolbar-live from the current installed baseline, preserving existing marker/colour fixture while excluding evolving successive-case source. Added Notebook bootstrap bundle, copied NotebookToolbar, removed only generic journal options from installed ContextMenu and GeneratedMenu. tools/sync_notebook_bundles.py now regenerates this toolbar bundle in future source builds; successive worker instructed to run sync after its changes.

Installed four files with SHA256 verification. Backup C:/Users/elkin.fricke/Zomboid/ConspiracyFiles-backups/20260906-122508-notebook-toolbar. All staged Lua syntax checks pass. Restart loads button automatically; current-session command: close notebook/map, then reloadLuaFile("media/lua/client/ConspiracyFiles/Notebook.lua"); reloadLuaFile("media/lua/client/ConspiracyFiles/ContextMenu.lua"); reloadLuaFile("media/lua/client/ConspiracyFiles/GeneratedMenu.lua"). Unpause briefly to let sidebar visibility update. Manual gates: adjacent icon appearance/click, tooltip, no generic journal item menu, Inspect retained, HUD visibility, repeated reload, scale. Successive integration remains undeployed.

## Live follow-up requested — hover and toggle

Owner confirmed native placement, appearance and opening. The button now starts
hidden and appears only when Search/Investigate Area is hovered. Native
`ISUIElement:isMouseOver()` is checked on both anchor and notebook button; a
four-`OnTick` grace bridges the empty gap, then the button hides after leaving
both. HUD/anchor hiding clears the grace immediately. Clicking now closes an
already-visible notebook and otherwise opens the existing Evidence view.
Focused mocks cover search -> gap -> button -> outside visibility, HUD hiding,
open/close/reopen, sidebar recreation and module reload/listener retention.
Native timing remains frame-dependent: the exact grace duration must be
accepted manually at the owner’s frame rate; no live action was performed here.

To support paused-game UI hover, the toolbar uses the verified native
`Events.OnPostUIDraw` surface rather than world `OnTick`; it retains exactly
one listener across hot reload. Search initiates a reveal that lasts 250 ms;
while revealed, its 4 px physical gap to the notebook is treated as one bridge
region and notebook hover refreshes the reveal. A hidden button alone cannot
initiate visibility. This avoids a sidebar-method patch and keeps the native
sidebar untouched.

PM review: removed an accidentally retained installPrerender helper/call from the worker candidate; corrected test to assert no sidebar wrapper exists, and tested upgrade removal of the old tick listener. Toolbar tests and staged Notebook syntax pass. Installed Notebook.lua and NotebookToolbar.lua from isolated live-baseline stage artifacts/notebook-toolbar-hover with backup/SHA256 verification. Hover/toggle awaits owner run; reload only Notebook.lua. No successive-case deployment.


Owner supplied replacement PNG codex-clipboard-4baa3f36-310f-414d-8762-de15a780a120.png. Copied unchanged to mod/common/media/ui/ConspiracyFiles/notebook.png (161x146; original black corner opaque). Toolbar uses native ISButton image scaling with preserved aspect, and replaces prior procedural button on reload. Worker focused test and staged Notebook syntax passed. Installed isolated live-baseline Notebook bundle, NotebookToolbar and PNG with backup/SHA256 verification. Owner can reload Notebook.lua; native icon appearance pending. Source bundle sync must include this latest toolbar and asset in subsequent builds.


## Owner acceptance

Fresh-game hover reveal, pointer transition, click open/close and paused behavior passed. Inventory-menu removal, retained clue inspection and evidence displayed through the toolbar-opened notebook also passed. Supplied icon displays; owner requested sharper asset sizing (current saved sidebar configuration yields 64x48 button). Replacement transparent icon pending; this does not invalidate interaction passes. See LIVE_SESSION_2026-09-06.md.

Owner provided Downloads/notebook_icon_64x48.png. Copied unchanged into source/live media/ui/ConspiracyFiles/notebook.png; verified dimensions 64x48 and installed SHA256. Previous icon backed up. No Lua/interaction changes. Running game may retain cached prior texture; full game restart loads replacement reliably, no new save required.

