-- Stages for checks/death.sh (catalogue E10: PS-10, PS-12). The respawn goes
-- through the game's own post-death panel, spawn-region list and character
-- creation, calling what their buttons call.
CFDeath = CFDeath or {}
local D = CFDeath
local R = ConspiracyFiles.GeneratedRuntime

function D.forename()
    local p = getPlayer()
    return p and p:getDescriptor():getForename() or "none"
end

-- Where the body will be, and which evidence it carries.
-- Case documents anywhere on the survivor. Recognised evidence is filed into
-- the evidence album (CaseFile.fileEvidence, P4-R132), so the root inventory
-- alone read "carrying 0" while two documents rode along in the album
-- (20260924T221458). One bag deep is where the album is.
local function documentsIn(container, depth, out)
    local items = container and container:getItems()
    for i = 0, (items and items:size() or 0) - 1 do
        local it = items:get(i)
        local md = it and it:getModData()
        if type(md) == "table" and md.cfGeneratedId then out[#out + 1] = { item = it, container = container, id = md.cfGeneratedId } end
        if depth < 1 and it and it.getInventory and instanceof(it, "InventoryContainer") then
            documentsIn(it:getInventory(), depth + 1, out)
        end
    end
    return out
end
D.documentsIn = documentsIn

function D.carried()
    local found = documentsIn(getPlayer():getInventory(), 0, {})
    local ids = {}
    for _, f in ipairs(found) do ids[#ids + 1] = f.id end
    D.bodyAt = { x = getPlayer():getX(), y = getPlayer():getY(), z = getPlayer():getZ() }
    return #ids, table.concat(ids, " ")
end

function D.die()
    local p = getPlayer()
    p:setGodMod(false)
    p:setInvisible(false)
    p:Kill(nil)
    return true
end

function D.dead() local p = getPlayer(); return p == nil or p:isDead() end

-- Post-death panel: Respawn, as its button does.
function D.respawn()
    local panel = ISPostDeathUI.instance[0]
    if not panel then return false, "no post-death panel" end
    panel:onRespawn()
    return true
end

-- Spawn region list (Next) and character creation (Accept), if shown.
function D.acceptCreation()
    local pick = CoopMapSpawnSelect and CoopMapSpawnSelect.instance
    if pick and pick:isVisible() then pick:clickNext(); return "region chosen" end
    local cc = CoopCharacterCreation and CoopCharacterCreation.instance
    if cc then cc:accept(); return "accepted" end
    return "nothing to accept"
end

function D.alive() local p = getPlayer(); return p ~= nil and not p:isDead() end

-- The new survivor goes back to the body and takes one document off it.
function D.bodyItem()
    local b = D.bodyAt
    local seen = {}
    for dx = -2, 2 do for dy = -2, 2 do
        local sq = getCell():getGridSquare(math.floor(b.x) + dx, math.floor(b.y) + dy, b.z)
        if sq then
            -- The body's own container and the album inside it.
            local bodies = sq:getDeadBodys()
            for i = 0, (bodies and bodies:size() or 0) - 1 do
                local c = bodies:get(i):getContainer()
                local found = documentsIn(c, 0, {})
                if found[1] then D.item, D.from = found[1].item, found[1].container; return true, found[1].item:getDisplayName(), "in the body" end
                local n = c and c:getItems() and c:getItems():size() or 0
                seen[#seen + 1] = "body@" .. sq:getX() .. "," .. sq:getY() .. " items=" .. n
            end
            -- A bag the game set down beside the body rather than inside it:
            -- the evidence album with the documents filed in it. Looked for
            -- since 20260925T011525, when the body held no document and the
            -- check could not say where the two documents had gone.
            local objs = sq:getWorldObjects()
            for i = 0, (objs and objs:size() or 0) - 1 do
                local wo = objs:get(i)
                local it = wo and wo.getItem and wo:getItem()
                if it then
                    local md = it:getModData()
                    if type(md) == "table" and md.cfGeneratedId then D.item, D.from = it, nil; D.floor = wo; return true, it:getDisplayName(), "on the floor" end
                    if it.getInventory and instanceof(it, "InventoryContainer") then
                        local found = documentsIn(it:getInventory(), 1, {})
                        if found[1] then D.item, D.from = found[1].item, found[1].container; return true, found[1].item:getDisplayName(), "in a bag on the floor (" .. it:getDisplayName() .. ")" end
                        seen[#seen + 1] = "floor bag " .. it:getDisplayName() .. "@" .. sq:getX() .. "," .. sq:getY()
                    end
                end
            end
        end
    end end
    return false, "no case document on a body or the floor near where the survivor died; seen: " .. (#seen > 0 and table.concat(seen, "; ") or "nothing")
end

-- The 5x5 around the death spot is loaded, so a scan there means something.
-- After teleportTo the chunk streams in over seconds, and a scan three
-- seconds later read "no case document on a body" while the squares were
-- still nil (suite 20260925T001636; the rerun before it was merely lucky).
function D.bodyLoaded()
    local b = D.bodyAt; if not b then return false end
    for dx = -2, 2 do for dy = -2, 2 do
        if not getCell():getGridSquare(math.floor(b.x) + dx, math.floor(b.y) + dy, b.z) then return false end
    end end
    return true
end

function D.goToBody()
    getPlayer():teleportTo(D.bodyAt.x, D.bodyAt.y, D.bodyAt.z)
    return true
end

function D.takeFromBody()
    local p = getPlayer()
    local from = D.item:getContainer()
    if not from then
        -- Lying on the floor: pick it up as a player would.
        ISTimedActionQueue.add(ISInventoryTransferAction:new(p, D.item, getPlayer():getCurrentSquare() and D.floor and D.floor:getContainer() or from, p:getInventory()))
        return true, "from the floor"
    end
    ISTimedActionQueue.add(ISInventoryTransferAction:new(p, D.item, from, p:getInventory()))
    return true
end

-- Anywhere on the new survivor: the album may already have filed it again.
function D.recovered() return D.item:getOutermostContainer() == getPlayer():getInventory() end
function D.stillInspected() return R.isInspected(D.item) == true end
