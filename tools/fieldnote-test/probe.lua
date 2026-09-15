-- Eval-channel probe for the organiser's case: the Fieldnote hardware contract,
-- measured on ConspiracyFiles.OrganiserScreen - the window the player uses.
-- Loaded with `pz.sh eval -f tools/fieldnote-test/probe.lua`, then queried by
-- name. Knox.OS itself (programs, cells, lamp) is checked by hardware.sh,
-- pdagame.sh and knox.sh; this is the plastic and the keys.
--
-- Until 2026-09-15 this drove a stand-alone Fieldnote window left over from
-- the test mod. It passed, and proved a window no player ever saw: 1x to 3x
-- only, its own hit test, its own release rule. At half and one-and-a-half
-- size the real case drew no legends at all, and nothing noticed.
CFFN = CFFN or {}
local G = require("Fieldnote/Geometry")
local Font = require("ConspiracyFiles/Generated/OrganiserFont")

local function now() return getTimeInMillis and getTimeInMillis() or 0 end

local function organiser()
    local S = ConspiracyFiles and ConspiracyFiles.OrganiserScreen
    return S, S and S.window
end

local function key(controlId)
    for _, ctl in ipairs(G.controls) do if ctl.id == controlId then return ctl end end
    return nil
end

-- Count what the window dispatches without letting it act: a real HOME would
-- leave the screen under test. The instance field shadows Screen:press and is
-- removed again afterwards.
local function counting(w)
    local got = {}
    w.press = function(self, id) got[#got + 1] = tostring(id) end
    return got
end

-- Open the organiser the way the mod does, past its boot screen.
function CFFN.open()
    local S = organiser()
    if not S then return false, "no OrganiserScreen" end
    local w = S.window or S.open()
    if not w then return false, "the organiser would not open" end
    if w.booting then w:finishBoot() end
    w.on = true
    CFFN.startScale = CFFN.startScale or w.scale
    return true, tostring(w.scale)
end

function CFFN.restore()
    local S, w = organiser()
    if w then w.press = nil end
    if S and CFFN.startScale then S.zoom(CFFN.startScale) end
    return true
end

function CFFN.state()
    local S, w = organiser()
    if not w then return false, "no window" end
    local sizes = {}
    for _, s in ipairs(S.SCALES) do sizes[#sizes + 1] = tostring(s) end
    return true, tostring(ConspiracyFiles.VERSION), table.concat(sizes, ","),
        tostring(w.width) .. "x" .. tostring(w.height), tostring(G.device.w) .. "x" .. tostring(G.device.h)
end

-- The organiser draws its case without throwing, with and without wear.
function CFFN.render()
    local S, w = organiser(); if not w then return false, "no window" end
    local P = Fieldnote.Panel
    local was = P.showWear
    local ok1, e1 = pcall(function() P.showWear = true;  w:prerender() end)
    local ok2, e2 = pcall(function() P.showWear = false; w:prerender() end)
    P.showWear = was
    if not ok1 then return false, "wear on: " .. tostring(e1) end
    if not ok2 then return false, "wear off: " .. tostring(e2) end
    return true, "drew with and without wear"
end

-- Count what would be drawn, so the wear toggle is observable.
function CFFN.primitiveCount(wear)
    local n = 0
    for _, c in ipairs(G.components) do
        if not (c.optional and not wear) then n = n + #c.primitives end
    end
    return true, tostring(n)
end

-- At every machine size: every key resolves to itself at its top-left corner
-- and at its last pixel, and to something else one pixel past its far corner
-- - the half-open contract at both ends of every box - and a real press at
-- the corner lands on that key rather than the grip or the glass.
function CFFN.hitboxes()
    local S, w = organiser(); if not w then return false, "no window" end
    local bad, boxes = {}, 0
    for _, scale in ipairs(S.SCALES) do
        S.zoom(scale)
        w = S.window
        local s = w.scale
        for _, ctl in ipairs(G.controls) do
            local tag = ctl.id .. "@" .. tostring(s)
            local tl = w:controlAt(ctl.x * s, ctl.y * s)
            local last = w:controlAt((ctl.x + ctl.w - 1) * s, (ctl.y + ctl.h - 1) * s)
            local past = w:controlAt((ctl.x + ctl.w) * s, (ctl.y + ctl.h) * s)
            if not tl or tl.id ~= ctl.id then bad[#bad + 1] = tag .. ":top-left" end
            if not last or last.id ~= ctl.id then bad[#bad + 1] = tag .. ":last-pixel" end
            if past and past.id == ctl.id then bad[#bad + 1] = tag .. ":past-edge-hit" end
            w.down = nil
            w:onMouseDown(ctl.x * s, ctl.y * s)
            if w.down ~= ctl.id then bad[#bad + 1] = tag .. ":press-landed-on-" .. tostring(w.down) end
            w.down = nil; w.resizing = nil; w.moving = nil
            boxes = boxes + 1
        end
    end
    S.zoom(1)
    if #bad > 0 then return false, table.concat(bad, ",") end
    return true, tostring(#G.controls) .. " keys at " .. tostring(#S.SCALES) .. " machine sizes, "
        .. tostring(boxes) .. " boxes, both ends"
end

-- Every letter on the plastic that has a picture at 1x has one at every
-- machine size; a letter without one is simply not drawn at that size.
function CFFN.legends()
    local S = organiser()
    local P = Fieldnote.Panel
    if not S then return false, "no OrganiserScreen" end
    if not P.glyph then return false, "Fieldnote.Panel.glyph missing" end
    local missing, letters = {}, 0
    for _, c in ipairs(G.components) do
        for _, p in ipairs(c.primitives) do
            if p.kind == "text" then
                for i = 1, #p.text do
                    local code = string.byte(p.text, i)
                    if code >= Font.first and code <= Font.last and P.glyph(code, 1) then
                        letters = letters + 1
                        for _, scale in ipairs(S.SCALES) do
                            if not P.glyph(code, scale) then
                                missing[#missing + 1] = p.text .. "@" .. tostring(scale)
                            end
                        end
                    end
                end
            end
        end
    end
    if letters == 0 then return false, "no legend letters found at 1x" end
    if #missing > 0 then return false, "no legend picture for " .. table.concat(missing, ",") end
    return true, tostring(letters) .. " letters at " .. tostring(#S.SCALES) .. " machine sizes"
end

-- The rocker divider row (device y=577) is inactive by design.
function CFFN.rockerGap()
    local S, w = organiser(); if not w then return false, "no window" end
    S.zoom(1); w = S.window
    local x = 176 + 24
    local up, gap, down = w:controlAt(x, 576), w:controlAt(x, 577), w:controlAt(x, 578)
    return true, tostring(up and up.id), tostring(gap and gap.id), tostring(down and down.id)
end

-- Pressing a key gives its face the pressed colour for as long as the
-- organiser reports it held, and releasing restores it.
function CFFN.pressColour(controlId)
    local S, w = organiser(); if not w then return false, "no window" end
    local P = Fieldnote.Panel
    -- Pick a primitive that changes IN THE STATE BEING PRESSED: the rocker's
    -- UP half is left alone by a DOWN press, correctly (2026-09-13).
    local comp, prim
    local state = (controlId == "rocker_up" and "up") or (controlId == "rocker_down" and "down") or nil
    for _, c in ipairs(G.components) do
        if state and c.id == "C13" and c.overrides and c.overrides[state] then
            for _, p in ipairs(c.primitives) do
                if c.overrides[state][p.id] then comp, prim = c, p; break end
            end
        elseif not state and c.id == controlId then
            for _, p in ipairs(c.primitives) do
                if p.pressed then comp, prim = c, p; break end
            end
        end
        if comp then break end
    end
    if not comp then return false, "no pressable primitive for " .. tostring(controlId) end
    local function hex(c) return string.format("%02X%02X%02X", math.floor(c[1] * 255 + 0.5), math.floor(c[2] * 255 + 0.5), math.floor(c[3] * 255 + 0.5)) end
    local normal = hex(P.colourFor(comp, prim, nil))
    w.pressedId, w.pressedAt = controlId, now()
    local heldId = w:heldControl()
    local held = hex(P.colourFor(comp, prim, heldId))
    w.pressedAt = now() - S.PRESS_MS - 1
    local afterId = w:heldControl()
    local released = hex(P.colourFor(comp, prim, afterId))
    return true, prim.id, normal, held, released, tostring(heldId), tostring(afterId)
end

-- A real mouse down and up over a key dispatches exactly once.
function CFFN.click(controlId)
    local S, w = organiser(); if not w then return false, "no window" end
    local ctl = key(controlId); if not ctl then return false, "no such control" end
    local s = w.scale
    local got = counting(w)
    w:onMouseDown((ctl.x + 2) * s, (ctl.y + 2) * s)
    local during = tostring(w.down)
    w:onMouseUp((ctl.x + 2) * s, (ctl.y + 2) * s)
    w.press = nil
    return true, during, tostring(#got), table.concat(got, ";")
end

-- A press that slides off its key before release dispatches nothing - not on
-- the glass, and not on the key it was released over.
function CFFN.dragOff(controlId, otherId)
    local S, w = organiser(); if not w then return false, "no window" end
    local ctl, other = key(controlId), key(otherId or "C12")
    if not ctl or not other then return false, "no such control" end
    local s = w.scale
    local glass = w:lcd()
    local got = counting(w)
    w:onMouseDown((ctl.x + 2) * s, (ctl.y + 2) * s)
    w:onMouseUp(glass.x + 10, glass.y + 10)
    local toGlass = #got
    w:onMouseDown((ctl.x + 2) * s, (ctl.y + 2) * s)
    w:onMouseUp((other.x + 2) * s, (other.y + 2) * s)
    local toKey = #got - toGlass
    w.press = nil
    return true, tostring(toGlass), tostring(toKey), tostring(w.down)
end

-- Where the organiser puts its glass, and that no hardware primitive enters it.
function CFFN.lcd()
    local S, w = organiser(); if not w then return false, "no window" end
    local r = w:lcd()
    local L = G.lcd
    local intruders = {}
    for _, c in ipairs(G.components) do
        if c.role ~= "lcd" then
            for _, p in ipairs(c.primitives) do
                if p.kind == "rect" then
                    local x0, y0 = c.x + p.x, c.y + p.y
                    local x1, y1 = x0 + p.w, y0 + p.h
                    if x0 < L.x + L.w and x1 > L.x and y0 < L.y + L.h and y1 > L.y then
                        intruders[#intruders + 1] = p.id
                    end
                end
            end
        end
    end
    return true, "glass at " .. tostring(r.x) .. "," .. tostring(r.y) .. " device " .. tostring(L.w) .. "x" .. tostring(L.h),
        tostring(#intruders), table.concat(intruders, ",")
end

-- Label placement: the legend's drawn top sits below the lowest icon rectangle
-- in the same component. Arithmetic on the device's own face (P4-R90), so a
-- pass here is a pass on every machine.
function CFFN.labels()
    local out, bad = {}, {}
    for _, c in ipairs(G.components) do
        local iconBottom, label = nil, nil
        for _, p in ipairs(c.primitives) do
            if p.kind == "rect" then
                local b = p.y + p.h
                if not iconBottom or b > iconBottom then iconBottom = b end
            elseif p.kind == "text" then
                label = p
            end
        end
        if label and iconBottom then
            local INK_TOP_IN_CELL = 2
            local top = label.baseline - Font.ascent + INK_TOP_IN_CELL
            local gap = top - iconBottom
            out[#out + 1] = c.id .. ":" .. label.text .. " top=" .. tostring(top) .. " icon=" .. tostring(iconBottom) .. " gap=" .. tostring(gap)
            if gap < 1 then bad[#bad + 1] = c.id .. ":" .. label.text .. " overlaps icon by " .. tostring(1 - gap) end
        end
    end
    if #bad > 0 then return false, table.concat(bad, "; "), table.concat(out, " | ") end
    return true, table.concat(out, " | ")
end
