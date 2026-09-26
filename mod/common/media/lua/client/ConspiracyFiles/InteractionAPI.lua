-- CFInteract's one PublicAPI table (module A, per docs/design/
-- MODULE_SEPARATION_2026-09-26.md sections 2.2 and 3 step 3). B or C may
-- call into A only through CFInteract.PublicAPI, never through A's own
-- internal files directly.
--
-- Grown from real straddler call sites, same as EngineAPI.lua/PDAAPI.lua:
-- OrganiserScreen.lua and KnoxApps.lua (module C) both reach into
-- Organiser.lua directly today - this exposes exactly that object.
ConspiracyFiles=ConspiracyFiles or {}
CFInteract=CFInteract or {}
local PublicAPI=CFInteract.PublicAPI or {}
CFInteract.PublicAPI=PublicAPI

-- require(): see EngineAPI.lua's own note on why this isn't a read off the
-- CFInteract global - PZ's file-load order across a directory can't be
-- relied on, but require() returns the same cached, real table regardless.
PublicAPI.Organiser=require("ConspiracyFiles/Organiser")

-- EvidenceRows.lua (reclassified to module B this increment - see
-- docs/design/MODULE_SEPARATION_2026-09-26.md section 3a) reaches into
-- two real module-A sources when building FILES/NAMES/PLACES rows:
-- ClueMarkers.note() and LocalPersonIntegration's own published
-- ConspiracyFiles.ObservedKeyLeads table (a small ad hoc "publish"
-- pattern already in this codebase, per its own comment: "leads must be
-- published there like IdentityObserver and KeyJournal are").
-- Lazy, not required here: EvidenceRows.lua reaches InteractionAPI from
-- deep inside a require chain that starts at EngineAPI.lua (EngineAPI ->
-- EvidenceRows -> InteractionAPI) and can loop back through PDAAPI.lua ->
-- KnoxApps.lua -> EngineAPI.lua if these were required at file-load time -
-- see EvidenceRows.lua's own call sites for the same lazy pattern.
function PublicAPI.clueMarkers() return require("ConspiracyFiles/ClueMarkers") end
function PublicAPI.observedKeyLeads()
    require("ConspiracyFiles/LocalPersonIntegration")
    return ConspiracyFiles.ObservedKeyLeads
end

return PublicAPI
