-- Stages for checks/case_body.sh: the case person's BODY (P4-R101).
--
-- No save and reload first. A named zombie does not survive one - CN-01
-- (case_person.sh) fails at exactly that step on the code before P4-R101 and
-- after it alike - so this goes straight to her death, which is where the two
-- names came from in play (owner, Windows, 2026-09-14).
CFBody = CFBody or {}
local B = CFBody
local P = ConspiracyFiles.CasePerson

function B.caseName()
    local w = ModData.get("ConspiracyFiles.Generated.G2")
    local c = w and (w.campaign and w.campaign.canonical or w.canonical)
    local person = c and c.case and c.case.identities and c.case.identities[1]
    return person and person.name or "none"
end

-- The zombie the case bound, and the name it carries for its body.
function B.find()
    local list = getCell():getZombieList()
    for i = 0, list:size() - 1 do
        local z = list:get(i)
        local md = z:getModData()
        if md[P.MARK] then
            B.zombie = z
            return true, tostring(md[P.NAME]), math.floor(z:getX()) .. "," .. math.floor(z:getY())
        end
    end
    return false, "no bound zombie loaded"
end

function B.kill()
    local z = B.zombie; if not z then return false, "no zombie" end
    B.x, B.y, B.z = math.floor(z:getX()), math.floor(z:getY()), math.floor(z:getZ())
    getPlayer():teleportTo(z:getX() + 1.5, z:getY() + 0.5, z:getZ())
    z:Kill(nil)
    return true
end

local function bodiesOn(square)
    local out = {}
    for _, getter in ipairs({ "getDeadBodys", "getStaticMovingObjects" }) do
        local ok, list = pcall(function() return square[getter](square) end)
        if ok and list then
            for i = 0, list:size() - 1 do
                local o = list:get(i)
                if instanceof(o, "IsoDeadBody") then out[#out + 1] = o end
            end
        end
    end
    return out
end

-- The marked body near where she died, and what it holds. The loot panel is
-- refreshed beside it first: showing an unsearched body is when the game rolls
-- its loot, so a count taken before that would prove nothing.
function B.body()
    local cell = getCell()
    for dx = -3, 3 do
        for dy = -3, 3 do
            local square = cell:getGridSquare(B.x + dx, B.y + dy, B.z)
            for _, o in ipairs(square and bodiesOn(square) or {}) do
                if o:getModData()[P.MARK] then
                    local c = o:getContainer()
                    local searched = c:isExplored()
                    pcall(function() getPlayerLoot(0):refreshBackpacks() end)
                    local cards, ours, names = 0, 0, {}
                    local items = c:getItems()
                    for j = 0, items:size() - 1 do
                        local it = items:get(j)
                        if it:getFullType():find("IDcard", 1, true) then
                            cards = cards + 1
                            names[#names + 1] = it:getDisplayName()
                            if it:getModData()[P.MARK] then ours = ours + 1 end
                        end
                    end
                    return true, tostring(searched), tostring(cards), tostring(ours),
                        table.concat(names, "; "), tostring(items:size())
                end
            end
        end
    end
    return false, "no marked body near " .. tostring(B.x) .. "," .. tostring(B.y)
end

-- Show her body in the loot panel, as a player opening it does. The identity
-- observer records a card only from rows the inventory pane actually draws,
-- so the container must be selected and drawn before the notebook can know it.
function B.openBody()
    local loot = getPlayerLoot(0)
    loot:refreshBackpacks()
    for _, b in ipairs(loot.backpacks) do
        local parent = b.inventory and b.inventory:getParent()
        if parent and instanceof(parent, "IsoDeadBody") and parent:getModData()[P.MARK] then
            loot:selectContainer(b)
            return true
        end
    end
    return false, "her body is not in the loot panel"
end

-- Whether the notebook holds a lead for the card, as a plain true or false.
-- CN-01 asked a helper that returns nil when there is no row, and counted the
-- printed word "nil" as a row - so its "card on the body in the notebook"
-- passed with nothing recorded (20260914T201413).
function B.lead(name)
    for _, r in ipairs(ConspiracyFiles.IdentityObserver.rows()) do
        if r.title == "Found ID Card: " .. tostring(name) then return true, tostring(r.summary) end
    end
    return false, "no notebook row for ID Card: " .. tostring(name)
end

return CFBody
