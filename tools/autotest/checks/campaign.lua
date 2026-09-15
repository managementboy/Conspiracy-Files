-- Long campaign check (checks/campaign.sh): several generated cases played end
-- to end in one save, with a save and reload between them. Loaded after
-- core_loop.lua and reload.lua, whose stages it reuses: CFLoop finds, takes
-- and inspects a paper the player's way; CFReload measures the save.
--
-- What only shows across cases and over time is what this is for: a finished
-- case turning into questions, the answers surviving a reload, the next case
-- built from them, the case after that built from nothing, the notebook's order
-- across cases, finished papers staying Old, and the save growing case by case.
CFCamp = CFCamp or {}
local C = CFCamp
local R = ConspiracyFiles.GeneratedRuntime
local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")

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
        local done = type(root.rows) == "table"
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

-- The newest case still being played, or "none".
function C.newestLive()
    local id = "none"
    for _, root in ipairs(roots()) do if root.case then id = root.case.caseId end end
    return id
end

-- Papers the harness could not reach, so the next pass moves on to another.
C.skipped = C.skipped or {}
function C.skipFirst()
    local d = CFLoop.list and CFLoop.list[1]
    if d then C.skipped[d.id] = true end
    return d and d.id or "none"
end

-- Point CFLoop at one case's papers still to find, in document order, so
-- inspect_doc 1 always plays the next one of that case and no other. Papers
-- already in the notebook, and papers skipped, are left out. Returns how many
-- remain, how many are placed, how many still waiting to be placed.
function C.useCase(caseId)
    local prefix = tostring(caseId):gsub(":case$", ":")
    local known = {}
    for _, row in ipairs(R.known()) do known[row.id] = true end
    local out, placed, waiting = {}, 0, 0
    for _, d in ipairs(CFLoop.docs()) do
        if d.id:sub(1, #prefix) == prefix and not known[d.id] and not C.skipped[d.id] then
            out[#out + 1] = d
            if d.status == "pending" or d.status == "placing" then waiting = waiting + 1 else placed = placed + 1 end
        end
    end
    table.sort(out, function(a, b)
        return (tonumber(a.id:match("document%-(%d+)$")) or 0) < (tonumber(b.id:match("document%-(%d+)$")) or 0)
    end)
    CFLoop.list = out
    return #out, placed, waiting
end

-- How a live case was built: its steer (or "unsteered"), its first person and
-- whether they are marked met (no body), and every paper title.
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

-- What the organiser shows: question rows and papers in FILES, NAMES, PLACES,
-- and the notebook's discoveries.
function C.surfaces()
    local A = require("ConspiracyFiles/KnoxApps")
    local qrows, papers = 0, 0
    for _, r in ipairs(A.files.list() or {}) do if r.questions then qrows = qrows + 1 else papers = papers + 1 end end
    return qrows, papers, #(A.names.list("All") or {}), #(A.places.list() or {}), #R.known()
end

-- The notebook's discoveries, by case index in campaign order. Cases played
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

-- The paper the harness is about to look for: where the case says it is, its
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

-- Carried papers by category: a finished case's must be Evidence / Old, a live
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
