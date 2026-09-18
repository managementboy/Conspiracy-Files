-- Stages for checks/instalments.sh: the three things P4-R133 and P4-R134 added
-- that no run had yet seen in the game - a clue placed as an INSTALMENT, a
-- clue on a CARRIER (a body and a zombie), and the MAILBOX - plus the expiry
-- of a clue that never found a home.
--
-- Loaded after core_loop.lua, campaign.lua, clue_actions.lua, clue_field.lua
-- and carriers.lua, whose stages this reuses (CFCamp.moveOn/settled/gap,
-- CFField.searchOn/recognised/icon, CFCarry.spawnBodies).
--
-- HOW THE WORLD IS PERSUADED, and why none of it is a mod change. A carrier is
-- used only for a clue the filler could not give a fixed container (P4-R134),
-- and that state is rare in a fresh suburb: the case simply gets a cupboard.
-- So the harness turns down what the mod is allowed to SEE, the way a player's
-- ransacked neighbourhood would:
--   * Storage.KINDS - the container kinds the nearby scan accepts - is
--     narrowed in place to one or two kinds. A case then goes live with the
--     clues that fit and the rest wait, which is P4-R133's own design, and the
--     site's few containers are all taken, which is what sends the filler to a
--     carrier.
--   * Session.VEHICLE_RADIUS is set to 0 while a case is prepared, so a car
--     does not spend the case's single mobile slot before a body can have it.
--   * Session.DEFER_EXPIRE_HOURS is lowered from 72 for the expiry stage,
--     because 72 in-game hours is forty minutes of real time even at the
--     fastest speed. The constant is the only thing changed; the path that
--     drops the clue, writes `ev=stale why=expired` and lets the case complete
--     on the clues it got is the shipped one.
-- Every one of these is restored before the check judges anything else, and
-- each is reported in the evidence so a reader knows what the run was.
CFInst = CFInst or {}
local I = CFInst
local R = ConspiracyFiles.GeneratedRuntime
local Storage = require("ConspiracyFiles/Generated/Storage")
local Session = require("ConspiracyFiles/Generated/Session")
local Carriers = require("ConspiracyFiles/Carriers")
local Cases = require("ConspiracyFiles/Generated/SuccessiveCases")

local function player() return getPlayer() end
local function roots()
    local store = ModData.get("ConspiracyFiles.Generated.G2")
    local wrapper = store and Cases.current(store)
    return (wrapper and Cases.sessions(wrapper)) or {}
end

-- ---------------------------------------------------------------------------
-- The knobs, each with what it was.
I.was = I.was or { kinds = nil, vehicle = Session.VEHICLE_RADIUS, expire = Session.DEFER_EXPIRE_HOURS }

local function kindList()
    local out = {}
    for k in pairs(Storage.KINDS) do out[#out + 1] = k end
    table.sort(out)
    return table.concat(out, ",")
end
function I.kinds() return kindList() end

-- Keep only these kinds. Mutated IN PLACE: Storage.scan closes over the same
-- table, so replacing Storage.KINDS would change nothing at all.
function I.narrow(csv)
    if not I.was.kinds then
        I.was.kinds = {}
        for k in pairs(Storage.KINDS) do I.was.kinds[k] = true end
    end
    local want = {}
    for k in tostring(csv or "counter"):gmatch("[^,]+") do want[k] = true end
    for k in pairs(Storage.KINDS) do if not want[k] then Storage.KINDS[k] = nil end end
    for k in pairs(want) do if I.was.kinds[k] then Storage.KINDS[k] = true end end
    return kindList()
end
function I.widen()
    for k in pairs(I.was.kinds or {}) do Storage.KINDS[k] = true end
    Session.VEHICLE_RADIUS = I.was.vehicle
    Session.DEFER_EXPIRE_HOURS = I.was.expire
    return kindList(), tostring(Session.VEHICLE_RADIUS), tostring(Session.DEFER_EXPIRE_HOURS)
end
function I.noCars(on)
    Session.VEHICLE_RADIUS = (tostring(on) == "true") and 0 or I.was.vehicle
    return tostring(Session.VEHICLE_RADIUS)
end
function I.expire(hours)
    Session.DEFER_EXPIRE_HOURS = tonumber(hours) or I.was.expire
    return tostring(Session.DEFER_EXPIRE_HOURS)
end
-- A run with zombies parked beside the survivor must not end with the survivor
-- eaten: this is a harness convenience and is reported as one.
function I.safe()
    local p, got = player(), {}
    for _, call in ipairs({ "setGodMod", "setInvincible", "setInvisible" }) do
        local ok = pcall(function() p[call](p, true) end)
        got[#got + 1] = call .. "=" .. tostring(ok)
    end
    return table.concat(got, " ")
end

-- ---------------------------------------------------------------------------
-- (a) THE MAILBOX (P4-R134). "postbox" is the engine's word, verified, and it
-- is in the allow-list - but a site is a ROOM RECTANGLE inside a building and
-- the nearby scan only ever looks at squares inside one (Storage.scan). So the
-- question a real game has to answer is not what the container is called: it
-- is whether any postbox is anywhere the scan can see it. For every postbox
-- container within `radius`, this reports where it is, whether its square is
-- in a room at all, and whether it falls inside a live case's site footprint.
function I.postboxes(radius)
    radius = tonumber(radius) or 60
    local cell = getCell()
    local p = player()
    local px, py, pz = math.floor(p:getX()), math.floor(p:getY()), math.floor(p:getZ())
    -- Every live case's site footprints, and the carrier-width margin the
    -- filler would allow around them.
    local sites = {}
    for _, root in ipairs(roots()) do
        for _, s in ipairs((root.case and root.case.locations) or {}) do sites[#sites + 1] = s end
    end
    local total, inRoom, inSite, sample = 0, 0, 0, ""
    -- HOW FAR OUTSIDE a site footprint each one lies, which is the number the
    -- fix needs: Session.OUTDOOR_RADIUS has to reach the gate from the
    -- building, and a band is walked square by square, so it must be no wider
    -- than it needs to be. `near` counts the ones the shipped radius reaches.
    local dists, near, nearBuilding, buildingDists = {}, 0, 0, {}
    -- AND HOW FAR FROM THE BUILDING IT SERVES, which is the question the band's
    -- width actually has to answer: a band is grown from a site's own
    -- rectangle, and a new case may pick any of the twelve buildings the
    -- nearby scan offered, not only the two this case happens to use.
    local function distanceToAnyBuilding(x, y)
        local reach = 20
        local best
        for dx = -reach, reach do for dy = -reach, reach do
            local d = math.max(math.abs(dx), math.abs(dy))
            if (not best or d < best) then
                local sq = cell:getGridSquare(x + dx, y + dy, 0)
                if sq and sq:getBuilding() then best = d end
            end
        end end
        return best
    end
    local function distanceToSites(x, y)
        local best
        for _, s in ipairs(sites) do
            local b = s.bounds
            local dx = math.max(b.x1 - x, 0, x - (b.x2 - 1))
            local dy = math.max(b.y1 - y, 0, y - (b.y2 - 1))
            local d = math.max(dx, dy)
            if not best or d < best then best = d end
        end
        return best
    end
    for dx = -radius, radius do for dy = -radius, radius do
        local sq = cell:getGridSquare(px + dx, py + dy, pz)
        local objects = sq and sq:getObjects()
        for i = 0, (objects and objects:size() or 0) - 1 do
            local o = objects:get(i)
            for c = 0, (o.getContainerCount and o:getContainerCount() or 0) - 1 do
                local cont = o:getContainerByIndex(c)
                if cont and tostring(cont:getType()) == Storage.MAILBOX then
                    total = total + 1
                    local room = sq:getRoom()
                    if room then inRoom = inRoom + 1 end
                    local inside = false
                    for _, s in ipairs(sites) do
                        local b = s.bounds
                        if px + dx >= b.x1 and px + dx < b.x2 and py + dy >= b.y1 and py + dy < b.y2 then inside = true end
                    end
                    if inside then inSite = inSite + 1 end
                    local d = distanceToSites(px + dx, py + dy)
                    if d then
                        if #dists < 12 then dists[#dists + 1] = string.format("%s,%s=%st", px + dx, py + dy, d) end
                        if d <= Session.OUTDOOR_RADIUS then near = near + 1 end
                    end
                    local b = distanceToAnyBuilding(px + dx, py + dy)
                    if b then
                        if #buildingDists < 12 then
                            buildingDists[#buildingDists + 1] = string.format("%s,%s=%st", px + dx, py + dy, b)
                        end
                        if b <= Session.OUTDOOR_RADIUS then nearBuilding = nearBuilding + 1 end
                    end
                    if sample == "" then
                        sample = string.format("%s,%s room=%s inside a site=%s tiles outside the nearest site=%s",
                            px + dx, py + dy, tostring(room and room:getName()), tostring(inside), tostring(d))
                    end
                end
            end
        end
    end end
    return total, inRoom, inSite, sample, #sites, near,
        tostring(Session.OUTDOOR_RADIUS), table.concat(dists, " "),
        nearBuilding, table.concat(buildingDists, " ")
end

-- What container kinds the mod itself offered each live site: the other half of
-- the same question. A postbox that no scan can see never reaches this list.
function I.siteTypes()
    local parts, postbox = {}, 0
    for _, root in ipairs(roots()) do
        for _, s in ipairs((root.case and root.case.locations) or {}) do
            local types = table.concat(s.containerTypes or {}, "+")
            if types:find(Storage.MAILBOX) then postbox = postbox + 1 end
            parts[#parts + 1] = s.id:gsub("^t3:", "") .. "=" .. types
        end
    end
    return postbox, table.concat(parts, " ")
end

-- ---------------------------------------------------------------------------
-- (b) WHAT THE CASES ARE DOING. Every clue of every live case: its status, the
-- kind of place it is in, and - the assertion of P4-R134 - the words the record
-- uses for it, which is GeneratedRuntime.whereabouts, the same line
-- EvidenceRows shows the survivor.
function I.targets()
    local placed, carriers, waiting, parts = 0, 0, 0, {}
    for _, root in ipairs(roots()) do
        for id, a in pairs(root.assignments or {}) do
            local t = a.target
            if a.status == "placed" then placed = placed + 1 end
            if t and Session.isMobile(t) and t.carrierMark then carriers = carriers + 1 end
            if a.status == "deferred" then waiting = waiting + 1 end
            local _, where = R.whereabouts(id)
            parts[#parts + 1] = (id:match("(%d+):document%-(%d+)$") and
                (id:gsub("^generated:", "")) or id) .. ":" .. tostring(a.status)
                .. ":" .. tostring(t and (t.carrierKind or t.containerType) or "none")
                .. (where and (" [" .. tostring(where) .. "]") or "")
        end
    end
    table.sort(parts)
    return placed, carriers, waiting, table.concat(parts, " | ")
end

-- The first clue on a carrier, made CFField's target so the searching stages
-- can look for it. Returns its id, the carrier's kind, the record's words and
-- where the mod thinks it is.
function I.pickCarrierClue(kind)
    for _, c in ipairs(R.clueTargets()) do
        if c.carrier and c.status == "placed"
            and (kind == nil or kind == "any" or tostring(c.carrierKind) == kind) then
            CFField.target = c
            CFCarry.clue = c
            local _, where = R.whereabouts(c.id)
            return "true", c.id, tostring(c.carrierKind), tostring(where), c.x .. "," .. c.y .. "," .. c.z,
                tostring(c.recognised)
        end
    end
    return "false", "no placed clue on a carrier" .. (kind and kind ~= "any" and (" of kind " .. kind) or "")
end

-- The first clue in a container of one type (the mailbox stage's other half).
function I.pickTypeClue(kind)
    for _, c in ipairs(R.clueTargets()) do
        if c.status == "placed" and not c.carrier
            and tostring(c.target and c.target.containerType) == kind then
            CFField.target = c
            local _, where = R.whereabouts(c.id)
            return "true", c.id, tostring(where), c.x .. "," .. c.y .. "," .. c.z, tostring(c.recognised)
        end
    end
    return "false", "no placed clue in a " .. tostring(kind)
end

-- Stand next to where the mod says the clue is NOW - a body stays put, a
-- zombie does not - and face it, which is what the survivor's own spotting
-- needs. Returns where the survivor ended up and how far that was from the
-- clue.
function I.standBeside()
    local t = CFField.target
    if not t then return "false", "no clue picked" end
    local live = CFField.livePosition() or { x = t.x, y = t.y, z = t.z }
    local cell = getCell()
    for _, d in ipairs({ { 1, 0 }, { 0, 1 }, { -1, 0 }, { 0, -1 }, { 1, 1 }, { -1, -1 }, { 2, 0 }, { 0, 2 } }) do
        local sq = cell:getGridSquare(live.x + d[1], live.y + d[2], live.z)
        if sq and sq:isFree(false) then
            player():teleportTo(sq:getX() + 0.5, sq:getY() + 0.5, sq:getZ())
            pcall(function() player():faceLocation(live.x + 0.5, live.y + 0.5) end)
            return "true", sq:getX() .. "," .. sq:getY(), live.x .. "," .. live.y
        end
    end
    return "false", "no free square beside " .. live.x .. "," .. live.y
end

-- ---------------------------------------------------------------------------
-- (c) THE WAITING CLUE, and the ground prepared for it. Where the first clue
-- still waiting belongs, so the harness can load that site, park bodies in it
-- and then stand far enough away that the filler is allowed to place.
-- A waiting clue whose case still has its ONE mobile slot free is the only
-- one a carrier can ever take (Session.MOBILE_PER_CASE): a case that already
-- has a clue on a body or in a car will refuse the next one with
-- `ev=skip why=no-containers` for ever, and a check waiting for it would wait
-- for ever too. The mobile-allowed ones come first, and the last field says
-- which kind was returned.
function I.waitingSite(caseId)
    local prefix = caseId and tostring(caseId):gsub(":case$", ":") or nil
    local best
    for _, root in ipairs(roots()) do
        if root.case and root.assignments then
            for id, a in pairs(root.assignments) do
                if (not prefix or id:sub(1, #prefix) == prefix) and a.status == "deferred" then
                    for _, s in ipairs(root.case.locations) do
                        if s.id == a.locationId then
                            local b = s.bounds
                            local mobile = Session.mobileAllowed(root, id) == true
                            local row = { "true", id, s.id, math.floor((b.x1 + b.x2) / 2),
                                math.floor((b.y1 + b.y2) / 2), b.z or 0,
                                tostring(a.deferredHours), table.concat(s.containerTypes or {}, "+"),
                                tostring(mobile) }
                            if mobile then return unpack(row) end
                            best = best or row
                        end
                    end
                end
            end
        end
    end
    if best then return unpack(best) end
    return "false", "no clue is waiting"
end

-- Park carriers at a point the world has loaded: "corpse" kills them where
-- they stand, "zombie" leaves them walking. The mod never spawns one; this is
-- the harness standing in for a street that already has bodies in it.
function I.park(kind, n, x, y, z)
    x, y, z = math.floor(tonumber(x)), math.floor(tonumber(y)), math.floor(tonumber(z) or 0)
    local made, dead = 0, 0
    for i = 1, (tonumber(n) or 4) do
        local ox = (i % 3) - 1
        local oy = math.floor(i / 3) - 1
        local list = addZombiesInOutfit(x + ox, y + oy, z, 1, nil, 50)
        local zed = list and list:size() > 0 and list:get(0) or nil
        if zed then
            made = made + 1
            if kind == "corpse" then
                local ok = pcall(function() zed:Kill(player()) end)
                if ok then dead = dead + 1 end
            end
        end
    end
    return made, dead
end

-- Stand `tiles` away from a point, on a free square, so the filler's proximity
-- guard (StaleClue.PROXIMITY_GUARD_TILES, twenty tiles) lets it place while
-- the site itself stays loaded.
function I.stepAway(tiles, x, y, z)
    tiles = tonumber(tiles) or 25
    x, y, z = math.floor(tonumber(x)), math.floor(tonumber(y)), math.floor(tonumber(z) or 0)
    local cell = getCell()
    for _, d in ipairs({ { 1, 0 }, { 0, 1 }, { -1, 0 }, { 0, -1 }, { 1, 1 }, { -1, 1 }, { 1, -1 }, { -1, -1 } }) do
        for extra = 0, 10 do
            local tx, ty = x + d[1] * (tiles + extra), y + d[2] * (tiles + extra)
            local sq = cell:getGridSquare(tx, ty, z)
            if sq and sq:isFree(false) then
                player():teleportTo(sq:getX() + 0.5, sq:getY() + 0.5, sq:getZ())
                return "true", tx .. "," .. ty,
                    tostring(math.max(math.abs(tx - x), math.abs(ty - y)))
            end
        end
    end
    return "false", "no free square about " .. tiles .. " tiles from " .. x .. "," .. y
end

-- Are the squares around a point loaded? The filler sees only loaded squares,
-- so this is the difference between "no container there" and "nothing there
-- yet".
function I.loadedAt(x, y, z, radius)
    x, y, z = math.floor(tonumber(x)), math.floor(tonumber(y)), math.floor(tonumber(z) or 0)
    radius = tonumber(radius) or 6
    local cell = getCell()
    local squares, containers, carriers = 0, 0, 0
    for dx = -radius, radius do for dy = -radius, radius do
        local sq = cell:getGridSquare(x + dx, y + dy, z)
        if sq then
            squares = squares + 1
            local objects = sq:getObjects()
            for i = 0, objects:size() - 1 do
                local o = objects:get(i)
                if o.getContainerCount and o:getContainerCount() > 0 then containers = containers + 1 end
            end
            local dead = sq.getDeadBodys and sq:getDeadBodys()
            if dead then carriers = carriers + (dead.size and dead:size() or 0) end
        end
    end end
    return squares, containers, carriers
end

-- The mod's own carrier scan around a point, so the evidence can say whether
-- what the harness parked is what the mod can see.
function I.carriersNear(x, y, z, radius)
    x, y, z = math.floor(tonumber(x)), math.floor(tonumber(y)), math.floor(tonumber(z) or 0)
    local seen = {}
    local job = Carriers.scan(x, y, z, tonumber(radius) or 14, function() end,
        function(state) seen[#seen + 1] = state; return false end)
    for _ = 1, 60000 do if job() then break end end
    local kinds, parts = {}, {}
    for _, s in ipairs(seen) do
        kinds[s.kind] = (kinds[s.kind] or 0) + 1
        if #parts < 6 then parts[#parts + 1] = s.kind .. "@" .. s.x .. "," .. s.y end
    end
    local counts = {}
    for k, n in pairs(kinds) do counts[#counts + 1] = k .. "=" .. n end
    table.sort(counts)
    return #seen, table.concat(counts, " "), table.concat(parts, " ")
end

-- ---------------------------------------------------------------------------
-- (e) IS A FRESH CORPSE A CARRIER AT ALL? Three runs now have found only
-- ZOMBIES usable (20260918T001512, 20260918T002532, 20260918T032829: "usable
-- carriers ... 2 (zombie@..., zombie@...)" with corpses lying on the same
-- squares, and a carrier scan that saw 0 with five bodies loaded at the site).
-- The design's own headline example is a note in a dead man's jacket, so this
-- asks the engine directly: for every dead body near a point, what each
-- inventory accessor returns, what class the object is, and what
-- Carriers.refusal says about it. Whatever the answer, it is evidence rather
-- than a guess.
function I.bodyProbe(x, y, z, radius)
    x, y, z = math.floor(tonumber(x)), math.floor(tonumber(y)), math.floor(tonumber(z) or 0)
    radius = tonumber(radius) or 8
    local cell = getCell()
    local open = Carriers.openContainers()
    local read = Carriers.read
    local function accessors(o)
        local parts = {}
        for _, call in ipairs({ "getInventory", "getContainer", "getItemContainer" }) do
            local v = read(o, call)
            parts[#parts + 1] = call .. "=" .. (v and (tostring(read(v, "getType") or "container")) or "nil")
        end
        local class = "?"
        pcall(function()
            for _, name in ipairs({ "IsoDeadBody", "IsoZombie", "IsoPlayer" }) do
                if instanceof(o, name) then class = name end
            end
        end)
        return class .. " " .. table.concat(parts, " ")
    end
    local bodies, usable, parts = 0, 0, {}
    for dx = -radius, radius do for dy = -radius, radius do
        local sq = cell:getGridSquare(x + dx, y + dy, z)
        for _, body in ipairs(sq and Carriers.bodiesOn(sq) or {}) do
            bodies = bodies + 1
            local state = Carriers.stateOf(body, Carriers.CORPSE, open, x + dx, y + dy, z)
            local why = Carriers.refusal(state)
            if not why then usable = usable + 1 end
            if #parts < 6 then
                parts[#parts + 1] = string.format("body@%s,%s %s refusal=%s",
                    x + dx, y + dy, accessors(body), tostring(why or "none, usable"))
            end
        end
    end end
    -- And the cell's zombie list, dead entries included: a zombie that has just
    -- been killed may still be in it, and Carriers.scan reads it first.
    local zombies, deadInList, zparts = 0, 0, {}
    local list = read(cell, "getZombieList")
    local total = read(list, "size") or 0
    for i = 1, (total < 60 and total or 60) do
        local zed = read(list, "get", i - 1)
        local zx, zy, zz = Carriers.position(zed)
        if zx and zz == z and math.abs(zx - x) <= radius and math.abs(zy - y) <= radius then
            zombies = zombies + 1
            local dead = read(zed, "isDead") == true
            if dead then deadInList = deadInList + 1 end
            -- "zombie" as a literal, not a carrier kind: there is no such
            -- kind any more (P4-R136), and what this prints is the mod
            -- refusing a walker - "not a carrier" - which is the point.
            local state = Carriers.stateOf(zed, dead and Carriers.CORPSE or "zombie", open, zx, zy, zz)
            local why = Carriers.refusal(state)
            if not why then usable = usable + 1 end
            if #zparts < 6 then
                zparts[#zparts + 1] = string.format("%s@%s,%s %s refusal=%s",
                    dead and "dead-in-list" or "walker", zx, zy, accessors(zed), tostring(why or "none, usable"))
            end
        end
    end
    return bodies, zombies, deadInList, usable,
        table.concat(parts, " | "), table.concat(zparts, " | ")
end

return CFInst
