-- Engine call form, measured in the real game (audit 2026-09-15).
--
-- AGENTS.md forbids taking a method off an engine object and calling it
-- ("Engine call form - hard rule"). CasePerson.lua, KeyObserver.lua,
-- IdentityObserver.lua, VehicleProbe.lua and IdentityProbe.lua all read engine
-- objects through a small helper that does exactly that: o[k](o,...). Earlier
-- runs show its getters working; this measures the two calls with the least
-- live coverage, AddItem and the searched flag on a container, both ways, on
-- the same object, so the rule can be kept or narrowed on evidence.
CFCall = {}

-- The helper exactly as CasePerson.lua writes it.
local function read(o, k, ...)
    if not o or not o[k] then return nil end
    local ok, v = pcall(function(...) return o[k](o, ...) end, ...)
    if ok then return v end
    return nil
end

local function count(inv, fullType)
    local n, items = 0, inv:getItems()
    for i = 0, items:size() - 1 do
        if items:get(i):getFullType() == fullType then n = n + 1 end
    end
    return n
end

function CFCall.run()
    local inv = getPlayer():getInventory()
    local kind = "Base.Pencil"
    local out = {}

    local before = count(inv, kind)
    local byColon = inv:AddItem(kind)
    local afterColon = count(inv, kind)
    local byHelper = read(inv, "AddItem", kind)
    local afterHelper = count(inv, kind)
    local addColon = byColon ~= nil and afterColon == before + 1
    local addHelper = byHelper ~= nil and afterHelper == afterColon + 1
    out[#out + 1] = "AddItem: colon added=" .. tostring(addColon) .. ", helper added=" .. tostring(addHelper)

    inv:setExplored(true)
    local colonAfterTrue, helperAfterTrue = inv:isExplored(), read(inv, "isExplored")
    read(inv, "setExplored", false)
    local colonAfterFalse, helperAfterFalse = inv:isExplored(), read(inv, "isExplored")
    out[#out + 1] = "searched flag set true by colon: colon read=" .. tostring(colonAfterTrue)
        .. ", helper read=" .. tostring(helperAfterTrue)
    out[#out + 1] = "set false by helper: colon read=" .. tostring(colonAfterFalse)
        .. ", helper read=" .. tostring(helperAfterFalse)

    -- Leave the survivor as they were.
    for _, item in ipairs({ byColon, byHelper }) do
        if item then pcall(function() inv:Remove(item) end) end
    end
    out[#out + 1] = "pencils left behind=" .. tostring(count(inv, kind) - before)

    local agree = addColon and addHelper and colonAfterTrue == true and helperAfterTrue == true
        and colonAfterFalse == false and helperAfterFalse == false
    return agree, table.concat(out, "; ")
end
