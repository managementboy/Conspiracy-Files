-- CFPDA's one PublicAPI table (module C, per docs/design/
-- MODULE_SEPARATION_2026-09-26.md sections 2.2 and 3 step 3). A or B may
-- call into C only through CFPDA.PublicAPI, never through C's own
-- internal files directly.
--
-- Grown from real straddler call sites, same as EngineAPI.lua: Organiser.lua
-- (module A) already reaches into OrganiserScreen.open/.window and
-- KnoxApps.rememberMe at 5 real call sites - this exposes exactly those two
-- objects, kept as the exact same call shapes, rather than a redesigned
-- narrow interface guessed at upfront.
ConspiracyFiles=ConspiracyFiles or {}
CFPDA=CFPDA or {}
local PublicAPI=CFPDA.PublicAPI or {}
CFPDA.PublicAPI=PublicAPI

-- require(), not a read off the CFPDA global: see EngineAPI.lua's own note -
-- PZ's file-load order across a directory can't be relied on, but require()
-- returns the same cached, already-initialized table regardless of it.
PublicAPI.OrganiserScreen=require("ConspiracyFiles/OrganiserScreen")
PublicAPI.KnoxApps=require("ConspiracyFiles/KnoxApps")

return PublicAPI
