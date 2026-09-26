-- The bridge between module A's Organiser.lua and module C's real PDA
-- screen. This file is genuinely module C: it is the only place that
-- reaches PDAAPI.OrganiserScreen/.KnoxApps to act on what Organiser.lua
-- wants, and the only place that reads the real screen's state back into
-- Organiser's own O.on/O.screenBooting/O.lampOn fields.
--
-- Two directions, per docs/design/MODULE_EXTRACTION_BLUEPRINT_2026-09-26.md
-- section 0/2/6:
--   command:  Organiser.lua emits organiser.open/.close/.boot/.rememberMe
--             through InteractionEvents; this file turns each into the
--             real PDAAPI call.
--   sync:     every tick, this file reads the real screen's window/lamp
--             state and writes it back into InteractionAPI.Organiser's
--             own fields - covering "the screen can be closed by
--             something other than the hand", which Organiser.lua used
--             to notice by reading the screen directly and now notices
--             because this file tells it.
--
-- A mod shipped without this file (no module C at all) simply never runs
-- either direction: Organiser.lua's O.on/O.screenBooting/O.lampOn stay at
-- their honest default (false), which is exactly correct - no screen
-- means nothing is ever "on".
local InteractionEvents=require("ConspiracyFiles/Events/InteractionEvents")
local InteractionAPI=require("ConspiracyFiles/InteractionAPI")
-- PDAAPI is deliberately NOT required at this file's own top level: this
-- file is force-loaded by PDAAPI.lua itself (see PDAAPI.lua's own bottom
-- line), and PDAAPI requiring this file, which requires PDAAPI back at
-- load time, would be a direct circular require. Every access below is
-- lazy, at the point of use, which is also correct since it's the same
-- convention every other C<->A/B reach in this codebase already follows.

InteractionEvents.subscribe("organiser.open", function()
    local screen=require("ConspiracyFiles/PDAAPI").OrganiserScreen
    if screen and screen.open then pcall(screen.open) end
end)

InteractionEvents.subscribe("organiser.boot", function()
    local screen=require("ConspiracyFiles/PDAAPI").OrganiserScreen
    if screen and screen.boot then pcall(screen.boot) end
end)

InteractionEvents.subscribe("organiser.close", function()
    local screen=require("ConspiracyFiles/PDAAPI").OrganiserScreen
    if screen and screen.close then pcall(screen.close) end
end)

InteractionEvents.subscribe("organiser.rememberMe", function()
    local apps=require("ConspiracyFiles/PDAAPI").KnoxApps
    if apps and apps.rememberMe then pcall(apps.rememberMe) end
end)

-- DiscoveryLog.lua/MapMediaRuntime.lua (module B) emit this instead of
-- reaching PDAAPI.OrganiserScreen directly when new content appears -
-- the same command direction as the organiser.* events above, just from
-- B instead of A.
require("ConspiracyFiles/Events/EngineEvents").subscribe("discovery.changed", function()
    local screen=require("ConspiracyFiles/PDAAPI").OrganiserScreen
    if screen and screen.window then screen.window.cachedList=nil end
end)

-- The sync tick: same cost and same cadence as the polling Organiser.lua
-- used to do itself (this handler is what notices an externally-closed
-- screen), just relocated to the module that owns the real object being
-- polled.
local function syncTick()
    local O=InteractionAPI.Organiser
    if not O then return end
    local screen=require("ConspiracyFiles/PDAAPI").OrganiserScreen
    local window=screen and screen.window
    O.on=window~=nil
    O.screenBooting=(window and window.booting)==true
    O.lampOn=(window and window.on and window.lamp)==true
end
require("ConspiracyFiles/Events/PDAEvents").on("OnTick", syncTick)

return true
