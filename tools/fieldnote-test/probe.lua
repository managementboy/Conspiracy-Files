-- Eval-channel probe for the Fieldnote test mod. Loaded with
-- `pz.sh eval -f tools/fieldnote-test/probe.lua`, then queried by name.
-- Every check here is about the HARDWARE drawing and input contract the
-- design package specifies; none wires a game action.
CFFN = CFFN or {}
local G = require("Fieldnote/Geometry")

local function panel()
    local S = Fieldnote and Fieldnote.Panel
    return S, S and S.window
end

-- The mod loaded and the device is on screen.
function CFFN.state()
    local S, w = panel()
    if not S then return false, "Fieldnote.Panel missing" end
    if not w then return false, "no window" end
    return true, tostring(Fieldnote.VERSION), tostring(S.scale),
        tostring(w.width) .. "x" .. tostring(w.height), tostring(G.device.w) .. "x" .. tostring(G.device.h)
end

-- Draws without throwing, both with and without wear.
function CFFN.render()
    local S, w = panel(); if not w then return false, "no window" end
    local was = S.showWear
    local ok1, e1 = pcall(function() S.showWear = true;  w:prerender() end)
    local ok2, e2 = pcall(function() S.showWear = false; w:prerender() end)
    S.showWear = was
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

-- Every manifest hitbox resolves to its own control at its top-left corner
-- and at its last inclusive pixel, and to NOTHING one pixel past the far edge:
-- the half-open contract, checked at both ends of every box.
function CFFN.hitboxes()
    local S, w = panel(); if not w then return false, "no window" end
    local s = w.scale
    local bad = {}
    for _, ctl in ipairs(G.controls) do
        local tl = w:controlAt(ctl.x * s, ctl.y * s)
        local last = w:controlAt((ctl.x + ctl.w - 1) * s, (ctl.y + ctl.h - 1) * s)
        local past = w:controlAt((ctl.x + ctl.w) * s, (ctl.y + ctl.h) * s)
        if not tl or tl.id ~= ctl.id then bad[#bad + 1] = ctl.id .. ":top-left" end
        if not last or last.id ~= ctl.id then bad[#bad + 1] = ctl.id .. ":last-pixel" end
        if past and past.id == ctl.id then bad[#bad + 1] = ctl.id .. ":past-edge-hit" end
    end
    if #bad > 0 then return false, table.concat(bad, ",") end
    return true, tostring(#G.controls) .. " controls, both ends of every box"
end

-- The rocker divider row (device y=577) is inactive by design.
function CFFN.rockerGap()
    local S, w = panel(); if not w then return false, "no window" end
    local s = w.scale
    local x = (176 + 24) * s
    local up = w:controlAt(x, 576 * s)
    local gap = w:controlAt(x, 577 * s)
    local down = w:controlAt(x, 578 * s)
    return true, tostring(up and up.id), tostring(gap and gap.id), tostring(down and down.id)
end

-- Pressing changes the key face to its pressed colour and releasing restores it.
function CFFN.pressColour(controlId)
    local S, w = panel(); if not w then return false, "no window" end
    -- Pick a primitive that changes IN THE STATE BEING PRESSED. The first
    -- version took the first C13 primitive with any override, which is the
    -- UP half's face (C13.04); pressing DOWN correctly leaves that alone, so
    -- the probe reported a fault the renderer did not have (2026-09-13).
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
    w.pressed = nil
    local normal = hex(w:colourFor(comp, prim))
    w.pressed = controlId
    local held = hex(w:colourFor(comp, prim))
    w.pressed = nil
    local released = hex(w:colourFor(comp, prim))
    return true, prim.id, normal, held, released
end

-- A real mouse down/up pair over a control dispatches exactly once.
function CFFN.click(controlId)
    local S, w = panel(); if not w then return false, "no window" end
    local target
    for _, ctl in ipairs(G.controls) do if ctl.id == controlId then target = ctl end end
    if not target then return false, "no such control" end
    local s = w.scale
    local x, y = (target.x + 2) * s, (target.y + 2) * s
    local got = {}
    local old = S.onAction
    S.onAction = function(action, id) got[#got + 1] = tostring(id) .. "->" .. tostring(action) end
    w:onMouseDown(x, y)
    local during = tostring(w.pressed)
    w:onMouseUp(x, y)
    S.onAction = old
    return true, during, tostring(#got), table.concat(got, ";")
end

-- A drag off the key before release must NOT dispatch.
function CFFN.dragOff(controlId)
    local S, w = panel(); if not w then return false, "no window" end
    local target
    for _, ctl in ipairs(G.controls) do if ctl.id == controlId then target = ctl end end
    if not target then return false, "no such control" end
    local s = w.scale
    local got = 0
    local old = S.onAction
    S.onAction = function() got = got + 1 end
    w:onMouseDown((target.x + 2) * s, (target.y + 2) * s)
    w:onMouseUp(1 * s, 1 * s)        -- released on the housing, not the key
    S.onAction = old
    return true, tostring(got), tostring(w.pressed)
end

-- The LCD rect in screen space, and that no hardware primitive enters it.
function CFFN.lcd()
    local S, w = panel(); if not w then return false, "no window" end
    local r = w:lcdRect()
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
    return true, string.format("%d,%d %dx%d", r.x, r.y, r.w, r.h), tostring(#intruders), table.concat(intruders, ",")
end

-- Label placement, measured rather than eyeballed. The design gives baselines
-- and the game anchors text by its top; the first live render put every label
-- ~10px high, on its icon, because getFontHeight is the full line height and
-- not the ascent (2026-09-13). For each key: the label's drawn top must sit
-- BELOW the lowest icon rectangle in the same component, and its glyphs must
-- end on the manifest baseline. Uses the same measurement the renderer uses,
-- so this is a check of the placement rule, not a second guess at metrics.
function CFFN.labels()
    local S, w = panel(); if not w then return false, "no window" end
    local tm = getTextManager()
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
        if label then
            local font = (label.font == "UI Medium") and UIFont.Medium or UIFont.Small
            -- Measure the INK, not the glyph box. The renderer places the box
            -- at baseline - (YOffset + YReal); the ink begins YOffset rows below
            -- that, at baseline - YReal. For UI Small on "NOTE" that is 4 blank
            -- rows (measured in-game, 2026-09-13: YOffset=4, YReal=8), and a
            -- box-top comparison reported a 0-1px overlap that was empty space.
            local ink = tm:MeasureStringYReal(font, label.text)
            local top = label.baseline - ink        -- ink top, component-local, scale 1
            local gap = top - iconBottom
            out[#out + 1] = string.format("%s:%s top=%d icon=%d gap=%d", c.id, label.text, top, iconBottom, gap)
            if gap < 1 then bad[#bad + 1] = c.id .. ":" .. label.text .. " overlaps icon by " .. tostring(1 - gap) end
        end
    end
    if #bad > 0 then return false, table.concat(bad, "; "), table.concat(out, " | ") end
    return true, table.concat(out, " | ")
end
