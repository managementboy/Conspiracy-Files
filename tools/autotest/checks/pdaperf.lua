-- What the PDA actually costs to draw, measured in a real game.
--
-- Counts every drawing call the device issues for ONE frame, per screen, and
-- times a run of frames. Both numbers matter and they are different things:
--
--   * CALL COUNT is the Lua->Java crossing count. Every one of these
--     primitives is already a GPU-backed textured or coloured quad - PZ's
--     renderer batches them engine-side - so the GPU is not the constraint
--     here and never was. The constraint is how many times per frame Lua
--     reaches across into Java.
--   * FRAME TIME is what that costs in practice.
--
-- Measured by calling prerender directly rather than sampling the real frame
-- loop: deterministic, so it can be a regression gate rather than a vibe.
CFPDA = CFPDA or {}
local S = ConspiracyFiles.OrganiserScreen

local COUNTED = {"drawRect","drawRectBorder","drawTexture","drawTextureScaled",
                 "drawText","drawTextCentre"}

local function screen()
    local w = S and S.window
    if not w then return nil, "no screen" end
    return w
end

-- Wrap the instance's draw methods with counters. Instance fields shadow the
-- class, so the real methods are restored by simply removing them.
local function instrument(w)
    local counts = {}
    local originals = {}
    for _, name in ipairs(COUNTED) do
        local orig = w[name]
        if type(orig) == "function" then
            originals[name] = rawget(w, name)
            counts[name] = 0
            w[name] = function(self, ...)
                counts[name] = counts[name] + 1
                return orig(self, ...)
            end
        end
    end
    return counts, function()
        for _, name in ipairs(COUNTED) do w[name] = originals[name] end
    end
end

local function total(counts)
    local n = 0
    for _, v in pairs(counts) do n = n + v end
    return n
end

local function describe(counts)
    local parts = {}
    for _, name in ipairs(COUNTED) do
        if counts[name] and counts[name] > 0 then
            parts[#parts + 1] = name .. "=" .. counts[name]
        end
    end
    return table.concat(parts, " ")
end

-- One frame's worth of drawing calls, with the device in whatever state the
-- caller has put it in.
function CFPDA.frame(label)
    local w, why = screen(); if not w then return false, why end
    local counts, restore = instrument(w)
    local ok, err = pcall(function() w:prerender() end)
    restore()
    if not ok then return false, "prerender threw: " .. tostring(err) end
    return true, tostring(label), tostring(total(counts)), describe(counts)
end

-- Frame time over `n` frames, in milliseconds, total and per frame.
function CFPDA.time(n)
    local w, why = screen(); if not w then return false, why end
    n = tonumber(n) or 120
    local clock = getTimestampMs
    if not clock then return false, "no engine clock" end
    -- One untimed pass so first-use texture loads and list building do not
    -- land inside the measurement.
    pcall(function() w:prerender() end)
    local began = clock()
    for _ = 1, n do
        local ok, err = pcall(function() w:prerender() end)
        if not ok then return false, "prerender threw: " .. tostring(err) end
    end
    local took = clock() - began
    return true, tostring(n), string.format("%.2f", took),
        string.format("%.4f", took / n)
end

-- Put the device on a named screen so each one can be measured separately.
-- Uses the same paths a player's taps do, not private state pokes.
function CFPDA.show(what)
    local w, why = screen(); if not w then return false, why end
    w.on = true; w.booting = false
    if what == "launcher" then
        w:press("MODE")
        w.launcher = true; w.record = nil
    elseif what == "list" then
        w.launcher = false; w.record = nil; w.app = 1; w.cachedList = nil
    elseif what == "record" then
        w.launcher = false; w.record = nil; w.app = 1; w.cachedList = nil
        local rows = w:list()
        if not rows or #rows == 0 then return false, "no rows to open" end
        w:openRow(1)
        if not w.record then return false, "row would not open" end
    elseif what == "off" then
        w.on = false
    else
        return false, "unknown screen " .. tostring(what)
    end
    return true, tostring(what), tostring(w.launcher == true),
        tostring(w.record ~= nil), tostring(w.on)
end

-- How much text is on screen at the current size, so a call count can be read
-- against the thing that drives it.
function CFPDA.shape()
    local w, why = screen(); if not w then return false, why end
    local l = w:lcd()
    return true, tostring(w.scale), tostring(w.fontSize), tostring(l.t),
        tostring(l.w) .. "x" .. tostring(l.h), tostring(#(w:list() or {}))
end

-- WHERE the frame time goes, split three ways. The launcher costs 0.8ms more
-- than a list for only 17 more draw calls, so the call count is plainly not
-- the dominant term and optimising it would have been guesswork.
--
--   case    = Fieldnote.Panel.render: the housing, 119 static primitives
--   content = Screen:draw: Knox.OS laying out and drawing the LCD
--   checks  = idleCheck + powerCheck + heldControl, the non-drawing part
function CFPDA.split(n)
    local w, why = screen(); if not w then return false, why end
    n = tonumber(n) or 120
    local clock = getTimestampMs
    if not clock then return false, "no engine clock" end
    local S2 = ConspiracyFiles.OrganiserScreen
    local Panel = Fieldnote and Fieldnote.Panel
    if not Panel then return false, "no Fieldnote panel" end
    local Case = { x = 40, y = 50 }        -- lcd origin, device units

    local function timed(f)
        pcall(f)                            -- warm
        local began = clock()
        for _ = 1, n do pcall(f) end
        return (clock() - began) / n
    end

    local case = timed(function()
        Panel.render(w, w.scale, w:heldControl())
    end)
    local content = timed(function()
        if w.on then w:draw(Case.x * w.scale, Case.y * w.scale) end
    end)
    local checks = timed(function()
        w:idleCheck(); w:powerCheck(); w:heldControl()
    end)
    local whole = timed(function() w:prerender() end)
    return true, string.format("case=%.4f content=%.4f checks=%.4f whole=%.4f",
        case, content, checks, whole)
end

-- A screen with real content on it. A fresh world has no discoveries, so the
-- list and record screens measured above were nearly empty - which is the
-- cheap case, not the one a player spends their time in. Notes are the one
-- store a test can fill honestly, and they exercise the same per-character
-- text path every other row uses.
function CFPDA.fill(rows)
    local Apps = ConspiracyFiles.KnoxApps
    if not Apps or not Apps.addNote then return false, "no notes program" end
    rows = tonumber(rows) or 40
    local line = "A folded receipt naming Dana Vale, found in a drawer at 101 4th Street"
    for i = 1, rows do pcall(Apps.addNote, i .. ". " .. line) end
    local w = screen()
    if w then w.cachedList = nil end
    return true, tostring(rows)
end

-- Put the device on the NOTES program, which is now full.
function CFPDA.showNotes()
    local w, why = screen(); if not w then return false, why end
    w.on = true; w.booting = false
    for i, p in ipairs(w:programs()) do
        if p.id == "NOTES" then
            w.launcher = false; w.record = nil; w.app = i; w.cachedList = nil
            local rows = w:list()
            return true, "NOTES", tostring(rows and #rows or 0)
        end
    end
    return false, "no NOTES program"
end

-- The per-tick handlers, timed as a group. This is what runs while the player
-- is simply walking around with the mod installed.
function CFPDA.ticks(n)
    n = tonumber(n) or 600
    local clock = getTimestampMs
    if not clock then return false, "no engine clock" end
    local subjects = {
        {"Organiser.tick", ConspiracyFiles.Organiser and ConspiracyFiles.Organiser.tick},
        {"LocalPersonIntegration.tick", ConspiracyFiles.LocalPersonIntegration and ConspiracyFiles.LocalPersonIntegration.tick},
        {"AutomaticInvestigations.onTick", ConspiracyFiles.AutomaticInvestigations and ConspiracyFiles.AutomaticInvestigations.onTick},
    }
    local out = {}
    for _, s in ipairs(subjects) do
        local name, fn = s[1], s[2]
        if type(fn) == "function" then
            local began = clock()
            for _ = 1, n do pcall(fn) end
            local took = clock() - began
            out[#out + 1] = string.format("%s=%.4fms/call", name, took / n)
        else
            out[#out + 1] = name .. "=absent"
        end
    end
    return true, tostring(n), table.concat(out, " ")
end

return CFPDA
