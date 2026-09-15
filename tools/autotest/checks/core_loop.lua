-- Stages for the core investigation loop (catalogue INF-02). Loaded once
-- through DevEval, then called by name with real game frames in between.
-- Each step goes through what a player's click would run: the loot panel's
-- selectContainer, a transfer timed action, and the real right-click menu
-- (ISInventoryPaneContextMenu.createMenu fires the mod's own menu hook).
CFLoop = CFLoop or {}
local L = CFLoop
local R = ConspiracyFiles.GeneratedRuntime

-- Placed documents, parsed from the runtime's own diagnostic.
function L.docs()
    local text = R.devLocations()
    local out = {}
    for line in (tostring(text) .. "\n"):gmatch("([^\n]*)\n") do
        local id, place, x, y, z, status =
            line:match("^(%S+)%s+(.-)%s+(%-?%d+),(%-?%d+) floor (%-?%d+)%s+%[(%w+)%]$")
        if id then
            out[#out + 1] = { id = id, place = place, x = tonumber(x), y = tonumber(y), z = tonumber(z), status = status }
        end
    end
    L.list = out
    return out
end

function L.summary()
    local parts = {}
    for i, d in ipairs(L.docs()) do parts[#parts + 1] = i .. ":" .. d.status .. "@" .. d.place end
    return #L.list, table.concat(parts, "; ")
end

local function scanSquare(sq, id)
    if not sq then return nil end
    local objects = sq:getObjects()
    for i = 0, objects:size() - 1 do
        local o = objects:get(i)
        for c = 0, o:getContainerCount() - 1 do
            local items = o:getContainerByIndex(c):getItems()
            for j = 0, items:size() - 1 do
                local it = items:get(j)
                if it:getModData().cfGeneratedId == id then return it, o end
            end
        end
    end
    -- Vehicles: a case may put a clue in a car (VehicleProbe, 7983376). Parts
    -- by index on the vehicle itself; VehicleParts cannot be indexed (6d2d3c3).
    local v = sq:getVehicleContainer()
    if v then
        for p = 0, v:getPartCount() - 1 do
            local part = v:getPartByIndex(p)
            local c = part and part:getItemContainer()
            if c then
                local items = c:getItems()
                for j = 0, items:size() - 1 do
                    local it = items:get(j)
                    if it:getModData().cfGeneratedId == id then L.vehicle, L.part = v, part; return it, v end
                end
            end
        end
    end
    local world = sq:getWorldObjects()
    for i = 0, world:size() - 1 do
        local it = world:get(i):getItem()
        if it and it:getModData().cfGeneratedId == id then return it, world:get(i) end
    end
end

-- Teleport onto document n's coordinates so its squares load before searching:
-- a site 100 tiles away is not loaded, and a search there finds nothing.
function L.approach(n)
    local d = L.list[n]
    getPlayer():teleportTo(d.x + 0.5, d.y + 0.5, d.z)
    return true
end

-- Whether document n's square and the eight around it have loaded, so a
-- search there can find something. Replaces a fixed two-second pause after
-- every teleport (owner, 2026-09-15: "is there a reason why between each
-- command ... we leave so much time?"): the caller waits for exactly as long
-- as loading takes, and no longer.
function L.loaded(n)
    local d = L.list[n]
    local cell = getCell()
    if not d or not cell then return false end
    for dx = -1, 1 do for dy = -1, 1 do
        if not cell:getGridSquare(d.x + dx, d.y + dy, d.z) then return false end
    end end
    return true
end

-- The physical item for document n, searched on its square and neighbours.
function L.find(n)
    local d = L.list[n]
    L.vehicle, L.part = nil, nil
    for dx = -1, 1 do for dy = -1, 1 do
        local it, holder = scanSquare(getCell():getGridSquare(d.x + dx, d.y + dy, d.z), d.id)
        if it then
            L.item, L.holder = it, holder
            local where = L.part and ("vehicle " .. tostring(L.part:getId())) or tostring(it:getContainer() and it:getContainer():getType())
            -- Room and floor, so repeated runs can tally where clues land.
            local sq = getCell():getGridSquare(d.x + dx, d.y + dy, d.z)
            local room = sq and sq:getRoom() and sq:getRoom():getName() or (L.part and "vehicle" or "outdoors")
            return true, it:getDisplayName(), where, room, d.z
        end
    end end
    L.item = nil
    return false, "not on or next to its square"
end

-- Stand where the loot panel can show the document's container: a free square
-- in the 3x3 around it that can reach it (the panel drops squares behind
-- walls, ISInventoryPage:refreshBackpacks). Teleport; arrival tests walk.
function L.goTo(n)
    local d = L.list[n]
    local target = (L.holder and L.holder.getSquare and L.holder:getSquare()) or getCell():getGridSquare(d.x, d.y, d.z)
    if not target then return false, "document square not loaded" end
    local best
    for dx = -1, 1 do for dy = -1, 1 do
        local sq = getCell():getGridSquare(target:getX() + dx, target:getY() + dy, target:getZ())
        if not best and sq and sq:isFree(false) and (sq == target or sq:canReachTo(target)) then best = sq end
    end end
    best = best or target
    getPlayer():teleportTo(best:getX() + 0.5, best:getY() + 0.5, best:getZ())
    return true, best:getX() .. "," .. best:getY()
end

-- A clue in a car: stand by it and get in through the vehicle menu's own
-- action, which walks to the door and enters, as a player's click does.
-- Is the driver's door locked? A clue in a locked car needs a key or a broken
-- window, which placement does not consider (catalogue VC-06).
function L.vehicleLocked()
    local door = L.vehicle and L.vehicle:getPartById("DoorFrontLeft")
    local d = door and door:getDoor()
    return d ~= nil and d:isLocked()
end

function L.enterVehicle()
    local v = L.vehicle
    if not v then return false, "no vehicle" end
    -- Stand at the driver's door (the seat's own area), not a guessed offset
    -- that can land inside a wall and leave no path to the door.
    local c = v:getAreaCenter(v:getPassengerArea(0))
    if c then getPlayer():teleportTo(c:getX(), c:getY(), v:getZ())
    else getPlayer():teleportTo(v:getX() + 2.5, v:getY() + 0.5, v:getZ()) end
    -- A locked car, as a player with its key would find it. Without this the
    -- harness took a clue out of a locked glove box it could never have
    -- reached, the mod saw no ordinary pickup, and that clue's map mark went
    -- missing (20260914T203902). The lock itself is reported as a finding.
    for p = 0, v:getPartCount() - 1 do
        local part = v:getPartByIndex(p)
        local d = part and part:getDoor()
        if d and d:isLocked() then d:setLocked(false); L.unlocked = true end
    end
    ISVehicleMenu.onEnter(getPlayer(), v, 0)
    return true
end
function L.inVehicle() return getPlayer():getVehicle() ~= nil end
function L.exitVehicle()
    if getPlayer():getVehicle() then ISVehicleMenu.onExit(getPlayer()) end
    return true
end

-- A part reached from OUTSIDE - a truck bed or a trunk - is reached as a player
-- reaches it: stand in the part's own area and open the door that guards it.
-- The game never shows a truck bed to someone sitting inside the vehicle
-- (Vehicles.lua ContainerAccess.TruckBed), which failed 20260914T173417.
-- A glove box is the opposite: it opens only from a front seat (owner,
-- 2026-09-14: "The globe box only opens when sitting in the front of the car"),
-- so for it this returns false and the caller gets in.
local GUARD = { TruckBed = { "TrunkDoor", "DoorRear" }, TrunkDoor = { "TrunkDoor" } }
-- The player walks into the part's area, as the game walks a player there
-- (ISPathFindAction:pathToVehicleArea, which ISVehicleMenu uses for the hood).
-- This used to teleport to the area's centre, but a teleport lands on the
-- tile's corner and a truck bed's area is a thin strip behind the tailgate: on
-- some runs the corner was just outside it, and the truck bed stayed refused
-- with its door open (vehicle_reach 20260914T213522, 20260915T122922; probe and
-- rule in docs/research/PZ_VEHICLE_AREAS_AND_ZONES.md). The door action queues
-- behind the walk, so the door opens once the player is there.
-- Close first, then only the last step on foot (owner, 2026-09-15: "why are we
-- walking and not teleporting closer to the place?"). The walk in from where
-- the van check leaves the player took 6-7 s every time. A teleport cannot
-- land inside the thin area itself - it lands on a tile corner - so it lands
-- on a free square just beyond the area, on the side away from the vehicle,
-- and the game's own path action takes the step in.
local function squareNearArea(v, area)
    local c = v:getAreaCenter(area)
    if not c then return nil end
    local dx, dy = c:getX() - v:getX(), c:getY() - v:getY()
    local len = math.sqrt(dx * dx + dy * dy)
    if len < 0.01 then return nil end
    dx, dy = dx / len, dy / len
    local cell, z = getCell(), math.floor(v:getZ())
    for _, step in ipairs({ 1.5, 2.5, 1.0, 3.5 }) do
        local sq = cell:getGridSquare(math.floor(c:getX() + dx * step), math.floor(c:getY() + dy * step), z)
        if sq and sq:isFree(false) then return sq end
    end
    return nil
end

function L.walkToPartArea()
    local v, part = L.vehicle, L.part
    if not v or not part then return false, "no vehicle part" end
    local area = part:getArea()
    if not area or not v:getAreaCenter(area) then return false, "the part has no area" end
    if L.inPartArea() then return true, tostring(area), "already in the area" end
    local sq = squareNearArea(v, area)
    if sq then getPlayer():teleportTo(sq:getX() + 0.5, sq:getY() + 0.5, sq:getZ()) end
    ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(getPlayer(), v, area))
    return true, tostring(area), sq and "teleported beside the area" or "walked from where the player stood"
end

-- Whether the player stands inside the part's own area - the game's first
-- condition for reaching a truck bed from outside (Vehicles.ContainerAccess).
function L.inPartArea()
    local v, part = L.vehicle, L.part
    local area = part and part:getArea()
    if not v or not area then return false end
    return v:isInArea(area, getPlayer()) == true
end

-- Whether the player is still walking there: a path action in their queue. A
-- walk still under way is slow, not failed; one that has ended with the player
-- outside the area could not get there.
function L.walking()
    local q = ISTimedActionQueue.getTimedActionQueue(getPlayer())
    for _, action in ipairs((q and q.queue) or {}) do
        if action.Type == "ISPathFindAction" then return true end
    end
    return false
end

-- Where the player is against the part's area, for a failure message: the
-- first walk-in failures (20260915T131626, 131829) left nothing to say why.
function L.walkState()
    local v, part, p = L.vehicle, L.part, getPlayer()
    local area = part and part:getArea()
    local c = v and area and v:getAreaCenter(area)
    local q = ISTimedActionQueue.getTimedActionQueue(p)
    local current = (q and q.queue and q.queue[1] and q.queue[1].Type) or "none"
    local function r1(n) return tostring(math.floor((n or 0) * 10 + 0.5) / 10) end
    local dist = c and math.sqrt((p:getX() - c:getX()) ^ 2 + (p:getY() - c:getY()) ^ 2)
    return true, "player " .. r1(p:getX()) .. "," .. r1(p:getY()),
        "area centre " .. (c and (r1(c:getX()) .. "," .. r1(c:getY())) or "none"),
        "distance " .. (dist and r1(dist) or "?"),
        "in area " .. tostring(L.inPartArea()),
        "action " .. tostring(current)
end

function L.reachPart()
    local v, part = L.vehicle, L.part
    if not v or not part then return false, "no vehicle part" end
    if not GUARD[part:getId()] then return false, tostring(part:getId()), "reached from a seat" end
    local walked, why = L.walkToPartArea()
    if not walked then return false, why end
    local opened = "none"
    for _, doorId in ipairs(GUARD[part:getId()] or {}) do
        local door = v:getPartById(doorId)
        local d = door and door:getDoor()
        if d and not d:isOpen() then
            -- A harness shortcut, reported as a finding by the caller: placement
            -- ignores locks (catalogue VC-06), so a locked door hides a clue.
            if d:isLocked() then d:setLocked(false); L.unlocked = doorId end
            ISVehicleMenu.onOpenDoor(getPlayer(), door)
            opened = doorId
            break
        end
    end
    return true, tostring(part:getId()), opened
end

-- The guarding door, opened outright if the door action has not managed it.
-- What the checks are about is the rule - a truck bed only once its door is
-- open (owner, 2026-09-14) - not the door animation; the queued action did not
-- finish within 20 s in 20260914T213522 and the check fell back into the seat,
-- where a truck bed is never shown.
function L.forceOpen()
    local v, part = L.vehicle, L.part
    if not v or not part then return false end
    for _, doorId in ipairs(GUARD[part:getId()] or {}) do
        local door = v:getPartById(doorId)
        local d = door and door:getDoor()
        if d and not d:isOpen() then d:setLocked(false); d:setOpen(true); return true, doorId end
    end
    return false, "no shut guard door"
end

-- Whether the game itself would let the player at this part's container now.
function L.partAccess()
    local v, part = L.vehicle, L.part
    if not v or not part then return false end
    return v:canAccessContainer(part:getIndex(), getPlayer()) == true
end

-- Click the container's icon in the loot panel, as a player would. Right after
-- a long move the panel has no icon yet, so the caller polls this.
function L.openContainer()
    local target = L.item:getContainer()
    if not target then return false, "item is not in a container" end
    local loot = getPlayerLoot(0)
    loot:refreshBackpacks()
    for _, b in ipairs(loot.backpacks) do
        if b.inventory == target then loot:selectContainer(b); return true, tostring(target:getType()) end
    end
    return false, "no loot-panel icon for " .. tostring(target:getType())
end

function L.take()
    local p = getPlayer()
    ISTimedActionQueue.add(ISInventoryTransferAction:new(p, L.item, L.item:getContainer(), p:getInventory()))
    return true
end

function L.carried()
    return L.item:getContainer() == getPlayer():getInventory()
end

-- The real right-click menu on the carried item, then its Inspect option.
function L.inspect()
    local ctx = ISInventoryPaneContextMenu.createMenu(0, true, { L.item }, 200, 200)
    if not ctx then return false, "no context menu" end
    local option = ctx:getOptionFromName("Inspect Investigation Evidence")
    local result
    if not option then result = "the menu has no Inspect Investigation Evidence option"
    elseif option.notAvailable then result = "the Inspect option is greyed out"
    else
        option.onSelect(option.target, option.param1, option.param2, option.param3)
        result = true
    end
    ctx:closeAll()
    return result == true, result == true and "inspected" or result
end

function L.inspected() return R.isInspected(L.item) == true end

-- DATES with a real document (owner, Windows, 2026-09-14: "an entry in the
-- calendar should open the file if we click on it"). pdagame proves the tap
-- with a stand-in record; this one uses a document the loop actually found and
-- read, so it proves a real document opens from the date book, and BACK returns.
function L.datesTap()
    local S = ConspiracyFiles.OrganiserScreen
    local w = S.window or S.open()
    if not w then return false, "the organiser would not open" end
    local rows = R.known()
    local doc = rows[#rows]
    if not doc then return false, "nothing found yet" end
    w.on = true; w.booting = false; w.launcher = false; w.record = nil; w.popup = nil
    for i, p in ipairs(w:programs()) do if p.id == "DATES" then w.app = i end end
    w.cachedList = nil
    local program = w:program()
    local _, _, at = w:category(program)
    local today = getGameTime():getDay() + 1
    local day = program.day(at or 1, today)
    local target
    for i, e in ipairs(day.entries or {}) do if e.ref == doc.id then target = i end end
    if not target then return false, "today's page has no entry for " .. tostring(doc.title) end
    w.record = day; w.day = today; w.card = 1
    -- A busy day runs to a second page; page to the entry with the rocker.
    local hit
    for _ = 1, 6 do
        w:prerender()
        for _, h in ipairs((w.context or {}).hits or {}) do
            if h.id == "ENTRY" and h.payload == target then hit = h end
        end
        if hit then break end
        w:press("DOWN")
    end
    if not hit then return false, "the day view drew no entry for " .. tostring(doc.title) end
    w:onMouseDown(hit.x + 2, hit.y + 2); w:onMouseUp(hit.x + 2, hit.y + 2)
    local opened = w.record ~= nil and w.record.id == doc.id and w.record.title == doc.title
    w:press("INDEX")
    local back = w.record == day
    pcall(S.close)
    return true, tostring(opened), tostring(back), tostring(doc.title)
end

-- A finished case's evidence can still be found (P4-R104, owner: "I lost my files
-- somewhere?"): once the case has retired, every document it held says where
-- it was last seen. Until now only unit tests had seen it.
function L.lastSeen()
    local have, total, sample = 0, 0, ""
    for _, row in ipairs(R.known()) do
        total = total + 1
        local state, words = R.whereabouts(row.id)
        if state == "lastseen" and type(words) == "string" and words ~= "" then
            have = have + 1
            if sample == "" then sample = words end
        end
    end
    -- What the save holds, so a shortfall says where it broke: 7 of 7 on one
    -- run and 0 of 8 on the next (20260914T214013), with nothing to tell why.
    local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")
    local store = ModData.get("ConspiracyFiles.Generated.G2")
    local wrapper = store and Cases.current(store)
    local retired, stored = 0, 0
    for _, root in ipairs((wrapper and Cases.sessions(wrapper)) or {}) do
        if type(root.rows) == "table" then
            retired = retired + 1
            for _, r in ipairs(root.rows) do if r.lastSeen then stored = stored + 1 end end
        end
    end
    return tostring(have), tostring(total), sample, tostring(retired), tostring(stored)
end

-- A finished case's evidence shows as Evidence / Old (P4-R118, owner 2026-09-15: "We
-- should change the category to Evidence / Old"). Walks the inventory and bags
-- the loop filled: how many case items it holds, how many the runtime calls
-- retired evidence, and how many the loot list would show as Old.
function L.oldPapers()
    local papers, retired, old = 0, 0, 0
    local function walk(container, depth)
        if not container or depth > 3 then return end
        local items = container:getItems()
        for i = 0, items:size() - 1 do
            local item = items:get(i)
            local md = item:getModData()
            if type(md) == "table" and md.cfGeneratedId then
                papers = papers + 1
                if R.retiredPaper(item) then retired = retired + 1 end
                local ok, category = pcall(function() return item:getDisplayCategory() end)
                if ok and category == "EvidenceOld" then old = old + 1 end
            end
            local inner = item.getInventory and item:getInventory()
            if inner then walk(inner, depth + 1) end
        end
    end
    walk(getPlayer():getInventory(), 0)
    return tostring(papers), tostring(retired), tostring(old)
end

-- The relay memo's date note, in the real game (P4-R96): once the memo is
-- found, every record dated inside 30 June - 8 July 1993 carries it. Until
-- now only a unit test had seen it.
function L.dateNotes()
    local Memo = require("ConspiracyFiles/Generated/RelayMemo")
    local rows = require("ConspiracyFiles/EvidenceRows").list("evidence") or {}
    local memo, dated, noted = false, 0, 0
    for _, r in ipairs(R.known()) do
        if r.kind == Memo.KIND then memo = true
        elseif Memo.inWeek(r.body) then dated = dated + 1 end
    end
    for _, row in ipairs(rows) do
        if tostring(row.detailText):find("DATE NOTE", 1, true) then noted = noted + 1 end
    end
    return tostring(memo), tostring(dated), tostring(noted)
end

-- What the survivor has noted: count and the newest titles.
function L.known()
    local rows = R.known()
    local titles = {}
    for i = math.max(1, #rows - 2), #rows do titles[#titles + 1] = tostring(rows[i].title) end
    return #rows, table.concat(titles, " | ")
end

-- A writing tool, so map markers can be drawn (catalogue INF-07).
function L.givePen()
    getPlayer():getInventory():AddItem("Base.Pen")
    return true
end

-- Whether the survivor can already write. A case's own evidence can be a pen
-- ("Green pen, marked Adele Prosser", 20260915T171041), and the loop picks up
-- every clue, so "without a pen" cannot always be arranged.
function L.hasPen()
    return ConspiracyFiles.ClueMarkers.canWrite(getPlayer()) == true
end

function L.markers()
    local written, pending, missing = ConspiracyFiles.ClueMarkers.status()
    return written, pending, missing
end

-- Open the world map on document n at a zoom where marks are drawn (>= 14).
function L.showMap(n)
    local d = L.list[n] or L.last
    ISWorldMap.ShowWorldMap(0, d.x + 0.5, d.y + 0.5, 17)
    return ISWorldMap_instance ~= nil and ISWorldMap_instance:isVisible()
end

function L.hideMap()
    if ISWorldMap_instance then ISWorldMap.HideWorldMap(0) end
    return true
end

-- Remember where the last document was, since a retired case lists nothing.
function L.remember(n) L.last = L.list[n]; return true end

function L.caseCount()
    local s = R.automaticStatus()
    return s.count, s.scheduled, s.preparing
end

-- Test pacing: the 24 h gap between cases (catalogue INF-04, AS-02).
function L.noGap()
    ConspiracyFiles.AutomaticInvestigations.config.minGapHours = 0
    -- And the wait after a completion (P4-R121); unit-tested on its own.
    ConspiracyFiles.AutomaticInvestigations.config.afterCompletionHours = 0
    return true
end

-- "What do I make of it?" (P4-R113): the survivor answers about the finished
-- case, so the next case is built from the answers - the chosen person returns,
-- and the case leans on records.
local function campaign()
    local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")
    local store = ModData.get("ConspiracyFiles.Generated.G2")
    local wrapper = store and Cases.current(store)
    return (wrapper and Cases.sessions(wrapper)) or {}
end
function L.answerFirst()
    for _, root in ipairs(campaign()) do
        if type(root.rows) == "table" and root.offered then
            local ok, why = R.setAnswers(root.caseId, {reading = "one", matters = "person1", way = "records"})
            return tostring(ok), tostring(why or root.caseId), tostring(root.offered.people[1])
        end
    end
    return "false", "no finished case with questions", ""
end
-- The same answers, given the way a player gives them: open FILES on the
-- organiser, tap "What do I make of it?", tap each question and a line of its
-- pick list (P4-R113, P4-R122). Returns ok, the note it shows, the person chosen.
function L.answerViaOrganiser()
    local S = ConspiracyFiles.OrganiserScreen
    local w = S.window or S.open()
    if not w then return "false", "the organiser would not open", "" end
    w.on = true; w.booting = false; w.launcher = false; w.record = nil; w.popup = nil
    for i, p in ipairs(w:programs()) do if p.id == "FILES" then w.app = i end end
    w.cachedList = nil; w.entry = 1
    local function tapHit(id, payload)
        w:prerender()
        for _, h in ipairs((w.context or {}).hits or {}) do
            if h.id == id and (payload == nil or h.payload == payload) then
                w:onMouseDown(h.x + 2, h.y + 2); w:onMouseUp(h.x + 2, h.y + 2)
                return true
            end
        end
        return false
    end
    local rows = w:list()
    local at
    for i, row in ipairs(rows) do if row.questions and not at then at = i end end
    if not at then pcall(S.close); return "false", "FILES has no question row", "" end
    if not tapHit("ROW", at) then pcall(S.close); return "false", "the question row was not drawn", "" end
    if not (w.record and w.record.questions) then pcall(S.close); return "false", "the row did not open the questions", "" end
    -- Reading: the first (ordinary) reading. Who matters: the first person.
    -- Next: "Listen for it", which brings the radio transcript (P4-R123); the
    -- records way was proven in the real game on 20260915T172134.
    for question, line in ipairs({1, 1, 3}) do
        if not tapHit("QUESTION", question) then pcall(S.close); return "false", "question " .. question .. " was not drawn", "" end
        if not w.popup then pcall(S.close); return "false", "question " .. question .. " opened no pick list", "" end
        if not tapHit("POPUP", line) then pcall(S.close); return "false", "pick list line " .. line .. " was not drawn", "" end
    end
    local q = w.record.questions
    local Q = require("ConspiracyFiles/Generated/Questions")
    local note = Q.note(q.answers, q.offered) or ""
    local ok = q.answers and q.answers.reading == "one" and q.answers.matters == "person1" and q.answers.way == "listen"
    pcall(S.close)
    return tostring(ok == true), note, tostring(q.offered.people[1])
end

function L.steerCheck()
    local finished, live
    for _, root in ipairs(campaign()) do
        if type(root.rows) == "table" and root.offered then finished = finished or root
        elseif root.case and root.case.steer then live = root end
    end
    if not finished or not live then return "false", "false", "false", "false", "no steered case", "false" end
    local steer, person = live.case.steer, live.case.identities[1]
    local transcript = false
    if steer.way == "listen" then
        for _, d in ipairs(live.case.documents) do if d.kind == "transcript" then transcript = true end end
    end
    return tostring(finished.answers ~= nil and finished.answers.usedBy == live.case.caseId),
        tostring(steer.fromCase == finished.caseId),
        tostring(person.name == finished.offered.people[1]),
        tostring(person.met == true),
        tostring(live.case.caseId),
        tostring(transcript)
end

-- Reshuffle support (checks/reshuffle.sh). ids() is the fingerprint of the
-- case currently in the save; orphanEvidence() counts clues left in the world
-- that still claim to belong to a case nothing knows about any more.
function L.ids()
    local out = {}
    for _, d in ipairs(L.docs()) do out[#out + 1] = d.id end
    table.sort(out)
    return table.concat(out, ",")
end

function L.orphanEvidence()
    local orphans, checked = 0, 0
    local cell = getCell()
    local p = getPlayer()
    local px, py, pz = math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ())
    local function consider(item)
        local ok, md = pcall(function() return item:getModData() end)
        if not ok or type(md) ~= "table" or not md.cfGeneratedId then return end
        checked = checked + 1
        -- Still marked, but no live case owns it: that is the orphan a
        -- reshuffle must not leave behind.
        if not R.subject(item) then orphans = orphans + 1 end
    end
    for x = px - 20, px + 20 do
        for y = py - 20, py + 20 do
            local square = cell:getGridSquare(x, y, pz)
            local objects = square and square:getObjects()
            for i = 0, (objects and objects:size() or 0) - 1 do
                local o = objects:get(i)
                for c = 0, (o.getContainerCount and o:getContainerCount() or 0) - 1 do
                    local container = o:getContainerByIndex(c)
                    local items = container and container:getItems()
                    for n = 0, (items and items:size() or 0) - 1 do pcall(consider, items:get(n)) end
                end
            end
        end
    end
    local carried = p:getInventory():getItems()
    for i = 0, carried:size() - 1 do pcall(consider, carried:get(i)) end
    return orphans, checked
end
