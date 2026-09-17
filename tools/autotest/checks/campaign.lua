-- Long campaign check (checks/campaign.sh): several generated cases played end
-- to end in one save, with a save and reload between them. Loaded after
-- core_loop.lua and reload.lua, whose stages it reuses: CFLoop finds, takes
-- and inspects a clue the player's way; CFReload measures the save.
--
-- What only shows across cases and over time is what this is for: a finished
-- case turning into questions, the answers surviving a reload, the next case
-- built from them, the case after that built from nothing, the record's order
-- across cases, finished evidence staying Old, and the save growing case by case.
CFCamp = CFCamp or {}
local C = CFCamp
local R = ConspiracyFiles.GeneratedRuntime
local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")
-- A FINISHED case is one the mod calls retired, which since P4-R111 includes a
-- STUB: the fifth finished case archives the first, and a stub has no `rows`
-- array at all. Counting by `rows` made the finished count go DOWN when a case
-- was archived, so wait_finished waited for a number that could never come
-- again and the archive stage reported "did not finish" twice
-- (20260918T005315). Ask RetiredCase, as the mod does.
local Retired = require("ConspiracyFiles/Generated/RetiredCase")

local function roots()
    local store = ModData.get("ConspiracyFiles.Generated.G2")
    local wrapper = store and Cases.current(store)
    return (wrapper and Cases.sessions(wrapper)) or {}
end
local function caseIdOf(root) return root.caseId or (root.case and root.case.caseId) end
local function short(id) return (tostring(id):gsub("^generated:", ""):gsub(":case$", "")) end

-- Every case in campaign order: "index:seed:live|retired".
function C.cases()
    local out, retired = {}, 0
    for i, root in ipairs(roots()) do
        local done = Retired.isRetired(root)
        if done then retired = retired + 1 end
        out[#out + 1] = i .. ":" .. short(caseIdOf(root)) .. ":" .. (done and "retired" or "live")
    end
    return #out, retired, table.concat(out, " ")
end

-- The unfinished case created first: it has had longest to be placed.
function C.oldestLive()
    for _, root in ipairs(roots()) do if root.case then return root.case.caseId end end
    return "none"
end

-- Whether a live case carries the relay memo, and how many of its other documents
-- are dated inside the memo's week (P4-R126: the date note needs at least one).
function C.memoWeek(caseId)
    local Memo = require("ConspiracyFiles/Generated/RelayMemo")
    for _, root in ipairs(roots()) do
        if root.case and root.case.caseId == caseId then
            local memo, dated = false, 0
            for _, d in ipairs(root.case.documents) do
                if d.kind == Memo.KIND then memo = true elseif Memo.inWeek(d.body) then dated = dated + 1 end
            end
            return tostring(memo), dated
        end
    end
    return "false", 0
end

-- The newest case still being played, or "none".
function C.newestLive()
    local id = "none"
    for _, root in ipairs(roots()) do if root.case then id = root.case.caseId end end
    return id
end

-- Clues the harness could not reach, so the next pass moves on to another.
C.skipped = C.skipped or {}
function C.skipFirst()
    local d = CFLoop.list and CFLoop.list[1]
    if d then C.skipped[d.id] = true end
    return d and d.id or "none"
end

-- Point CFLoop at one case's clues still to find, in document order, so
-- inspect_doc 1 always plays the next one of that case and no other. Clues
-- already noted, and clues skipped, are left out.
--
-- The STATUS comes from the store, not from the diagnostic: since P4-R133 a
-- case goes live with the clues that fit and the rest wait as `deferred`
-- assignments with no target, so R.devLocations gives them no coordinates and
-- CFLoop.docs() cannot see them at all. A check reading only the diagnostic
-- would think a partial case was whole, play its three placed clues and then
-- wait for a completion that cannot come.
--
-- Returns: findable now, placed, waiting (pending, placing or deferred),
-- dropped (expired, accounted for and never coming), and the statuses.
function C.useCase(caseId)
    local prefix = tostring(caseId):gsub(":case$", ":")
    local known = {}
    for _, row in ipairs(R.known()) do known[row.id] = true end
    local status = {}
    for _, root in ipairs(roots()) do
        for id, a in pairs(root.assignments or {}) do status[id] = a.status end
    end
    local byId = {}
    for _, d in ipairs(CFLoop.docs()) do byId[d.id] = d end
    local out, placed, waiting, dropped, seen = {}, 0, 0, 0, {}
    for id, st in pairs(status) do
        if id:sub(1, #prefix) == prefix and not known[id] and not C.skipped[id] then
            seen[#seen + 1] = id:match("document%-(%d+)$") .. ":" .. tostring(st)
            if st == "dropped" then dropped = dropped + 1
            elseif st == "placed" and byId[id] then out[#out + 1] = byId[id]; placed = placed + 1
            else waiting = waiting + 1 end
        end
    end
    table.sort(out, function(a, b)
        return (tonumber(a.id:match("document%-(%d+)$")) or 0) < (tonumber(b.id:match("document%-(%d+)$")) or 0)
    end)
    table.sort(seen)
    CFLoop.list = out
    return #out, placed, waiting, dropped, table.concat(seen, " ")
end

-- How a live case was built: its steer (or "unsteered"), its first person and
-- whether they are marked met (no body), and every clue title.
function C.steerOf(caseId)
    for _, root in ipairs(roots()) do
        if root.case and root.case.caseId == caseId then
            local s, first = root.case.steer, root.case.identities[1]
            local titles = {}
            for _, d in ipairs(root.case.documents) do titles[#titles + 1] = d.title end
            if not s then
                return "unsteered", "", "", "", tostring(first.name), tostring(first.met == true), table.concat(titles, " | ")
            end
            return tostring(s.fromCase), tostring(s.reading), tostring(s.way), tostring(s.person or s.organisation),
                tostring(first.name), tostring(first.met == true), table.concat(titles, " | ")
        end
    end
    return "none", "", "", "", "", "", ""
end

-- A finished case's questions: what it asks about and what was answered.
function C.answersOf(caseId)
    for _, q in ipairs(R.questions() or {}) do
        if q.caseId == caseId then
            local a, o = q.answers or {}, q.offered
            return "true", tostring(a.reading), tostring(a.matters), tostring(a.way), tostring(a.usedBy),
                tostring(o.people[1]), tostring(o.people[2]), tostring(o.organisation)
        end
    end
    return "false", "", "", "", "", "", "", ""
end

-- Answer a finished case's three questions the player's way: FILES, its row,
-- each question, a line of each pick list. `lines` are the pick-list lines.
function C.answer(caseId, l1, l2, l3)
    local S = ConspiracyFiles.OrganiserScreen
    local w = S.window or S.open()
    if not w then return "false", "the organiser would not open" end
    w.on = true; w.booting = false; w.launcher = false; w.record = nil; w.popup = nil
    for i, p in ipairs(w:programs()) do if p.id == "FILES" then w.app = i end end
    w.cachedList = nil; w.entry = 1
    local function tapHit(id, payload)
        for _ = 1, 4 do
            w:prerender()
            for _, h in ipairs((w.context or {}).hits or {}) do
                if h.id == id and (payload == nil or h.payload == payload) then
                    w:onMouseDown(h.x + 2, h.y + 2); w:onMouseUp(h.x + 2, h.y + 2)
                    return true
                end
            end
            -- A row further down the list: step the selection to it.
            if id == "ROW" then w:press("DOWN") end
        end
        return false
    end
    local at
    for i, row in ipairs(w:list()) do if row.questions and row.questions.caseId == caseId then at = i end end
    if not at then pcall(S.close); return "false", "FILES has no question row for " .. short(caseId) end
    if not tapHit("ROW", at) or not (w.record and w.record.questions) then
        pcall(S.close); return "false", "the question row did not open"
    end
    for question, line in ipairs({ l1, l2, l3 }) do
        if not tapHit("QUESTION", question) or not w.popup then pcall(S.close); return "false", "question " .. question .. " opened no pick list" end
        if not tapHit("POPUP", line) then pcall(S.close); return "false", "pick list line " .. line .. " was not drawn" end
    end
    local Q = require("ConspiracyFiles/Generated/Questions")
    local q = w.record.questions
    local note = Q.note(q.answers, q.offered) or ""
    pcall(S.close)
    return "true", note
end

-- What the organiser shows: question rows and evidence in FILES, NAMES, PLACES,
-- and the record's discoveries.
function C.surfaces()
    local A = require("ConspiracyFiles/KnoxApps")
    local qrows, papers = 0, 0
    for _, r in ipairs(A.files.list() or {}) do if r.questions then qrows = qrows + 1 else papers = papers + 1 end end
    return qrows, papers, #(A.names.list("All") or {}), #(A.places.list() or {}), #R.known()
end

-- The record's discoveries, by case index in campaign order. Cases played
-- one after another must read as a non-decreasing run such as 11111122222233.
function C.order()
    local index = {}
    for i, root in ipairs(roots()) do index[tostring(caseIdOf(root)):gsub(":case$", ":")] = i end
    local seq, ok, last = {}, true, 0
    for _, row in ipairs(R.known()) do
        local prefix = tostring(row.id):match("^(generated:%d+:)")
        local i = prefix and index[prefix] or 0
        if i < last then ok = false end
        last = i
        seq[#seq + 1] = tostring(i)
    end
    return tostring(ok), table.concat(seq)
end

-- The timer's gaps: off (0) while waiting for the next case, back to normal
-- (24 h after a case is created, 1 h after one finishes) once it has come, so
-- further cases do not pile up while this one is played.
function C.gap(normal)
    local c = ConspiracyFiles.AutomaticInvestigations.config
    if normal then c.minGapHours, c.afterCompletionHours = 24, 1
    else c.minGapHours, c.afterCompletionHours = 0, 0 end
    return c.minGapHours, c.afterCompletionHours
end

-- The clue the harness is about to look for: where the case says it is, its
-- placement state, and where the runtime last saw it.
function C.describeFirst()
    local d = CFLoop.list and CFLoop.list[1]
    if not d then return "none" end
    local state, where = R.whereabouts(d.id)
    return string.format("%s at %s,%s floor %s (%s) [%s]; runtime: %s %s", d.id, tostring(d.x), tostring(d.y),
        tostring(d.z), tostring(d.place), tostring(d.status), tostring(state), tostring(where))
end

-- Where the survivor stands and how long they have survived: the anchor and
-- the reach a later case is prepared from.
function C.here()
    local p = getPlayer()
    return math.floor(p:getX()), math.floor(p:getY()), p:getHoursSurvived()
end

-- MOVING ON BETWEEN CASES (P4-R125, P4-R67). A new case is refused where the
-- survivor has no unused, loaded buildings with containers near them, and once
-- refused it is not tried again until they have moved about 50 tiles or half an
-- in-game hour has passed. This check used to stand where case 1 left it, so
-- after case 1 no further case ever came: "Deferred: insufficient distinct
-- loaded storage nearby", 17 times in 20260917T160453 and in the four runs
-- before it. Between cases it now does what a player does - goes to another
-- neighbourhood - and the checks keep their meaning, because the case is
-- prepared from wherever the survivor is standing and the shell reads
-- CFCamp.here() after the move.
local function usedSites()
    local used = {}
    for _, root in ipairs(roots()) do
        if root.case then for _, s in ipairs(root.case.locations) do used[s.id] = true end
        else for _, row in ipairs(root.rows or {}) do if row.locationId then used[row.locationId] = true end end end
    end
    return used
end

-- Every building on the map that no case has used, from the metagrid
-- (checks/addresses.lua reads the same list): a building needs no loaded cell
-- to be considered, only to be scanned once the survivor is standing in it.
-- Site ids are "t3:" .. the building's id string (Generated/NearbyCatalog).
local function freshBuildings(minRooms)
    local grid = getWorld() and getWorld():getMetaGrid()
    local list = grid and grid:getBuildings()
    local used = usedSites()
    local out = {}
    for i = 0, (list and list:size() or 0) - 1 do
        local b = list:get(i)
        local id = "t3:" .. tostring(b:getIDString())
        local rooms = b:getRooms():size()
        if not used[id] and rooms >= minRooms then
            out[#out + 1] = { id = id, rooms = rooms,
                x = math.floor((b:getX() + b:getX2()) / 2), y = math.floor((b:getY() + b:getY2()) / 2) }
        end
    end
    return out
end

-- Move on: into the middle of a building no case has used, just beyond
-- `minTiles` away, preferring one with unused neighbours - a case needs two
-- sites with containers of its own, so a lone barn in a field is no use.
-- Returns ok, where, what was chosen, how far it was.
C.NEIGHBOURS = 120
function C.moveOn(minTiles)
    minTiles = tonumber(minTiles) or 300
    local p = getPlayer()
    if not p then return "false", "no player" end
    local px, py = p:getX(), p:getY()
    local all = freshBuildings(2)
    if #all == 0 then return "false", "no building on the map is unused" end
    local ring = {}
    for _, b in ipairs(all) do
        local d = math.sqrt((b.x - px) ^ 2 + (b.y - py) ^ 2)
        if d >= minTiles and b.rooms >= 4 then ring[#ring + 1] = { b = b, d = d } end
    end
    if #ring == 0 then
        return "false", "no unused building with four rooms over " .. minTiles .. " tiles away (" .. #all .. " unused on the map)"
    end
    table.sort(ring, function(a, z) return a.d < z.d end)
    local pick, neighbours = nil, 0
    for i = 1, math.min(#ring, 20) do
        local c = ring[i].b
        local n = 0
        for _, b in ipairs(all) do
            if b.id ~= c.id and math.abs(b.x - c.x) <= C.NEIGHBOURS and math.abs(b.y - c.y) <= C.NEIGHBOURS then n = n + 1 end
        end
        if n >= 5 then pick, neighbours = ring[i], n; break end
    end
    pick = pick or ring[1]
    local b = pick.b
    p:teleportTo(b.x + 0.5, b.y + 0.5, 0)
    C.movedTo = b
    return "true", b.x .. "," .. b.y,
        b.id .. ", " .. b.rooms .. " rooms, " .. neighbours .. " unused buildings within " .. C.NEIGHBOURS .. " tiles",
        string.format("%.0f", pick.d)
end

-- Has the world around the survivor loaded enough for a case to be placed?
-- Generated/Storage.scan accepts only loaded real furniture, so the answer is
-- the squares the cell has and the containers standing on them. Returns
-- whether it is worth asking for a case, the squares and the containers.
function C.settled(radius)
    radius = tonumber(radius) or 8
    local p, cell = getPlayer(), getCell()
    if not p or not cell then return "false", 0, 0 end
    local px, py, pz = math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ())
    local squares, containers = 0, 0
    for dx = -radius, radius do for dy = -radius, radius do
        local sq = cell:getGridSquare(px + dx, py + dy, pz)
        if sq then
            squares = squares + 1
            local objects = sq:getObjects()
            for i = 0, objects:size() - 1 do
                local o = objects:get(i)
                if o.getContainerCount and o:getContainerCount() > 0 then containers = containers + 1 end
            end
        end
    end end
    return tostring(containers >= 6), squares, containers
end

-- A live case's two sites: inside the reach of (x, y) for that many hours
-- survived, and not a site any other case already used.
function C.placement(caseId, x, y, hours)
    local Reach = require("ConspiracyFiles/Reach")
    local radius = Reach.radius(tonumber(hours))
    local used, mine = {}, nil
    for _, root in ipairs(roots()) do
        local id = caseIdOf(root)
        if id == caseId and root.case then
            mine = root.case.locations
        elseif root.case then
            for _, s in ipairs(root.case.locations) do used[s.id] = true end
        else
            for _, row in ipairs(root.rows or {}) do if row.locationId then used[row.locationId] = true end end
        end
    end
    if not mine then return "false", "false", "no live case " .. short(caseId) end
    local within, fresh, detail = true, true, {}
    for _, s in ipairs(mine) do
        local inside = radius ~= nil and Reach.contains(s.bounds, { x = tonumber(x), y = tonumber(y) }, radius)
        if not inside then within = false end
        if used[s.id] then fresh = false end
        detail[#detail + 1] = s.id .. (inside and "" or " (outside reach)") .. (used[s.id] and " (reused)" or "")
    end
    return tostring(within), tostring(fresh), "reach " .. tostring(radius) .. ": " .. table.concat(detail, ", ")
end

-- Try to change a finished case's answers; used answers must refuse.
function C.tryChange(caseId)
    local ok, why = R.setAnswers(caseId, { way = "person" })
    return tostring(ok == true), tostring(why)
end

-- Whether a case is being prepared, and how many cases there are.
function C.preparing()
    local s = R.automaticStatus()
    return tostring(s.preparing), s.count, s.limit
end

-- Carried evidence by category: a finished case's must be Evidence / Old, a live
-- case's must be Evidence.
function C.categories()
    local oldOk, oldBad, liveOk, liveBad = 0, 0, 0, 0
    local function walk(container, depth)
        if not container or depth > 3 then return end
        local items = container:getItems()
        for i = 0, items:size() - 1 do
            local item = items:get(i)
            local md = item:getModData()
            if type(md) == "table" and md.cfGeneratedId then
                local ok, category = pcall(function() return item:getDisplayCategory() end)
                category = ok and category or nil
                if R.retiredPaper(item) then
                    if category == "EvidenceOld" then oldOk = oldOk + 1 else oldBad = oldBad + 1 end
                elseif R.subject(item) then
                    if category == "Evidence" then liveOk = liveOk + 1 else liveBad = liveBad + 1 end
                end
            end
            local inner = item.getInventory and item:getInventory()
            if inner then walk(inner, depth + 1) end
        end
    end
    walk(getPlayer():getInventory(), 0)
    return oldOk, oldBad, liveOk, liveBad
end

-- THE GENERATOR'S OWN PROMISE (P4-R133, docs/design/CASE_PACING.md step 6).
-- A refusal now carries a code from a closed set, a per-code count, the
-- in-game hour a case is promised BY, and the rung of the ladder that count
-- has earned. So the check no longer writes a finding when no case comes: it
-- reads the promise and fails when the hour passes.
--
-- Returns: code, count, due (hh:mm), rung, rungMax, now (hh:mm), overdue,
-- hours overdue, preparing, active/activeLimit, cases/limit.
local function hhmm(h)
    if type(h) ~= "number" or h ~= h then return "-" end
    local m = math.floor(h * 60 + 0.5) % 1440
    return string.format("%02d:%02d", math.floor(m / 60), m % 60)
end
function C.promise()
    local s = R.automaticStatus()
    local now = getGameTime():getWorldAgeHours()
    local over = type(s.dueHours) == "number" and now > s.dueHours
    return tostring(s.why), tostring(s.deferCount), hhmm(s.dueHours), tostring(s.rung), tostring(s.rungMax),
        hhmm(now), tostring(over == true),
        string.format("%.2f", type(s.dueHours) == "number" and (now - s.dueHours) or 0),
        tostring(s.preparing), tostring(s.active) .. "/" .. tostring(s.activeLimit),
        tostring(s.count) .. "/" .. tostring(s.limit)
end

-- The ladder must climb with the count (P4-R133): three refusals of one code
-- earn a rung, up to MAX_RUNG. A count that walks past a threshold while the
-- rung stands still means the generator is refusing without ever lowering its
-- standard, which is the fault the ladder exists to prevent.
function C.ladder()
    local Cases2 = require("ConspiracyFiles/Generated/SuccessiveCases")
    local s = R.automaticStatus()
    local per, max = Cases2.REFUSALS_PER_RUNG, Cases2.MAX_RUNG
    local expected = math.min(max, math.floor((s.deferCount or 0) / per))
    return tostring((s.rung or 0) >= expected), tostring(s.rung), tostring(expected),
        tostring(s.deferCount), tostring(per), tostring(max)
end

-- Every assignment of every case by status, so a case that will not come can
-- be read against what the save is still holding: a `placing` that never ends
-- refuses every later case as `busy`, and that refusal is logged at debug
-- level, which never reaches the console.
function C.assignments()
    local n, parts = {}, {}
    for _, root in ipairs(roots()) do
        for _, a in pairs(root.assignments or {}) do n[tostring(a.status)] = (n[tostring(a.status)] or 0) + 1 end
    end
    for k, v in pairs(n) do parts[#parts + 1] = k .. "=" .. v end
    table.sort(parts)
    return table.concat(parts, " ")
end

-- THE ARCHIVE (P4-R111, docs/design/CASE_RETIREMENT.md). A finished case keeps
-- its rows while it is one of the four most recent; older ones become stubs.
-- What a check can read: how many are full, how many are stubs, how many rows
-- each still offers the reading surface, and whether a stubbed case still
-- offers its questions.
function C.archive()
    local full, stubs, rows, stubbedWithQuestions, ids = 0, 0, 0, 0, {}
    for i, root in ipairs(roots()) do
        if Retired.isRetired(root) then
            local isStub = Retired.isStub(root)
            if isStub then stubs = stubs + 1 else full = full + 1 end
            rows = rows + #(root.rows or {})
            ids[#ids + 1] = i .. ":" .. short(caseIdOf(root)) .. (isStub and ":stub" or ":full") .. ":" .. #(root.rows or {})
            if isStub and root.offered then stubbedWithQuestions = stubbedWithQuestions + 1 end
        end
    end
    return full, stubs, rows, stubbedWithQuestions, table.concat(ids, " ")
end

-- A record of a finished case, as the loot list and the right-click menu show
-- it: the one thing the archive could break is a clue in the world whose case
-- is now a stub. Walks the survivor's own inventory, which is where the
-- campaign check's finished clues are.
function C.oldEvidence()
    local checked, old, greyed, missing, sample = 0, 0, 0, 0, ""
    local function look(item)
        local md = item:getModData()
        if type(md) ~= "table" or not md.cfGeneratedId then return end
        if not R.retiredPaper(item) then return end
        checked = checked + 1
        local ok, category = pcall(function() return item:getDisplayCategory() end)
        if ok and category == "EvidenceOld" then old = old + 1 end
        local ctx = ISInventoryPaneContextMenu.createMenu(0, true, { item }, 200, 200)
        local option = ctx and ctx:getOptionFromName("Already in the Investigation")
        if not option and ctx then option = ctx:getOptionFromName("Already in the organiser") end
        if option then
            if option.notAvailable then greyed = greyed + 1 end
            if sample == "" then sample = tostring(item:getDisplayName()) .. " -> " .. tostring(option.name) end
        else
            missing = missing + 1
            if sample == "" then sample = tostring(item:getDisplayName()) .. " -> no such option (" ..
                tostring(ctx and #(ctx.options or {}) or "no menu") .. " options)" end
        end
        if ctx then ctx:closeAll() end
    end
    -- Down into the bags: the evidence album files a clue into itself as soon
    -- as it is picked up, so the top level of the inventory holds none of them
    -- (the first run read "0 checked", 20260917T234706).
    local function walk(container, depth)
        if not container or depth > 3 then return end
        local items = container:getItems()
        for i = 0, items:size() - 1 do
            local item = items:get(i)
            pcall(look, item)
            local inner = item.getInventory and item:getInventory()
            if inner then walk(inner, depth + 1) end
        end
    end
    walk(getPlayer():getInventory(), 0)
    return checked, old, greyed, missing, sample
end

-- AD-10 town names in the record (P4-R129): a place in another town carries the
-- town, a place in the survivor's own town does not. Read from the reading
-- surface's own rows, with the town the survivor is standing in.
function C.townNames()
    local rows = require("ConspiracyFiles/EvidenceRows").list("evidence") or {}
    local map = ConspiracyFiles.AddressMap
    -- The town the survivor is standing in, the same way the record decides
    -- whether to write one (AddressMap.qualified: a place in your own town is
    -- written without it).
    local here = map and map.currentTown and map.currentTown() or nil
    local withTown, plain, sample, other = 0, 0, "", ""
    for _, row in ipairs(rows) do
        local words = tostring(row.detailText or "") .. " | " .. tostring(row.text or "")
        -- A house number, a street, then a comma and a capitalised name: that
        -- comma is only ever written for a place in another town.
        local address, town = words:match("(%d+ [%u][%a%.]* ?[%a%.]*),%s*(%u%a+[%a ]*)")
        if address and town then
            withTown = withTown + 1
            if sample == "" then sample = address .. ", " .. town end
        elseif words:match("%d+ [%u][%a%.]* ?[%a%.]*") then
            plain = plain + 1
            if other == "" then other = tostring(words:match("(%d+ [%u][%a%.]* ?[%a%.]*)")) end
        end
    end
    return tostring(here), withTown, plain, sample .. (other ~= "" and ("; own town: " .. other) or ""), #rows
end

-- Every unfinished case, so a check that needs to finish one can move on from
-- one it could not (campaign 20260918T003507 asked the same broken case twice).
function C.liveIds()
    local out = {}
    for _, root in ipairs(roots()) do if root.case then out[#out + 1] = root.case.caseId end end
    return table.concat(out, " ")
end

-- ANOTHER TOWN (AD-10, P4-R129). Every case of a run is within 300 tiles, so
-- all its records are in the survivor's own town and none carries a town name -
-- correct, and only half the rule. The shipped address book knows which
-- buildings are in which town, so this walks to one in a different town and the
-- records can be read from there.
function C.moveToTown()
    local map = ConspiracyFiles.AddressMap
    local B = require("ConspiracyFiles/Generated/AddressBook")
    local here = map and map.currentTown and map.currentTown() or nil
    local p = getPlayer()
    local px, py = p:getX(), p:getY()
    local best, bestTown, bestD
    for _, row in ipairs(B.rows or {}) do
        local id, x, y = row:match("^([^|]+)|(%-?%d+)|(%-?%d+)|")
        local town = id and map.townForBuilding and map.townForBuilding(id) or nil
        if town and town ~= here then
            local d = math.sqrt((tonumber(x) - px) ^ 2 + (tonumber(y) - py) ^ 2)
            -- The NEAREST other town: a shorter walk loads fewer cells.
            if not bestD or d < bestD then best, bestTown, bestD = { x = tonumber(x), y = tonumber(y) }, town, d end
        end
    end
    if not best then return "false", "the address book knows no town but " .. tostring(here) end
    p:teleportTo(best.x + 0.5, best.y + 0.5, 0)
    return "true", tostring(here), tostring(bestTown), best.x .. "," .. best.y, string.format("%.0f", bestD)
end

-- WHERE A WAITING CLUE IS WAITING (P4-R133). The filler scans the deferred
-- clue's OWN site for a free container, and Storage only ever sees loaded
-- squares - so walking on to a fresh neighbourhood, which is what brings the
-- next case, is exactly the wrong way for an instalment: the survivor has to
-- be at the site the clue belongs to. (Six moves away from it placed nothing,
-- 20260918T011509.) This teleports into the middle of that site.
function C.goToWaitingSite(caseId)
    local prefix = tostring(caseId):gsub(":case$", ":")
    for _, root in ipairs(roots()) do
        if root.case and root.assignments then
            for id, a in pairs(root.assignments) do
                if id:sub(1, #prefix) == prefix and a.status == "deferred" then
                    for _, site in ipairs(root.case.locations) do
                        if site.id == a.locationId then
                            local b = site.bounds
                            local x = math.floor((b.x1 + b.x2) / 2)
                            local y = math.floor((b.y1 + b.y2) / 2)
                            getPlayer():teleportTo(x + 0.5, y + 0.5, b.z or 0)
                            return "true", id, site.id, x .. "," .. y, tostring(a.deferredHours)
                        end
                    end
                    return "false", "site " .. tostring(a.locationId) .. " is not in the case"
                end
            end
        end
    end
    return "false", "no deferred clue in " .. short(caseId)
end
