-- The PDA as a player actually uses it, inside a running game.
--
-- The distinction that matters: this drives the device through the SAME
-- entry points the player's hands reach, not through the screen's private
-- API. Opening it means putting the organiser in the primary hand, because
-- that is the switch (O.handTick); closing it means taking it out. A test
-- that calls OrganiserScreen.open() is testing our own function, not the
-- feature.
CFGAME = CFGAME or {}
local S = ConspiracyFiles.OrganiserScreen
local O = ConspiracyFiles.Organiser

local function player() return getPlayer and getPlayer() end

-- ---------------------------------------------------------------- obtaining
-- A survivor is issued an organiser at spawn. Find it the way the mod does.
function CFGAME.issued()
    local p = player(); if not p then return false, "no player" end
    local item = O.held and O.held(p)
    if not item then return false, "no organiser in inventory" end
    local md = item:getModData()
    local favourite = select(2, pcall(function() return item:isFavorite() end))
    return true, tostring(item:getFullType()), tostring(md.cfOrganiser == true),
        tostring(favourite), tostring(O.readable and select(1, O.readable(item)))
end

-- ------------------------------------------------------ the hand is the switch
-- Put it in the main hand and let the mod's own tick notice, exactly as
-- equipping it in play does.
function CFGAME.takeOut()
    local p = player(); if not p then return false, "no player" end
    local item = O.held(p); if not item then return false, "no organiser" end
    pcall(function() p:setPrimaryHandItem(item) end)
    for _ = 1, 5 do pcall(O.tick) end
    return true, tostring(S.window ~= nil), tostring(S.window and S.window.on)
end

function CFGAME.putAway()
    local p = player(); if not p then return false, "no player" end
    pcall(function() p:setPrimaryHandItem(nil) end)
    for _ = 1, 5 do pcall(O.tick) end
    return true, tostring(S.window == nil)
end

-- ------------------------------------------------------------------- screens
-- Every program on the launcher, opened by TAPPING ITS ICON, then a record
-- opened, then backed out - and what the screen says it is at each step.
function CFGAME.tour()
    local w = S.window; if not w then return false, "no screen" end
    w.on = true; w.booting = false
    w:press("MODE")
    local visited, problems = {}, {}
    local programs = w:programs()
    for i, program in ipairs(programs) do
        w:press("MODE")                 -- HOME, through the real key
        w:prerender()                   -- so the launcher's hit boxes exist
        local hit
        for _, h in ipairs((w.context or {}).hits or {}) do
            if h.id == "APP" and h.payload == i then hit = h end
        end
        if not hit then
            problems[#problems + 1] = program.title .. ": no icon to tap"
        else
            w:onMouseDown(hit.x + 2, hit.y + 2); w:onMouseUp(hit.x + 2, hit.y + 2)
            w:prerender()
            local opened = w:program()
            if not opened or opened.title ~= program.title then
                problems[#problems + 1] = program.title .. ": tap opened "
                    .. tostring(opened and opened.title)
            else
                visited[#visited + 1] = program.title
                -- And a row, if it has any. Tapping a row does not always
                -- open a record, and it is not supposed to: a to-do TICKS
                -- (that is how they are completed) and a SETUP line steps a
                -- size. So the assertion is that the tap did SOMETHING
                -- observable, which is the behaviour a player relies on -
                -- asserting "a record opened" wrongly failed the TO DO
                -- program as soon as there was a real to-do in it.
                local rows = w:list()
                if rows and #rows > 0 then
                    local row = rows[1]
                    local wasDone = row.todo and tostring(row.label):find("%[x%]") ~= nil
                    local sizeBefore = tostring(S.scale) .. "/" .. tostring(S.fontSize)
                    w:openRow(1); w:prerender()
                    if row.todo then
                        local after = w:list()[1]
                        local nowDone = after and tostring(after.label):find("%[x%]") ~= nil
                        if nowDone == wasDone then
                            problems[#problems + 1] = program.title .. ": tapping a to-do did not tick it"
                        end
                        w:openRow(1)              -- put it back as it was
                    elseif row.setup then
                        if sizeBefore == tostring(S.scale) .. "/" .. tostring(S.fontSize) then
                            problems[#problems + 1] = program.title .. ": tapping a size line changed nothing"
                        end
                    elseif row.cfHeading then
                        if w.record then problems[#problems + 1] = program.title .. ": a heading opened a record" end
                    elseif not w.record then
                        problems[#problems + 1] = program.title .. ": a row would not open"
                    end
                    w:press("INDEX"); w:prerender()
                    if w.record then problems[#problems + 1] = program.title .. ": BACK left the record open" end
                end
            end
        end
    end
    if #problems > 0 then return false, table.concat(problems, " | "), table.concat(visited, ",") end
    return true, tostring(#visited), table.concat(visited, ",")
end

-- The rocker and the four keys, each proved by an observable effect.
function CFGAME.controls()
    local w = S.window; if not w then return false, "no screen" end
    w.on = true; w.booting = false
    local problems = {}
    -- HOME from inside a record reaches the launcher.
    w.launcher = false; w.app = 1; w.cachedList = nil
    local rows = w:list()
    if rows and #rows > 0 then w:openRow(1) end
    w:press("C09")
    if not w.launcher then problems[#problems + 1] = "HOME (C09) did not reach the launcher" end
    -- The rocker moves the selection on a list.
    w.launcher = false; w.app = 1; w.cachedList = nil; w.entry = 1
    w:prerender()
    local before = w.entry
    w:press("rocker_down"); w:prerender()
    local afterDown = w.entry
    w:press("rocker_up"); w:prerender()
    local afterUp = w.entry
    if #(w:list() or {}) > 1 and afterDown == before then
        problems[#problems + 1] = "the rocker did not move the selection down"
    end
    if afterUp ~= before then problems[#problems + 1] = "the rocker did not come back up" end
    -- The two unassigned keys must do NOTHING except wake it.
    w.launcher = true; w.record = nil
    local snapshot = tostring(w.launcher) .. tostring(w.app) .. tostring(w.entry)
    w:press("C10"); w:press("C11")
    if tostring(w.launcher) .. tostring(w.app) .. tostring(w.entry) ~= snapshot then
        problems[#problems + 1] = "an unassigned key changed the screen"
    end
    -- BACK stops at the launcher rather than falling off the top.
    w:press("C12")
    if not w.launcher then problems[#problems + 1] = "BACK went past the launcher" end
    if #problems > 0 then return false, table.concat(problems, " | ") end
    return true, "HOME, BACK, the rocker both ways, and two keys that do nothing"
end

-- ------------------------------------------------------------- writing state
-- A note and a to-do, written the way the player writes them, so there is
-- something of the survivor's own to survive a save.
function CFGAME.write(text)
    local w = S.window; if not w then return false, "no screen" end
    w.on = true; w.booting = false
    local Apps = ConspiracyFiles.KnoxApps
    local ok1 = pcall(Apps.addNote, tostring(text or "night note"))
    local ok2 = pcall(Apps.addToDo, "night to-do " .. tostring(text or ""))
    w.cachedList = nil
    return true, tostring(ok1), tostring(ok2), CFGAME.countState()
end

function CFGAME.countState()
    local notes = ModData.get("ConspiracyFiles.KnoxNotes")
    local todos = ModData.get("ConspiracyFiles.KnoxToDo")
    local n = (type(notes) == "table" and type(notes.items) == "table") and #notes.items or -1
    local t = (type(todos) == "table" and type(todos.items) == "table") and #todos.items or -1
    return "notes=" .. n .. " todos=" .. t
end

-- The two size settings, and whether they came back.
function CFGAME.setSizes(scale, font)
    S.fontSize = tonumber(font) or S.FONT_DEFAULT
    S.zoom(tonumber(scale) or 1)
    S.savePrefs()
    return true, tostring(S.scale), tostring(S.fontSize)
end

function CFGAME.sizes()
    return true, tostring(S.scale), tostring(S.fontSize)
end

-- --------------------------------------------------------- hostile world state
-- What the device does when its own stores are rubbish. A save edited by hand,
-- a mod conflict, a half-written file: the device must still open.
function CFGAME.corrupt()
    local notes = ModData.getOrCreate("ConspiracyFiles.KnoxNotes")
    local todos = ModData.getOrCreate("ConspiracyFiles.KnoxToDo")
    local prefs = ModData.getOrCreate("ConspiracyFilesOrganiserPrefs")
    notes.items = "not a table"
    todos.items = { "a bare string", 42, {}, { text = nil, done = "yes" } }
    prefs.scale = "enormous"
    prefs.fontSize = -17
    return true, "stores corrupted"
end

-- Open it, draw every screen, and report anything that threw. This is the
-- assertion that corrupted state degrades rather than crashing.
function CFGAME.survivesCorruption()
    local problems = {}
    S.prefsLoaded = nil                  -- force the bad prefs to be read
    local ok, why = pcall(S.open)
    if not ok then return false, "would not open: " .. tostring(why) end
    local w = S.window
    if not w then return false, "no window after open" end
    if type(w.scale) ~= "number" or w.scale < 1 or w.scale > S.MAX then
        problems[#problems + 1] = "bad prefs produced scale " .. tostring(w.scale)
    end
    if type(w.fontSize) ~= "number" or not S.FONT_SIZES[w.fontSize] then
        problems[#problems + 1] = "bad prefs produced fontSize " .. tostring(w.fontSize)
    end
    w.on = true; w.booting = false
    for i = 1, #w:programs() do
        w.launcher = false; w.app = i; w.cachedList = nil; w.record = nil
        local drew, err = pcall(function()
            local rows = w:list()
            w:prerender()
            if rows and #rows > 0 then w:openRow(1); w:prerender() end
        end)
        if not drew then problems[#problems + 1] = "program " .. i .. ": " .. tostring(err) end
    end
    if #problems > 0 then return false, table.concat(problems, " | ") end
    return true, "opened and drew every program on corrupted stores"
end

-- ------------------------------------------------------ inventory interactions
-- Taking the organiser out of the inventory entirely while the screen is up.
function CFGAME.removeItem()
    local p = player(); if not p then return false, "no player" end
    local item = O.held(p); if not item then return false, "no organiser" end
    pcall(function() p:setPrimaryHandItem(item) end)
    for _ = 1, 5 do pcall(O.tick) end
    local wasOpen = S.window ~= nil
    pcall(function() p:getInventory():Remove(item) end)
    pcall(function() p:setPrimaryHandItem(nil) end)
    for _ = 1, 10 do pcall(O.tick) end
    return true, tostring(wasOpen), tostring(S.window == nil),
        tostring(O.held(p) == nil)
end

-- ITEM TRANSFER: the organiser stashed in a bag.
--
-- getItems() returns only what is directly in the main inventory - a worn
-- backpack is one item in that list and its contents live in the bag's own
-- container - so an organiser inside a bag was invisible to O.issued. O.give
-- runs on every OnGameStart, concluded the survivor had never been issued one,
-- and added ANOTHER. Every reload with the device in a bag produced one more.
--
-- Reachable in ordinary play: it is a pocket device and players stash things.
function CFGAME.stashAndReissue()
    local p = player(); if not p then return false, "no player" end
    local inv = p:getInventory()
    local item = O.held(p); if not item then return false, "no organiser" end
    -- A container to put it in. Any bag the survivor has; else make one.
    local bag
    local items = inv:getItems()
    for i = 0, items:size() - 1 do
        local candidate = items:get(i)
        local container = candidate and candidate.getInventory and candidate:getInventory()
        if container and candidate ~= item then bag = candidate; break end
    end
    if not bag then
        bag = inv:AddItem("Base.Bag_Satchel")
        if not bag or not bag.getInventory or not bag:getInventory() then
            return false, "could not obtain a container to stash it in"
        end
    end
    -- Counted by walking, not by getAllTypeRecurse: that call matches an
    -- item's SHORT type, so the full type finds nothing and comes back as a
    -- valid empty list. Believing it is what broke the organiser entirely.
    local function countCarried(container, depth)
        if not container or depth > 4 then return 0 end
        local list = container.getItems and container:getItems()
        if not list then return 0 end
        local n = 0
        for i = 0, list:size() - 1 do
            local it = list:get(i)
            if it then
                local ok, full = pcall(function() return it:getFullType() end)
                if ok and full == O.TYPE then n = n + 1 end
                local inner = it.getInventory and select(2, pcall(function() return it:getInventory() end))
                if inner and inner ~= container then n = n + countCarried(inner, depth + 1) end
            end
        end
        return n
    end
    local before = countCarried(inv, 0)
    -- Move it into the bag.
    pcall(function() p:setPrimaryHandItem(nil) end)
    local moved = pcall(function()
        inv:Remove(item)
        bag:getInventory():AddItem(item)
    end)
    if not moved then return false, "could not move the organiser into the bag" end
    -- Still found, though it is inside a container.
    local stillFound = O.issued(p) ~= nil
    -- And issuing again must NOT add a second one.
    O.give(p)
    local after = countCarried(inv, 0)
    return true, tostring(stillFound), tostring(before), tostring(after),
        tostring(bag:getFullType())
end

-- And a new one is issued again, so losing it costs convenience and never the
-- case (P4-R80).
function CFGAME.reissue()
    local p = player(); if not p then return false, "no player" end
    local item, why = O.give(p)
    if not item then return false, "not reissued: " .. tostring(why) end
    return true, tostring(O.held(p) ~= nil)
end

-- Where the window sits for a given screen size, so a resolution change
-- cannot leave it off-screen.
function CFGAME.placement(w0, h0)
    local fit = S.fit(tonumber(h0))
    local m = S.metrics(fit)
    -- S.place reads the live screen, so compute the same way against the
    -- hypothetical one.
    local screenW = tonumber(w0)
    local x = screenW - m.w
    return true, tostring(fit), tostring(m.w) .. "x" .. tostring(m.h),
        tostring(x >= 0), tostring(m.h <= tonumber(h0))
end

-- ------------------------------------------------------------ live records
-- Owner, Windows, 2026-09-14, three reports in one sitting: a new find only
-- appeared after leaving the program and coming back; every DATES entry read
-- 02:00; and a DATES entry could not be opened. A discovery is recorded the way
-- the mod records one, with a program open, and the screen is read back. The
-- FILES list is stood in for so the tap has a record to open.
function CFGAME.liveRecords()
    local w = S.window; if not w then return false, "no screen" end
    local D = ConspiracyFiles.DiscoveryLog
    local A = ConspiracyFiles.KnoxApps
    w.on = true; w.booting = false; w.launcher = false; w.record = nil; w.day = nil
    for i, p in ipairs(w:programs()) do if p.id == "DATES" then w.app = i end end
    w.entry, w.card, w.cachedList = 1, 1, nil
    w:prerender(); w:list()
    local cachedBefore = w.cachedList ~= nil
    local ref = "cfgame:live-" .. tostring(getTimeInMillis())
    local recorded = D.record("evidence", ref)
    local refreshed = cachedBefore and w.cachedList == nil
    local clock = getGameTime()
    local hourNow = math.floor(clock:getTimeOfDay())
    local program = w:program()
    local _, _, at = w:category(program)
    local today = clock:getDay() + 1
    local day = program.day(at or 1, today)
    local entry
    for _, e in ipairs(day.entries or {}) do if e.ref == ref then entry = e end end
    local shown = entry and entry.text or "none"
    local hourOk = entry ~= nil and shown:sub(1, 5) == string.format("%02d:00", hourNow)
    local files = A.files.list
    A.files.list = function() return {{id = ref, title = "Live record", detail = "check", fields = {}}} end
    w.record = day; w.day = today; w.card = 1
    w:prerender()
    local hit
    for _, h in ipairs((w.context or {}).hits or {}) do
        if h.id == "ENTRY" and day.entries[h.payload] == entry then hit = h end
    end
    local opened, back = false, false
    if hit then
        w:onMouseDown(hit.x + 2, hit.y + 2); w:onMouseUp(hit.x + 2, hit.y + 2)
        opened = w.record ~= nil and w.record.id == ref
        w:press("INDEX"); w:prerender()
        back = w.record == day
    end
    A.files.list = files
    -- The week across the top (P4-R100): it holds the open day, and tapping
    -- another day in it opens that day.
    local weekOk = false
    for _, cell in pairs(day.week or {}) do if cell.day == today then weekOk = true end end
    local otherDay, tried = false, false
    w.record = day; w.card = 1; w:prerender()
    for _, h in ipairs((w.context or {}).hits or {}) do
        if h.id == "WEEKDAY" and h.payload ~= today and not tried then
            tried = true
            w:onMouseDown(h.x + 2, h.y + 2); w:onMouseUp(h.x + 2, h.y + 2)
            if w.record and w.record.dayView and w.record.dayNumber == h.payload then otherDay = h.payload end
        end
    end
    w.record = nil; w.day = nil; w.cachedList = nil
    return tostring(recorded), tostring(cachedBefore), tostring(refreshed), shown,
        tostring(hourOk), tostring(hit ~= nil), tostring(opened), tostring(back),
        tostring(weekOk), tostring(otherDay)
end

return CFGAME
