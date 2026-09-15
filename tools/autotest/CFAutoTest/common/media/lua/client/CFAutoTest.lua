-- Unattended game start for tools/autotest/pz.sh. Lives outside mod/, so
-- package.sh and Workshop never see it; pz.sh links it into Zomboid/mods.
--
-- Does nothing unless the game runs with -debug AND pz.sh has written a
-- session file that has not expired. A manual launch on this machine is
-- therefore never hijacked, even if a session file was left behind.
--
-- With a live session it launches a fresh world through the game's own debug
-- scenario launcher (DebugScenarios.lua), at the start location the session
-- names. Everything after that goes through ConspiracyFiles.DevEval.
if not (getDebug and getDebug()) then return end

CFAutoTest = CFAutoTest or {}
local A = CFAutoTest
A.SESSION = "cf_autotest_session.txt"

-- key=value lines; nil when there is no session file.
function A.readSession()
    local reader = getFileReader(A.SESSION, false)
    if not reader then return nil end
    local cfg = {}
    local line = reader:readLine()
    while line do
        local k, v = tostring(line):match("^%s*([%w_]+)%s*=%s*(.-)%s*$")
        if k then cfg[k] = v end
        line = reader:readLine()
    end
    reader:close()
    return cfg
end

function A.live(cfg)
    local expires = cfg and tonumber(cfg.expires)
    return expires ~= nil and getTimestampMs() / 1000 < expires
end

-- Debug mode opens the Lua debugger on any error, even inside pcall, and the
-- game freezes until someone presses Continue. Nobody is there to press it.
function A.noBreakOnError()
    if UIManager and UIManager.setShowLuaDebuggerOnError then UIManager.setShowLuaDebuggerOnError(false) end
end

-- The debug Command Console covers a third of the screen. Code arrives through
-- DevEval, so screenshots are better without it. pz.sh calls this once ready.
function A.hideConsole()
    local console = UIManager.getDebugConsole()
    if console then console:setVisible(false) end
    return console ~= nil
end

function A.scenario(cfg)
    return {
        name = "CF AutoTest",
        world = cfg.map or "Muldraugh, KY",
        -- Default: a kitchen in Muldraugh (102 E Maple St.). Indoors matters:
        -- the first case is built around the house the player starts in, as in
        -- a normal new game, and waits while the player is outdoors.
        startLoc = { x = tonumber(cfg.x) or 10837, y = tonumber(cfg.y) or 10147, z = tonumber(cfg.z) or 0 },
        onStart = function()
            A.noBreakOnError()
            -- Nobody is at the keyboard: a zombie at the spawn point would end
            -- the run. Zombies stay in the world, since corpses matter to the mod.
            local p = getPlayer()
            if p and cfg.mortal ~= "1" then p:setGodMod(true); p:setInvisible(true) end
            print("[CF-AUTOTEST] world started session=" .. tostring(cfg.session))
        end,
    }
end

function A.frontEndTick()
    if A.launched then return end
    if not (MainScreen and MainScreen.instance and DebugScenarios and DebugScenarios.instance) then return end
    A.launched = true
    local cfg = A.readSession()
    if not A.live(cfg) then
        print("[CF-AUTOTEST] no live session; normal start")
        return
    end
    A.noBreakOnError()
    print("[CF-AUTOTEST] launching session=" .. tostring(cfg.session))
    -- mode=continue: reload an existing save by name, through the main menu's
    -- own Continue path (reload tests: catalogue INF-01).
    if cfg.mode == "continue" and cfg.world then
        print("[CF-AUTOTEST] continuing world=" .. cfg.world)
        MainScreen.continueLatestSave("Sandbox", cfg.world)
        return
    end
    -- The debug-scenario launcher does not copy the active mods into the new
    -- world's mods.txt, so a reload of that save ran with NO mods (seen
    -- 2026-09-11). A normal New Game does this copy itself.
    ActiveMods.getById("currentGame"):copyFrom(ActiveMods.getById("default"))
    DebugScenarios.instance:launchScenario(A.scenario(cfg))
end

if not A.handler then
    A.handler = A.frontEndTick
    Events.OnFETick.Add(A.handler)
end
