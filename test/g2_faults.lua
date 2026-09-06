-- G2 interrupted-placement and identity-reconciliation regression harness.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

local function newFixture()
    ConspiracyFiles=nil
    package.loaded["ConspiracyFiles/GeneratedRuntime"]=nil
    package.preload["ConspiracyFiles/ClueHints"]=function() return {} end
    package.preload["ConspiracyFiles/GeneratedMenu"]=function() return {} end
    local events={}
    Events={OnTick={Add=function(f) events.tick=f end},OnGameStart={Add=function(f) events.start=f end}}
    local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
    local function record(t) local o={} for k,v in pairs(t) do local value=v; o[k]=function() return value end end return o end
    local function container()
        local items={}; local c={items=items,getType=function() return "desk" end,getItems=function() return list(items) end}
        function c:AddItem(item) items[#items+1]=item; item.container=c; return item end
        return c
    end
    local containers,loaded={},{}; for _,x in ipairs({0,20}) do for _,offset in ipairs({0,0.1,1,1.1}) do containers[x+offset]=container() end;loaded[x]=true;loaded[x+1]=true end;local inventory=container()
    local player=record{getX=0,getY=0,getZ=0,getHoursSurvived=0,getInventory=inventory}
    player.getModData=function() return {} end; player.getVehicle=function() return nil end
    getPlayer=function() return player end; getDebug=function() return true end; isClient=function() return false end; isServer=function() return false end
    ZombRand=function() return 1 end
    local clock=0; getTimeInMillis=function() clock=clock+0.01; return clock end
    getCell=function() return {getGridSquare=function(_,x,y,z)
        if (y~=0 and y~=1) or z~=0 or not loaded[x] or not containers[x+y/10] then return nil end
        local c=containers[x+y/10]
        return record{getObjects=list{record{getContainerCount=1,getContainerByIndex=c,getSprite=record{getName="desk_sprite"}}},getWorldObjects=list{},getStaticMovingObjects=list{}}
    end} end
    instanceof=function() return false end
    instanceItem=function()
        local md={}; local item={getModData=function() return md end,setName=function() end,setCustomName=function() end}
        item.getOutermostContainer=function() return item.container end; return item
    end
    local saved={}; ModData={getOrCreate=function() return saved end,get=function(tag) if tag=="ConspiracyFiles.Generated.G2" then return saved end end}
    local result={version="T3-nearby-2",buildings=2,map="mock",gameVersion="42.20",anchor={x=0,y=0},rows={}}
    for _,x in ipairs({0,20}) do
        result.rows[#result.rows+1]={kind="building",id=tostring(x),x=x,y=0,x2=x+2,y2=2,minLevel=0}
        result.rows[#result.rows+1]={kind="rect",building=tostring(x),x=x,y=0,z=0,w=2,h=2}
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
    return f
end

local function oneAssignment(f)
    for id,a in pairs(f.saved.campaign.canonical.assignments) do return id,a end
end
local function restart(f) f.events.start(); f.tick(180) end

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
    assert(not f.R.inspect(f.items(a.physicalToken)[1]), "conflicted evidence must not be inspected")
end

-- Known evidence is saved independently of later placement reconciliation.
do
    local f=newFixture(); f.boot(); local id,a=oneAssignment(f); local item=f.items(a.physicalToken)[1]
    f.remove(item); f.inventory:AddItem(item); assert(f.R.inspect(item)); assert(#f.R.known()==1)
    restart(f)
    assert(#f.R.known()==1, "saved positive discovery must survive restart")
end

print("PASS G2 faults: intent/ack, zero-token unknown, positive-token reconciliation, unloaded deferral, out-of-scan preservation, duplicate conflict, saved known evidence")
