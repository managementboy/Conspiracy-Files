-- NH-D3 B7: Kill at every save across multi-area route with ground targets.
-- Record store and squares after every save (via metatable on G2 entry).
-- Assign ground targets after areas decided; replay each snapshot and verify state.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path

local function deepCopy(t)
    if type(t)~="table" then return t end
    local copy={}
    for k,v in pairs(t) do copy[k]=deepCopy(v) end
    return copy
end

local boot=dofile("test/fixtures/oi_runtime_stub.lua")

-- Fake map setup
local function javaList(t)
    return {size=function() return #t end,get=function(_,i) return t[i+1] end,
            remove=function(_,o) for i,v in ipairs(t) do if v==o then table.remove(t,i); return end end end}
end
local squares={}
local function square(x,y,z)
    local k=x..","..y..","..z
    if squares[k] then return squares[k] end
    local objects={}
    local sq={objects=objects,x=x,y=y,z=z}
    function sq:getWorldObjects() return javaList(objects) end
    function sq:AddWorldInventoryItem(item)
        local o={item=item}
        function o:getItem() return self.item end
        function o:removeFromWorld() self.gone=true end
        function o:removeFromSquare() for i,v in ipairs(objects) do if v==self then table.remove(objects,i) end end end
        function o:setSquare() end
        objects[#objects+1]=o; return o
    end
    function sq:transmitRemoveItemFromSquare() end
    setmetatable(sq,{__index=function() return function() end end})
    squares[k]=sq; return sq
end
local unloaded={}
local function installWorld()
    local p=getPlayer(); if p and not p.getVehicle then local mt=getmetatable(p); p.getVehicle=function() return nil end end
    getCell=function() return {getGridSquare=function(_,x,y,z)
        if unloaded[x..","..y..","..z] then return nil end
        return square(x,y,z) end} end
    instanceItem=function(t) local md={}; local it={fullType=t}
        function it:getModData() return md end
        function it:getFullType() return self.fullType end
        return setmetatable(it,{__index=function() return function() end end}) end
end

-- Setup sites (3+ areas)
local function site(id,x)
    return {id=id,areaId=id,name="Building",mapId="Muldraugh, KY",buildLine="42",
        bounds={x1=x,y1=1000,x2=x+10,y2=1010,z=0},source={kind="map-research",reference="test"},
        paperStorage="observed",containerTypes={"shelves","postbox"},excluded=false}
end
local result={rows={
    {kind="building",id="p1",categoryHint="public-service"},
    {kind="building",id="p2",categoryHint="public-service"},
    {kind="building",id="p3",categoryHint="public-service"},
},catalog={revision="t",locations={site("t3:p1",1000),site("t3:p2",1100),site("t3:p3",1200)}},
  candidates={["t3:p1"]={{x=1001,y=1001,z=0}},["t3:p2"]={{x=1101,y=1001,z=0}},["t3:p3"]={{x=1201,y=1001,z=0}}}}

-- Helpers
local function docsById(world)
    local map={}
    if not world or not world.case then return map end
    for i,d in ipairs(world.case.documents or {}) do
        local areaId
        for j,a in ipairs(world.case.areas or {}) do
            if i>=a.first and i<a.first+a.count then areaId=a.id; break end
        end
        map[d.id]={kind=d.kind,lean=d.lean,areaId=areaId}
    end
    return map
end

local function sameTarget(a,b)
    for k,v in pairs(a) do if b[k]~=v then return false end end
    for k,v in pairs(b) do if a[k]~=v then return false end end
    return true
end

local function checkPieces(a,golden_info,label,id)
    assert(sameTarget(a.target,golden_info.target),label.." target for "..id)
    local all,onSpot=0,0
    local spot=a.target.x..","..a.target.y..","..a.target.z
    for k,sq in pairs(squares) do for _,o in ipairs(sq.objects) do
        if o.item:getModData().oiPhysicalToken==a.physicalToken then
            all=all+1; if k==spot then onSpot=onSpot+1 end
        end
    end end
    assert(all==golden_info.pieceCount and onSpot==all,label.." pieces for "..id..": "..all.." ("..onSpot.." on spot) of "..golden_info.pieceCount)
end

-- SETUP: decide the three areas, then give every clue that takes open ground
-- a spot inside its own area (through the real Session, as the filler would).
local store={}
local h0=boot(store)
installWorld(); h0.setPlayerPos(1100,1001)
h0.fire("OnGameStart"); squares={}; installWorld()
assert(h0.R.decideNearby()==true,"scan starts")
h0.probe.result=result
for _=1,100 do h0.fire("OnTick") end
local Sess=require("OIShared/Generated/Session")
local w=store["OIShared.Generated.G2"]
local api=assert(Sess.open(w.campaign.canonical,function(n) w.campaign.canonical=n end))
local base={["t3:p1"]=1000,["t3:p2"]=1100,["t3:p3"]=1200}
local assigned_ids,n={},0
local docs=w.campaign.canonical.case.documents
for _,d in ipairs(docs) do
    local x0=base[d.locationId]
    if x0 then
        n=n+1
        if api.assign(d.id,{x=x0+1+n%9,y=1002+math.floor(n/9),z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true},1) then
            assigned_ids[d.id]=true
        end
    end
end
-- A confirmed vanilla scene with one clue on open ground, decided and given
-- its spot the same way (checklist B7: "including scene areas").
local Scenes=require("OIShared/Generated/VanillaScenes")
local SceneMatch=require("OIShared/Generated/SceneMatch")
local Manifest=require("OIShared/Mystery/Manifest")
local sceneKind
for _,k in ipairs(Scenes.allowedKinds()) do if Scenes.spotFor(k)=="ground" then sceneKind=k; break end end
assert(sceneKind,"a scene kind whose clue lies on open ground")
-- One clue per conspiracy plus a written one, as the playthrough harness gives
-- every scene kind (the scene takes the world's pick among them).
local sceneClues={
    {id="SC01c",kind="set",pieces={"Twine","Tarp"},anchor={scene=sceneKind},
        where={{place="farm",spot="ground",lean="containment",rival="agricultural"}}},
    {id="SC01a",kind="set",pieces={"Tarp","Rope"},anchor={scene=sceneKind},
        where={{place="farm",spot="ground",lean="agricultural",rival="containment"}}},
    {id="SC01w",kind="written",pieces={"photograph"},anchor={scene=sceneKind},
        where={{place="farm",spot="ground",lean="containment",rival="agricultural"}}}}
local key=SceneMatch.keyAt(1301,1001,0)
assert(api.noteScene(key,{pending={"room:trace"},x=1301,y=1001,z=0,hours=1}))
assert(api.noteScene(key,{kind=sceneKind,x=1301,y=1001,z=0,hours=1,source="seen"}))
local ok,why=api.addSceneArea{site={id="scene:"..key,bounds={x1=1300,y1=1000,x2=1310,y2=1010,z=0},
    paperStorage="unknown",containerTypes={}},key=key,kind=sceneKind,clues=sceneClues,version=Manifest.VERSION,hours=1}
assert(ok,"the scene area is decided: "..tostring(why))
local sceneDocs=0
for _,d in ipairs(w.campaign.canonical.case.documents) do
    if d.locationId=="scene:"..key and api.assign(d.id,{x=1302+sceneDocs,y=1002,z=0,objectIndex=0,containerIndex=0,
        containerType="floor",sprite="yard",ground=true},1) then
        assigned_ids[d.id]=true; sceneDocs=sceneDocs+1
    end
end
assert(sceneDocs>=1,"the scene's clue has its ground spot")
local nAssigned=0; for _ in pairs(assigned_ids) do nAssigned=nAssigned+1 end
assert(#w.campaign.canonical.case.areas>=3 and nAssigned>=3,"three areas decided and ground clues assigned ("..nAssigned..")")
local K2=deepCopy(store)

-- The survivor walks through the three areas; every clue is placed on arrival.
local ROUTE={{1003,1003},{1103,1003},{1203,1003},{1303,1003}}
local TICKS=80
local function walk(h,fromLeg,fromTick,onStep)
    for leg=fromLeg,#ROUTE do
        h.setPlayerPos(ROUTE[leg][1],ROUTE[leg][2])
        for t=(leg==fromLeg and fromTick or 1),TICKS do
            if onStep then onStep(leg,t) end
            h.fire("OnTick")
        end
    end
end
local function boot2(st)
    squares={}
    local h=boot(st); installWorld(); h.setPlayerPos(ROUTE[1][1],ROUTE[1][2])
    h.fire("OnGameStart"); squares={}; installWorld()
    return h
end

-- GOLDEN RUN from K2, catching every save: each one replaces store.campaign.
local gstore=deepCopy(K2)
local hg=boot2(gstore)
local entry=gstore["OIShared.Generated.G2"]
local real=entry.campaign; entry.campaign=nil
local snapshots,atLeg,atTick={},1,1
setmetatable(entry,{
    __index=function(t,k) if k=="campaign" then return real end end,
    __newindex=function(t,k,v)
        if k~="campaign" then rawset(t,k,v); return end
        real=v
        local st=deepCopy(gstore); st["OIShared.Generated.G2"].campaign=deepCopy(v)
        local sq={}
        for key,q in pairs(squares) do
            sq[key]={}
            for i,o in ipairs(q.objects) do sq[key][i]=o.item:getModData().oiPhysicalToken end
        end
        snapshots[#snapshots+1]={store=st,squares=sq,leg=atLeg,tick=atTick}
    end})
walk(hg,1,1,function(leg,t) atLeg,atTick=leg,t end)
setmetatable(entry,nil); entry.campaign=real

local golden=gstore["OIShared.Generated.G2"].campaign.canonical
local golden_docs=docsById(golden)
local golden_info={}
for id in pairs(assigned_ids) do
    local a=golden.assignments[id]
    assert(a.status=="placed","golden: every ground clue is placed ("..id..")")
    local want=0
    for _,d in ipairs(golden.case.documents) do if d.id==id then
        for _,m in ipairs(d.members or {{quantity=d.quantity or 1}}) do want=want+(m.quantity or 1) end
    end end
    golden_info[id]={target=deepCopy(a.target),pieceCount=want}
    checkPieces(a,golden_info[id],"golden",id)
end

-- REPLAY every save to the end of the walk: the same final state each time.
local placementSaves=0
for i,snap in ipairs(snapshots) do
    for id in pairs(assigned_ids) do
        local a=snap.store["OIShared.Generated.G2"].campaign.canonical.assignments[id]
        if a and (a.status=="placing" or a.status=="placed") then placementSaves=placementSaves+1; break end
    end
    local st=deepCopy(snap.store)
    local h=boot2(st)
    for key,tokens in pairs(snap.squares) do
        local x,y,z=key:match("^(-?%d+),(-?%d+),(-?%d+)$")
        local q=square(tonumber(x),tonumber(y),tonumber(z))
        for _,tok in ipairs(tokens) do
            local item=instanceItem("fake.item"); item:getModData().oiPhysicalToken=tok
            q:AddWorldInventoryItem(item)
        end
    end
    walk(h,snap.leg,snap.tick)
    local root=st["OIShared.Generated.G2"].campaign.canonical
    assert(#root.case.areas==#golden.case.areas,"save "..i..": area count")
    local d=docsById(root)
    for id,g in pairs(golden_docs) do
        assert(d[id] and d[id].lean==g.lean and d[id].areaId==g.areaId and d[id].kind==g.kind,"save "..i..": document "..id)
    end
    for id in pairs(d) do assert(golden_docs[id],"save "..i..": extra document "..id) end
    for id,g in pairs(golden.assignments) do
        local a=root.assignments[id]
        assert(a and a.status==g.status,"save "..i..": status of "..id)
        assert((a.target==nil)==(g.target==nil) and (a.target==nil or sameTarget(a.target,g.target)),"save "..i..": target of "..id)
    end
    for id,g in pairs(golden_info) do checkPieces(root.assignments[id],g,"save "..i,id) end
end
assert(#snapshots>=6 and placementSaves>=3,"the walk made placement saves ("..#snapshots.." saves, "..placementSaves.." during placement)")
print(("nohelp reload fuzz: %d saves recorded and %d replayed (%d during placement), %d ground clues (%d in a scene), %d areas"):format(
    #snapshots,#snapshots,placementSaves,nAssigned,sceneDocs,#golden.case.areas))
print("NH-D3: a crash and reload at these save points changes nothing")
