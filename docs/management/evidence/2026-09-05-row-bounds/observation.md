# Owner-observed T12 row overflow

The supplied screenshot shows DEV-0.6-shared-document-panel with a visible document scrollbar and readable dark ink. Pale list summaries extend across the document. Layout verdict: Fail. Scrolling interaction, high contrast and focus cannot be accepted from this still image.

DEV-0.6.1-row-bounds limits both list text lines to measured available width, caches shortened labels per width/font height, preserves UTF-8 boundaries and skips off-screen rows/lines. The full title/content remains in detail. Installed ISScrollingListBox already applies a stencil; the fix avoids relying on it for oversized text at the observed scale.

42 offline tests and 37 syntax parses pass. The two changed live UI files were backed up, installed and hash-verified. No automated game input occurred. Post-fix visual confirmation remains pending. The earlier DEV06 ZIP is the pre-hotfix bundle; the live folder now includes this focused patch.

For the current session: close the notebook with its X, then manually execute reloadLuaFile("media/lua/client/ConspiracyFiles/Notebook.lua") in the ordinary debug console. Reopen from the guide and check the title for DEV-0.6.1-row-bounds. This updates UI only; no world/runtime reload or save reset is required by this patch. If the engine reports a reload error, capture it before retrying.
