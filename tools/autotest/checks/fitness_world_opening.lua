-- The Fitness Instructor world-evidence opening, observed in a running game.
-- Loaded by checks/fitness_world_opening.sh after core_loop and
-- profession_openings.
--
-- Every answer here is read from the WORLD or the PLAYER, never from the
-- record that says what should have happened. "Assigned" and "in the player's
-- hand" are different claims; so are "nine members authored" and "nine items
-- exist".
CFFit = CFFit or {}
local F = CFFit
local R = ConspiracyFiles.GeneratedRuntime
local Session = require("ConspiracyFiles/Generated/Session")

-- THE FIRST CASE, WHEREVER THE STORE KEEPS IT.
--
-- The generated store has two shapes. The legacy one is a bare
-- `store.canonical`; the shipped one is `store.campaign`, a wrapper whose
-- own `.canonical` is the first case and whose `.successive.cases` holds the
-- rest. Reading `store.canonical` directly sees the first shape and nothing
-- at all in the second.
--
-- That is why this check reported "the first case never arrived" through two
-- full runs on 2026-09-23 while the generator had in fact built one after
-- forty seconds: automaticStatus() said cases=1 active=1/4 the whole time,
-- and the deferral it did report - why=gap, dueHours=26 - was about the NEXT
-- case, not the missing first one.
--
-- SuccessiveCases.current/sessions is how the rest of the codebase reads
-- this, including checks/opening_in_play.sh. Going through it means the
-- check cannot be blind to a store shape again.
local function root()
    local store = ModData.get("ConspiracyFiles.Generated.G2")
    if type(store) ~= "table" then return nil end
    local C = require("ConspiracyFiles/Generated/SuccessiveCases")
    local wrapper = C.current(store)
    if not wrapper then return nil end
    local roots = C.sessions(wrapper)
    return roots and roots[1] or nil
end
local function docById(case, id)
    for _, d in ipairs(case.documents) do if d.id == id then return d end end
end

-- In-game minutes since the world began, so "how long before the key
-- appeared" is answered in the player's time, not the wall clock.
function F.minutes()
    local gt = getGameTime()
    return tostring(gt and gt:getWorldAgeHours() and math.floor(gt:getWorldAgeHours() * 60) or -1)
end

-- WHY NO CASE HAS COME. GeneratedRuntime.automaticStatus() was built to
-- answer exactly this (P4-R133): the refusal code, how many times it has
-- refused, the in-game hour a case is promised by, and the rung of the
-- ladder. This check used to report only "the first case never arrived",
-- which is the observation, not the reason - and on 2026-09-23 it sat through
-- a full 2400-second budget with the map scan long since complete and said
-- nothing about what the generator was withholding or why.
function F.why()
    local R2 = ConspiracyFiles.GeneratedRuntime
    if not (R2 and R2.automaticStatus) then return "no-runtime" end
    local ok, s = pcall(R2.automaticStatus)
    if not ok or type(s) ~= "table" then return "status-unavailable" end
    return table.concat({
        "cases=" .. tostring(s.count), "preparing=" .. tostring(s.preparing),
        "scheduled=" .. tostring(s.scheduled), "active=" .. tostring(s.active)
            .. "/" .. tostring(s.activeLimit),
        "why=" .. tostring(s.why), "deferCount=" .. tostring(s.deferCount),
        "dueHours=" .. tostring(s.dueHours),
        "rung=" .. tostring(s.rung) .. "/" .. tostring(s.rungMax),
    }, " ")
end

-- (1)(2)(3)(10) THE OPENING CLUE. Is it on the player, is it a real key, does
-- it carry the opening line, and what does the door say about it?
function F.opening()
    local r = root()
    if not r or not r.case then return "no-case" end
    local first = r.case.documents[1]
    local inv = getPlayer():getInventory():getItems()
    local held, itemType, voice, gotKey = false, "none", "none", false
    for i = 0, inv:size() - 1 do
        local it = inv:get(i)
        local md = it:getModData()
        if md and md.cfGeneratedId == first.id then
            held = true
            itemType = tostring(it:getFullType())
            voice = tostring(md.cfOpeningVoice or "none")
            -- A REAL KEY, asked of the item's own class rather than its title.
            gotKey = instanceof(it, "InventoryItem") and tostring(it:getFullType()):find("Key") ~= nil
        end
    end
    return table.concat({tostring(first.title), tostring(held), itemType, tostring(gotKey), voice,
        F.minutes()}, "\t")
end

-- (2) DOES THE KEY OPEN THE STARTING HOUSE? Asked of the door, not of the
-- key's title: a key that says "house key" and opens nothing is the failure
-- this is for.
function F.keyOpensHouse()
    local r = root()
    if not r or not r.case then return "no-case" end
    local first = r.case.documents[1]
    local a = r.assignments and r.assignments[first.id]
    local t = a and a.target
    if not t then return "no-target" end
    local inv = getPlayer():getInventory():getItems()
    local key
    for i = 0, inv:size() - 1 do
        local md = inv:get(i):getModData()
        if md and md.cfGeneratedId == first.id then key = inv:get(i) end
    end
    if not key then return "key-not-held" end
    -- Walk the squares of the starting building looking for a door this key
    -- opens. getKeyId is what the engine matches on.
    local cell = getCell()
    local keyId = key.getKeyId and key:getKeyId() or nil
    local doors, matched = 0, 0
    for dx = -12, 12 do for dy = -12, 12 do
        local sq = cell:getGridSquare(t.x + dx, t.y + dy, t.z)
        if sq then
            local objs = sq:getObjects()
            for i = 0, math.min(32, objs:size()) - 1 do
                local o = objs:get(i)
                if instanceof(o, "IsoDoor") or instanceof(o, "IsoThumpable") then
                    doors = doors + 1
                    local ok, id = pcall(function() return o:getKeyId() end)
                    if ok and id and keyId and id == keyId then matched = matched + 1 end
                end
            end
        end
    end end
    return table.concat({tostring(keyId), tostring(doors), tostring(matched)}, "\t")
end

-- GATE 3: DOES THE RECORDED HOUSE MATCH THE REAL STARTING BUILDING?
--
-- Asked of the world, twice over, because a case that records a plausible
-- address for the wrong building reads perfectly and is still wrong. The
-- comparison is between the label the address book gives for the building
-- the key's target square actually sits in, and the label the same book gives
-- for the building the survivor is standing in. If the opening put the key in
-- the survivor's own house, those two are the same building id.
--
-- Everything here can be unavailable for honest reasons - a target outside
-- any building, an address book still loading - and each of those answers
-- says so by name rather than returning a bare false.
function F.address()
    local r = root()
    if not r or not r.case then return "no-case" end
    local A = ConspiracyFiles.AddressMap
    if not (A and A.ready and A.ready()) then return "no-address-book" end
    local first = r.case.documents[1]
    local a = r.assignments and r.assignments[first.id]
    local t = a and a.target
    if not t then return "no-target" end

    local function buildingAt(x, y, z)
        local sq = getCell():getGridSquare(x, y, z)
        local ok, b = pcall(function() return sq and sq:getBuilding() end)
        if not (ok and b) then return nil end
        local ok2, def = pcall(function() return b:getDef() end)
        if not (ok2 and def) then return nil end
        -- getIDString(), not getID(). AddressMap.labelForBuilding is keyed
        -- exactly as the book is built, and the book is built from
        -- BuildingDef:getIDString(); the numeric getID() would look plausible
        -- and resolve to nothing.
        local ok3, id = pcall(function() return def:getIDString() end)
        return ok3 and id or nil
    end

    local targetBuilding = buildingAt(t.x, t.y, t.z)
    local p = getPlayer()
    local playerBuilding = buildingAt(math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ()))
    local targetLabel = targetBuilding and A.labelForBuilding(targetBuilding) or nil
    local playerLabel = playerBuilding and A.labelForBuilding(playerBuilding) or nil

    -- What the CASE recorded as its first site. The generated case keeps its
    -- places in `locations`, each with an id and a name; there is no
    -- `story.addressA`, and reading for one printed "none" on an otherwise
    -- correct run (2026-09-23) - a reported value that is always "none" says
    -- nothing about whether the address is right.
    local site = r.case.locations and r.case.locations[1]
    local recorded = site and (tostring(site.name or site.label or "unnamed")
        .. " [" .. tostring(site.id) .. "]") or "none" 

    return table.concat({
        tostring(targetBuilding or "none"), tostring(targetLabel or "none"),
        tostring(playerBuilding or "none"), tostring(playerLabel or "none"),
        recorded,
        tostring(targetBuilding ~= nil and targetBuilding == playerBuilding),
    }, "\t")
end

-- (4)(5) THE THREE WORLD ANCHORS. For each: is it assigned, has it been
-- placed, and - for the grouped one - how many real items exist at its
-- target. Nine items and ONE finding is the claim; both halves are counted.
function F.anchors()
    local r = root()
    if not r or not r.case then return "no-case" end
    local out = {}
    for _, d in ipairs(r.case.documents) do
        local a = r.assignments and r.assignments[d.id]
        local t = a and a.target
        local items, members = 0, 0
        if type(d.members) == "table" then for _, m in ipairs(d.members) do members = members + (m.quantity or 1) end end
        if t then
            local sq = getCell():getGridSquare(t.x, t.y, t.z)
            if sq then
                local objs = sq:getObjects()
                for i = 0, math.min(48, objs:size()) - 1 do
                    local o = objs:get(i)
                    for ci = 0, math.min(8, (o.getContainerCount and o:getContainerCount() or 0)) - 1 do
                        local c = o:getContainerByIndex(ci)
                        if c then
                            local list = c:getItems()
                            for k = 0, list:size() - 1 do
                                local md = list:get(k):getModData()
                                if md and md.cfGeneratedId == d.id then items = items + 1 end
                            end
                        end
                    end
                end
            end
        end
        out[#out + 1] = table.concat({d.id:match("document%-(%d+)$") or d.id,
            tostring(d.title), tostring(a and a.status or "none"),
            tostring(members), tostring(items)}, ":")
    end
    return table.concat(out, "\t")
end

-- (6)(7) THE VEHICLE SCENE. Whether a stable scene has been confirmed, and
-- whether clue five is still waiting for one.
function F.vehicle()
    local r = root()
    if not r or not r.case then return "no-case" end
    local V = ConspiracyFiles.VanillaSceneRuntime
    local confirmed = V and V.confirmed and V.confirmed() or nil
    local n = 0
    if type(confirmed) == "table" then for _ in pairs(confirmed) do n = n + 1 end end
    local vid, status, sig
    for _, d in ipairs(r.case.documents) do
        if d.placementIntent == "vehicle" or d.sceneKind then
            vid = d.id
            local a = r.assignments and r.assignments[d.id]
            status = a and a.status or "none"
            sig = a and a.target and a.target.sceneSignature or "none"
        end
    end
    return table.concat({tostring(n), tostring(vid and "yes" or "no"),
        tostring(status), tostring(sig)}, "\t")
end

-- (8) WHAT MUST SURVIVE A RELOAD, AND WHAT MAY LEGITIMATELY CHANGE.
--
-- Two signatures, because they are two different claims.
--
-- `stable` is the part a reload may not touch: a PLACED clue's coordinates
-- and any confirmed scene signature. A placed clue is a real object at real
-- coordinates and a confirmed scene has been observed twice; if either moves
-- across a save, that is a persistence defect.
--
-- `waiting` is the part that may change, and this check used to assert it as
-- though it could not. On 2026-09-23 it called a reload a failure because two
-- findings went indexed -> deferred. That is a documented transition, not
-- corruption: Session.unplan is the only path between those two states and
-- exists precisely for it - "an indexed signature that no longer matches the
-- live building becomes an ordinary deferred clue" - and it deliberately
-- preserves the original expiry clock so the fallback does not restart it.
-- An indexed plan is provisional by definition; it is re-verified once the
-- squares load, and falling back is the system working.
--
-- So the transition is still REPORTED, every time, and still visible in the
-- evidence. It is simply no longer called a failure, because the product
-- documents it as correct. Nothing about placed coordinates or scene
-- signatures is relaxed.
function F.stable()
    local r = root()
    if not r or not r.case then return "no-case" end
    local parts = {}
    for _, d in ipairs(r.case.documents) do
        local a = r.assignments and r.assignments[d.id]
        local t = a and a.target
        local n = d.id:match("document%-(%d+)$") or d.id
        if a and a.status == "placed" and t then
            parts[#parts + 1] = n .. "=placed@" .. t.x .. "," .. t.y .. "," .. t.z
        end
        if t and t.sceneSignature then
            parts[#parts + 1] = n .. "#scene=" .. tostring(t.sceneSignature)
        end
    end
    table.sort(parts)
    if #parts == 0 then return "nothing-placed-and-no-scene" end
    return table.concat(parts, " ")
end

function F.signature()
    local r = root()
    if not r or not r.case then return "no-case" end
    local parts = {}
    for _, d in ipairs(r.case.documents) do
        local a = r.assignments and r.assignments[d.id]
        local t = a and a.target
        parts[#parts + 1] = (d.id:match("document%-(%d+)$") or d.id) .. "="
            .. tostring(a and a.status) .. "@"
            .. (t and (t.x .. "," .. t.y .. "," .. t.z) or "none")
            .. (t and t.sceneSignature and ("#" .. tostring(t.sceneSignature)) or "")
    end
    table.sort(parts)
    return table.concat(parts, " ")
end
return true
