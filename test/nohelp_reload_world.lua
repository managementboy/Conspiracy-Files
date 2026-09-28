-- NH-D3: Kill point K2 — reload with placement target preservation.
-- K2: after ground targets assigned, clues pending with targets.
-- Tests: golden placement, reload from K2, mid-placement reload, double reload.
-- K3 (saved as "placing", objects not in world) is checklist item B4.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path

local function deepCopy(t)
    if type(t)~="table" then return t end
    local copy={}
    for k,v in pairs(t) do copy[k]=deepCopy(v) end
    return copy
end

local boot=dofile("test/fixtures/nohelp_runtime_stub.lua")

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
-- Squares not yet loaded (the survivor has not come close enough).
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

-- Setup initial area and clues
local function site(id,x)
    return {id=id,areaId=id,name="Building",mapId="Muldraugh, KY",buildLine="42",
        bounds={x1=x,y1=1000,x2=x+10,y2=1010,z=0},source={kind="map-research",reference="test"},
        paperStorage="observed",containerTypes={"shelves","postbox"},excluded=false}
end
local result={rows={
    {kind="building",id="p1",categoryHint="public-service"},
    {kind="building",id="h1",categoryHint="residential"},
},catalog={revision="t",locations={site("t3:p1",1000),site("t3:h1",1100)}},
  candidates={["t3:p1"]={{x=1001,y=1001,z=0}},["t3:h1"]={{x=1101,y=1001,z=0}}}}

-- Build and assign ground targets
local store={}
local harness=boot(store)
harness.fire("OnGameStart")
assert(harness.R.decideNearby()==true,"scan starts")
harness.probe.result=result
for _=1,20 do harness.fire("OnTick") end

local w=store["NHShared.Generated.G2"]
local Sess=require("NHShared/Generated/Session")
local api=assert(Sess.open(w.campaign.canonical,function(n) w.campaign.canonical=n end))
local assigned_count=0
local assigned_ids={}
for id,a in pairs(w.campaign.canonical.assignments) do
  assigned_count=assigned_count+1
  local ok,why=api.assign(id,{x=1001+assigned_count,y=1002,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true},1)
  if ok then
    assigned_ids[id]=true
  end
end
assert(assigned_count>=2,"at least 2 clues attempted")

-- K2 SNAPSHOT: after ground targets assigned
local K2_store=deepCopy(store)

-- GOLDEN RUN: boot K2, place clues, record results
local st_golden=deepCopy(K2_store)
local h_golden=boot(st_golden); installWorld(); h_golden.setPlayerPos(1003,1003)
h_golden.fire("OnGameStart")
squares={}; installWorld()
for t=1,400 do h_golden.fire("OnTick") end
local golden_root=st_golden["NHShared.Generated.G2"].campaign.canonical
local golden_info={}
local placed_count=0
for id,a in pairs(golden_root.assignments) do
  if assigned_ids[id] then
    local count=0
    for _,sq in pairs(squares) do for _,o in ipairs(sq.objects) do if o.item:getModData().cfPhysicalToken==a.physicalToken then count=count+1 end end end
    golden_info[id]={target=deepCopy(a.target),status=a.status,pieceCount=count}
    assert(golden_info[id].status=="placed","golden placement for "..id)
    -- The clue's own piece count, from its document: never the golden run's
    -- own tally, so a doubling in every run cannot hide.
    local want=0
    for _,d in ipairs(golden_root.case.documents) do if d.id==id then
        for _,m in ipairs(d.members or {{quantity=d.quantity or 1}}) do want=want+(m.quantity or 1) end
    end end
    assert(want>0 and golden_info[id].pieceCount==want,"golden pieces for "..id..": "..golden_info[id].pieceCount.." of "..want)
    placed_count=placed_count+1
  end
end
assert(placed_count>=2,"at least 2 clues placed in golden")

-- RELOAD FROM K2: verify targets and status match golden
local st_reload=deepCopy(K2_store)
squares={}
-- Every reload must give the golden run's exact spot (every field of the
-- target) and the clue's pieces exactly once, all of them on that spot's square.
local function sameTarget(a,b)
    for k,v in pairs(a) do if b[k]~=v then return false end end
    for k,v in pairs(b) do if a[k]~=v then return false end end
    return true
end
local function checkPieces(a,golden,label,id)
    assert(sameTarget(a.target,golden.target),label.." target for "..id)
    local all,onSpot=0,0
    local spot=a.target.x..","..a.target.y..","..a.target.z
    for k,sq in pairs(squares) do for _,o in ipairs(sq.objects) do
        if o.item:getModData().cfPhysicalToken==a.physicalToken then
            all=all+1; if k==spot then onSpot=onSpot+1 end
        end
    end end
    assert(all==golden.pieceCount and onSpot==all,label.." pieces for "..id..": "..all.." ("..onSpot.." on its spot) of "..golden.pieceCount)
end

local h_reload=boot(st_reload); installWorld(); h_reload.setPlayerPos(1003,1003)
h_reload.fire("OnGameStart")
squares={}; installWorld()
for t=1,400 do h_reload.fire("OnTick") end
local reload_root=st_reload["NHShared.Generated.G2"].campaign.canonical
for id,golden in pairs(golden_info) do
  if assigned_ids[id] then
    local a=reload_root.assignments[id]
    assert(a.status=="placed","reload placement for "..id)
    checkPieces(a,golden,"reload",id)
  end
end

-- MID-PLACEMENT RELOAD: boot K2, tick once, snapshot store & squares, boot fresh, continue
local st_mid=deepCopy(K2_store)

squares={}
local h_mid=boot(st_mid); installWorld(); h_mid.setPlayerPos(1003,1003)
h_mid.fire("OnGameStart")
squares={}; installWorld()
-- One assigned clue's square is not loaded yet, so exactly one clue can be
-- placed before the reload; its square loads after the reload.
local later
for id in pairs(assigned_ids) do
    local t=st_mid["NHShared.Generated.G2"].campaign.canonical.assignments[id].target
    later=t.x..","..t.y..","..t.z
    break
end
unloaded[later]=true
-- Tick until exactly one of the assigned clues is placed: the reload must
-- fall between two placements, not before the first.
local function placedNow(store)
    local n=0
    for id,a in pairs(store["NHShared.Generated.G2"].campaign.canonical.assignments) do
        if assigned_ids[id] and a.status=="placed" then n=n+1 end
    end
    return n
end
for _=1,400 do if placedNow(st_mid)>=1 then break end; h_mid.fire("OnTick") end
assert(placedNow(st_mid)==1,"the mid-placement reload falls between placements, got "..placedNow(st_mid).." placed")
-- Snapshot store and squares with one clue placed
local mid_store_checkpoint=deepCopy(st_mid)
local mid_squares_checkpoint={}
for k,sq in pairs(squares) do
  mid_squares_checkpoint[k]={}
  for i,o in ipairs(sq.objects) do
    local token=o.item:getModData().cfPhysicalToken
    mid_squares_checkpoint[k][i]={token=token}
  end
end
-- Boot fresh from checkpoint
local st_mid2=deepCopy(mid_store_checkpoint)
squares={}
local h_mid2=boot(st_mid2); installWorld(); h_mid2.setPlayerPos(1003,1003)
h_mid2.fire("OnGameStart")
squares={}; installWorld()
-- Recreate squares with checkpoint objects
for k,objs in pairs(mid_squares_checkpoint) do
  local parts={}
  for part in k:gmatch("[^,]+") do table.insert(parts,tonumber(part)) end
  local sq=square(parts[1],parts[2],parts[3])
  for i,o_info in ipairs(objs) do
    local item=instanceItem("fake.item")
    item:getModData().cfPhysicalToken=o_info.token
    sq:AddWorldInventoryItem(item)
  end
end
unloaded={}   -- the survivor comes close: the last square loads
for t=2,400 do h_mid2.fire("OnTick") end
local mid2_root=st_mid2["NHShared.Generated.G2"].campaign.canonical
for id,golden in pairs(golden_info) do
  if assigned_ids[id] then
    local a=mid2_root.assignments[id]
    assert(a.status=="placed","mid-reload placement for "..id)
    checkPieces(a,golden,"mid-reload",id)
  end
end

-- DOUBLE RELOAD: repeat mid-checkpoint-reload once more
local st_dbl=deepCopy(mid_store_checkpoint)
squares={}
local h_dbl=boot(st_dbl); installWorld(); h_dbl.setPlayerPos(1003,1003)
h_dbl.fire("OnGameStart")
squares={}; installWorld()
-- Recreate squares with checkpoint objects
for k,objs in pairs(mid_squares_checkpoint) do
  local parts={}
  for part in k:gmatch("[^,]+") do table.insert(parts,tonumber(part)) end
  local sq=square(parts[1],parts[2],parts[3])
  for i,o_info in ipairs(objs) do
    local item=instanceItem("fake.item")
    item:getModData().cfPhysicalToken=o_info.token
    sq:AddWorldInventoryItem(item)
  end
end
for t=2,400 do h_dbl.fire("OnTick") end
local dbl_root=st_dbl["NHShared.Generated.G2"].campaign.canonical
for id,golden in pairs(golden_info) do
  if assigned_ids[id] then
    local a=dbl_root.assignments[id]
    assert(a.status=="placed","double-reload placement for "..id)
    checkPieces(a,golden,"double-reload",id)
  end
end

print("nohelp reload world: K2 ground targets preserve through golden, reload, mid-placement, and double reload")
