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
-- Released over the MENU key itself: a key now acts only when let go over the
-- key it went down on (2026-09-15), and this used to set a pretend "MODE" key
-- down and let go at the window's corner.
function CFHW.holdPower()
    local w = S.window; if not w then return false, "no screen" end
    w.on = true
    local menu
    for _, b in ipairs(w:buttons()) do if S.ACTION[b.id] == "MENU" then menu = b end end
    if not menu then return false, "no MENU key on the case" end
    w.down = menu.id
    w.downAt = getTimeInMillis() - (S.HOLD_MS + 50)
    w:onMouseUp(menu.x + 2, menu.y + 2)
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
    -- P4-R99 turned this round: the machine size decides how much fits.
    if not (b.cols > a.cols and b.rows > a.rows) then bad[#bad+1] = "a bigger machine did not fit more text" end
    if c.ww ~= b.ww or c.wh ~= b.wh then bad[#bad+1] = "text size resized the window" end
    if c.cols >= b.cols then bad[#bad+1] = "bigger text did not fit less" end
    -- Every glyph set the two controls can land on must actually exist.
    -- Each text size is a face and a multiple; the multiple must be one that
    -- face was generated at (tools/build_palm_font.py FACES).
    local missing = {}
    for _, size in ipairs(S.FONT_SIZES) do
        local ok = false
        for _, have in ipairs((size.face and size.face.scales) or {}) do if have == size.mult then ok = true end end
        if not ok then missing[#missing+1] = tostring(size.id) end
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

-- A new game has never saved a size, so S.scale is nil (P4-R94 opens at the
-- default without writing one). Tapping SETUP > Machine compared that nil and
-- crashed on the owner's first try (Windows, 2026-09-14). Every size check
-- above had already set a size, which is why none of them saw it. The row is
-- handed to openRow directly so the check does not depend on SETUP's layout.
-- Open the real SETUP program and tap its real line for `kind` ("text" or
-- "machine") through the stylus, as the player does. The first version of
-- these stages handed openRow a fake row instead, which proved openRow and not
-- SETUP - a layout change that lost the line would still have passed.
local function tapSetupLine(w, kind)
    w.on = true; w.booting = false; w.launcher = false; w.record = nil; w.popup = nil
    for i, p in ipairs(w:programs()) do if p.id == "SETUP" then w.app = i end end
    w.cachedList = nil
    local rows = w:list()
    local index
    for i, row in ipairs(rows) do if row.setup == kind then index = i end end
    if not index then return false, "SETUP has no " .. kind .. " line" end
    w.entry = index
    local drew, why = pcall(function() w:prerender() end)
    if not drew then return false, "SETUP did not draw: " .. tostring(why) end
    local hit
    for _, h in ipairs((w.context or {}).hits or {}) do
        if h.id == "ROW" and h.payload == index then hit = h end
    end
    if not hit then return false, "SETUP drew no tappable " .. kind .. " line" end
    local tapped, err = pcall(function()
        w:onMouseDown(hit.x + 2, hit.y + 2); w:onMouseUp(hit.x + 2, hit.y + 2)
    end)
    return tapped, tostring(err)
end

function CFHW.freshMachineTap()
    local w = S.window; if not w then return false, "no window" end
    S.zoom(1); S.scale = nil
    local ok, err = tapSetupLine(w, "machine")
    -- SETUP > Machine opens a list now (owner, 2026-09-14), with the size the
    -- machine is actually drawn at marked.
    local popup = w.popup
    w.popup = nil
    S.zoom(1)
    return ok, tostring(err), tostring(popup ~= nil), tostring(popup and popup.index)
end

-- SETUP > Text: a Palm popup list; tapping a line chooses it and closes it.
function CFHW.textList()
    local w = S.window; if not w then return false, "no window" end
    local opened, why = tapSetupLine(w, "text")
    if not opened then return false, why end
    w:prerender()
    local hit
    for _, h in ipairs((w.context or {}).hits or {}) do
        if h.id == "POPUP" and h.payload == 2 then hit = h end
    end
    local chosen = false
    if hit then
        w:onMouseDown(hit.x + 1, hit.y + 1); w:onMouseUp(hit.x + 1, hit.y + 1)
        chosen = S.fontSize == 2 and w.fontSize == 2
    end
    local closed = w.popup == nil
    S.setFont(S.FONT_DEFAULT); w.popup = nil
    return true, tostring(#S.FONT_SIZES), tostring(hit ~= nil), tostring(chosen), tostring(closed)
end

-- Growing the machine drags its corner AWAY from it, so the pointer is outside
-- the window from the first pixel and the game sends the moves to
-- onMouseMoveOutside. Only moves inside were handled, so the drag could shrink
-- the machine and never grow it (owner, Windows, 2026-09-14).
function CFHW.dragOutside()
    local w = S.window; if not w then return false, "no window" end
    local FG = require("Fieldnote/Geometry")
    S.zoom(1)
    local g = w:grip()
    w:onMouseDown(g.x + 1, g.y + 1)
    local before = w.scale
    w:onMouseMoveOutside(0, FG.device.h * 1.2)
    local grown = w.scale
    w:onMouseUpOutside(w.width + 50, w.height + 50)
    local released = w.resizing == nil and w.down == nil
    local prefs = ModData.get("ConspiracyFilesOrganiserPrefs")
    local saved = prefs and prefs.scale
    S.zoom(1)
    return tostring(before), tostring(grown), tostring(released), tostring(saved)
end

-- The launcher's clock (P4-R100): shown only while the survivor carries
-- something that tells the time, the vanilla clock's own rule. Every watch and
-- clock is taken away first, then one watch is given, then all is put back.
function CFHW.clock()
    local w = S.window; if not w then return false, "no window" end
    local inv = getPlayer():getInventory()
    local held = {}
    local items = inv:getItems()
    for i = items:size() - 1, 0, -1 do
        local item = items:get(i)
        if instanceof(item, "AlarmClockClothing") or instanceof(item, "AlarmClock") then
            held[#held + 1] = item:getFullType(); inv:Remove(item)
        end
    end
    w.clockAt = nil
    local without = w:clockText()
    local watch = inv:AddItem("Base.WristWatch_Left_DigitalBlack")
    w.clockAt = nil
    local with = w:clockText()
    if watch then inv:Remove(watch) end
    for _, fullType in ipairs(held) do inv:AddItem(fullType) end
    w.clockAt = nil
    return true, tostring(without), tostring(with), tostring(watch ~= nil)
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

-- Filing evidence into the evidence album, and inspecting where it lies.
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
    -- Only RECOGNISED evidence is filed (P4-R132, 2680eaf): an unrecognised
    -- clue is the plain item it looks like. A test id no case knows is never
    -- recognised, so the planted page carries the id of evidence the survivor
    -- has already recognised - the opening key, delivered to the hand.
    local R = ConspiracyFiles.GeneratedRuntime
    local id, how
    for _, c in ipairs(R.clueTargets()) do
        if c.recognised then id, how = c.id, "already recognised"; break end
    end
    if not id then
        -- Nothing recognised yet (this check does not play the case): recognise
        -- the first placed clue through the runtime's own entry, as searching
        -- would, so the planted page is evidence rather than a plain paper.
        for _, c in ipairs(R.clueTargets()) do
            if c.status == "placed" then
                local ok, done, why = pcall(R.recognise, c.id, "search")
                if ok and done then id, how = c.id, "recognised now"; break end
                how = tostring(ok and why or done)
            end
        end
    end
    if not id then return false, "no evidence could be recognised (" .. tostring(how) .. "); an unrecognised clue is never filed (P4-R132)" end
    item:getModData().cfGeneratedId = id
    return true, tostring(item:getFullType()), id
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
