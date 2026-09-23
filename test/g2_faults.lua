-- G2 interrupted-placement and identity-reconciliation regression harness.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

local function newFixture(profession,indexedOpening)
    ConspiracyFiles=nil
    package.loaded["ConspiracyFiles/GeneratedRuntime"]=nil
    package.preload["ConspiracyFiles/ClueCue"]=function() return {} end
    package.preload["ConspiracyFiles/GeneratedMenu"]=function() return {} end
    local events={}
    Events={OnTick={Add=function(f) events.tick=f end},OnGameStart={Add=function(f) events.start=f end}}
    local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
    local function record(t) local o={} for k,v in pairs(t) do local value=v; o[k]=function() return value end end return o end
    local function container()
        local items={}; local c={items=items,getType=function() return "desk" end,getItems=function() return list(items) end,
            isExplored=function() return false end}
        function c:AddItem(item) if self.reject then return nil end; items[#items+1]=item; item.container=c; return item end
        -- Match the native B42 ItemContainer API exactly.  Do not add a
        -- RemoveItem alias: that typo caused DEV-0.47.3 to pass this harness
        -- and then fail in the live game.
        function c:Remove(item)
            for i,value in ipairs(items) do
                if value==item then table.remove(items,i); item.container=nil; return end
            end
        end
        return c
    end
    local containers,loaded={},{}; for _,x in ipairs({0,20}) do for _,offset in ipairs({0,0.1,1,1.1}) do containers[x+offset]=container() end;loaded[x]=true;loaded[x+1]=true end;local inventory=container()
    if indexedOpening then loaded[20]=false;loaded[21]=false end
    local buildingDef={getIDString=function() return "0" end,getKeyId=function() return 7 end}
    local building={getDef=function() return buildingDef end}
    local player=record{getX=0,getY=0,getZ=0,getHoursSurvived=0,getInventory=inventory}
    if profession then
        player.getDescriptor=function()
            return {getForename=function() return "Ada" end,getSurname=function() return "Whitlock" end,
                getCharacterProfession=function()
                    return {getName=function() return profession end}
                end}
        end
    end
    player.getModData=function() return {} end; player.getVehicle=function() return nil end
    player.getSquare=function()
        return {getBuilding=function()
            return building
        end}
    end
    getPlayer=function() return player end; getDebug=function() return true end; isClient=function() return false end; isServer=function() return false end
    ZombRand=function() return 1 end
    local clock=0; getTimeInMillis=function() clock=clock+0.01; return clock end
    local worldAgeHours=0; getGameTime=function() return {getWorldAgeHours=function() return worldAgeHours end} end
    getCell=function() return {getGridSquare=function(_,x,y,z)
        if (y~=0 and y~=1) or z~=0 or not loaded[x] or not containers[x+y/10] then return nil end
        local c=containers[x+y/10]
        return record{getBuilding=building,getObjects=list{record{getContainerCount=1,getContainerByIndex=c,getSprite=record{getName="desk_sprite"}}},getWorldObjects=list{},getStaticMovingObjects=list{}}
    end} end
    instanceof=function() return false end
    instanceItem=function(fullType)
        local md,keyId={}; local item={getModData=function() return md end,setName=function() end,setCustomName=function() end,
            getFullType=function() return fullType or "Base.Note" end,getContainer=function(self) return self.container end,
            getWorldItem=function() return nil end,setKeyId=function(_,v) keyId=v end,getKeyId=function() return keyId end}
        item.getOutermostContainer=function() return item.container end; return item
    end
    local saved={}
    local otherStores={}
    ModData={
        getOrCreate=function(tag)
            if tag=="ConspiracyFiles.Generated.G2" then return saved end
            otherStores[tag]=otherStores[tag] or {}; return otherStores[tag]
        end,
        get=function(tag)
            if tag=="ConspiracyFiles.Generated.G2" then return saved end
            return otherStores[tag]
        end
    }
    local result={version="T3-nearby-2",buildings=2,map="mock",gameVersion="42.20",anchor={x=0,y=0},rows={}}
    for _,x in ipairs({0,20}) do
        result.rows[#result.rows+1]={kind="building",id=tostring(x),x=x,y=0,x2=x+2,y2=2,minLevel=0}
        result.rows[#result.rows+1]={kind="rect",building=tostring(x),x=x,y=0,z=0,w=2,h=2}
    end
    if indexedOpening then
        package.loaded["ConspiracyFiles/Generated/Storage"]=nil
        package.loaded["ConspiracyFiles/Generated/FixedContainerIndexData"]=nil
        package.preload["ConspiracyFiles/Generated/FixedContainerIndexData"]=function()
            return {{schema=1,map="mock",build="42.20",source="runtime regression",rows={
                {"0",0,0,0,"desk_sprite","desk","livingroom"},
                {"20",20,0,0,"desk_sprite","desk","livingroom"},
            }}}
        end
    end
    package.preload["ConspiracyFiles/T3Nearby"]=function() return {start=function() return true end,result=result} end
    local R=require("ConspiracyFiles/GeneratedRuntime")
    local f={R=R,saved=saved,containers=containers,inventory=inventory,loaded=loaded,events=events}
    function f.tick(n) for _=1,n do events.tick() end end
    function f.items(token)
        local found={}
        local function add(c) for _,item in ipairs(c.items) do if not token or item:getModData().cfPhysicalToken==token then found[#found+1]=item end end end
        add(inventory); for _,c in pairs(containers) do add(c) end; return found
    end
    function f.remove(item)
        local c=item.container; for i,v in ipairs(c.items) do if v==item then table.remove(c.items,i); item.container=nil; return end end
        error("item missing from its container")
    end
    function f.boot()
        assert(R.start(1)); f.tick(200); assert(saved.campaign.canonical)
    end
    function f.bootOpening()
        assert(R.start(1,{firstHouse=true})); f.tick(200); assert(saved.campaign.canonical)
    end
    return f
end

local function oneAssignment(f)
    for id,a in pairs(f.saved.campaign.canonical.assignments) do return id,a end
end
local function restart(f) f.events.start(); f.tick(180) end

-- The Fitness Instructor's inciting key exists before the neighbourhood scan
-- has produced any case.  When that case arrives it adopts the same item,
-- records it, and never creates the former container copy.
do
    local f=newFixture("fitnessinstructor")
    assert(f.R.primeOpening())
    assert(not f.saved.campaign,"priming the opening must not invent a partial saved case")
    assert(#f.inventory.items==1,"the real opening key must appear immediately")
    local item=f.inventory.items[1]
    assert(item:getFullType()=="Base.Key1" and item:getKeyId()==7,
        "the immediate object must unlock the spawning building")
    assert(item:getModData().cfOpeningAnnounced and item:getModData().cfVoiceHinted,
        "the immediate key must deliver the opening thought exactly once")
    f.bootOpening()
    local root=f.saved.campaign.canonical
    local first=root.case.documents[1]
    assert(#f.inventory.items==1 and item:getModData().cfGeneratedId==first.id,
        "case creation must adopt the primed key rather than create a second key")
    assert(root.assignments[first.id].status=="placed" and #f.R.known()==1,
        "the adopted key must become the recorded opening evidence")
end

-- The first personal clue keeps a real origin in the starting house, but is
-- handed to the survivor and noted immediately. The durable item flags make
-- the special line exactly once; later clues remain ordinary placements.
do
    local f=newFixture("fitnessinstructor"); f.bootOpening()
    local root=f.saved.campaign.canonical
    assert(root.case.opening.profession=="fitnessinstructor"
        and root.case.opening.premise=="fitness-instructor-start"
        and root.case.opening.variant>=1 and root.case.opening.variant<=10,
        "runtime must route the Fitness Instructor into one of ten saved starts")
    local first=root.case.documents[1]
    local a=root.assignments[first.id]
    assert(first.locationId=="t3:0" and a.target,"the opening origin must be the starting house")
    local item
    for _,candidate in ipairs(f.inventory.items) do
        if candidate:getModData().cfGeneratedId==first.id then item=candidate end
    end
    assert(item,"the opening clue must be on the spawning survivor")
    assert(item:getFullType()=="Base.Key1" and item:getKeyId()==7,
        "the carried opening clue must be the real starting building key")
    assert(#f.inventory.items==1,"only the opening clue is delivered; later evidence stays distributed")
    assert(item:getModData().cfOpeningAnnounced and item:getModData().cfVoiceHinted,
        "the opening announcement and ordinary-hint suppression persist on the item")
    assert(#f.R.known()==1 and f.R.known()[1].id==first.id,
        "personal delivery must automatically recognise and record the opening clue")
    local ppe=root.case.documents[4]
    local counts={}
    for _,part in ipairs(f.items(root.assignments[ppe.id].physicalToken)) do
        counts[part:getFullType()]=(counts[part:getFullType()] or 0)+1
    end
    assert(counts["Base.Hat_SurgicalMask"]==3 and counts["Base.Gloves_Surgical"]==4
        and counts["Base.Disinfectant"]==2,
        "one PPE finding must materialise as its nine real heterogeneous objects")
end

-- A refused inventory handoff is not a lost or half-discovered clue. The same
-- physical item stays in its starting-house fallback container, with no flags
-- that would suppress ordinary proximity/discovery behavior.
do
    local f=newFixture("fitnessinstructor"); f.inventory.reject=true; f.bootOpening()
    local root=f.saved.campaign.canonical
    local first=root.case.documents[1]
    local found
    for _,candidate in ipairs(f.items()) do
        if candidate:getModData().cfGeneratedId==first.id then found=candidate end
    end
    assert(found and found.container~=f.inventory,"a refused handoff keeps the opening clue in furniture")
    assert(not found:getModData().cfOpeningAnnounced and not found:getModData().cfVoiceHinted,
        "fallback keeps the normal proximity and pickup cues available")
    assert(#f.R.known()==0,"fallback does not reveal a clue the player has not found")
end

-- Before intent: a fresh canonical plan contains pending assignments and one
-- observed item is ultimately committed as placed.
do
    local f=newFixture(); f.boot()
    local id,a=oneAssignment(f)
    local Session=require("ConspiracyFiles/Generated/Session"); local targets={}
    for docId,assignment in pairs(f.saved.campaign.canonical.assignments) do
        local doc; for _,candidate in ipairs(f.saved.campaign.canonical.case.documents) do if candidate.id==docId then doc=candidate end end
        targets[doc.locationId]=assignment.target
    end
    local fresh=assert(Session.create(f.saved.campaign.canonical.case,targets))
    for _,assignment in pairs(fresh.assignments) do assert(assignment.status=="pending", "new plan must persist pending before intent") end
    for _,item in ipairs(f.items()) do f.remove(item) end
    f.saved.campaign.canonical=fresh;restart(f)
    assert(f.saved.campaign.canonical.assignments[id].status=="placed", "restart before intent must perform initial placement")
    assert(#f.items(a.physicalToken)==1, "fresh placement must create one physical item")
end

-- Persisted intent with no positive observation is uncertain. It never creates
-- a replacement, even though the target is loaded and readable.
do
    local f=newFixture(); f.boot(); local id,a=oneAssignment(f); local token=a.physicalToken
    f.remove(f.items(token)[1]); f.saved.campaign.canonical.assignments[id].status="placing"
    restart(f)
    assert(f.saved.campaign.canonical.assignments[id].status=="unknown", "zero-token interrupted intent must remain unknown")
    assert(#f.items(token)==0, "unknown intent must not mint a replacement")
end

-- A token that exists before the persisted intent is acknowledged is positive
-- surviving-item evidence, so it reconciles to placed without duplication.
do
    local f=newFixture(); f.boot(); local id,a=oneAssignment(f); local token=a.physicalToken
    f.saved.campaign.canonical.assignments[id].status="placing"
    restart(f)
    assert(f.saved.campaign.canonical.assignments[id].status=="placed", "observed token must acknowledge placement")
    assert(#f.items(token)==1, "acknowledgement must not add a second token")
end

-- A target that is presently unloaded is left pending. Once loaded, normal
-- placement may proceed; the unloaded read itself cannot cause a replacement.
do
    local f=newFixture(); f.boot(); local id,a=oneAssignment(f); local token=a.physicalToken
    f.remove(f.items(token)[1]); f.saved.campaign.canonical.assignments[id].status="pending"; f.loaded[a.target.x]=false
    restart(f)
    assert(f.saved.campaign.canonical.assignments[id].status=="pending" and #f.items(token)==0, "unloaded target must defer placement")
    f.loaded[a.target.x]=true; f.tick(180)
    assert(f.saved.campaign.canonical.assignments[id].status=="placed" and #f.items(token)==1, "loaded retry must place exactly one item")
end

-- A moved token outside the periodic scan coverage yields zero observations;
-- the existing placed state is retained and no replacement is generated.
do
    local f=newFixture(); f.boot(); local id,a=oneAssignment(f); local token=a.physicalToken
    local outside=f.items(token)[1];f.remove(outside); f.tick(240)
    assert(outside:getModData().cfPhysicalToken==token,"out-of-scan item still exists")
    assert(f.saved.campaign.canonical.assignments[id].status=="placed", "zero identity observations must not revise placed to replacement work")
    assert(#f.items(token)==0, "identity scan must not replace an unobserved moved token")
end

-- Two positive observations are an explicit, sticky conflict, never a guess.
do
    local f=newFixture(); f.boot(); local id,a=oneAssignment(f); local duplicate=instanceItem()
    duplicate:getModData().cfGeneratedId=id; duplicate:getModData().cfPhysicalToken=a.physicalToken; f.inventory:AddItem(duplicate)
    f.tick(240)
    assert(f.saved.campaign.canonical.assignments[id].status=="conflict", "duplicate tokens must become conflict")
    -- Recognised first (P4-R132), so the refusal is the conflict's.
    assert(f.R.recognise(id,"search"))
    assert(not f.R.inspect(f.items(a.physicalToken)[1]), "conflicted evidence must not be inspected")
end

-- Known evidence is saved independently of later placement reconciliation.
do
    local f=newFixture(); f.boot(); local id,a=oneAssignment(f); local item=f.items(a.physicalToken)[1]
    f.remove(item); f.inventory:AddItem(item); assert(f.R.recognise(item,"search")); assert(f.R.inspect(item)); assert(#f.R.known()==1)
    restart(f)
    assert(#f.R.known()==1, "saved positive discovery must survive restart")
end

-- The current house is live but the indexed partner's chunk is not. This is
-- the real new-game shape: only the distant clue may wait; the opening key
-- must have a concrete target and reach the survivor immediately.
do
    local f=newFixture("fitnessinstructor",true); f.bootOpening()
    local root=f.saved.campaign.canonical
    local first=root.case.documents[1]
    assert(root.assignments[first.id].target and root.assignments[first.id].planned==nil,
        "an indexed opening must resolve a real starting-house target before commit")
    local delivered
    for _,item in ipairs(f.inventory.items) do
        if item:getModData().cfGeneratedId==first.id then delivered=item end
    end
    assert(delivered and delivered:getFullType()=="Base.Key1",
        "an unloaded indexed partner must not delay the opening house key")
end

print("PASS G2 faults: intent/ack, zero-token unknown, positive-token reconciliation, unloaded deferral, out-of-scan preservation, duplicate conflict, saved known evidence")
