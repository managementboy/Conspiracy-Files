-- Stages for checks/fitness_mystery_audit.sh.
--
-- Three questions about the Fitness Instructor's FIRST mystery, each answered
-- from the live world and the saved case, never from what should have happened:
--
--   1. Is it bound to the campaign's hidden central conspiracy?
--   2. Is it built from real objects, and are they physically in the world?
--   3. Do those objects add value - does the story rest on them, by name?
--
-- Loaded after core_loop, profession_openings and fitness_world_opening.
CFAudit = {}
local A = CFAudit
local SC = require("ConspiracyFiles/Generated/SuccessiveCases")
local Pair = require("ConspiracyFiles/Generated/ConspiracyPair")
local Story = require("ConspiracyFiles/Generated/Story")
local Kinds = require("ConspiracyFiles/Generated/EvidenceKinds")

local function root()
    local store = ModData.get("ConspiracyFiles.Generated.G2")
    if type(store) ~= "table" then return nil end
    local wrapper = SC.current(store)
    local roots = wrapper and SC.sessions(wrapper)
    return roots and roots[1] or nil
end

-- 1. THE CENTRAL CONSPIRACY. Registered pair, valid, no winner, an axis this
--    case declares, and a bridge sentence that resolves for THIS pair.
function A.conspiracy()
    local r = root(); if not r or not r.case then return "no-case" end
    local pair = r.case.conspiracyPair
    local id = pair and pair.id or "none"
    local registered = false
    for _, known in ipairs(Pair.list()) do if known == id then registered = true end end
    local valid = pair ~= nil and Pair.validate(pair) == true
    local winner = "none"
    if type(pair) == "table" then
        for _, f in ipairs({ "correct", "winner", "truth", "answer" }) do
            if pair[f] ~= nil then winner = f end
        end
    end
    local axis = r.case.story and r.case.story.centralAxis or "none"
    local bridge = Story.centralLine(r.case.story, pair)
    local theories = (pair and pair.theories) and #pair.theories or 0
    local pinned = r.case.opening and r.case.opening.profession or "none"
    return table.concat({
        id, tostring(registered), tostring(valid), winner, tostring(theories),
        tostring(axis), tostring(Pair.isAxis(axis)),
        bridge and "yes" or "no", tostring(pinned),
        tostring(r.case.story and r.case.story.unresolved == (pair and pair.question)),
    }, "\t")
end

-- 2. REAL OBJECTS. For every document: its kind, whether that kind is a physical
--    object (no readable text) or paper, its placement status, and how many of
--    its items actually exist at its target square right now.
-- Items the SURVIVOR carries for this document, at any depth. The opening key
-- is delivered straight to the inventory (primed-at-start), so counting only
-- the target square reported it "placed, 0 items" - a false failure in this
-- audit, 2026-09-24. Where a thing IS matters less than whether it exists.
local function carried(docId)
    local player = getPlayer(); if not player then return 0 end
    local n, queue, seen = 0, { player:getInventory() }, {}
    local cursor = 1
    while queue[cursor] and cursor <= 16 do
        local inv = queue[cursor]; cursor = cursor + 1
        if inv and not seen[inv] then
            seen[inv] = true
            local list = inv:getItems()
            for i = 0, list:size() - 1 do
                local it = list:get(i)
                local md = it:getModData()
                if md and md.cfGeneratedId == docId then n = n + 1 end
                if it.getInventory and instanceof(it, "InventoryContainer") then
                    local bag = it:getInventory(); if bag then queue[#queue + 1] = bag end
                end
            end
        end
    end
    return n
end
local function itemsAt(t, docId)
    local held = carried(docId)
    if not t then return held end
    local sq = getCell():getGridSquare(t.x, t.y, t.z)
    if not sq then return held > 0 and held or -1 end -- unloaded and not held: unknown
    local n = held
    local objs = sq:getObjects()
    for i = 0, math.min(48, objs:size()) - 1 do
        local o = objs:get(i)
        local count = o.getContainerCount and o:getContainerCount() or 0
        for ci = 0, math.min(8, count) - 1 do
            local c = o:getContainerByIndex(ci)
            local list = c and c:getItems()
            for k = 0, (list and list:size() or 0) - 1 do
                local md = list:get(k):getModData()
                if md and md.cfGeneratedId == docId then n = n + 1 end
            end
        end
    end
    return n
end
function A.objects()
    local r = root(); if not r or not r.case then return "no-case" end
    local out = {}
    for _, d in ipairs(r.case.documents) do
        local carrier = Kinds.get(d.kind)
        local capacity = carrier and carrier.capacity or "unknown"
        local a = r.assignments and r.assignments[d.id]
        local t = a and a.target
        local members = 0
        if type(d.members) == "table" then
            for _, m in ipairs(d.members) do members = members + (m.quantity or 1) end
        end
        out[#out + 1] = table.concat({
            d.id:match("document%-(%d+)$") or d.id, tostring(d.kind), capacity,
            tostring(a and a.status or "none"), tostring(itemsAt(t, d.id)),
            tostring(members > 0 and members or (d.quantity or 1)),
            tostring(d.wear or "-"), tostring(d.roomIntent or d.placementIntent or "-"),
        }, ":")
    end
    return table.concat(out, "\t")
end

-- 3. VALUE. An object adds value if the story RESTS on it: at least one
--    comparison has it as `from` or `to`, and that comparison names the thing
--    (a word from its title or observation), so the player is told what the
--    object showed rather than reading a line about paper. Also whether the
--    object's own observation is distinct from every paper document's.
local STOP = { the = true, a = true, an = true, of = true, and_ = true, with = true, from = true }
local function words(text)
    local out = {}
    for w in tostring(text or ""):gmatch("%a+") do
        w = w:lower()
        if #w > 2 and not STOP[w] then out[#out + 1] = w end
    end
    return out
end
function A.value()
    local r = root(); if not r or not r.case then return "no-case" end
    local docs = {}
    for _, d in ipairs(r.case.documents) do docs[d.id] = d end
    local out = {}
    for _, d in ipairs(r.case.documents) do
        local carrier = Kinds.get(d.kind)
        if carrier and carrier.capacity == "object" then
            local restsOn, named = 0, 0
            -- The BUILT document has no observation/note fields - they are folded
            -- into d.body by Story.body(). Reading d.observation here returned nil
            -- and, worse, made the distinctness test below compare nil==nil and
            -- call every object "paper in disguise". Use what the document carries.
            local vocabulary = words((d.title or "") .. " " .. (d.body or ""))
            for _, c in ipairs(r.case.story.comparisons or {}) do
                if c.from == d.id or c.to == d.id then
                    restsOn = restsOn + 1
                    local text = tostring(c.text or ""):lower()
                    for _, w in ipairs(vocabulary) do
                        if text:find(w, 1, true) then named = named + 1; break end
                    end
                end
            end
            -- Distinct from paper: no paper document carries this object's text.
            -- Compare bodies, and only real strings - two nils are not "the same
            -- observation", they are the absence of one.
            local distinct = true
            for _, other in ipairs(r.case.documents) do
                local oc = Kinds.get(other.kind)
                if other.id ~= d.id and oc and oc.capacity ~= "object"
                    and type(d.body) == "string" and other.body == d.body then distinct = false end
            end
            out[#out + 1] = table.concat({
                d.id:match("document%-(%d+)$") or d.id, tostring(d.kind),
                tostring(restsOn), tostring(named), tostring(distinct),
            }, ":")
        end
    end
    local readings = r.case.story.readings and #r.case.story.readings or 0
    return table.concat(out, "\t") .. "\t" .. "readings=" .. readings
end

-- WALK TO A WAITING OBJECT. An indexed plan waits for its square to load
-- (GeneratedRuntime: resolve -> "unloaded"); a test that never goes there can
-- only ever report it as waiting. This does what a player following the
-- appointment card would do - stand at the second address - so Q2 can be
-- answered rather than deferred. Returns the square it moved to.
function A.visit(n)
    local r = root(); if not r or not r.case then return "no-case" end
    for _, d in ipairs(r.case.documents) do
        if (d.id:match("document%-(%d+)$") or d.id) == tostring(n) then
            local a = r.assignments and r.assignments[d.id]
            local site
            for _, s in ipairs(r.case.locations) do if a and s.id == a.locationId then site = s end end
            local b = site and site.bounds
            if not b then return "no-site" end
            -- Stand at the site's edge, just outside the guard radius, the way
            -- a player arrives: inside the radius nothing may materialise
            -- (StaleClue.tooClose), and the first run of this stage stood on
            -- the planned square itself and so could only ever see "waiting".
            local SC = require("ConspiracyFiles/StaleClue")
            local gx, gy = b.x1 - (SC.PROXIMITY_GUARD_TILES + 2), b.y1
            local p = getPlayer()
            -- teleportTo, not setX/setY: the engine overwrote those the same
            -- tick and reported a walk that never happened (2026-09-24).
            p:teleportTo(gx + 0.5, gy + 0.5, b.z or 0)
            return table.concat({ tostring(b.x1), tostring(b.y1), tostring(b.z or 0), tostring(a.status),
                "standing=" .. tostring(math.floor(p:getX())) .. "," .. tostring(math.floor(p:getY())) }, "\t")
        end
    end
    return "no-document"
end
-- Why a deferred object is not in the world yet, if the mod recorded a reason.
function A.why(module)
    local Log = require("ConspiracyFiles/Log")
    if not Log.lastDecline then return "no-declines" end
    local why = Log.lastDecline(module)
    return why and tostring(why) or "none"
end
return "fitness mystery audit stages loaded"
