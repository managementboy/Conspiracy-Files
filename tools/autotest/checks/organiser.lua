-- Drives checks/organiser.sh: the pocket organiser as a real carried object.
CFOrg = CFOrg or {}
local O = ConspiracyFiles.Organiser

function CFOrg.state()
    local item = O.held()
    if not item then return false, "not carried" end
    local power = O.power(item)
    local favourite = false
    pcall(function() favourite = item:isFavorite() end)
    return true, tostring(item:getFullType()), tostring(power), tostring(favourite)
end

function CFOrg.read()
    local ok, why = O.read()
    return ok == true, tostring(why)
end

function CFOrg.uiOpen()
    local screen = ConspiracyFiles.OrganiserScreen
    return screen ~= nil and screen.window ~= nil
end

function CFOrg.closeUI()
    local screen = ConspiracyFiles.OrganiserScreen
    if screen then screen.close() end
    return true
end

-- Run the battery down the way the game would, without waiting for it.
function CFOrg.drain()
    local item = O.held()
    if not item then return false, "not carried" end
    local data = item:getDeviceData()
    if not data then return false, "no device data" end
    data:setPower(0)
    return true, tostring(O.power(item))
end

function CFOrg.charge()
    local item = O.held()
    local data = item and item:getDeviceData()
    if not data then return false end
    data:setPower(1)
    return true
end

-- The way back to reading when the device is gone (P4-R80): the evidence album.
function CFOrg.papersHeld()
    local F = ConspiracyFiles.CaseFile
    return F ~= nil and F.held(getPlayer()) ~= nil
end

-- The device's own screen: does it open, does it draw, do the buttons answer?
function CFOrg.openScreen()
    local w = ConspiracyFiles.OrganiserScreen.open()
    return w ~= nil, tostring(w and w.width), tostring(w and w.height)
end

function CFOrg.pressButton(id)
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w then return false, "no screen" end
    w:press(id)
    return true, tostring(w.section), tostring(w.entry), tostring(w.card), tostring(w.index), tostring(w.on)
end

function CFOrg.screenState()
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w then return false, "no screen" end
    return true, tostring(w.section), tostring(w.entry), tostring(w.card), tostring(w.index), tostring(w.on), tostring(w.lamp)
end

function CFOrg.clickButton(id)
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w then return false, "no screen" end
    for _, b in ipairs(w:buttons()) do
        if b.id == id then
            w:onMouseDown(b.x + 1, b.y + 1)
            w:onMouseUp(b.x + 1, b.y + 1)
            return true, id
        end
    end
    return false, "no such button: " .. tostring(id)
end

function CFOrg.closeScreen()
    ConspiracyFiles.OrganiserScreen.close()
    return true
end

-- Knox.OS: the launcher, the programs and the stylus.
function CFOrg.knox()
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w then return false, "no screen" end
    local program = w:program()
    return true, tostring(program and program.title), tostring(#w:list()),
        tostring(w.launcher), tostring(w.record ~= nil), tostring(w.app or 1)
end

function CFOrg.programs()
    local names = {}
    for _, app in ipairs(ConspiracyFiles.KnoxApps.visible()) do
        names[#names + 1] = app.title .. "=" .. #(app.list and app.list() or {})
    end
    return true, table.concat(names, " ")
end

-- Tap the glass where a widget is: find it through the context the shell built.
function CFOrg.tapWidget(id, payload)
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w or not w.context then return false, "no screen" end
    for _, h in ipairs(w.context.hits) do
        if h.id == id and (payload == nil or h.payload == payload) then
            w:onMouseDown(h.x + 2, h.y + 2)
            w:onMouseUp(h.x + 2, h.y + 2)
            return true, id
        end
    end
    return false, "no widget " .. tostring(id)
end

-- What the player can actually READ on the screen, so a check can assert the
-- words rather than only the shape. Added 2026-09-25 for the survivor's own
-- headings (DR-20260925-RECORD-VOICE) and THREADS (DR-20260925-THREADS): both
-- are about wording, and a check that can only count rows cannot see wording.
function CFOrg.rows()
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w then return false, "no screen" end
    local out = {}
    for _, row in ipairs(w:list()) do out[#out + 1] = tostring(row.label) end
    return true, table.concat(out, " | ")
end

function CFOrg.recordText()
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w or not w.record then return false, "no record open" end
    local fields = {}
    for _, f in ipairs(w.record.fields or {}) do
        fields[#fields + 1] = tostring(f.label) .. ": " .. tostring(f.value)
    end
    -- One line: a FILES record's detail spans paragraphs, and a newline
    -- inside a tab-separated answer put the thread flag on the wrong line
    -- (knox 20260925T142803 read "tapping a finding did not leave the thread").
    return true, tostring(w.record.title), (tostring(w.record.detail):gsub("\n+", " / ")),
        table.concat(fields, " | "), tostring(w.record.thread)
end

-- The open record's entries (a DATES day, a THREADS thread), as the player
-- reads them, and the category the program is showing. Added 2026-09-25 for
-- the THREADS redesign: one row per thread, opened as a record of its findings.
function CFOrg.entries()
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w or not w.record then return false, "no record open" end
    local out = {}
    for _, e in ipairs(w.record.entries or {}) do out[#out + 1] = tostring(e.text) end
    return true, table.concat(out, " | "), tostring(#out)
end

function CFOrg.category()
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w then return false, "no screen" end
    local current = w:category(w:program())
    return true, tostring(current)
end

-- How many threads the survivor has put down, read from the record rather than
-- from the screen: the point of the state is that it is saved.
function CFOrg.threadsPutDown()
    local root = ModData and ModData.get and ModData.get("ConspiracyFiles.Threads")
    local n = 0
    for _ in pairs((root and root.putDown) or {}) do n = n + 1 end
    return true, tostring(n)
end

-- Which card of a record is on screen, for the scrolling check.
function CFOrg.card()
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w then return "no screen" end
    return tostring(w.card), tostring(w.record ~= nil)
end

-- Outline every hit box over the case, so the owner can see whether the taps
-- land on the art. Debug aid only; nothing draws these in a real game.
function CFOrg.showHitBoxes(on)
    local S = ConspiracyFiles.OrganiserScreen
    local w = S.window
    if not w then return false, "no screen" end
    w.showHits = on ~= false
    if w.showHits and not w.hitPainter then
        local FG = require("Fieldnote/Geometry")
        local original = w.prerender
        w.hitPainter = true
        w.prerender = function(self)
            original(self)
            local s = self.scale
            self:drawRectBorder(FG.lcd.x * s, FG.lcd.y * s,
                FG.lcd.w * s, FG.lcd.h * s, 1, 1, 0.2, 0.8)
            for _, b in ipairs(self:buttons()) do
                self:drawRectBorder(b.x, b.y, b.w, b.h, 1, 0.2, 1, 0.4)
            end
        end
    end
    return true
end

-- Open a program by NAME. Its position moves whenever a program is added, and
-- a check that taps position 3 starts testing whatever landed there (PLACES
-- displaced DATES on 2026-09-12).
function CFOrg.openProgram(title)
    local w = ConspiracyFiles.OrganiserScreen.window
    if not w then return false, "no screen" end
    for i, program in ipairs(w:programs()) do
        if program.title == title then
            for _, h in ipairs(w.context and w.context.hits or {}) do
                if h.id == "APP" and h.payload == i then
                    w:onMouseDown(h.x + 2, h.y + 2); w:onMouseUp(h.x + 2, h.y + 2)
                    return true, title
                end
            end
            return false, "no icon for " .. title
        end
    end
    return false, "no program called " .. tostring(title)
end

-- The machine may have switched itself off between two steps of a check: the
-- harness takes minutes over what a player does in seconds, and auto-off is
-- real (S.AUTO_OFF_MS). A player presses a key and carries on, so the driver
-- does the same rather than pretending the feature is not there.
function CFOrg.wake()
    local S = ConspiracyFiles.OrganiserScreen
    local w = S and S.window
    if not w then return false, "no screen" end
    local was = w.on
    w.on = true
    w:touch()
    return true, tostring(was)
end
