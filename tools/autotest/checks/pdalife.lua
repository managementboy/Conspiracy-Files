-- The PDA over a long session: does anything accumulate?
--
-- Every question here is about state that outlives the thing that made it.
-- Unit tests cannot answer any of them, because the leaks are in the game's
-- own registries - the UI manager's element list, the Events tables, ModData -
-- and those only exist inside a running game.
CFLIFE = CFLIFE or {}
local S = ConspiracyFiles.OrganiserScreen

-- How many handlers an Event is holding. PZ's Event object keeps them in a
-- list; the field name has moved between builds, so try the known shapes and
-- say plainly when none of them is readable rather than reporting a wrong zero.
function CFLIFE.handlers(name)
    local ev = Events and Events[name]
    if not ev then return nil, "no event " .. tostring(name) end
    for _, field in ipairs({"callbacks", "handlers", "listeners", "_callbacks"}) do
        local t = ev[field]
        if type(t) == "table" then return #t, field end
    end
    -- Some builds keep them in the array part of the event itself.
    if #ev > 0 then return #ev, "self" end
    return nil, "handler list not readable on this build"
end

function CFLIFE.handlerCounts()
    local out, unreadable = {}, {}
    for _, name in ipairs({"OnTick", "OnGameStart", "OnPostUIDraw",
                           "OnFillInventoryObjectContextMenu", "OnCreatePlayer"}) do
        local n, how = CFLIFE.handlers(name)
        if n then out[#out + 1] = name .. "=" .. n else unreadable[#unreadable + 1] = name end
    end
    return true, table.concat(out, " "),
        (#unreadable > 0 and ("unreadable: " .. table.concat(unreadable, ",")) or "all readable")
end

-- Everything the UI manager is holding, so a window that is closed but still
-- referenced shows up as a number that climbs.
function CFLIFE.uiCount()
    local mgr = UIManager and UIManager.getUI and UIManager.getUI()
    if not mgr then return nil end
    local ok, n = pcall(function() return mgr:size() end)
    return ok and n or nil
end

-- The heap figure, in kilobytes, after two collections.
--
-- WHAT THIS NUMBER IS AND IS NOT, measured on this engine 2026-09-13 rather
-- than assumed:
--
--   * Between separate eval calls it drifts on its own by up to 6 MB with
--     nothing happening at all (five idle reads: 1480704, 1474560, 1476608,
--     1478656, 1476608). So a before/after pair spanning two calls says
--     nothing.
--   * WITHIN one call it is stable: two hundred no-op iterations moved it by
--     exactly 0 KB. So a before/after pair inside one call is meaningful.
--   * But collectgarbage here almost certainly cannot force a full JVM
--     collection, and every UI panel is a Java object. Growth therefore
--     cannot distinguish "still referenced" from "garbage not yet collected".
--
-- Which is why nothing FAILS on this number. The leak assertions are the
-- direct reachability ones: the UI manager's element count, the window being
-- nil after close, and the event handler counts. Those say what is still
-- reachable; this says what has not been swept yet.
function CFLIFE.heapKB()
    collectgarbage("collect"); collectgarbage("collect")
    return collectgarbage("count")
end

-- The same loop shape doing no device work, so the growth above has a control
-- taken in the same call under the same conditions.
function CFLIFE.heapControl(n)
    n = tonumber(n) or 200
    local before = CFLIFE.heapKB()
    for _ = 1, n do local t = {}; t[1] = _; t = nil end
    local after = CFLIFE.heapKB()
    return true, string.format("%+.2fKB per idle iteration", (after - before) / n)
end

-- Open and close the device n times through the SAME entry points the player's
-- hand uses, and report what accumulated.
function CFLIFE.cycle(n)
    n = tonumber(n) or 100
    local heapBefore = CFLIFE.heapKB()
    local before = { ui = CFLIFE.uiCount() }
    local _, handlersBefore = CFLIFE.handlerCounts()
    local errors = 0
    for _ = 1, n do
        local ok = pcall(S.open)
        if not ok then errors = errors + 1 end
        local w = S.window
        if w then
            -- Draw it, so anything created lazily during a frame is created.
            pcall(function() w:prerender() end)
        end
        if not pcall(S.close) then errors = errors + 1 end
    end
    local _, handlersAfter = CFLIFE.handlerCounts()
    local after = { ui = CFLIFE.uiCount() }
    local heapAfter = CFLIFE.heapKB()
    return true, tostring(n), tostring(errors),
        "ui " .. tostring(before.ui) .. "->" .. tostring(after.ui),
        "handlers before[" .. handlersBefore .. "] after[" .. handlersAfter .. "]",
        tostring(S.window == nil),
        string.format("heap %.0fKB->%.0fKB (%+.0fKB, %+.2fKB per cycle)",
            heapBefore, heapAfter, heapAfter - heapBefore, (heapAfter - heapBefore) / n)
end

-- Rapid screen changes: every program, opened and backed out of, repeatedly.
-- This is where a stale cachedList or a record left behind would show.
function CFLIFE.churn(rounds)
    rounds = tonumber(rounds) or 50
    local w = S.window or S.open()
    if not w then return false, "no screen" end
    w.on = true; w.booting = false
    local programs = w:programs()
    local errors, visited = 0, 0
    for _ = 1, rounds do
        for i = 1, #programs do
            local ok = pcall(function()
                w.launcher = false; w.record = nil; w.app = i; w.cachedList = nil
                local rows = w:list()
                w:prerender()
                if rows and #rows > 0 then
                    w:openRow(1)
                    w:prerender()
                end
                w:press("INDEX")   -- BACK
                w:prerender()
                w:press("MODE")    -- HOME
                w:prerender()
            end)
            if ok then visited = visited + 1 else errors = errors + 1 end
        end
    end
    return true, tostring(rounds), tostring(visited), tostring(errors),
        tostring(w.record == nil), tostring(w.launcher == true)
end

-- Every size combination, drawn. Both size controls, all nine pairs, which is
-- also every glyph set the type can land on.
function CFLIFE.sizes()
    local w = S.window or S.open()
    if not w then return false, "no screen" end
    local missing, drawn = {}, 0
    for _, scale in ipairs(S.SCALES) do
        for font = 1, #S.FONT_SIZES do
            S.fontSize = font
            S.zoom(scale)
            local cur = S.window
            if not cur then return false, "the device vanished at " .. scale .. "/" .. font end
            cur.fontSize = font
            local ok, err = pcall(function() cur:prerender() end)
            if ok then drawn = drawn + 1
            else missing[#missing + 1] = scale .. "x/font" .. font .. ": " .. tostring(err) end
        end
    end
    S.fontSize = S.FONT_DEFAULT
    S.zoom(1)
    if #missing > 0 then return false, table.concat(missing, "; ") end
    -- Counted from the tables, not typed: P4-R99 made it 5 machine sizes x 4
    -- text sizes, and a hard-coded 9 failed a run that drew all 20.
    return true, tostring(drawn), tostring(#S.SCALES * #S.FONT_SIZES)
end

-- The stores the device writes, so growth can be seen rather than guessed.
function CFLIFE.stores()
    local out = {}
    for _, tag in ipairs({"ConspiracyFilesOrganiserPrefs", "ConspiracyFiles.KnoxNotes",
                          "ConspiracyFiles.KnoxToDo", "ConspiracyFiles.DeadAir"}) do
        local t = ModData and ModData.get and ModData.get(tag)
        local n = 0
        if type(t) == "table" then
            for _ in pairs(t) do n = n + 1 end
            if type(t.items) == "table" then n = #t.items end
        end
        out[#out + 1] = tag .. "=" .. n
    end
    return true, table.concat(out, " ")
end

-- Deliberately hostile: drive the device through states a player can reach by
-- being contrary, and states they cannot, and require that it survives.
function CFLIFE.abuse()
    local w = S.window or S.open()
    if not w then return false, "no screen" end
    local problems = {}
    local function try(what, fn)
        local ok, err = pcall(fn)
        if not ok then problems[#problems + 1] = what .. ": " .. tostring(err) end
    end
    -- Every control, while asleep, while booting, and with no cell.
    for _, state in ipairs({"asleep", "booting", "normal"}) do
        try("press-" .. state, function()
            w.on = (state ~= "asleep")
            w.booting = (state == "booting")
            for _, id in ipairs({"C09","C10","C11","C12","rocker_up","rocker_down","MODE","PREV","NEXT","INDEX"}) do
                w:press(id); w:prerender()
            end
        end)
    end
    w.on = true; w.booting = false
    -- Taps at and beyond every edge of the device, including the exact
    -- half-open boundary pixels.
    try("edge-taps", function()
        local m = S.metrics(w.scale)
        for _, p in ipairs({{0,0},{m.w-1,m.h-1},{m.w,m.h},{-5,-5},{m.w+50,m.h+50},
                            {math.floor(m.w/2),math.floor(m.h/2)}}) do
            w:onMouseDown(p[1],p[2]); w:onMouseUp(p[1],p[2]); w:prerender()
        end
    end)
    -- A row index that does not exist, and a record opened twice.
    try("bad-rows", function()
        w.launcher=false; w.app=1; w.cachedList=nil
        w:openRow(0); w:openRow(-1); w:openRow(99999); w:prerender()
        w:openRow(1); w:openRow(1); w:prerender()
    end)
    -- The note writer opened, abandoned, and opened again without committing.
    try("note-churn", function()
        for _ = 1, 20 do
            w:writeNote(); w:prerender()
            w:finishNote(false); w:prerender()
        end
    end)
    -- Closing twice, and drawing after close.
    try("double-close", function()
        S.close(); S.close()
        S.open(); S.close()
    end)
    if #problems > 0 then return false, table.concat(problems, " | ") end
    return true, "survived every state"
end

return CFLIFE
