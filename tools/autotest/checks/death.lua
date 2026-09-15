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
function D.carried()
    local out = {}
    local items = getPlayer():getInventory():getItems()
    for i = 0, items:size() - 1 do
        local id = items:get(i):getModData().cfGeneratedId
        if id then out[#out + 1] = id end
    end
    D.bodyAt = { x = getPlayer():getX(), y = getPlayer():getY(), z = getPlayer():getZ() }
    return #out, table.concat(out, " ")
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
    for dx = -2, 2 do for dy = -2, 2 do
        local sq = getCell():getGridSquare(math.floor(b.x) + dx, math.floor(b.y) + dy, b.z)
        local bodies = sq and sq:getDeadBodys()
        if bodies then
            for i = 0, bodies:size() - 1 do
                local c = bodies:get(i):getContainer()
                local items = c:getItems()
                for j = 0, items:size() - 1 do
                    local it = items:get(j)
                    if it:getModData().cfGeneratedId then D.item, D.from = it, c; return true, it:getDisplayName() end
                end
            end
        end
    end end
    return false, "no case document on a body near where the survivor died"
end

function D.goToBody()
    getPlayer():teleportTo(D.bodyAt.x, D.bodyAt.y, D.bodyAt.z)
    return true
end

function D.takeFromBody()
    local p = getPlayer()
    ISTimedActionQueue.add(ISInventoryTransferAction:new(p, D.item, D.item:getContainer(), p:getInventory()))
    return true
end

function D.recovered() return D.item:getContainer() == getPlayer():getInventory() end
function D.stillInspected() return R.isInspected(D.item) == true end
