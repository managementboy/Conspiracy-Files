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

return PublicAPI
