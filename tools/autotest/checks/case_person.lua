-- Stages for checks/case_person.sh (catalogue CN-01): the case's person is a
-- nearby zombie with the case's name and an ID card (CasePerson.lua).
CFPerson = CFPerson or {}
local P = CFPerson
local MARK = (ConspiracyFiles.CasePerson and ConspiracyFiles.CasePerson.MARK) or "cfCasePerson"

-- The bound zombie in the loaded area, if any: name, position, and the name on
-- its ID card.
function P.find()
    local list = getCell():getZombieList()
    for i = 0, list:size() - 1 do
        local z = list:get(i)
        local md = z:getModData()
        if md[MARK] then
            P.zombie = z
            local d = z:getDescriptor()
            local name = d and (d:getForename() .. " " .. d:getSurname()) or "?"
            local card = "none"
            local items = z:getInventory():getItems()
            for j = 0, items:size() - 1 do
                local it = items:get(j)
                if it:getFullType() == "Base.IDcard" or it:getFullType():find("IDcard", 1, true) then card = it:getDisplayName() end
            end
            return true, name, card, math.floor(z:getX()) .. "," .. math.floor(z:getY()), tostring(md[MARK])
        end
    end
    return false, "no bound case person loaded"
end

function P.goTo()
    local z = P.zombie
    getPlayer():teleportTo(z:getX() + 1.5, z:getY() + 0.5, z:getZ())
    return true
end

function P.kill() P.zombie:Kill(nil); return true end

-- The ID card on the body, shown in the loot panel as a player would see it.
function P.openBody()
    local loot = getPlayerLoot(0); loot:refreshBackpacks()
    for _, b in ipairs(loot.backpacks) do
        local body = b.inventory and b.inventory:getParent()
        if body and instanceof(body, "IsoDeadBody") and body:getModData()[MARK] ~= nil then
            loot:selectContainer(b); return true
        end
    end
    -- The body's ModData may not carry the mark; any body here will do.
    for _, b in ipairs(loot.backpacks) do
        local body = b.inventory and b.inventory:getParent()
        if body and instanceof(body, "IsoDeadBody") and b.inventory:containsType("IDcard") then
            loot:selectContainer(b); return true, "unmarked body"
        end
    end
    return false, "no body with the case person's card in the loot panel"
end

-- The case's own person, as the case records it.
function P.caseName()
    local w = ModData.get("ConspiracyFiles.Generated.G2")
    local c = w and (w.campaign and w.campaign.canonical or w.canonical)
    local person = c and c.case and c.case.identities and c.case.identities[1]
    return person and person.name or "no identity in the case"
end
