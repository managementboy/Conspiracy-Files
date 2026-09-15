-- Drives checks/drop_note.sh: several case clues noted at once by dropping
-- them on the open organiser (P4-R116), and the names on them reaching NAMES.
-- Needs checks/core_loop.lua loaded first: it finds, reaches and takes clues.
CFDROP = CFDROP or {}
local D = CFDROP
local L = CFLoop
local R = ConspiracyFiles.GeneratedRuntime
local S = ConspiracyFiles.OrganiserScreen
local A = ConspiracyFiles.KnoxApps
D.carried = D.carried or {}
D.people = D.people or {}

-- The case's people, read while the case is live. Noting its last clue
-- finishes a case, and a finished case keeps only its rows - the first run of
-- this check looked the people up after the drop and found none (20260915T111000).
local function rememberPeople(item)
    local md = item and item:getModData()
    if not md or not md.cfGeneratedId then return end
    local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")
    local wrapper = Cases.current(ModData.get("ConspiracyFiles.Generated.G2"))
    local root = Cases.find(wrapper, md.cfGeneratedId)
    -- A case keeps its people as `identities` (Generator.build). The first
    -- version read `people`, found nothing, and reported NAMES as unexercised
    -- on every run (20260915T113943, 114251).
    for _, person in ipairs((root and root.case and root.case.identities) or {}) do
        if person.name then D.people[person.name] = true end
    end
end

-- Which documents are in furniture rather than a car: approach and find only.
function D.inFurniture(n)
    L.approach(n)
    local ok, _, holder = L.find(n)
    if not ok then return false, "not found" end
    return not tostring(holder):find("^vehicle"), tostring(holder)
end

function D.keepCarried()
    D.carried[#D.carried + 1] = L.item
    rememberPeople(L.item)
    return true, tostring(#D.carried)
end

function D.keepLying()
    D.lying = L.item
    rememberPeople(L.item)
    return true, tostring(L.item:getContainer() and L.item:getContainer():getType())
end

function D.inspectedCount()
    local n = 0
    for _, it in ipairs(D.carried) do if R.isInspected(it) then n = n + 1 end end
    return tostring(n), tostring(D.lying ~= nil and R.isInspected(D.lying))
end

function D.open()
    local w = S.window or S.open()
    if not w then return false, "the organiser would not open" end
    if w.booting then w:finishBoot() end
    w.on = true
    return true
end

-- A drag the way the inventory pane builds one - the carried clues as one
-- stack whose items[1] is the header copy, the clue lying in its container as
-- a loose item, an ordinary pencil from the pockets - let go on the glass.
function D.drop()
    local w = S.window; if not w then return false, "no window" end
    local p = getPlayer()
    D.plain = D.plain or p:getInventory():AddItem("Base.Pencil")
    local stack = { items = { D.carried[1] } }
    for _, it in ipairs(D.carried) do stack.items[#stack.items + 1] = it end
    local drag = { stack, D.plain }
    if D.lying then table.insert(drag, 2, D.lying) end
    local ledger = ConspiracyFiles.DiscoveryLog
    local before = #((ledger and ledger.events and ledger.events()) or {})
    ISMouseDrag.dragging = drag
    ISMouseDrag.draggingFocus = getPlayerInventory(0).inventoryPane
    local glass = w:lcd()
    local ok, err = pcall(function() w:onMouseUp(glass.x + 20, glass.y + 20) end)
    -- The pane clears its drag on its next update; clear it here as it would.
    ISMouseDrag.dragging = nil
    ISMouseDrag.draggingFocus = nil
    if not ok then return false, "mouse-up threw: " .. tostring(err) end
    local after = #((ledger and ledger.events and ledger.events()) or {})
    return true, tostring(after - before), tostring(w:footText(""))
end

function D.where()
    local inv = getPlayer():getInventory()
    local still = 0
    for _, it in ipairs(D.carried) do if it:getOutermostContainer() == inv then still = still + 1 end end
    local lying = D.lying ~= nil and D.lying:getOutermostContainer() ~= inv
    return true, tostring(still), tostring(lying), tostring(D.plain ~= nil and R.isInspected(D.plain) == true)
end

-- Every case person whose name is written on noted evidence is in NAMES - read
-- from the rows, which a finished case keeps.
function D.names()
    local rows = require("ConspiracyFiles/EvidenceRows").list("evidence") or {}
    local expected, seen = {}, {}
    for _, row in ipairs(rows) do
        local text = tostring(row.title) .. "\n" .. tostring(row.detailText)
        for name in pairs(D.people) do
            if not seen[name] and text:find(name, 1, true) then
                seen[name] = true
                expected[#expected + 1] = name
            end
        end
    end
    local listed = {}
    for _, r in ipairs(A.names.list("All") or {}) do listed[r.label] = true end
    local missing = {}
    for _, name in ipairs(expected) do if not listed[name] then missing[#missing + 1] = name end end
    return #missing == 0, tostring(#expected), table.concat(expected, ","), table.concat(missing, ",")
end
