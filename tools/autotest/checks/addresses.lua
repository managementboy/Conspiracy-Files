-- Drives checks/addresses.sh: the shipped whole-map house numbers (AD-10,
-- P4-R129) in the real game.
CFAdr = CFAdr or {}
local C = CFAdr
local A = ConspiracyFiles.AddressMap

-- Ready at game start, before any case; how long the load took; nothing saved.
function C.state()
    local saved = ModData.get("ConspiracyFiles.AddressBook.Muldraugh")
    return tostring(A.ready()), tostring(A.loadMs), tostring(saved ~= nil), tostring(A.status and A.status())
end

-- Every shipped building against the live world, a batch per call: the same id
-- must exist with the same footprint. Returns done, checked, missing, moved.
function C.verifyStart()
    local B = require("ConspiracyFiles/Generated/AddressBook")
    C.shipped = {}
    for _, row in ipairs(B.rows) do
        local id, x, y, x2, y2 = row:match("^([^|]+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|(%-?%d+)|")
        C.shipped[id] = x .. "," .. y .. "," .. x2 .. "," .. y2
    end
    C.buildings = getWorld():getMetaGrid():getBuildings()
    C.i, C.found, C.moved = 0, 0, 0
    C.firstMoved = nil
    return B and #B.rows or 0
end

function C.verifyStep(batch)
    local total = C.buildings:size()
    local stop = math.min(total, C.i + (batch or 500))
    while C.i < stop do
        local b = C.buildings:get(C.i)
        C.i = C.i + 1
        local id = tostring(b:getIDString())
        local want = C.shipped[id]
        if want then
            C.found = C.found + 1
            local have = b:getX() .. "," .. b:getY() .. "," .. b:getX2() .. "," .. b:getY2()
            if have ~= want then
                C.moved = C.moved + 1
                C.firstMoved = C.firstMoved or (id .. " shipped " .. want .. " live " .. have)
            end
        end
    end
    local shippedCount = 0
    for _ in pairs(C.shipped) do shippedCount = shippedCount + 1 end
    return tostring(C.i >= total), C.found, shippedCount - C.found, C.moved, tostring(C.firstMoved)
end

-- A few real addresses, by town, straight from the book the game loaded.
function C.samples()
    local B = require("ConspiracyFiles/Generated/AddressBook")
    local want = { Irvington = true, Riverside = true, WestPoint = true, Muldraugh = true, Brandenburg = true }
    local out, taken = {}, {}
    for _, row in ipairs(B.rows) do
        local id = row:match("^([^|]+)|")
        local town = A.townForBuilding(id)
        if town and want[town] and not taken[town] then
            taken[town] = true
            out[#out + 1] = town .. ": " .. tostring(A.labelForBuilding(id))
        end
    end
    table.sort(out)
    return #out, table.concat(out, " | ")
end
