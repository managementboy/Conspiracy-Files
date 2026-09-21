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
-- The filler's own proximity guard, by name: goToWaitingSite steps back beyond
-- it so a clue CAN be placed at the site the survivor has just loaded.
local StaleClue = require("ConspiracyFiles/StaleClue")

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

-- WHICH WAYS OF INVESTIGATING a live case actually offers.
--
-- The check used to demand a literal "Duty log / " title from a records-steered
-- case. That was never the contract: Story.build guarantees that when the
-- survivor leaned on a way, the case carries at least one OPTIONAL SOURCE whose
-- role is that way (Story.lua, `count=math.max(1,count)`). Which document it is,
-- and what it is called, is the author's business. Pinning the title made the
-- check fail the moment anybody rewrote the event, which is the opposite of what
-- it is for.
--
-- A built document does not carry its role - the role lives on the scenario's
-- optional entry - so this matches each document back to the entry that declared
-- it by title, exactly as test/pile_paperwork.lua does, and reports the roles
-- found. Returns a space-separated list, or "" when none.
local Ordinary = require("ConspiracyFiles/Generated/OrdinaryScenarios")
local Personal = require("ConspiracyFiles/Generated/PersonalScenarios")
local Gen = require("ConspiracyFiles/Generated/Generator")
local function bind(value, case)
    local v = Gen.dateFields(case.facts)
    v.CODE = case.facts.code; v.ORG = case.facts.organisation
    v.P1 = case.facts.sender; v.P2 = case.facts.recipient
    v.SELF = case.facts.survivor or v.SELF
    if case.locations[1] then v.A = case.locations[1].name end
    if case.locations[2] then v.B = case.locations[2].name end
    -- An unbound slot is left as written rather than raising: this runs inside
    -- the game and a diagnostic must never be the thing that breaks a run.
    return (value:gsub("{([%u%d]+)}", function(k) return v[k] or ("{" .. k .. "}") end))
end
function C.waysOf(caseId)
    for _, root in ipairs(roots()) do
        if root.case and root.case.caseId == caseId then
            local case = root.case
            local variant = case.outline == "corroboration" and 1 or 2
            local scenario = Ordinary.get(case.premiseId, variant)
                or Personal.get(case.premiseId, variant)
            if not scenario then return "no-scenario" end
            local declared = {}
            for _, extra in ipairs(scenario.optional or {}) do
                declared[bind(extra.title, case)] = extra.role
            end
            local found, seen = {}, {}
            for _, d in ipairs(case.documents) do
                local role = declared[d.title]
                if role and not seen[role] then seen[role] = true; found[#found + 1] = role end
            end
            table.sort(found)
            return table.concat(found, " ")
        end
    end
    return "none"
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
-- EVERY CASE'S GAPS, with the history of each (P4-R141,
-- DR-20260919-SOLVABLE-WITHDRAWN). A gap is a clue the case ended without: the
-- record says dropped and the survivor never found it. Reported per case with
-- its id, so a run can be read afterwards and say which failure it saw rather
-- than only that something went missing.
--
-- Note what this CANNOT capture yet: whether a gap removed an ESSENTIAL link or
-- only optional context. Today every clue in a case is equal - the notion of an
-- essential chain arrives with the opening pair (DR-20260919-OPENING-CHAIN) -
-- so nothing here may claim it. Said plainly rather than guessed.
function C.gaps()
    local Session = require("ConspiracyFiles/Generated/Session")
    local out = {}
    for _, root in ipairs(roots()) do
        local ok, ids, history = pcall(Session.gaps, root)
        if ok and type(ids) == "table" and #ids > 0 then
            local bits = {}
            for _, id in ipairs(ids) do
                bits[#bits + 1] = id .. "(" .. tostring(history and history[id]) .. ")"
            end
            out[#out + 1] = tostring(root.case and root.case.caseId) .. ": " .. table.concat(bits, " ")
        end
    end
    if #out == 0 then return "none (every clue of every case accounted for and found)" end
    return table.concat(out, " | ") .. " [essential-vs-optional: NOT CAPTURABLE YET, every clue is equal today]"
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

-- KNOX'S BOOT LINE (P4-R111). "Records ....... N" counts the DISCOVERY LEDGER,
-- which the archive never prunes: stubbing a case drops its rows, not the
-- record of what was found. So the boot count must still include a stubbed
-- case's documents. Returns the number on the boot screen, the ledger's own
-- count, how many of those belong to stubbed cases, and the line itself.
function C.bootRecords()
    local A = require("ConspiracyFiles/KnoxApps")
    local line, shown = "", nil
    for _, l in ipairs(A.bootLines() or {}) do
        if tostring(l):find("^Records") then line = tostring(l); shown = tonumber(tostring(l):match("(%d+)%s*$")) end
    end
    local log = ConspiracyFiles.DiscoveryLog
    local ok, events = pcall(function() return log and log.events and log.events() end)
    events = (ok and events) or {}
    -- Which discoveries belong to a case that is now a stub.
    local stubbed = {}
    for _, root in ipairs(roots()) do
        if Retired.isRetired(root) and Retired.isStub(root) then
            stubbed[tostring(caseIdOf(root)):gsub(":case$", ":")] = true
        end
    end
    local fromStubs = 0
    for _, e in ipairs(events) do
        local prefix = tostring(e.ref or e.id or ""):match("^(generated:%d+:)")
        if prefix and stubbed[prefix] then fromStubs = fromStubs + 1 end
    end
    return tostring(shown), #events, fromStubs, line
end

-- A STUB'S QUESTIONS AND ANSWERS (P4-R111). Archiving a finished case keeps
-- what the survivor made of it: its "What do I make of it?" questions must
-- still be offered, its saved answers must still be readable, and an answer
-- already used must still name the case it steered. Returns how many stubs
-- there are, how many still offer questions, how many carry saved answers, how
-- many of those are marked used, and a sample.
function C.stubQuestions()
    local stubs, offered, answered, used, sample = 0, 0, 0, 0, ""
    local questions = R.questions() or {}
    for _, root in ipairs(roots()) do
        if Retired.isRetired(root) and Retired.isStub(root) then
            stubs = stubs + 1
            local id = caseIdOf(root)
            if root.offered then offered = offered + 1 end
            for _, q in ipairs(questions) do
                if q.caseId == id then
                    local a = q.answers or {}
                    if a.reading or a.matters or a.way then
                        answered = answered + 1
                        if a.usedBy then used = used + 1 end
                        if sample == "" then
                            sample = short(id) .. " -> " .. tostring(a.reading) .. "/" .. tostring(a.matters)
                                .. "/" .. tostring(a.way) .. " usedBy=" .. tostring(a.usedBy)
                        end
                    end
                end
            end
        end
    end
    return stubs, offered, answered, used, sample
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
--
-- WHICH LINE IS WHICH. A record row carries two addresses and they are not the
-- same kind of thing (the AD-10 fixer's caveat, 2026-09-18):
--   * the LIVE label - where the mod says the clue is NOW, from
--     GeneratedRuntime.whereabouts / the retired case's last-seen line. It is
--     recomputed as the survivor moves and is what AD-10's "unfreeze the town"
--     fix applies to.
--   * the stored FOUND block - the words the discovery ledger kept at the
--     moment of the find (PlaceIndex.decorate writes them into detailText).
--     That is HISTORY and is frozen by design: a survivor's note of where they
--     were does not rewrite itself when they walk to the next town.
-- Reading detailText alone therefore measures the frozen half, which is what
-- made the assertion read "0 of 16" in 20260918T005315. Both are counted here
-- and the check asserts on the live one.
local function townOf(words)
    -- A house number, a street, then a comma and a capitalised name: that comma
    -- is only ever written for a place in another town.
    local address, town = tostring(words):match("(%d+ [%u][%a%.]* ?[%a%.]*),%s*(%u%a+[%a ]*)")
    if address then return address, town end
    return tostring(words):match("(%d+ [%u][%a%.]* ?[%a%.]*)")
end
-- AD-10 AT THE LEVEL THE FIX WAS MADE (33496b0). A remembered address keeps
-- its two halves and is qualified on the way out, so the question "does the
-- town unfreeze?" can be asked of the address book directly, without a case
-- and without a record: for every building any case used, the label, its town,
-- and what the survivor would write for it HERE. Standing in another town,
-- every one of them must gain ", <town>".
--
-- This is the probe the record-level assertion needed, because a FINISHED
-- case's record rows carry no live address at all: EvidenceRows asks
-- AddressMap.describe(body, case) and retirement drops the case envelope, so
-- the only address left in a finished row is the frozen FOUND line.
function C.qualifyProbe()
    local map = ConspiracyFiles.AddressMap
    if not map or not map.labelParts then return "nil", 0, 0, "no address map" end
    local here = map.currentTown and map.currentTown() or nil
    local ids, seen = {}, {}
    local function add(id)
        if type(id) == "string" and id ~= "" and not seen[id] then seen[id] = true; ids[#ids + 1] = id end
    end
    for _, root in ipairs(roots()) do
        for _, s in ipairs((root.case and root.case.locations) or {}) do add(s.id) end
        for _, r in ipairs(root.rows or {}) do add(r.locationId) end
    end
    local named, plain, parts = 0, 0, {}
    for _, id in ipairs(ids) do
        local label, town = map.labelParts((id:gsub("^t3:", "")))
        if label then
            local q = map.qualify(label, town)
            if town and q ~= label then named = named + 1 else plain = plain + 1 end
            if #parts < 4 then
                parts[#parts + 1] = string.format("%s [%s] -> %q", label, tostring(town), tostring(q))
            end
        end
    end
    return tostring(here), named, plain, table.concat(parts, "; "), #ids
end

function C.townNames()
    local map = ConspiracyFiles.AddressMap
    -- The town the survivor is standing in, the same way the record decides
    -- whether to write one (AddressMap.qualified: a place in your own town is
    -- written without it).
    local here = map and map.currentTown and map.currentTown() or nil
    local rows = require("ConspiracyFiles/EvidenceRows").list("evidence") or {}
    -- WHICH HALF OF THE ROW. PlaceIndex.decorate appends a FOUND block holding
    -- the words the discovery ledger kept at the find; everything before it is
    -- rendered fresh on every refresh, through AddressMap.describe, and is the
    -- half AD-10's fix applies to. Counting the whole detailText measured the
    -- frozen half and read "0 of 16" (20260918T005315).
    local live, livePlain, sample, other = 0, 0, "", ""
    local stored, storedPlain = 0, 0
    local liveCaseRows = 0
    local Cases2 = require("ConspiracyFiles/Generated/SuccessiveCases")
    local store = ModData.get("ConspiracyFiles.Generated.G2")
    local wrapper = store and Cases2.current(store)
    for _, row in ipairs(rows) do
        local detail = tostring(row.detailText or "")
        -- THE MARKER IS "\n\nFOUND\n". Every generated document opens with the
        -- heading "WHAT YOU FOUND", so splitting on the bare word cut the row
        -- after nine characters and made the "live" half the string
        -- "WHAT YOU " - so this counted no live address in any row and the
        -- shortfall was reported against the mod (travel check, 2026-09-18).
        local cut = detail:find("\n\nFOUND\n", 1, true)
        local fresh = cut and detail:sub(1, cut - 1) or detail
        local found = cut and detail:sub(cut + 2) or ""
        -- Only a row whose case is still live can carry a rendered address at
        -- all: retirement drops the case envelope AddressMap.describe needs.
        local root = row.id and Cases2.find(wrapper, row.id)
        if root and root.case then liveCaseRows = liveCaseRows + 1 end
        local address, town = townOf(fresh .. " | " .. tostring(row.text or ""))
        if address and town then
            live = live + 1
            if sample == "" then sample = address .. ", " .. town end
        elseif address then
            livePlain = livePlain + 1
            if other == "" then other = address end
        end
        local fa, ft = townOf(found)
        if fa and ft then stored = stored + 1 elseif fa then storedPlain = storedPlain + 1 end
    end
    return tostring(here), live, livePlain,
        sample .. (other ~= "" and ("; own town: " .. other) or "")
            .. "; rows whose case is still live: " .. liveCaseRows,
        #rows, stored, storedPlain
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

-- FAULT 5, THE CHEAPEST DIAGNOSTIC (docs/design/CASE_PACING.md, "Known
-- unexplained": a clue the record calls `placed` that is not in its container).
-- Three of nine overnight runs saw it and no cause is proven, so when the
-- harness cannot find a clue this prints everything the four suspects would
-- each leave behind:
--   * the STORED TARGET and World.resolve's verdict on it (suspect 2: a
--     relocation whose canonical write was refused leaves the item in the new
--     cupboard while the record still names the old one);
--   * the RELOCATIONS count (same suspect: zero means it never moved);
--   * the last sighting's words and the runtime's own state (suspect 3: a
--     stale sighting reading as current);
--   * and WHERE THE ITEM ACTUALLY IS, searched wider than CFLoop.find does
--     (suspect 1, the one the doc bets on: the mod's identity scan sees every
--     container within TWO tiles of the survivor, CFLoop.find searches ONE
--     around the recorded square, so a clue two tiles out reads as missing
--     while the record honestly names its cupboard). The Chebyshev distance
--     from the recorded square is the number that settles it.
local function tokenNear(cx, cy, cz, radius, token)
    local cell = getCell()
    for r = 0, radius do
        for dx = -r, r do for dy = -r, r do
            if math.max(math.abs(dx), math.abs(dy)) == r then
                local sq = cell:getGridSquare(cx + dx, cy + dy, cz)
                local objects = sq and sq:getObjects()
                for i = 0, (objects and objects:size() or 0) - 1 do
                    local o = objects:get(i)
                    for c = 0, (o.getContainerCount and o:getContainerCount() or 0) - 1 do
                        local cont = o:getContainerByIndex(c)
                        local items = cont and cont.getItems and cont:getItems()
                        for j = 0, (items and items:size() or 0) - 1 do
                            local md = items:get(j):getModData()
                            if type(md) == "table" and md.cfPhysicalToken == token then
                                return cx + dx, cy + dy, cz, r,
                                    tostring(cont.getType and cont:getType()),
                                    tostring(o:getSprite() and o:getSprite():getName())
                            end
                        end
                    end
                end
            end
        end end
    end
    return nil
end
function C.faultFive(id)
    id = id or (CFLoop.list and CFLoop.list[1] and CFLoop.list[1].id)
    if not id then return "no clue to diagnose" end
    local a
    for _, root in ipairs(roots()) do
        if root.assignments and root.assignments[id] then a = root.assignments[id] end
    end
    if not a then return "no assignment for " .. tostring(id) end
    local parts = { id }
    -- droppedFrom separates the TWO HISTORIES a dropped clue can have (P4-R141):
    -- "deferred" never found a container and so was never in the world, while
    -- "carrier" WAS placed on a body, zombie or car that then went away - and
    -- dropMissing nils the target, so without this the two are indistinguishable
    -- afterwards and a run cannot say which failure it saw. "unrecorded" means a
    -- save older than the field, never a guess.
    parts[#parts + 1] = string.format("status=%s droppedFrom=%s relocations=%s site=%s placedHours=%s deferredHours=%s missingHours=%s",
        tostring(a.status), tostring(a.droppedFrom), tostring(a.relocations), tostring(a.locationId),
        tostring(a.placedHours), tostring(a.deferredHours), tostring(a.missingHours))
    local t = a.target
    if not t then parts[#parts + 1] = "target=none (still waiting)" else
        parts[#parts + 1] = string.format("target=%s,%s,%s object=%s container=%s type=%s sprite=%s%s",
            tostring(t.x), tostring(t.y), tostring(t.z), tostring(t.objectIndex), tostring(t.containerIndex),
            tostring(t.containerType), tostring(t.sprite),
            t.carrierMark and (" carrier=" .. tostring(t.carrierKind))
                or (t.vehiclePart and (" part=" .. tostring(t.vehiclePart)) or ""))
        local W = require("ConspiracyFiles/WorldAccess")
        local ok, container = pcall(W.resolve, t, a.physicalToken)
        if not ok then parts[#parts + 1] = "World.resolve THREW: " .. tostring(container)
        elseif not container then parts[#parts + 1] = "World.resolve REFUSED the target (nil)"
        else
            local items = container.getItems and container:getItems()
            local size, mine = items and items:size() or 0, 0
            for i = 0, size - 1 do
                local md = items:get(i):getModData()
                if type(md) == "table" and md.cfPhysicalToken == a.physicalToken then mine = mine + 1 end
            end
            parts[#parts + 1] = string.format("World.resolve ok: type=%s items=%s carrying the token=%s",
                tostring(container.getType and container:getType()), size, mine)
        end
        local x, y, z, r, ctype, sprite = tokenNear(t.x, t.y, t.z, 4, a.physicalToken)
        if x then
            parts[#parts + 1] = string.format("the item IS in the world at %s,%s,%s - %s tile(s) from its recorded square, in a %s [%s]",
                x, y, z, r, ctype, sprite)
        else
            local p = getPlayer()
            local px, py, pz = math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ())
            local ax, ay, _, ar = tokenNear(px, py, pz, 4, a.physicalToken)
            if ax then
                parts[#parts + 1] = string.format("not within 4 tiles of its square, but %s tile(s) from the survivor at %s,%s",
                    ar, ax, ay)
            else
                parts[#parts + 1] = "no item carrying the token within 4 tiles of the recorded square or of the survivor"
            end
        end
    end
    local state, where = R.whereabouts(id)
    parts[#parts + 1] = "whereabouts=" .. tostring(state) .. " (" .. tostring(where) .. ")"
    return table.concat(parts, "; ")
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
                            local z = b.z or 0
                            -- STAND AT THE SITE, THEN STEP BACK. The filler
                            -- needs the site LOADED, which is why the survivor
                            -- goes there - but it also refuses to place a clue
                            -- within StaleClue.PROXIMITY_GUARD_TILES of the
                            -- survivor, so standing on the site is standing
                            -- exactly where nothing may be placed. Run
                            -- 20260918T072821 waited fifteen minutes on that
                            -- and failed ("2 clue(s) never reached a container
                            -- in fifteen minutes"); instalments.sh has stepped
                            -- back for the same reason since it was written.
                            -- The site stays loaded at this distance (that
                            -- check reports 169 squares loaded from 25 tiles).
                            local pc = getPlayer()
                            pc:teleportTo(x + 0.5, y + 0.5, z)
                            local guard = StaleClue.PROXIMITY_GUARD_TILES + 5
                            local cell = getCell()
                            local back
                            for _, d in ipairs({ { 1, 0 }, { 0, 1 }, { -1, 0 }, { 0, -1 },
                                                 { 1, 1 }, { -1, 1 }, { 1, -1 }, { -1, -1 } }) do
                                for extra = 0, 10 do
                                    local tx, ty = x + d[1] * (guard + extra), y + d[2] * (guard + extra)
                                    local sq = cell:getGridSquare(tx, ty, z)
                                    if not back and sq and sq:isFree(false) then
                                        pc:teleportTo(tx + 0.5, ty + 0.5, z)
                                        back = tx .. "," .. ty
                                    end
                                end
                            end
                            return "true", id, site.id, x .. "," .. y, tostring(a.deferredHours),
                                tostring(back or "nowhere free to step back to; standing on the site")
                        end
                    end
                    return "false", "site " .. tostring(a.locationId) .. " is not in the case"
                end
            end
        end
    end
    return "false", "no deferred clue in " .. short(caseId)
end
