-- NHInteract's one PublicAPI table (module A, per docs/design/
-- MODULE_SEPARATION_2026-09-26.md sections 2.2 and 3 step 3). B or C may
-- call into A only through NHInteract.PublicAPI, never through A's own
-- internal files directly.
--
-- Grown from real straddler call sites, same as EngineAPI.lua.
--
-- Organiser.lua/CaseFile.lua are NOT part of this mod at all (no PDA
-- item, per docs/design/MODULE_EXTRACTION_BLUEPRINT_2026-09-26.md - "we
-- do not have an organiser in the future"), so PublicAPI.Organiser is
-- deliberately absent rather than a require() left to fail silently.
NHShared=NHShared or {}
NHInteract=NHInteract or {}
local PublicAPI=NHInteract.PublicAPI or {}
NHInteract.PublicAPI=PublicAPI

-- Found by the stage-5 boundary check (tools/autotest/checks/
-- module_boundary.sh), not by hand: several module-B files reach these
-- four A files directly, some for real functionality
-- (GeneratedRuntime.lua calls PlayerVoice.onOpeningClue), some purely to
-- force PZ to load a file that only registers itself onto the shared
-- global table otherwise ("a module reached only through the shared
-- table can silently never exist" - DiscoveryLog.lua's own comment).
-- Both cases go through here now.
PublicAPI.PlayerVoice=require("NHShared/PlayerVoice")
PublicAPI.GeneratedMenu=require("NHShared/GeneratedMenu")
PublicAPI.ClueCue=require("NHShared/ClueCue")
PublicAPI.ClueSearch=require("NHShared/ClueSearch")

-- EvidenceRows.lua (reclassified to module B this increment - see
-- docs/design/MODULE_SEPARATION_2026-09-26.md section 3a) reaches into
-- two real module-A sources when building FILES/NAMES/PLACES rows:
-- ClueMarkers.note() and LocalPersonIntegration's own published
-- NHShared.ObservedKeyLeads table (a small ad hoc "publish"
-- pattern already in this codebase, per its own comment: "leads must be
-- published there like IdentityObserver and KeyJournal are").
-- Lazy, not required here: EvidenceRows.lua reaches InteractionAPI from
-- deep inside a require chain that starts at EngineAPI.lua (EngineAPI ->
-- EvidenceRows -> InteractionAPI) and can loop back through PDAAPI.lua ->
-- KnoxApps.lua -> EngineAPI.lua if these were required at file-load time -
-- see EvidenceRows.lua's own call sites for the same lazy pattern.
function PublicAPI.clueMarkers() return require("NHShared/ClueMarkers") end
function PublicAPI.observedKeyLeads()
    require("NHShared/LocalPersonIntegration")
    return NHShared.ObservedKeyLeads
end

return PublicAPI
