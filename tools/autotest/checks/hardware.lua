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

function CFHW.loseMemory()
    O.checkPower(held())
    return O.memoryLost(held()) == true
end

function CFHW.memoryLost() return O.memoryLost(held()) == true end

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

-- The lamp, asked for the way the player asks: a held POWER release.
function CFHW.holdPower()
    local w = S.window; if not w then return false, "no screen" end
    w.down = "POWER"
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
    return true, tostring(O.memoryLost(held()))
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

function CFHW.pressKey(id)
    local w = S.window; if not w then return false, "no screen" end
    local before = tostring(w.app or 1)
    w:press(id)
    return true, tostring(w.on), before, tostring(w.app or 1)
end

function CFHW.app()
    local w = S.window; if not w then return false end
    return true, tostring(w.app or 1), tostring(w.on)
end
