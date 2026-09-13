-- Drives checks/hardware.sh: the organiser as a piece of 1993 hardware.
-- Everything here is about the DEVICE - its cells, its lamp, its volatile
-- memory - and never about the case, which lives in the world and must
-- survive all of it (P4-R80).
CFHW = CFHW or {}
local O = ConspiracyFiles.Organiser
local S = ConspiracyFiles.OrganiserScreen
local A = ConspiracyFiles.KnoxApps

local function held() return O.held() end
local function data() local i = held() return i and i:getDeviceData() end

function CFHW.setPower(level)
    local d = data(); if not d then return false, "no device data" end
    d:setPower(tonumber(level))
    return true, tostring(O.power(held()))
end

function CFHW.power() return tostring(O.power(held())) end
function CFHW.low() return O.low(held()) == true end

-- Volatile memory: what a flat cell is allowed to take.
function CFHW.seedMemory()
    A.addNote("check note")
    A.addToDo("check to-do")
    return CFHW.counts()
end

function CFHW.counts()
    local notes = ModData.get("ConspiracyFiles.KnoxNotes")
    local todos = ModData.get("ConspiracyFiles.KnoxToDo")
    local log = ConspiracyFiles.DiscoveryLog
    local events = (log and log.events and log.events()) or {}
    return #((notes or {}).items or {}), #((todos or {}).items or {}), #events
end

function CFHW.suspend()
    O.checkPower(held())
    return O.memoryAsleep(held()) == true
end

function CFHW.restore()
    O.checkPower(held())
    return O.memoryRestored(held()) == true, tostring(O.memoryAsleep(held()))
end

function CFHW.memoryAsleep() return O.memoryAsleep(held()) == true end

-- The screen. open() is the moment a flat cell is noticed.
function CFHW.open()
    local w = S.open()
    return w ~= nil
end

function CFHW.close() S.close(); return true end

function CFHW.screen()
    local w = S.window
    if not w then return false end
    return true, tostring(w.on), tostring(w.lamp), tostring(w.booting)
end

-- Auto-off: pretend the player stopped touching it `ms` ago, then let the
-- machine's own idle check run.
function CFHW.idle(ms)
    local w = S.window; if not w then return false, "no screen" end
    w.on = true
    w.touched = (getTimeInMillis() - tonumber(ms))
    w:idleCheck()
    return true, tostring(w.on), tostring(w.lamp)
end

function CFHW.touch()
    local w = S.window; if not w then return false end
    w:touch(); w.on = true
    return true
end

-- The lamp, asked for the way the player asks: a held MENU release. The case
-- has no power tab any more (owner, 2026-09-13), so MENU carries it.
function CFHW.holdPower()
    local w = S.window; if not w then return false, "no screen" end
    w.on = true
    w.down = "MODE"
    w.downAt = getTimeInMillis() - (S.HOLD_MS + 50)
    w:onMouseUp(0, 0)
    return true, tostring(w.lamp), tostring(w.lampRefused ~= nil)
end

function CFHW.foot()
    local w = S.window; if not w then return false, "no screen" end
    return true, tostring(w:footText("HINT"))
end

function CFHW.boot()
    local w = S.window; if not w then return false, "no screen" end
    w.booting = true
    local lines = A.bootLines()
    return true, table.concat(lines, " | ")
end

function CFHW.dismissBoot()
    local w = S.window; if not w then return false end
    w.booting = false
    w:bootSeen()
    return true, tostring(O.memoryRestored(held()))
end

-- The lamp drain, over a stated number of in-game hours.
function CFHW.lampFor(hours)
    local w = S.window; if not w then return false, "no screen" end
    local d = data(); if not d then return false, "no device data" end
    w.on, w.lamp = true, true
    local now = getGameTime():getWorldAgeHours()
    O.lampAt = now - tonumber(hours)
    O.lampTick()
    return true, tostring(d:getPower()), tostring(w.lamp)
end

-- Waking. A machine that has switched itself off must come back on the first
-- hardware key, and that press must be spent on waking rather than also
-- navigating - which is what a Palm did, and what stops a blind key press
-- landing somewhere the player cannot see.
function CFHW.sleep()
    local w = S.window; if not w then return false, "no screen" end
    w.on = true
    w.touched = getTimeInMillis() - (S.AUTO_OFF_MS + 1000)
    w:idleCheck()
    return true, tostring(w.on)
end

-- MODE is MENU now, so its effect is observable as the launcher opening -
-- which is what lets us prove the waking press was SPENT on waking.
function CFHW.pressKey(id)
    local w = S.window; if not w then return false, "no screen" end
    local before = tostring(w.launcher == true)
    w:press(id)
    return true, tostring(w.on), before, tostring(w.launcher == true)
end

function CFHW.leaveLauncher()
    local w = S.window; if not w then return false end
    w.launcher = false; w.record = nil
    return true, tostring(w.launcher == true)
end

function CFHW.app()
    local w = S.window; if not w then return false end
    return true, tostring(w.app or 1), tostring(w.on)
end

-- Size. S.zoom existed with nothing calling it, so it was never exercised.
function CFHW.size()
    local w = S.window
    return true, tostring(S.scale or S.fit()), tostring(S.fit()),
        tostring(w and w.width or "?"), tostring(w and w.height or "?")
end

function CFHW.step(by)
    S.step(tonumber(by))
    return true, tostring(S.scale), tostring(S.MAX)
end

-- What fit() picks for a given screen height, without needing that screen.
function CFHW.fitFor(height)
    local Case = require("ConspiracyFiles/Generated/OrganiserCase")
    local want = math.floor(tonumber(height) * S.FILL / Case.h)
    if want < 1 then want = 1 elseif want > 3 then want = 3 end
    return true, tostring(want), tostring(Case.h * want), tostring(height)
end

-- HELP must actually tell the player how to do it.
function CFHW.helpText()
    local out = {}
    for _, row in ipairs(A.help.list()) do
        out[#out + 1] = tostring(row.title) .. ": " .. tostring(row.detail):gsub("\n", " ")
    end
    return true, table.concat(out, " || ")
end

-- The survivor's own card in NAMES. It printed a translation key at the player
-- ("Work: IGUI_Occupation_fitnessinstructor") because the key was invented and
-- getText hands back what it cannot find (owner screenshot, 2026-09-13).
function CFHW.meCard()
    for _, row in ipairs(A.names.list()) do
        if row.me then return true, tostring(row.detail):gsub("\n", " | ") end
    end
    return false, "no card for the survivor"
end

-- Crash durability. The ledger lives in ModData, which only reaches the disk
-- when the GAME saves, so a hard crash loses every discovery since the last
-- autosave - the owner lost his on 2026-09-13. A write-ahead journal is
-- supposed to bring them back. This proves it by destroying the ModData copy,
-- which is exactly what a crash does to the unsaved part of it.
local DL = ConspiracyFiles.DiscoveryLog
local LEDGER_TAG = "ConspiracyFiles.DiscoveryLedger"

function CFHW.recordDiscovery(ref)
    local ok = DL.record("evidence", tostring(ref))
    return ok == true, tostring(#DL.events())
end

function CFHW.ledgerCount() return true, tostring(#DL.events()) end

function CFHW.journalCount()
    return true, tostring(#DL.journalRead())
end

-- What a crash does: the in-memory ledger was never written to the save.
function CFHW.wipeLedger()
    local store = ModData.getOrCreate(LEDGER_TAG)
    store.canonical = nil
    return true, tostring(#DL.events())
end

function CFHW.replay()
    local n = DL.journalReplay()
    return true, tostring(n), tostring(#DL.events())
end

function CFHW.refs()
    local out = {}
    for _, e in ipairs(DL.events()) do out[#out + 1] = tostring(e.ref) end
    return true, table.concat(out, ",")
end
