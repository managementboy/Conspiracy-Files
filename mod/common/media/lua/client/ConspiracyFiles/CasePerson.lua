-- Give a case's person a body.
--
-- Owner, 2026-09-10: "please use the name of a nearby zombie or corpse for the
-- evidence... that would make finding that zombie later a part of the mystery."
-- Then: "lets give a nearby zombie an ID or other document with her full name."
--
-- The obvious reading - take a name off a nearby zombie and write it into the
-- case - cannot work. A case is rebuilt from its seed to survive a reload
-- (Generator.validate), so a fact taken from the world is not reproducible and
-- the case would fail to validate the moment the player saved.
--
-- So it runs the other way: the case keeps its own name, and a nearby zombie is
-- given THAT name, plus an ID card carrying it. Marion Ellis stops being a
-- signature on a letter and becomes a specific walking corpse near the address
-- on the paperwork.
--
-- WHAT THIS DOES NOT DO, and must never do: claim the body IS that person. The
-- ID is an ordinary identity document, read by IdentityObserver like any other,
-- and that module already says what a name on a document is worth - a lead,
-- never proof of who a body is. A zombie carrying Marion Ellis's ID is a zombie
-- carrying Marion Ellis's ID.
local CFLog=require("ConspiracyFiles/Log")
ConspiracyFiles=ConspiracyFiles or {}
local P=ConspiracyFiles.CasePerson or {}
ConspiracyFiles.CasePerson=P
P.CARD="Base.IDcard"
-- Stamped on the zombie, so one body is bound once and a reload does not bind
-- a second. Stamped on the card too, so the binding can be recognised later.
P.MARK="cfCasePerson"
-- Far enough to be worth walking to, close enough to be findable at all.
P.RADIUS=40
P.MAX_SCAN=60

local function log(message) CFLog.message("person","person",message) end
local function read(o,k,...)
    if not o or not o[k] then return nil end
    local ok,v=pcall(function(...) return o[k](o,...) end,...)
    if ok then return v end
    return nil
end

-- Split "Marion Ellis" for a descriptor, which stores the halves separately.
local function halves(name)
    local first,last=string.match(name,"^(%S+)%s+(.+)$")
    if first then return first,last end
    return name,""
end

-- A zombie within reach of (x,y,z) that we have not already bound. Bounded: a
-- cell can hold a great many, and this runs on a budgeted step like every other
-- scan in this mod.
function P.candidate(x,y,z)
    local cell=getCell and getCell()
    local list=cell and read(cell,"getZombieList")
    if not list or not list.size then return nil end
    local total=list:size()
    local limit=total<P.MAX_SCAN and total or P.MAX_SCAN
    for i=1,limit do
        local zombie=list:get(i-1)
        local square=zombie and read(zombie,"getSquare")
        if square then
            local zx,zy,zz=read(square,"getX"),read(square,"getY"),read(square,"getZ")
            if zx and zy and zz==z
                and math.abs(zx-x)<=P.RADIUS and math.abs(zy-y)<=P.RADIUS then
                local md=read(zombie,"getModData")
                if type(md)=="table" and not md[P.MARK] then return zombie end
            end
        end
    end
    return nil
end

-- Bind `name` to a zombie near (x,y,z). Returns the zombie, or nil and a
-- reason. Never throws: this runs from a scheduled step where an error would
-- be silent and would stop the case being prepared.
function P.bind(name,caseId,x,y,z)
    if type(name)~="string" or name=="" then return nil,"no name" end
    local zombie=P.candidate(x,y,z)
    if not zombie then return nil,"no unbound zombie within "..P.RADIUS.." tiles" end
    local first,last=halves(name)
    -- The descriptor is what the game shows for a body; the card is what the
    -- player can read. Both, because either alone is a half-measure: a named
    -- corpse with no document is unverifiable, and a document on an unnamed
    -- corpse is just litter.
    pcall(function()
        local descriptor=zombie:getDescriptor()
        if descriptor then
            descriptor:setForename(first)
            if last~="" then descriptor:setSurname(last) end
        end
    end)
    local card
    pcall(function()
        local inventory=zombie:getInventory()
        if inventory then card=inventory:AddItem(P.CARD) end
    end)
    if card then
        pcall(function()
            card:setName("ID Card: "..name)
            card:setCustomName(true)
            local md=card:getModData()
            md[P.MARK]=caseId
        end)
    end
    pcall(function()
        local md=zombie:getModData()
        md[P.MARK]=caseId
    end)
    log("bound "..name.." to a body near "..tostring(x)..","..tostring(y)
        ..(card and " with an ID card" or " but could not give it a card"))
    return zombie
end

-- Where is the case person now? A debug-console answer, logged so it reaches the
-- development machine through the stream. Owner, 2026-09-11, having killed a
-- zombie he took for Ines Kubiak: "ahhh wrong one then". The bound zombie moves,
-- and nothing else says where it went.
--
--     ConspiracyFiles.CasePerson.where()
function P.where()
    local cell=getCell and getCell()
    local list=cell and read(cell,"getZombieList")
    if not list or not list.size then log("where: no zombie list"); return "no zombie list" end
    local lines={}
    for i=0,list:size()-1 do
        local zombie=list:get(i)
        local md=zombie and read(zombie,"getModData")
        if type(md)=="table" and md[P.MARK] then
            local square=read(zombie,"getSquare")
            local descriptor=read(zombie,"getDescriptor")
            local name=descriptor and ((read(descriptor,"getForename") or "").." "..(read(descriptor,"getSurname") or "")) or "?"
            local x,y=square and read(square,"getX"),square and read(square,"getY")
            local place
            local map=ConspiracyFiles.AddressMap
            if map and map.nearest and x and y then
                local ok,label=pcall(map.nearest,x,y)
                if ok and label then place="near "..label end
            end
            lines[#lines+1]=name.."  "..(place or "no address nearby").."  ("..tostring(x)..","..tostring(y)..")"
        end
    end
    if #lines==0 then
        log("where: no bound case person in the loaded area - dead, or too far away to be loaded")
        return "none loaded"
    end
    for _,line in ipairs(lines) do log("where: "..line) end
    return table.concat(lines,"\n")
end

-- When a named zombie dies, record exactly what the game left in its pockets.
--
-- Not yet known, and it decides the design: does Project Zomboid generate a
-- corpse's loot at death? If it does, a zombie given Ines Kubiak's name and ID
-- will die carrying its ORIGINAL identity as well - one body, two names, and
-- the game's own documents contradicting the case. Rather than build a fix for
-- a guess, this logs the answer the first time it happens.
function P.onZombieDead(zombie)
    local md=zombie and read(zombie,"getModData")
    if type(md)~="table" or not md[P.MARK] then return end
    local names={}
    local inventory=read(zombie,"getInventory")
    local items=inventory and read(inventory,"getItems")
    if items and items.size then
        for i=0,items:size()-1 do
            local item=items:get(i)
            local label=item and read(item,"getDisplayName")
            if label then names[#names+1]=tostring(label) end
        end
    end
    log("bound case person died ("..tostring(md[P.MARK]).."); carrying: "
        ..(#names>0 and table.concat(names,"; ") or "nothing"))
end

if Events and Events.OnZombieDead and not P.deathHandler then
    P.deathHandler=function(zombie) pcall(P.onZombieDead,zombie) end
    Events.OnZombieDead.Add(P.deathHandler)
end

return P
