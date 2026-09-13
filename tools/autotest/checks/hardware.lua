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

-- THE TWO SIZE CONTROLS (P4-R89), and the invariant that makes them two
-- controls rather than one: changing the MACHINE size changes the window and
-- not how much text fits; changing the TEXT size changes how much text fits
-- and not the window. If either one moved both numbers they would not be
-- independent, which is the whole of the owner's ruling.
function CFHW.sizes()
    local w = S.window; if not w then return false, "no screen" end
    local function state()
        local l = w:lcd()
        return {device=w.scale, font=w.fontSize, ww=w:getWidth(), wh=w:getHeight(),
                t=l.t, cols=l.w, rows=l.h}
    end
    local function show(x)
        return string.format("device=%dx font=%d window=%dx%d glyphs=%dx cols=%d rows=%d",
            x.device, x.font, x.ww, x.wh, x.t, x.cols, x.rows)
    end
    S.fontSize = S.FONT_DEFAULT; w.fontSize = S.FONT_DEFAULT
    S.zoom(1)
    local a = state()
    S.zoom(2)
    local b = state()                       -- machine bigger
    S.stepFont(1)
    local c = state()                       -- text bigger, machine unchanged
    local bad = {}
    if not (b.ww > a.ww and b.wh > a.wh) then bad[#bad+1] = "machine size did not resize the window" end
    if b.cols ~= a.cols or b.rows ~= a.rows then bad[#bad+1] = "machine size changed how much text fits" end
    if c.ww ~= b.ww or c.wh ~= b.wh then bad[#bad+1] = "text size resized the window" end
    if c.cols == b.cols then bad[#bad+1] = "text size did not change how much text fits" end
    -- Every glyph set the two controls can land on must actually exist.
    local Font = require("ConspiracyFiles/Generated/OrganiserFont")
    local missing = {}
    for d = 1, S.MAX do
        for f = 1, #S.FONT_SIZES do
            local t = S.typeScale(d, f)
            local ok = false
            for _, have in ipairs(Font.scales or {}) do if have == t then ok = true end end
            if not ok then missing[#missing+1] = tostring(t) .. "x" end
        end
    end
    if #missing > 0 then bad[#bad+1] = "no glyph set for " .. table.concat(missing, ",") end
    S.zoom(1); S.fontSize = S.FONT_DEFAULT; w.fontSize = S.FONT_DEFAULT
    if #bad > 0 then return false, table.concat(bad, "; "), show(a) .. " | " .. show(b) .. " | " .. show(c) end
    return true, show(a) .. " | " .. show(b) .. " | " .. show(c)
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
-- It ASKS fit() now. It used to recompute the formula here, so when the
-- rounding changed - flooring 1.53 to 1x had been opening the device at its
-- smallest size on a 4K screen - this check went on confirming the old
-- behaviour and would never have caught the bug it exists to catch.
function CFHW.fitFor(height)
    local FG = require("Fieldnote/Geometry")
    local want = S.fit(height)
    return true, tostring(want), tostring(FG.device.h * want), tostring(height)
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

-- The address book's category picker.
function CFHW.openNames()
    local w = S.window; if not w then return false, "no screen" end
    w.on = true; w.launcher = false; w.record = nil
    for i, p in ipairs(w:programs()) do
        if p.id == "NAMES" then w.app = i end
    end
    w.entry, w.card, w.cachedList = 1, 1, nil
    return true, tostring(w:program().id)
end

function CFHW.category()
    local w = S.window; if not w then return false end
    local name = w:category()
    return true, tostring(name), tostring(#w:list())
end

function CFHW.cycleCategory()
    local w = S.window; if not w then return false end
    w:cycleCategory()
    return true, tostring(w:category()), tostring(#w:list())
end

-- Pulling the cell out. The screen stayed lit because power was only ever
-- looked at when the device was picked up or woken (owner, 2026-09-13).
function CFHW.removeCell()
    local i = held(); if not i then return false, "not carried" end
    local d = i:getDeviceData(); if not d then return false, "no device data" end
    d:setHasBattery(false)
    d:setPower(0)
    return true, tostring(O.hasCell(i))
end

function CFHW.fitCell()
    local i = held(); local d = i and i:getDeviceData()
    if not d then return false end
    d:setHasBattery(true); d:setPower(1)
    return true, tostring(O.hasCell(i))
end

function CFHW.pumpScreen()
    local w = S.window; if not w then return false, "no screen" end
    w.chargeAt = nil                -- force the cached read to refresh
    w:powerCheck()
    return true, tostring(w.on)
end

-- The date book, drawn as a month.
function CFHW.openDates()
    local w = S.window; if not w then return false, "no screen" end
    w.on = true; w.launcher = false; w.record = nil; w.day = nil
    for i, p in ipairs(w:programs()) do if p.id == "DATES" then w.app = i end end
    w.entry, w.card, w.cachedList = 1, 1, nil
    local ok, why = pcall(function() w:render() end)
    if not ok then return false, "render: " .. tostring(why) end
    local program = w:program()
    local _, _, at = w:category(program)
    local month = program.month and program.month(at or 1)
    if not month then return false, "no month" end
    return true, tostring(program.id), tostring(month.label),
        tostring(month.length), tostring(month.first), tostring(month.today)
end

-- Every month the picker can reach must draw without throwing.
function CFHW.everyMonth()
    local w = S.window; if not w then return false end
    local program = w:program()
    local seen = {}
    for i = 1, 6 do
        w.categories = w.categories or {}
        w.categories[program.id] = i
        w.cachedList = nil
        local ok, why = pcall(function() w:render() end)
        if not ok then return false, "month " .. i .. " render: " .. tostring(why) end
        local m = program.month(i)
        seen[#seen + 1] = m and m.label or "?"
    end
    w.categories[program.id] = 1
    return true, table.concat(seen, ",")
end

-- Tapping a day must open it, and an empty day must say so rather than break.
function CFHW.tapDay(n)
    local w = S.window; if not w then return false end
    local program = w:program()
    local _, _, at = w:category(program)
    local row = program.day and program.day(at or 1, tonumber(n))
    if not row then return false, "no row" end
    w.record = row; w.day = tonumber(n)
    local ok, why = pcall(function() w:render() end)
    if not ok then return false, "render: " .. tostring(why) end
    return true, tostring(row.title), tostring(row.detail):gsub("\n", " | ")
end

-- Filing evidence into the Papers, and inspecting where it lies.
local CaseFile = require("ConspiracyFiles/CaseFile")

function CFHW.pocketCount()
    local inv = getPlayer():getInventory()
    local items = inv:getItems()
    local loose, filed = 0, 0
    local papers = CaseFile.held(getPlayer())
    for i = 0, items:size() - 1 do
        local it = items:get(i)
        local md = it and it.getModData and it:getModData()
        if type(md) == "table" and md.cfGeneratedId then loose = loose + 1 end
    end
    local into = papers and papers:getInventory()
    if into then
        local pi = into:getItems()
        for i = 0, pi:size() - 1 do
            local md = pi:get(i):getModData()
            if type(md) == "table" and md.cfGeneratedId then filed = filed + 1 end
        end
    end
    return true, tostring(loose), tostring(filed), tostring(papers ~= nil)
end

-- A document in the pocket, made the way the runtime makes one.
function CFHW.plantDoc()
    local item = getPlayer():getInventory():AddItem("Base.Newspaper")
    if not item then return false, "could not create" end
    item:getModData().cfGeneratedId = "test:filing:" .. tostring(getTimeInMillis())
    return true, tostring(item:getFullType())
end

function CFHW.file()
    CaseFile.filedAt = nil            -- skip the throttle
    local n = CaseFile.fileEvidence()
    return true, tostring(n)
end

function CFHW.setScreen(on)
    local w = S.window; if not w then return false end
    w.on = (tostring(on) == "true")
    return true, tostring(w.on)
end
