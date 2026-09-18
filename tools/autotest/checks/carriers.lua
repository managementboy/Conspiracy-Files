-- Stages for checks/carriers.sh: clues on carriers (P4-R134,
-- docs/design/CLUES_ON_THE_MOVE.md) in the real game, and the one thing that
-- design shipped as a guess - what the engine calls a mailbox's container.
--
-- Loaded after core_loop.lua, campaign.lua (CFCamp.moveOn, gap, cases),
-- clue_actions.lua and clue_field.lua, whose stages this reuses.
CFCarry = CFCarry or {}
local K = CFCarry
local R = ConspiracyFiles.GeneratedRuntime
local Carriers = require("ConspiracyFiles/Carriers")
local Storage = require("ConspiracyFiles/Generated/Storage")

local function player() return getPlayer() end
local function here()
    local p = player()
    return math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ())
end

-- ---------------------------------------------------------------------------
-- (1) THE MAILBOX GUESS. Storage.MAILBOX is the string "mailbox" and
-- Storage.UNVERIFIED says plainly that nobody had asked Build 42 whether that
-- is what it calls the container. This walks the squares around the survivor
-- and reports what the engine really says: every container type it found, and
-- every one whose type or sprite has "mail" in it, with the sprite that drew
-- it. That is enough to confirm the guess or correct it.
function K.containerTypes(radius)
    radius = tonumber(radius) or 40
    local cell = getCell()
    local px, py, pz = here()
    local byType, mailish, squares = {}, {}, 0
    for dx = -radius, radius do for dy = -radius, radius do
        local sq = cell:getGridSquare(px + dx, py + dy, pz)
        if sq then
            squares = squares + 1
            local objects = sq:getObjects()
            for i = 0, objects:size() - 1 do
                local o = objects:get(i)
                local sprite = o.getSprite and o:getSprite()
                local name = sprite and sprite.getName and tostring(sprite:getName()) or ""
                for c = 0, (o.getContainerCount and o:getContainerCount() or 0) - 1 do
                    local cont = o:getContainerByIndex(c)
                    local t = cont and tostring(cont:getType()) or "?"
                    byType[t] = (byType[t] or 0) + 1
                    if name:lower():find("mail") or t:lower():find("mail") or name:lower():find("postbox") then
                        local key = t .. " [" .. name .. "]"
                        mailish[key] = (mailish[key] or 0) + 1
                    end
                end
            end
        end
    end end
    -- The guess, and the types that look like the thing it is guessing at. The
    -- first run answered this outright: the engine calls it "postbox", and
    -- Storage.MAILBOX is "mailbox", so a mailbox can never be chosen
    -- (20260918T001512, 5 postbox containers within 40 tiles).
    local types, mails, found, near = {}, {}, false, {}
    for t, n in pairs(byType) do
        types[#types + 1] = t .. "=" .. n
        if t == Storage.MAILBOX then found = true end
        local lower = t:lower()
        if lower:find("post") or lower:find("mail") or lower:find("letter") then
            near[#near + 1] = t .. "=" .. n
        end
    end
    for _, x in ipairs(near) do mails[#mails + 1] = x .. " (type)" end
    for k, n in pairs(mailish) do mails[#mails + 1] = k .. "=" .. n end
    table.sort(types); table.sort(mails)
    return tostring(Storage.MAILBOX), tostring(found), table.concat(mails, ", "),
        squares, table.concat(types, " ")
end

-- ---------------------------------------------------------------------------
-- (2) THE CARRIER GUARDS, on real bodies. "Never two clues on one body", "not
-- one the survivor has already searched", "not one they are looking into right
-- now" are pure rules with unit tests; this asks them about a body the world
-- actually has, and drives the survivor's own looting to turn them from false
-- to true.
function K.spawnBodies(n)
    local px, py, pz = here()
    local made = 0
    for i = 1, (tonumber(n) or 3) do
        local list = addZombiesInOutfit(px + 2 + i, py + 2, pz, 1, nil, 50)
        local z = list and list:size() > 0 and list:get(0) or nil
        if z then
            -- A BODY, always (P4-R136): a walking zombie is not a carrier at
            -- all any more, so a check that left half of them standing would
            -- be parking things the mod must ignore.
            pcall(function() z:Kill(player()) end)
            made = made + 1
        end
    end
    return made
end

-- Every usable carrier within `radius`, through the mod's own scan job.
function K.scan(radius)
    local px, py, pz = here()
    local seen = {}
    local job = Carriers.scan(px, py, pz, tonumber(radius) or 12, function() end,
        function(state) seen[#seen + 1] = state; return false end)
    for _ = 1, 40000 do if job() then break end end
    K.found = seen
    local parts = {}
    for _, s in ipairs(seen) do parts[#parts + 1] = s.kind .. "@" .. s.x .. "," .. s.y end
    return #seen, table.concat(parts, " ", 1, math.min(#parts, 6))
end

-- Choose one and remember it.
function K.pick(n)
    K.carrier = (K.found or {})[tonumber(n) or 1]
    if not K.carrier then return "false", "only " .. #(K.found or {}) .. " usable carriers" end
    local c = K.carrier
    return "true", c.kind, c.x .. "," .. c.y .. "," .. c.z
end

-- What the mod says about the chosen carrier NOW, re-read from the object.
function K.state()
    local c = K.carrier
    if not c then return "false", "no carrier picked" end
    local fresh = Carriers.stateOf(c.object, c.kind, Carriers.openContainers(), c.x, c.y, c.z)
    return "true", tostring(Carriers.usable(fresh)), tostring(Carriers.refusal(fresh) or "none"),
        tostring(fresh.explored), tostring(fresh.lootOpen), tostring(fresh.mark ~= nil), tostring(fresh.casePerson)
end

-- Stand beside it, then open its inventory in the loot panel the way a player
-- clicking the body's icon does.
function K.standBy()
    local c = K.carrier
    if not c then return "false", "no carrier picked" end
    local cell = getCell()
    for _, d in ipairs({ { 1, 0 }, { 0, 1 }, { -1, 0 }, { 0, -1 }, { 1, 1 }, { -1, -1 } }) do
        local sq = cell:getGridSquare(c.x + d[1], c.y + d[2], c.z)
        if sq and sq:isFree(false) then
            player():teleportTo(sq:getX() + 0.5, sq:getY() + 0.5, sq:getZ())
            pcall(function() player():faceLocation(c.x + 0.5, c.y + 0.5) end)
            return "true", sq:getX() .. "," .. sq:getY()
        end
    end
    return "false", "no free square beside the carrier"
end
function K.openBody()
    local c = K.carrier
    -- getContainer, as the engine answers for an IsoDeadBody and as the loot
    -- panel itself reads it; getInventory is nil on a body (P4-R136 fix).
    local container = c and Carriers.read(c.object, "getContainer")
    if not container then return "false", "the carrier has no inventory" end
    local loot = getPlayerLoot(0)
    loot:refreshBackpacks()
    for _, b in ipairs(loot.backpacks) do
        if b.inventory == container then loot:selectContainer(b); return "true", tostring(container:getType()) end
    end
    return "false", "no loot-panel icon for the carrier"
end
-- Looking into a container is what marks it searched; the game does it through
-- the loot window. If opening the panel has not set the flag, the check says so
-- and sets it the way the game's own call does, so the guard is still asked.
function K.markSearched()
    local c = K.carrier
    local container = c and Carriers.read(c.object, "getContainer")
    if not container then return "false", "no inventory" end
    local was = container:isExplored() == true
    if not was then container:setExplored(true) end
    return "true", tostring(was), tostring(container:isExplored() == true)
end

-- ---------------------------------------------------------------------------
-- (3) A CLUE ON A CARRIER, if the world gave the filler one. Which clues of the
-- live cases sit on a carrier, and where the mod thinks each one is now.
function K.clues()
    local rows = R.clueTargets()
    local carriers, parts = 0, {}
    for _, c in ipairs(rows) do
        if c.carrier then carriers = carriers + 1 end
        parts[#parts + 1] = c.id:gsub("^generated:", "") .. ":" .. c.status
            .. (c.carrier and (":" .. tostring(c.carrierKind)) or "") .. (c.vehicle and ":car" or "")
            .. (c.recognised and ":recognised" or "")
    end
    return #rows, carriers, table.concat(parts, " ")
end

-- The first unrecognised clue on a carrier, made the target of the stages that
-- already know how to search for one (CFField) and how to look one over
-- (CFAct).
function K.pickClue()
    for _, c in ipairs(R.clueTargets()) do
        if c.carrier and c.status == "placed" and not c.recognised then
            CFField.target = c
            K.clue = c
            return "true", c.id, c.x .. "," .. c.y .. "," .. c.z, tostring(c.carrierKind), tostring(c.mark)
        end
    end
    return "false", "no unrecognised clue on a carrier"
end

-- Where the marked carrier is now, through the mod's own lookup, and whether
-- the clue is really in its inventory.
function K.clueCarrier()
    local c = K.clue
    if not c then return "false", "no carrier clue" end
    -- The mod's own resolver, anchored on the TARGET as WorldAccess anchors it:
    -- findMark returns a carrier state, not a container, and it looks around the
    -- clue's own square, not around the survivor (the first run read it as a
    -- container and the stage threw, 20260918T001512).
    local container, state = Carriers.resolve(c.target, Carriers.FIND_RADIUS)
    if not container then return "false", tostring(state or "not found") end
    local items = container.getItems and container:getItems()
    local found
    for i = 0, (items and items:size() or 0) - 1 do
        local it = items:get(i)
        if it:getModData().cfGeneratedId == c.id then found = it end
    end
    K.item = found
    K.carrierState = state
    if found then CFAct.item = found end
    return "true", tostring(found ~= nil), tostring(found and found:getName()),
        tostring(container.getType and container:getType()),
        tostring(state and (state.kind .. " at " .. state.x .. "," .. state.y))
end

function K.takeClue()
    local p = player()
    if not K.item then return "false", "no item" end
    ISTimedActionQueue.add(ISInventoryTransferAction:new(p, K.item, K.item:getContainer(), p:getInventory()))
    return "true"
end
function K.carried()
    return tostring(K.item ~= nil and K.item:getOutermostContainer() == player():getInventory())
end
function K.recognised()
    return tostring(K.clue ~= nil and R.isRecognisedId(K.clue.id) == true)
end

return CFCarry
