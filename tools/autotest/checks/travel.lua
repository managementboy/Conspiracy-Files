-- Stages for checks/travel.sh: one journey across the whole map, Irvington to
-- Muldraugh, asking at every leg whether the cases still work (owner,
-- 2026-09-18: "do a test run from Irvington to muldraugh ... See if the cases
-- work by traveling").
--
-- Loaded after core_loop.lua, reload.lua, campaign.lua and clue_search.lua,
-- whose stages it reuses rather than repeats: CFCamp reads the case store, the
-- promise and the ladder; CFReload measures the save; CFLoop finds, takes and
-- inspects a clue the player's way; CFClue drives the game's own Search Mode.
-- What is new here is everything that only a MOVING survivor can be asked:
-- where they have been, whether a case's clues are inside the reach of that
-- trail, and whether a record written in one town still names it when read
-- from another (P4-R129 / AD-10).
--
-- An `ev -f` loaded file cannot rely on its own OnTick handlers, so nothing
-- here schedules anything: the driver calls these by name with real game
-- frames in between.
CFTrav = CFTrav or {}
local T = CFTrav
local R = ConspiracyFiles.GeneratedRuntime
local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired = require("ConspiracyFiles/Generated/RetiredCase")
-- ConspiracyFiles/Reach is deliberately NOT required here: the reach assertion
-- keeps its own copy of P4-R55's radii (see ruleRadius below), so widening the
-- mod's reach cannot widen the yardstick that judges it.
local Book = require("ConspiracyFiles/Generated/AddressBook")

local function roots()
    local store = ModData.get("ConspiracyFiles.Generated.G2")
    local wrapper = store and Cases.current(store)
    return (wrapper and Cases.sessions(wrapper)) or {}
end
local function caseIdOf(root) return root.caseId or (root.case and root.case.caseId) end
local function short(id) return (tostring(id):gsub("^generated:", ""):gsub(":case$", "")) end
local function map() return ConspiracyFiles.AddressMap end
local function hhmm(h)
    if type(h) ~= "number" or h ~= h then return "-" end
    local m = math.floor(h * 60 + 0.5) % 1440
    return string.format("%02d:%02d", math.floor(m / 60), m % 60)
end

-- ---------------------------------------------------------------------------
-- THE TRAIL. Reach is anchored on where the survivor has actually been, not
-- on where they are standing now (P4-R67, Reach.radius), so a journey has to
-- remember its own legs: a clue placed 300 tiles behind is inside the reach of
-- the anchor it was prepared from and outside the reach of the next stop. Every
-- leg records one anchor, with the survival hours it had at the time.
T.visited = T.visited or {}
T.distance = T.distance or 0

function T.visit()
    local p = getPlayer()
    if not p then return 0, 0, 0, "0" end
    local x, y = math.floor(p:getX()), math.floor(p:getY())
    local h = p:getHoursSurvived()
    local last = T.visited[#T.visited]
    if last then
        T.distance = T.distance + math.sqrt((x - last.x) ^ 2 + (y - last.y) ^ 2)
    end
    if not last or math.max(math.abs(last.x - x), math.abs(last.y - y)) >= 8 then
        T.visited[#T.visited + 1] = { x = x, y = y, hours = h }
    end
    return #T.visited, x, y, string.format("%.1f", h), string.format("%.0f", T.distance)
end

-- Teleport one leg. A player drives; the harness steps, as campaign.sh does.
function T.go(x, y, z)
    local p = getPlayer()
    if not p then return "false", "no player" end
    p:teleportTo(x + 0.5, y + 0.5, z or 0)
    return "true", x .. "," .. y
end

-- Has the world at the survivor's feet streamed in? A leg in the woods will
-- never have six containers within eight tiles, so `CFCamp.settled` is the
-- wrong question between towns: the right one is whether the squares exist at
-- all, which is what every scan the mod makes needs.
function T.loaded(radius)
    radius = tonumber(radius) or 3
    local p, cell = getPlayer(), getCell()
    if not p or not cell then return "false", 0 end
    local px, py, pz = math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ())
    local have, want = 0, 0
    for dx = -radius, radius do for dy = -radius, radius do
        want = want + 1
        if cell:getGridSquare(px + dx, py + dy, pz) then have = have + 1 end
    end end
    return tostring(have == want), have, want
end

-- The survivor's own position, hours and town, in one call.
function T.pos()
    local p = getPlayer()
    local town = map() and map().currentTown and map().currentTown() or nil
    return math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ()),
        string.format("%.1f", p:getHoursSurvived()), hhmm(getGameTime():getWorldAgeHours()), tostring(town)
end

-- Walk, rather than teleport: the game's own walk action to a free square a few
-- tiles off. Movement is what releases a refused case (P4-R125) and what the
-- wordless cue is hung on (P4-R132), and a journey made entirely of teleports
-- would never exercise either. Returns where it is walking to.
function T.walkTo(tiles)
    tiles = tonumber(tiles) or 5
    local p, cell = getPlayer(), getCell()
    local px, py, pz = math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ())
    for _, d in ipairs({ { 1, 0 }, { 0, 1 }, { -1, 0 }, { 0, -1 }, { 1, 1 }, { -1, -1 } }) do
        local sq = cell:getGridSquare(px + d[1] * tiles, py + d[2] * tiles, pz)
        if sq and sq:isFree(false) then
            T.walkGoal = sq
            ISTimedActionQueue.add(ISWalkToTimedAction:new(p, sq))
            return "true", sq:getX() .. "," .. sq:getY(), px .. "," .. py
        end
    end
    return "false", "no free square " .. tiles .. " tiles off"
end
function T.walked()
    local cur = getPlayer():getCurrentSquare()
    local goal = T.walkGoal
    if not goal or not cur then return "false", "?" end
    local d = math.max(math.abs(cur:getX() - goal:getX()), math.abs(cur:getY() - goal:getY()))
    return tostring(cur == goal or d <= 1), cur:getX() .. "," .. cur:getY()
end

-- ---------------------------------------------------------------------------
-- THE FIRST CASE'S OWN WAIT (P4-R133, fixed 2026-09-18). The first case of a
-- save is anchored on the building the survivor is standing in, so
-- GeneratedRuntime.start's firstHouse path waits until they are inside one.
-- Until 2026-09-18 that wait said nothing at all: automaticStatus() read
-- why=nil, and a player who spawned on a street got no case and no reason -
-- which this check's own header used to record as a fact to live with. It now
-- reports the typed code `outdoors`.
--
-- Proven by stepping OUT of the house the journey starts in rather than by
-- starting the journey on a street: the waypoint is deliberately the middle of
-- a numbered building, so the first case is made where it can be found and its
-- record can carry an address. Stepping out before the first case exists is
-- also the player's own way into this state - walk out of the house you woke up
-- in - and it drives nothing but the shipped path: the survivor moves, and the
-- mod is asked why nothing is happening.
T.home = T.home or nil
function T.stepOutside(within)
    local p, cell = getPlayer(), getCell()
    if not p or not cell then return "false", "no player or cell" end
    local px, py, pz = math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ())
    T.home = { x = px, y = py, z = pz }
    for r = 3, (tonumber(within) or 40), 3 do
        for _, d in ipairs({ { 1, 0 }, { 0, 1 }, { -1, 0 }, { 0, -1 }, { 1, 1 }, { -1, -1 }, { 1, -1 }, { -1, 1 } }) do
            local sq = cell:getGridSquare(px + d[1] * r, py + d[2] * r, pz)
            if sq and sq:isFree(false) and not sq:getBuilding() then
                p:teleportTo(sq:getX() + 0.5, sq:getY() + 0.5, sq:getZ())
                return "true", sq:getX() .. "," .. sq:getY(), px .. "," .. py, tostring(r)
            end
        end
    end
    return "false", "no square outside a building within " .. (tonumber(within) or 40) .. " tiles"
end
function T.stepBackInside()
    local p = getPlayer()
    if not p or not T.home then return "false", "nowhere to step back to" end
    p:teleportTo(T.home.x + 0.5, T.home.y + 0.5, T.home.z)
    return "true", T.home.x .. "," .. T.home.y
end
-- Is the survivor in a building, how many cases does the save have, and what
-- does the mod say about the silence? The three facts this wait depends on.
function T.insideAndCases()
    local p = getPlayer()
    local sq = p and p:getCurrentSquare()
    local total = select(1, CFCamp.cases())
    return tostring((sq and sq:getBuilding()) ~= nil), tostring(total),
        tostring(R.automaticStatus().why)
end
-- Does the wait NAME itself? True only while the save really has no case and
-- the survivor really is outside a building, so a case arriving in the middle
-- of the wait cannot make this pass by accident.
function T.waitIsNamed()
    local s = R.automaticStatus()
    local p = getPlayer()
    local sq = p and p:getCurrentSquare()
    local outside = (sq and sq:getBuilding()) == nil
    return tostring(s.why == "outdoors" and s.count == 0 and outside),
        tostring(s.why), tostring(s.count), tostring(outside)
end

-- ---------------------------------------------------------------------------
-- IS EVERY CLUE INSIDE THE REACH OF THE TRAIL? Measured against every anchor
-- the journey recorded, with the radius that anchor's survival hours bought -
-- which is the strict reading of P4-R67: a case is filtered by the reach it had
-- when it was prepared, and the survivor cannot have prepared one from a place
-- they had not yet reached.
--
-- THE RADIUS IS THIS CHECK'S OWN COPY of P4-R55, not Reach.radius. Sharing the
-- yardstick with the code under test made the assertion unfalsifiable: widen
-- the mod's reach and the check widens with it, so every site stayed "inside
-- the reach" however far the generator was allowed to go, and prove.py could
-- never catch a traded reach. This is the rule as the decision states it (250
-- tiles under 96 hours survived, then 500, 1000 and 1500), written out where a
-- reader can compare the two. If the policy is ever changed on purpose, this
-- table changes with it - deliberately, in a second place.
local P4_R55 = { { 96, 250 }, { 264, 500 }, { 504, 1000 } }
local function ruleRadius(hours)
    if type(hours) ~= "number" or hours ~= hours or hours < 0 then return 250 end
    for _, step in ipairs(P4_R55) do if hours < step[1] then return step[2] end end
    return 1500
end
local function nearestAnchor(bounds)
    local best, bestRadius, bestAnchor
    for _, a in ipairs(T.visited) do
        local radius = ruleRadius(a.hours)
        local dx = math.max(bounds.x1 - a.x, 0, a.x - (bounds.x2 - 1))
        local dy = math.max(bounds.y1 - a.y, 0, a.y - (bounds.y2 - 1))
        local d = math.sqrt(dx * dx + dy * dy)
        if not best or (d - radius) < (best - bestRadius) then best, bestRadius, bestAnchor = d, radius, a end
    end
    return best, bestRadius, bestAnchor
end

-- Returns: sites checked, sites outside reach, placed clues checked, clues
-- outside reach, the worst overshoot in tiles, and the detail for the evidence.
function T.outside()
    local sites, badSites, clues, badClues, worst, detail = 0, 0, 0, 0, 0, {}
    if #T.visited == 0 then return 0, 0, 0, 0, "0", "no anchor recorded yet" end
    for _, root in ipairs(roots()) do
        if root.case then
            for _, s in ipairs(root.case.locations or {}) do
                sites = sites + 1
                local d, radius, a = nearestAnchor(s.bounds)
                if d and d > radius then
                    badSites = badSites + 1
                    if (d - radius) > worst then worst = d - radius end
                    detail[#detail + 1] = string.format("%s site %s is %.0f tiles from the nearest anchor %d,%d (reach %d)",
                        short(caseIdOf(root)), s.id, d, a.x, a.y, radius)
                end
            end
            for id, asg in pairs(root.assignments or {}) do
                local t = asg.status == "placed" and asg.target
                if type(t) == "table" and type(t.x) == "number" then
                    clues = clues + 1
                    local d, radius, a = nearestAnchor({ x1 = t.x, y1 = t.y, x2 = t.x + 1, y2 = t.y + 1 })
                    if d and d > radius then
                        badClues = badClues + 1
                        if (d - radius) > worst then worst = d - radius end
                        detail[#detail + 1] = string.format("clue %s is at %d,%d, %.0f tiles from the nearest anchor %d,%d (reach %d)",
                            short(id), t.x, t.y, d, a.x, a.y, radius)
                    end
                end
            end
        end
    end
    return sites, badSites, clues, badClues, string.format("%.0f", worst),
        (#detail > 0 and table.concat(detail, "; ") or "every site and every placed clue is inside the reach of the trail")
end

-- Every live case's clues by status, as the store holds them (P4-R133: a case
-- goes live with what fits and the rest wait, so "placed" is not the only
-- state a live case's clue can be in).
function T.statuses()
    local parts, placed, deferred, dropped = {}, 0, 0, 0
    for _, root in ipairs(roots()) do
        if root.case then
            local n = {}
            for _, a in pairs(root.assignments or {}) do
                local st = tostring(a.status)
                n[st] = (n[st] or 0) + 1
                if st == "placed" then placed = placed + 1
                elseif st == "dropped" then dropped = dropped + 1
                elseif st ~= "found" then deferred = deferred + 1 end
            end
            local bits = {}
            for k, v in pairs(n) do bits[#bits + 1] = k .. "=" .. v end
            table.sort(bits)
            parts[#parts + 1] = short(caseIdOf(root)) .. "[" .. table.concat(bits, " ") .. "]"
        end
    end
    return placed, deferred, dropped, (#parts > 0 and table.concat(parts, " ") or "no live case")
end

-- ---------------------------------------------------------------------------
-- TOWNS. The address book knows which town every numbered building is in, so
-- "a case in Muldraugh" is a question with an answer rather than a guess from
-- coordinates.
local function townOfSite(id)
    if not map() or not map().labelParts then return nil, nil end
    local label, town = map().labelParts((tostring(id):gsub("^t3:", "")))
    return label, town
end

-- WHICH TOWN IS THE SURVIVOR REALLY IN? AddressMap.currentTown is deliberately
-- sticky and rate-limited - it answers at most every five seconds and keeps the
-- last town it knew while the survivor is in the woods, because "walking into
-- the woods does not make someone a stranger to the town they just left". Both
-- of those are right for the record and wrong for a leg line: read straight
-- after a teleport it still names the town 400 tiles back, so a journey's log
-- would say "Irvington" all the way to Rosewood. The shipped book is asked
-- directly here instead, parsed once, and the two answers are reported side by
-- side - which is also the only way to see the stickiness at all.
local function bookRows()
    if T.book then return T.book end
    T.book = {}
    for _, row in ipairs(Book.rows or {}) do
        local id, x, y, x2, y2, area = row:match("^([^|]+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%d+)|")
        if id then
            local a = Book.areas and Book.areas[tonumber(area)]
            local town = a and type(a.name) == "string" and a.name ~= "" and a.name or nil
            if town then
                T.book[#T.book + 1] = { x = tonumber(x), y = tonumber(y),
                    x2 = tonumber(x2), y2 = tonumber(y2), town = town }
            end
        end
    end
    return T.book
end
function T.townAt(x, y, within)
    within = tonumber(within) or 64
    local best, bestD
    for _, r in ipairs(bookRows()) do
        local ex = (x < r.x) and (r.x - x) or ((x >= r.x2) and (x - r.x2 + 1) or 0)
        local ey = (y < r.y) and (r.y - y) or ((y >= r.y2) and (y - r.y2 + 1) or 0)
        local d = math.max(ex, ey)
        if d <= within and (not bestD or d < bestD) then best, bestD = r.town, d end
    end
    return tostring(best), tostring(bestD or "-")
end
-- The mod's own answer beside the book's, so a check can wait for the sticky
-- one to catch up before asserting on a record that depends on it.
function T.townAgrees()
    local p = getPlayer()
    local book = T.townAt(math.floor(p:getX()), math.floor(p:getY()), 64)
    local mine = map() and map().currentTown and map().currentTown() or nil
    return tostring(tostring(mine) == book), tostring(mine), book
end

-- Which towns each live case's sites are in.
function T.caseTowns(caseId)
    local out, mine = {}, nil
    for _, root in ipairs(roots()) do
        if root.case and (caseId == nil or caseId == "" or root.case.caseId == caseId) then
            mine = true
            for _, s in ipairs(root.case.locations or {}) do
                local label, town = townOfSite(s.id)
                out[#out + 1] = short(root.case.caseId) .. " " .. tostring(label) .. " [" .. tostring(town) .. "]"
            end
        end
    end
    return tostring(mine == true), table.concat(out, "; ")
end

-- Is there a live case with a site in this town, and which?
function T.caseIn(town)
    local ids = {}
    for _, root in ipairs(roots()) do
        if root.case then
            for _, s in ipairs(root.case.locations or {}) do
                local _, t = townOfSite(s.id)
                if t == town then ids[#ids + 1] = root.case.caseId; break end
            end
        end
    end
    return tostring(#ids > 0), tostring(ids[1]), #ids, table.concat(ids, " ")
end

-- The newest live case, and its own towns, so the driver can tell a case
-- created in the town just reached from the one the journey started with.
function T.newestLive()
    local id, towns = "none", {}
    for _, root in ipairs(roots()) do if root.case then id = root.case.caseId; towns = root.case.locations end end
    local names = {}
    for _, s in ipairs(towns or {}) do
        local label, town = townOfSite(s.id)
        names[#names + 1] = tostring(label) .. " [" .. tostring(town) .. "]"
    end
    return tostring(id), table.concat(names, "; ")
end

-- HOW MUCH OF THE MAP THE BOOK NUMBERS, and how that lands on a case. AD-10
-- numbers "useful" buildings only, and a building outside the named towns
-- never gets an invented town (P4-R129) - so a case is free to choose a site
-- the book has no row for. AddressMap.describe then refuses the WHOLE case's
-- addresses, and every one of its clues reads with no street at all. This
-- counts both: the sites of every live case, and every building on the map
-- with two or more rooms (the smallest a case will use).
function T.bookCoverage()
    local numbered, total, detail = 0, 0, {}
    for _, root in ipairs(roots()) do
        if root.case then
            local mine, ok = 0, 0
            for _, s in ipairs(root.case.locations or {}) do
                mine = mine + 1
                if townOfSite(s.id) then ok = ok + 1 end
            end
            numbered = numbered + ok; total = total + mine
            detail[#detail + 1] = short(root.case.caseId) .. " " .. ok .. "/" .. mine
        end
    end
    local grid = getWorld() and getWorld():getMetaGrid()
    local list = grid and grid:getBuildings()
    local all, withLabel = 0, 0
    for i = 0, (list and list:size() or 0) - 1 do
        local b = list:get(i)
        if b:getRooms():size() >= 2 then
            all = all + 1
            if townOfSite("t3:" .. tostring(b:getIDString())) then withLabel = withLabel + 1 end
        end
    end
    return numbered, total, table.concat(detail, "; "), withLabel, all
end

-- ---------------------------------------------------------------------------
-- A CLUE, THE PLAYER'S WAY. Pick one placed, unrecognised clue of a case in a
-- fixed container, and point BOTH of the harnesses that already know how to
-- play one at it: CFClue for the game's own Search Mode, CFLoop (and so
-- lib.sh's inspect_doc / note_carried) for taking it and inspecting it.
--
-- `needBook` asks for a clue whose record will CARRY AN ADDRESS at all, which
-- is two conditions, both learned the hard way:
--   * every site of its case is in the shipped address book.
--     AddressMap.describe is all-or-nothing per case - one unnumbered site and
--     the record writes no street for ANY of the case's clues - so without
--     this the address stages can only ever report that fault
--     (run 20260918T222421, the Rosewood case).
--   * the document's OWN WORDS name one of the case's sites. describe only
--     rewrites a site's name where the body mentions it, and plenty of
--     documents mention no place: a letter of resignation carried none, so the
--     row had no address to judge and the stage would have failed the mod for
--     writing a letter (run 20260918T223740).
local function caseRoot(caseId)
    for _, root in ipairs(roots()) do
        if root.case and root.case.caseId == caseId then return root end
    end
end
local function writesAnAddress(caseId, docId)
    local root = caseRoot(caseId)
    if not root then return false end
    local named = {}
    for _, s in ipairs(root.case.locations or {}) do
        local label = townOfSite(s.id)
        if not label then return false end
        named[#named + 1] = s.name
    end
    for _, d in ipairs(root.case.documents or {}) do
        if d.id == docId then
            for _, name in ipairs(named) do
                if type(name) == "string" and string.find(tostring(d.body), name, 1, true) then return true end
            end
            return false
        end
    end
    return false
end

--
-- `maxTiles` keeps the journey honest. Without it the fallback picked a clue of
-- the case left behind in Irvington and inspect_doc teleported the survivor
-- 6,500 tiles back to get it, which doubled the journey's own distance and put
-- the trail through a town it had already left (20260918T225250: 22,785 tiles
-- for a 9,700-tile route).
function T.pickClue(caseId, n, needBook, maxTiles)
    local p = getPlayer()
    local px, py = math.floor(p:getX()), math.floor(p:getY())
    maxTiles = tonumber(maxTiles)
    local list = {}
    for _, row in ipairs(R.clueTargets()) do
        local far = maxTiles and math.max(math.abs(row.x - px), math.abs(row.y - py)) > maxTiles
        if row.status == "placed" and not row.recognised and not row.vehicle and not row.carrier
            and not far
            and (caseId == nil or caseId == "" or row.case == caseId)
            and (not needBook or writesAnAddress(row.case, row.id)) then
            list[#list + 1] = row
        end
    end
    table.sort(list, function(a, b) return a.id < b.id end)
    local t = list[tonumber(n) or 1]
    if not t then return "false", #list .. " clues of " .. short(tostring(caseId)) .. " are placed in a fixed container" end
    T.clue = t
    if CFClue then CFClue.target = { id = t.id, x = t.x, y = t.y, z = t.z } end
    if CFLoop then
        CFLoop.list = { { id = t.id, x = t.x, y = t.y, z = t.z, place = tostring(t.place), status = t.status } }
    end
    return "true", t.id, t.x .. "," .. t.y .. "," .. t.z, tostring(t.case), #list
end

function T.clueRecognised()
    return tostring(T.clue ~= nil and R.isRecognisedId(T.clue.id) == true)
end
function T.clueId() return T.clue and T.clue.id or "none" end
function T.clueNoted()
    if not T.clue then return "false" end
    for _, row in ipairs(R.known()) do if row.id == T.clue.id then return "true", tostring(row.title) end end
    return "false", "not in the record"
end

-- ---------------------------------------------------------------------------
-- AD-10 / P4-R129 FOR A TRAVELLER. A record written about a place in the town
-- the survivor is standing in is written without the town; the same record read
-- from another town must name it. The journey is the only test that can ask
-- this honestly, because it really does leave the town behind.
--
-- Asked by STRING, not by pattern: the address book holds the label, so the
-- question is whether the record says "203 Main St, Irvington" or plain
-- "203 Main St" - and whether it ever says a town that is not the right one,
-- which is the failure this is here to catch.
local function areaNames()
    local out = {}
    for _, a in ipairs(Book.areas or {}) do
        if type(a.name) == "string" and a.name ~= "" then out[#out + 1] = a.name end
    end
    return out
end

-- The site a clue belongs to. An ASSIGNMENT only carries `locationId` while it
-- is waiting or has been moved; for a clue placed where the case first meant it
-- to go the site is the document's own (StaleClue.destinations reads
-- `a.locationId or doc.locationId` for the same reason). Reading only the
-- assignment gave every address stage "no label" in 20260918T222421 and made
-- the AD-10 assertion vacuous - the exact trap TESTING.md warns about.
local function siteOfClue(clueId)
    for _, root in ipairs(roots()) do
        local a = root.assignments and root.assignments[clueId]
        if a and a.locationId then return a.locationId, root end
        for _, doc in ipairs((root.case and root.case.documents) or {}) do
            if doc.id == clueId and doc.locationId then return doc.locationId, root end
        end
        for _, row in ipairs(root.rows or {}) do
            if row.id == clueId and row.locationId then return row.locationId, root end
        end
    end
    return nil, nil
end

-- WHICH ADDRESS A ROW CARRIES. Not, as the first version of this assumed, the
-- address of the place the clue was found in: AddressMap.describe rewrites
-- every mention of a SITE'S NAME in the document's own words, so a maintenance
-- callout found at 301 Merino St reads "Attend 105 Bullet Dr, room 14" - the
-- place it is ABOUT. Where the clue was found is the frozen FOUND line
-- underneath, which is history and does not re-qualify by design. So the rule
-- is asked of every one of the case's addresses the live half actually writes,
-- which is the only honest form of the question.
--
-- Returns: row found, the town the survivor is in, how many of the case's
-- addresses the live half writes, how many are written correctly for here, how
-- many name the WRONG town, how many are missing the town they should carry,
-- the per-site detail, a snippet, AddressMap.describe's verdict, the clue's own
-- site, and what the frozen FOUND line says.
function T.address(clueId)
    clueId = clueId or (T.clue and T.clue.id)
    local rows = require("ConspiracyFiles/EvidenceRows").list("evidence") or {}
    local detail
    for _, row in ipairs(rows) do
        if row.id == clueId then
            detail = tostring(row.detailText or "") .. " | " .. tostring(row.text or "")
                .. " | " .. tostring(row.summary or "")
        end
    end
    if not detail then return "false", "no record row for " .. tostring(clueId) end
    -- The FOUND block is what the discovery ledger kept at the moment of the
    -- find and is frozen by design; everything before it is rendered fresh on
    -- every refresh and is the half AD-10's fix applies to (campaign.lua says
    -- the same at more length).
    -- THE MARKER IS "\n\nFOUND\n", not "FOUND". Every generated document opens
    -- with the heading "WHAT YOU FOUND", so splitting on the bare word cuts the
    -- row after nine characters and leaves "WHAT YOU " as the whole live half -
    -- which is why the first version of this stage reported every address
    -- absent, and why campaign.lua's townNames read "0 of 16"
    -- (20260918T005315) and was blamed on the mod.
    local cut = string.find(detail, "\n\nFOUND\n", 1, true)
    local fresh = cut and string.sub(detail, 1, cut - 1) or detail
    local here = map() and map().currentTown and map().currentTown() or nil
    local siteId, root = siteOfClue(clueId)
    local ownLabel, ownTown = nil, nil
    if siteId then ownLabel, ownTown = townOfSite(siteId) end
    local names = areaNames()
    local function readsAs(label, town)
        if type(label) ~= "string" or label == "" then return "no label", nil end
        local namedAs
        for _, name in ipairs(names) do
            if string.find(fresh, label .. ", " .. name, 1, true) then namedAs = name end
        end
        if namedAs then return "named", namedAs end
        if string.find(fresh, label, 1, true) then return "plain", nil end
        return "absent", nil
    end
    -- Every address of the case, judged as it is written HERE: a place in the
    -- survivor's own town plain, a place in another town named, and never
    -- named as a town it is not in.
    local present, right, wrong, missing, others, first = 0, 0, 0, 0, {}, nil
    for _, s in ipairs((root and root.case and root.case.locations) or {}) do
        local label, town = townOfSite(s.id)
        local state, named = readsAs(label, town)
        local shouldName = (type(town) == "string" and town ~= "" and here ~= nil and here ~= town) and town or nil
        if state == "named" or state == "plain" then
            present = present + 1
            first = first or label
            if named and named ~= town then wrong = wrong + 1
            elseif shouldName and not named then missing = missing + 1
            elseif named and not shouldName then wrong = wrong + 1
            else right = right + 1 end
        end
        others[#others + 1] = tostring(label) .. " [" .. tostring(town) .. "] " .. state
            .. (named and (" as " .. named) or "") .. (shouldName and " (should name " .. shouldName .. ")" or " (should be plain)")
    end
    local at = first and string.find(fresh, first, 1, true)
    local snippet = at and string.sub(fresh, math.max(1, at - 30), at + 60) or string.sub(fresh, 1, 90)
    snippet = tostring(snippet):gsub("\n", " / ")
    -- The frozen half, reported so a reader can see both (P4-R129 applies to
    -- the live one; campaign.lua explains why at length).
    local found = cut and string.sub(detail, cut + 2, cut + 80) or ""
    found = tostring(found):gsub("\n", " / ")
    -- WHY an address can be missing rather than merely unqualified:
    -- AddressMap.describe refuses the whole row when a site's bounds no longer
    -- match the shipped book, and EvidenceRows then falls back to PlaceNames,
    -- which writes no street at all. A check that only reported "absent" would
    -- leave a reader unable to tell that apart from a qualification fault.
    local describe = "not asked"
    if root and root.case and map() and map().describe then
        for _, row in ipairs(R.known()) do
            if row.id == clueId then
                local ok, out = pcall(map().describe, row.body, root.case)
                describe = (ok and out) and "ok"
                    or (ok and "refused the row (a site the book does not number, or bounds that no longer match it)" or "threw")
            end
        end
    end
    return "true", tostring(here), present, right, wrong, missing,
        table.concat(others, "; "), snippet, describe,
        tostring(ownLabel) .. " [" .. tostring(ownTown) .. "]", found
end

-- ---------------------------------------------------------------------------
-- ONE LEG, ONE LINE. Everything the owner asked to see per leg, in a single
-- eval so a journey of twenty-five legs does not cost two hundred round trips.
--
-- Fields: x, y, town, survival hours, world clock, cases, live, finished,
-- placed, deferred, dropped, per-case statuses, sites checked, sites outside
-- reach, clues checked, clues outside reach, worst overshoot, reach detail,
-- refusal code, count, rung/max, due, overdue, save bytes, squares loaded,
-- containers within 8 tiles, anchors on the trail, tiles travelled, and last
-- the town the shipped BOOK puts the survivor in (field 3 is the mod's own
-- sticky answer, and the two disagreeing is worth seeing).
function T.leg()
    local p = getPlayer()
    local x, y = math.floor(p:getX()), math.floor(p:getY())
    local town = map() and map().currentTown and map().currentTown() or nil
    local total, retired = CFCamp.cases()
    local placed, deferred, dropped, statuses = T.statuses()
    local sites, badSites, clues, badClues, worst, reach = T.outside()
    local s = R.automaticStatus()
    local now = getGameTime():getWorldAgeHours()
    local overdue = type(s.dueHours) == "number" and now > s.dueHours
    local bytes = CFReload and CFReload.bytes() or 0
    local _, squares = T.loaded(3)
    local _, _, containers = CFCamp.settled(8)
    return x, y, tostring(town), string.format("%.1f", p:getHoursSurvived()), hhmm(now),
        total, total - retired, retired,
        placed, deferred, dropped, statuses,
        sites, badSites, clues, badClues, worst, reach,
        tostring(s.why), tostring(s.deferCount), tostring(s.rung) .. "/" .. tostring(s.rungMax),
        hhmm(s.dueHours), tostring(overdue == true),
        bytes, squares, containers, #T.visited, string.format("%.0f", T.distance),
        T.townAt(x, y, 64)
end

-- WHAT THE RECORD STILL KNOWS about a clue left behind. The identity scan only
-- sees a few tiles around the survivor, so a clue 9,000 tiles back cannot be
-- seen - and the design forbids the record from claiming it is lost (P4-R104).
-- Counted by state, per live case, so a journey can say plainly what the
-- survivor reads about the evidence they walked away from.
function T.sightings()
    local parts = {}
    for _, root in ipairs(roots()) do
        if root.case then
            local n = {}
            for _, doc in ipairs(root.case.documents or {}) do
                local state = R.whereabouts(doc.id)
                state = tostring(state)
                n[state] = (n[state] or 0) + 1
            end
            local bits = {}
            for k, v in pairs(n) do bits[#bits + 1] = k .. "=" .. v end
            table.sort(bits)
            parts[#parts + 1] = short(caseIdOf(root)) .. "[" .. table.concat(bits, " ") .. "]"
        end
    end
    return (#parts > 0 and table.concat(parts, " ") or "no live case")
end

-- The journey, for the summary line at the end.
function T.journey()
    return #T.visited, string.format("%.0f", T.distance),
        T.visited[1] and (T.visited[1].x .. "," .. T.visited[1].y) or "?",
        T.visited[#T.visited] and (T.visited[#T.visited].x .. "," .. T.visited[#T.visited].y) or "?",
        string.format("%.1f", getPlayer():getHoursSurvived())
end
