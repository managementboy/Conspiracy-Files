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
--
-- SURVIVING A RELOAD (P4-R103). The game never saves an ordinary zombie as an
-- object: it writes a position, a facing and an outfit id, and on load builds a
-- brand-new zombie with an empty ModData, a fresh descriptor and fresh pockets.
-- The mark, the name and the card on the zombie are all gone after every load,
-- which is exactly where the in-game check case_person.sh failed. A dead body,
-- by contrast, IS saved whole. So the one thing that survives is a small record
-- per case in the mod's own world ModData - who, where last seen, what she wore,
-- dead or not - and while she is alive a zombie near that spot is dressed as her
-- again after every load. After death the body carries itself.
local CFLog=require("ConspiracyFiles/Log")
local Budget=require("ConspiracyFiles/SaveBudget")
ConspiracyFiles=ConspiracyFiles or {}
local P=ConspiracyFiles.CasePerson or {}
ConspiracyFiles.CasePerson=P
P.CARD="Base.IDcard"
-- Stamped on the zombie, so one body is bound once. Stamped on the card too, so
-- the binding can be recognised later. A reload wipes the zombie's copy; the
-- record below is what remembers it.
P.MARK="cfCasePerson"
-- Her name, on the zombie beside the mark. The card cannot carry it through
-- death - the game empties a zombie's pockets as it dies - but the body copies
-- the zombie's ModData, so the name arrives with the body (P4-R101).
P.NAME="cfCasePersonName"
-- Far enough to be worth walking to, close enough to be findable at all.
P.RADIUS=40
P.MAX_SCAN=60
-- The world record of every case person (P4-R103).
P.TAG="ConspiracyFiles.CasePeople"
P.MAX_RECORDS=24
-- A reloaded zombie stands where the save last saw it, so the search after a
-- load is tight: a wide one would hand her name to a stranger passing by.
P.REBIND_RADIUS=12
-- Her last-seen position is rewritten at most this often, and only once she
-- has moved this far: the record is a save write, not a tracker.
P.REFRESH_MS=5000
P.MOVED=2
-- One window of P.MAX_SCAN zombies per in-game minute; a few windows while
-- zombies are being created, which is what a load looks like.
P.HURRY_WINDOWS=4

-- The sex of every invented name in Generator.lua's `invented` list. Owner saw
-- a man's name on a zombie in women's clothes. The list itself cannot change:
-- a case is rebuilt byte-for-byte from its seed. A name met on a corpse is not
-- here, and then any body will do.
P.SEX={["Marion Ellis"]="f",["Delia Mercer"]="f",["Roy Hale"]="m",["Joanne Voss"]="f",
    ["Curtis Vance"]="m",["Adele Prosser"]="f",["Warren Nagy"]="m",["Ines Kubiak"]="f"}

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

-- The case's card: her name, and the mark that says whose it is.
local function stamp(card,name,caseId)
    pcall(function()
        card:setName("ID Card: "..name)
        card:setCustomName(true)
        card:getModData()[P.MARK]=caseId
    end)
end

local function position(zombie)
    local square=read(zombie,"getSquare")
    if not square then return nil end
    local x,y,z=read(square,"getX"),read(square,"getY"),read(square,"getZ")
    if type(x)~="number" or type(y)~="number" or type(z)~="number" then return nil end
    return math.floor(x),math.floor(y),math.floor(z)
end

-- 2 = the outfit she wore when saved (the outfit id encodes the sex too),
-- 1 = the right sex, 0 = anyone. `female` nil means any sex fits.
local function rank(zombie,female,outfit)
    if outfit~=nil and read(zombie,"getPersistentOutfitID")==outfit then return 2 end
    if female==nil or read(zombie,"isFemale")==female then return 1 end
    return 0
end
local function femaleOf(sex)
    if sex=="f" then return true elseif sex=="m" then return false end
    return nil
end

-- The store. Every table read back is checked field by field, as every other
-- store in this mod is: ModData is a file the player can edit and an old build
-- can have written.
local FIELDS={name=true,caseId=true,x=true,y=true,z=true,outfit=true,female=true,dead=true}
local function whole(v) return type(v)=="number" and v==v and v%1==0 and v>-4294967296 and v<4294967296 end
local function validRecord(key,r)
    if type(key)~="string" or #key==0 or #key>160 then return false end
    if type(r)~="table" or getmetatable(r) then return false end
    for k in pairs(r) do if not FIELDS[k] then return false end end
    if type(r.name)~="string" or r.name=="" or #r.name>80 or r.caseId~=key then return false end
    if not (whole(r.x) and whole(r.y) and whole(r.z)) then return false end
    if r.outfit~=nil and not whole(r.outfit) then return false end
    if r.female~=nil and type(r.female)~="boolean" then return false end
    return type(r.dead)=="boolean"
end
function P.store()
    local wrapper=ModData and ModData.get and ModData.get(P.TAG)
    if wrapper==nil then return {schema=1,records={}} end
    if type(wrapper)~="table" then return nil,"case-people store is not a table" end
    for key in pairs(wrapper) do if key~="canonical" then return nil,"unknown case-people field" end end
    local c=wrapper.canonical
    if c==nil then return {schema=1,records={}} end
    if type(c)~="table" or c.schema~=1 or type(c.records)~="table" then return nil,"invalid case-people store" end
    for key in pairs(c) do if key~="schema" and key~="records" then return nil,"unknown case-people field" end end
    local n=0
    for key,r in pairs(c.records) do
        if not validRecord(key,r) then return nil,"invalid case-person record "..tostring(key) end
        n=n+1
    end
    if n>P.MAX_RECORDS then return nil,"too many case-person records" end
    return c
end
-- Copy-on-write, one save for any number of changes: SaveBudget recognises an
-- unchanged store by identity, and a half-applied write is never stored.
local function save(store,changes)
    local records={}
    for k,r in pairs(store.records) do records[k]=r end
    for k,r in pairs(changes) do if r==false then records[k]=nil else records[k]=r end end
    local staged={schema=1,records=records}
    for k,r in pairs(records) do if not validRecord(k,r) then return false,"invalid record "..tostring(k) end end
    local ok,why=Budget.check("casePeople",{canonical=staged})
    if not ok then return false,why end
    ModData.getOrCreate(P.TAG).canonical=staged
    return true
end
local function copy(r,over)
    local out={}
    for k,v in pairs(r) do out[k]=v end
    for k,v in pairs(over) do out[k]=v end
    return out
end

-- A zombie within reach of (x,y,z) that we have not already bound: the nearest
-- of the right sex, else the nearest of any (returned with matched=false).
-- Bounded: a cell can hold a great many, and this runs on a budgeted step like
-- every other scan in this mod.
function P.candidate(x,y,z,sex)
    local cell=getCell and getCell()
    local list=cell and read(cell,"getZombieList")
    if not list or not list.size then return nil end
    local total=list:size()
    local limit=total<P.MAX_SCAN and total or P.MAX_SCAN
    local female=femaleOf(sex)
    local best,bestRank,bestDist
    for i=1,limit do
        local zombie=list:get(i-1)
        local zx,zy,zz=position(zombie)
        if zx and zz==z and not read(zombie,"isDead")
            and math.abs(zx-x)<=P.RADIUS and math.abs(zy-y)<=P.RADIUS then
            local md=read(zombie,"getModData")
            if type(md)=="table" and not md[P.MARK] then
                local r=rank(zombie,female,nil)
                local d=math.max(math.abs(zx-x),math.abs(zy-y))
                if not best or r>bestRank or (r==bestRank and d<bestDist) then
                    best,bestRank,bestDist=zombie,r,d
                end
            end
        end
    end
    if not best then return nil end
    return best,bestRank>0
end

-- Name, card and marks, without ever a second card: a zombie dressed twice
-- (a reload, a repeated step) must still carry one.
local function dress(zombie,name,caseId)
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
    local inventory=read(zombie,"getInventory")
    local items=inventory and read(inventory,"getItems")
    local card
    if items and items.size then
        for i=0,items:size()-1 do
            local item=items:get(i)
            local imd=item and read(item,"getModData")
            if type(imd)=="table" and imd[P.MARK]==caseId then card=item end
        end
    end
    if not card then
        card=inventory and read(inventory,"AddItem",P.CARD)
        if card then stamp(card,name,caseId) end
    end
    pcall(function()
        local md=zombie:getModData()
        md[P.MARK]=caseId
        md[P.NAME]=name
    end)
    return card
end
local function describe(zombie)
    local outfit=read(zombie,"getPersistentOutfitID")
    local female=read(zombie,"isFemale")
    return whole(outfit) and outfit or nil,type(female)=="boolean" and female or nil
end

-- Which zombies carry which case this session. A sweep walks the whole list
-- one window at a time; a live record whose carrier was not seen during a
-- complete sweep has lost its body, and only then is another zombie dressed.
-- Waiting for the full sweep is what stops a second person appearing when the
-- carrier merely sits further down the list than one window reaches.
local sweep={id=1,cursor=0,seen={},best={},wrote={}}

-- Bind `name` to a zombie near (x,y,z). Returns the zombie, or nil and a
-- reason. Never throws: this runs from a scheduled step where an error would
-- be silent and would stop the case being prepared.
function P.bind(name,caseId,x,y,z)
    if type(name)~="string" or name=="" then return nil,"no name" end
    if type(caseId)~="string" or caseId=="" then return nil,"no case" end
    local store,bad=P.store()
    if not store then return nil,bad end
    -- One person per case, ever. A reload re-dresses her; it never binds anew.
    if store.records[caseId] then return nil,"case already has a person" end
    local changes={}
    local n,evict=0,nil
    for k,r in pairs(store.records) do
        n=n+1
        if r.dead and (not evict or k<evict) then evict=k end
    end
    if n>=P.MAX_RECORDS then
        if not evict then return nil,"too many living case people" end
        changes[evict]=false
    end
    local sex=P.SEX[name]
    local zombie,matched=P.candidate(x,y,z,sex)
    if not zombie then return nil,"no unbound zombie within "..P.RADIUS.." tiles" end
    local card=dress(zombie,name,caseId)
    local zx,zy,zz=position(zombie)
    local outfit,female=describe(zombie)
    changes[caseId]={name=name,caseId=caseId,x=zx or math.floor(x),y=zy or math.floor(y),
        z=zz or math.floor(z),outfit=outfit,female=female,dead=false}
    sweep.seen[caseId]=sweep.id
    local ok,why=save(store,changes)
    log("bound "..name.." to a body near "..tostring(x)..","..tostring(y)
        ..(card and " with an ID card" or " but could not give it a card")
        ..(matched and "" or "; no zombie of her sex within reach, so the nearest")
        ..(ok and "" or "; NOT recorded, she will not survive a reload: "..tostring(why)))
    return zombie
end

-- After a load she is a new zombie with no mark. The best-ranked unmarked
-- zombie seen near her last position during the sweep is dressed as her.
local function finish(store,live,changes)
    local changed=false
    for caseId,r in pairs(live) do
        local best=sweep.best[caseId]
        if (sweep.seen[caseId] or 0)<sweep.id and best then
            local zombie=best.zombie
            local md=read(zombie,"getModData")
            local zx,zy,zz=position(zombie)
            if type(md)=="table" and not md[P.MARK] and not read(zombie,"isDead") and zx and zz==r.z
                and math.abs(zx-r.x)<=P.REBIND_RADIUS and math.abs(zy-r.y)<=P.REBIND_RADIUS then
                dress(zombie,r.name,caseId)
                local outfit,female=describe(zombie)
                -- What the save will write for THIS zombie is what the next
                -- load must look for.
                changes[caseId]=copy(changes[caseId] or r,{x=zx,y=zy,outfit=outfit,female=female})
                sweep.seen[caseId]=sweep.id+1
                sweep.wrote[caseId]=nil
                changed=true
                log("re-bound "..r.name.." ("..caseId..") after a load near "..zx..","..zy
                    ..(best.rank==2 and "; same outfit" or (best.rank==1 and "; outfit differs" or "; no zombie of her sex nearby, so the nearest")))
            end
        end
    end
    sweep.id=sweep.id+1
    sweep.cursor=0
    sweep.best={}
    sweep.hurry=false
    return changed
end

-- One window of the zombie list. Returns "idle", "partial" or "swept".
function P.step(now)
    now=now or (getTimeInMillis and getTimeInMillis()) or 0
    local store,bad=P.store()
    if not store then
        if not P.badLogged then P.badLogged=true; log("case people not tracked: "..tostring(bad)) end
        return "idle"
    end
    local live,any={},false
    for k,r in pairs(store.records) do if not r.dead then live[k]=r; any=true end end
    if not any then return "idle" end
    local cell=getCell and getCell()
    local list=cell and read(cell,"getZombieList")
    if not list or not list.size then return "idle" end
    local size=list:size()
    if sweep.cursor>size then sweep.cursor=0 end
    local from=sweep.cursor
    local to=math.min(size,from+P.MAX_SCAN)
    local changes,changed={},false
    for i=from,to-1 do
        local zombie=list:get(i)
        local md=zombie and read(zombie,"getModData")
        if type(md)=="table" and not read(zombie,"isDead") then
            local mark=md[P.MARK]
            local zx,zy,zz=position(zombie)
            if mark~=nil then
                local r=live[mark]
                if r then
                    sweep.seen[mark]=sweep.id
                    local last=sweep.wrote[mark]
                    if zx and (last==nil or now-last>=P.REFRESH_MS)
                        and (zz~=r.z or math.abs(zx-r.x)>=P.MOVED or math.abs(zy-r.y)>=P.MOVED) then
                        changes[mark]=copy(r,{x=zx,y=zy,z=zz}); changed=true
                        sweep.wrote[mark]=now
                    end
                end
            elseif zx then
                for caseId,r in pairs(live) do
                    local dx,dy=math.abs(zx-r.x),math.abs(zy-r.y)
                    if zz==r.z and dx<=P.REBIND_RADIUS and dy<=P.REBIND_RADIUS then
                        local k=rank(zombie,r.female,r.outfit)
                        local d=math.max(dx,dy)
                        local b=sweep.best[caseId]
                        if not b or k>b.rank or (k==b.rank and d<b.dist) then
                            sweep.best[caseId]={zombie=zombie,rank=k,dist=d}
                        end
                    end
                end
            end
        end
    end
    sweep.cursor=to
    local state="partial"
    if to>=size then
        -- No `next` here: PZ's Kahlua cannot be relied on to have it (see
        -- test/g2_smoke.lua), so finish says itself whether it changed anything.
        if finish(store,live,changes) then changed=true end
        state="swept"
    end
    if changed then
        local ok,why=save(store,changes)
        if not ok then log("case person position not recorded: "..tostring(why)) end
    end
    return state
end

-- A full sweep now, bounded by the list's length. The re-bind entry point for
-- a console or a test; play uses the throttled step.
--
--     ConspiracyFiles.CasePerson.rebind()
function P.rebind(now)
    sweep.cursor=0
    local cell=getCell and getCell()
    local list=cell and read(cell,"getZombieList")
    local size=list and list.size and list:size() or 0
    for _=0,math.floor(size/P.MAX_SCAN)+1 do
        if P.step(now)~="partial" then return end
    end
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
        -- The record still knows where she was last seen, and whether she died.
        local store=P.store()
        for _,r in pairs(store and store.records or {}) do
            log("where: record "..r.name.." last at "..r.x..","..r.y..(r.dead and " (dead)" or ""))
        end
        log("where: no bound case person in the loaded area - dead, or too far away to be loaded")
        return "none loaded"
    end
    for _,line in ipairs(lines) do log("where: "..line) end
    return table.concat(lines,"\n")
end

-- Dead is final: no zombie is ever dressed as her again, and her body, which
-- the game saves whole, carries her from here on.
function P.markDead(caseId,x,y,z)
    local store=P.store()
    local r=store and store.records[caseId]
    if not r or r.dead then return false end
    local over={dead=true}
    if whole(x) and whole(y) and whole(z) then over.x,over.y,over.z=x,y,z end
    local ok,why=save(store,{[caseId]=copy(r,over)})
    log("case person "..r.name.." ("..caseId..") recorded dead"..(ok and "" or "; NOT recorded: "..tostring(why)))
    return ok
end

-- When a named zombie dies, record exactly what the game left in its pockets.
--
-- The answer came in play (Windows, 2026-09-14): the game empties a zombie's
-- pockets as it dies, before this event fires, and rolls the body's loot from
-- its name the first time the body is opened - so "Roy Hale" landed on two of
-- the game's own ID cards. P.onDeadBodySpawn below is the fix. This log stays:
-- it is how the next surprise will be seen.
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
    P.markDead(md[P.MARK],position(zombie))
end

if Events and Events.OnZombieDead and not P.deathHandler then
    P.deathHandler=function(zombie) pcall(P.onZombieDead,zombie) end
    Events.OnZombieDead.Add(P.deathHandler)
end

-- When her body appears, it carries exactly one card: hers (P4-R101).
--
-- The body is built from the zombie AFTER its pockets were emptied, copies the
-- zombie's ModData (so the mark and the name arrive), and only then fires
-- OnDeadBodySpawn, with its searched flag already set - all read from the
-- game's IsoDeadBody constructor. Loot is rolled the first time an unsearched
-- body is opened, so marking it searched here stops the game putting her name
-- on its own cards. She keeps what she wore; she gains nothing the game rolls.
function P.onDeadBodySpawn(body)
    local md=body and read(body,"getModData")
    local caseId=type(md)=="table" and md[P.MARK]
    if not caseId then return end
    -- Also here, not only on OnZombieDead: whichever the game fires, the record
    -- must stop a new zombie being dressed as someone who has a body.
    pcall(P.markDead,caseId)
    local container=read(body,"getContainer")
    if not container then log("case person's body has no container; left as the game made it"); return end
    pcall(function() container:setExplored(true) end)
    local has=false
    local items=read(container,"getItems")
    if items and items.size then
        for i=0,items:size()-1 do
            local item=items:get(i)
            local imd=item and read(item,"getModData")
            if type(imd)=="table" and imd[P.MARK]==caseId then has=true end
        end
    end
    local name=md[P.NAME]
    local card
    if not has and type(name)=="string" and name~="" then
        card=read(container,"AddItem",P.CARD)
        if card then stamp(card,name,caseId) end
    end
    log("case person's body ("..tostring(caseId).."): marked searched; card "
        ..(has and "already there" or (card and "added" or "could not be added")))
end

if Events and Events.OnDeadBodySpawn and not P.bodyHandler then
    P.bodyHandler=function(body) pcall(P.onDeadBodySpawn,body) end
    Events.OnDeadBodySpawn.Add(P.bodyHandler)
end

-- The sweep, once an in-game minute rather than on a tick: this mod stripped
-- its per-tick work on 2026-09-12 and must not grow it back. It costs nothing
-- while no living case person is recorded, and one window of P.MAX_SCAN
-- zombies otherwise; the position write is further throttled by P.REFRESH_MS.
if Events and Events.EveryOneMinute and not P.minuteHandler then
    P.minuteHandler=function()
        local now=getTimeInMillis and getTimeInMillis() or 0
        local windows=sweep.hurry and P.HURRY_WINDOWS or 1
        for _=1,windows do
            local ok,state=pcall(P.step,now)
            if not ok then
                if not P.stepLogged then P.stepLogged=true; log("case person step failed: "..tostring(state)) end
                return
            end
            if state~="partial" then return end
        end
    end
    Events.EveryOneMinute.Add(P.minuteHandler)
end
-- Zombies being created is what a load, or walking back into her street, looks
-- like: sweep quicker until the list has been walked once.
if Events and Events.OnZombieCreate and not P.createHandler then
    P.createHandler=function() sweep.hurry=true end
    Events.OnZombieCreate.Add(P.createHandler)
end

return P
