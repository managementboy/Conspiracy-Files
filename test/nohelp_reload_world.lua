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

-- Helper: Build areaId -> set of leans.
local function leansPerArea(world)
    local map={}
    if not world or not world.case then return map end
    for i=1,#(world.case.documents or {}) do
        local d=world.case.documents[i]
        local areaId
        for j,a in ipairs(world.case.areas or {}) do
            if i>=a.first and i<a.first+a.count then areaId=a.id; break end
        end
        if areaId then
            map[areaId]=map[areaId] or {}
            map[areaId][d.lean]=true
        end
    end
    return map
end

-- Helper: Compare two lean sets (as sets, not subsets).
local function leansEqual(golden, reload, label)
    for areaId,golden_leans in pairs(golden) do
        assert(reload[areaId], label.." missing area "..areaId)
        for lean,_ in pairs(golden_leans) do
            assert(reload[areaId][lean], label.." area "..areaId.." missing lean "..lean)
        end
        for lean,_ in pairs(reload[areaId]) do
            assert(golden_leans[lean], label.." area "..areaId.." extra lean "..lean.." (no peek)")
        end
    end
    for areaId,_ in pairs(reload) do
        assert(golden[areaId], label.." extra area "..areaId)
    end
end

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
-- Ground clues only: since E2 a furniture clue may also take the floor, and
-- this test's mid-placement reload counts on exactly the ground clues.
local spotOf={}
for _,d in ipairs(w.campaign.canonical.case.documents) do spotOf[d.id]=d.spot end
for id,a in pairs(w.campaign.canonical.assignments) do
 if spotOf[id]=="ground" then
  assigned_count=assigned_count+1
  local ok,why=api.assign(id,{x=1001+assigned_count,y=1002,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true},1)
  if ok then
    assigned_ids[id]=true
  end
 end
end
assert(assigned_count>=2,"at least 2 clues attempted")

-- K2 SNAPSHOT: after ground targets assigned
local K2_store=deepCopy(store)
local K2_golden_leans=leansPerArea(K2_store["NHShared.Generated.G2"].campaign.canonical)

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
local reload_leans=leansPerArea(reload_root)
leansEqual(K2_golden_leans, reload_leans, "K2 reload leans")
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
local mid2_leans=leansPerArea(mid2_root)
leansEqual(K2_golden_leans, mid2_leans, "mid-placement reload leans")
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
local dbl_leans=leansPerArea(dbl_root)
leansEqual(K2_golden_leans, dbl_leans, "double reload leans")
for id,golden in pairs(golden_info) do
  if assigned_ids[id] then
    local a=dbl_root.assignments[id]
    assert(a.status=="placed","double-reload placement for "..id)
    checkPieces(a,golden,"double-reload",id)
  end
end

-- K3: Clue saved as "placing", crash before items in world, reload with empty square.
-- Test B4 (2026-09-28): provisional owner rule—retry only if never shown/recognised.

-- Find a clue to use for K3
local k3_target_id
for id in pairs(assigned_ids) do k3_target_id=id; break end
assert(k3_target_id,"found a target clue for K3")
local K3_golden_leans=leansPerArea(K2_store["NHShared.Generated.G2"].campaign.canonical)

-- Set it to "placing" from K2's "pending" state
local k3_checkpoint=deepCopy(K2_store)
local api_k3_set_placing=Sess.open(k3_checkpoint["NHShared.Generated.G2"].campaign.canonical,
    function(n) k3_checkpoint["NHShared.Generated.G2"].campaign.canonical=n end)
local ok_placing=api_k3_set_placing.status(k3_target_id,"placing")
assert(ok_placing,"could set clue to placing status from pending")

local k3_target_loc=k3_checkpoint["NHShared.Generated.G2"].campaign.canonical.assignments[k3_target_id].target
local k3_target_spot=k3_target_loc.x..","..k3_target_loc.y..","..k3_target_loc.z

-- K3 CASE 1: Never shown—should retry and place normally
local st_k3_c1=deepCopy(k3_checkpoint)
local k3_c1_api=Sess.open(st_k3_c1["NHShared.Generated.G2"].campaign.canonical,
    function(n) st_k3_c1["NHShared.Generated.G2"].campaign.canonical=n end)
assert(not k3_c1_api.isShown(k3_target_id),"clue not shown before K3 case 1")

squares={}
local h_k3_c1=boot(st_k3_c1); installWorld(); h_k3_c1.setPlayerPos(1003,1003)
h_k3_c1.fire("OnGameStart")
squares={}; installWorld()
-- Mark square unloaded initially, then load it (simulating crash recovery)
unloaded[k3_target_spot]=true
for t=1,200 do h_k3_c1.fire("OnTick") end
unloaded={}  -- survivor comes close, square loads
for t=1,200 do h_k3_c1.fire("OnTick") end

local k3_c1_root=st_k3_c1["NHShared.Generated.G2"].campaign.canonical
local k3_c1_leans=leansPerArea(k3_c1_root)
leansEqual(K3_golden_leans, k3_c1_leans, "K3 case 1 leans")
local k3_c1_result=k3_c1_root.assignments[k3_target_id]
assert(k3_c1_result.status=="placed","K3 case 1: never-shown clue should be placed after retry")
local k3_c1_all,k3_c1_onSpot=0,0
for k,sq in pairs(squares) do for _,o in ipairs(sq.objects) do
    if o.item:getModData().cfPhysicalToken==k3_c1_result.physicalToken then
        k3_c1_all=k3_c1_all+1
        if k==k3_target_spot then k3_c1_onSpot=k3_c1_onSpot+1 end
    end
end end
local k3_c1_want=0
for _,d in ipairs(k3_c1_root.case.documents) do if d.id==k3_target_id then
    for _,m in ipairs(d.members or {{quantity=d.quantity or 1}}) do k3_c1_want=k3_c1_want+(m.quantity or 1) end
end end
assert(k3_c1_want>0 and k3_c1_all==k3_c1_want and k3_c1_onSpot==k3_c1_all,
    "K3 case 1: pieces placed exactly on target")

-- K3 CASE 2: Shown before crash—should NOT retry, end as unknown with no pieces
local st_k3_c2=deepCopy(k3_checkpoint)
local k3_c2_api=Sess.open(st_k3_c2["NHShared.Generated.G2"].campaign.canonical,
    function(n) st_k3_c2["NHShared.Generated.G2"].campaign.canonical=n end)
k3_c2_api.show(k3_target_id)

squares={}
local h_k3_c2=boot(st_k3_c2); installWorld(); h_k3_c2.setPlayerPos(1003,1003)
h_k3_c2.fire("OnGameStart")
squares={}; installWorld()
unloaded[k3_target_spot]=true
for t=1,200 do h_k3_c2.fire("OnTick") end
unloaded={}
for t=1,200 do h_k3_c2.fire("OnTick") end

local k3_c2_root=st_k3_c2["NHShared.Generated.G2"].campaign.canonical
local k3_c2_leans=leansPerArea(k3_c2_root)
leansEqual(K3_golden_leans, k3_c2_leans, "K3 case 2 leans")
local k3_c2_result=k3_c2_root.assignments[k3_target_id]
assert(k3_c2_result.status=="unknown","K3 case 2: shown clue should end unknown")
local k3_c2_count=0
for k,sq in pairs(squares) do for _,o in ipairs(sq.objects) do
    if o.item:getModData().cfPhysicalToken==k3_c2_result.physicalToken then k3_c2_count=k3_c2_count+1 end
end end
assert(k3_c2_count==0,"K3 case 2: no pieces created for shown clue")

-- K3 CASE 3 (PARTIAL): Set clue (2+ pieces) with 1 piece in world → ends unknown, no retry
local k3_partial_id
for id in pairs(assigned_ids) do
    for _,d in ipairs(K2_store["NHShared.Generated.G2"].campaign.canonical.case.documents) do
        if d.id==id then
            local pcount=0
            if d.members and #d.members > 0 then
                for _,m in ipairs(d.members) do pcount=pcount+(m.quantity or 1) end
            else
                pcount=d.quantity or 1
            end
            if pcount >= 2 then k3_partial_id=id; break end
        end
    end
    if k3_partial_id then break end
end
if k3_partial_id then
    local st_k3_c3=deepCopy(K2_store)
    local api_k3_c3=Sess.open(st_k3_c3["NHShared.Generated.G2"].campaign.canonical,
        function(n) st_k3_c3["NHShared.Generated.G2"].campaign.canonical=n end)
    api_k3_c3.status(k3_partial_id,"placing")

    local k3_c3_loc=st_k3_c3["NHShared.Generated.G2"].campaign.canonical.assignments[k3_partial_id].target
    local k3_c3_spot=k3_c3_loc.x..","..k3_c3_loc.y..","..k3_c3_loc.z

    squares={}
    local h_k3_c3=boot(st_k3_c3); installWorld(); h_k3_c3.setPlayerPos(1003,1003)
    h_k3_c3.fire("OnGameStart")
    squares={}; installWorld()
    -- Pre-place 1 piece on target square (simulating partial placement before crash)
    local sq_c3=square(k3_c3_loc.x,k3_c3_loc.y,k3_c3_loc.z)
    local item_c3=instanceItem("fake.item")
    item_c3:getModData().cfPhysicalToken=st_k3_c3["NHShared.Generated.G2"].campaign.canonical.assignments[k3_partial_id].physicalToken
    sq_c3:AddWorldInventoryItem(item_c3)

    unloaded[k3_c3_spot]=true
    for t=1,200 do h_k3_c3.fire("OnTick") end
    unloaded={}
    for t=1,200 do h_k3_c3.fire("OnTick") end

    local k3_c3_root=st_k3_c3["NHShared.Generated.G2"].campaign.canonical
    local k3_c3_leans=leansPerArea(k3_c3_root)
    leansEqual(K3_golden_leans, k3_c3_leans, "K3 case 3 leans")
    local k3_c3_result=k3_c3_root.assignments[k3_partial_id]
    assert(k3_c3_result.status=="unknown","K3 case 3: partial placement must end unknown")
    local k3_c3_count=0
    for k,sq in pairs(squares) do for _,o in ipairs(sq.objects) do
        if o.item:getModData().cfPhysicalToken==k3_c3_result.physicalToken then k3_c3_count=k3_c3_count+1 end
    end end
    assert(k3_c3_count==1,"K3 case 3: partial clue token count stays 1, not recreated")
end

-- K3 CASE 4 (RECOGNISED): Like case 2 but clue recognised instead of shown → unknown, nothing created
local st_k3_c4=deepCopy(k3_checkpoint)
local k3_c4_api=Sess.open(st_k3_c4["NHShared.Generated.G2"].campaign.canonical,
    function(n) st_k3_c4["NHShared.Generated.G2"].campaign.canonical=n end)
k3_c4_api.recognise(k3_target_id,"search")

squares={}
local h_k3_c4=boot(st_k3_c4); installWorld(); h_k3_c4.setPlayerPos(1003,1003)
h_k3_c4.fire("OnGameStart")
squares={}; installWorld()
unloaded[k3_target_spot]=true
for t=1,200 do h_k3_c4.fire("OnTick") end
unloaded={}
for t=1,200 do h_k3_c4.fire("OnTick") end

local k3_c4_root=st_k3_c4["NHShared.Generated.G2"].campaign.canonical
local k3_c4_leans=leansPerArea(k3_c4_root)
leansEqual(K3_golden_leans, k3_c4_leans, "K3 case 4 leans")
local k3_c4_result=k3_c4_root.assignments[k3_target_id]
assert(k3_c4_result.status=="unknown","K3 case 4: recognised clue should end unknown")
local k3_c4_count=0
for k,sq in pairs(squares) do for _,o in ipairs(sq.objects) do
    if o.item:getModData().cfPhysicalToken==k3_c4_result.physicalToken then k3_c4_count=k3_c4_count+1 end
end end
assert(k3_c4_count==0,"K3 case 4: no pieces created for recognised clue")

-- B6: Reload inside arrival ring (inRing resets at game start, job requeues)
-- Setup: reload while survivor inside area's arrival ring, verify clues placed exactly once
local st_b6=deepCopy(K2_store)
local arrival_area_id=K2_store["NHShared.Generated.G2"].campaign.canonical.case.areas[1].id

squares={}
local h_b6=boot(st_b6); installWorld();
-- Start far away
h_b6.setPlayerPos(2000,2000)
h_b6.fire("OnGameStart")
squares={}; installWorld()

-- Tick until at least one clue is placed
for _=1,400 do if placedNow(st_b6)>=1 then break end; h_b6.fire("OnTick") end
assert(placedNow(st_b6)>=1,"at least one clue placed before in-ring reload")

-- Move survivor INSIDE the arrival ring (near target 1001,1002)
h_b6.setPlayerPos(1001,1001)

-- Snapshot store and squares before reload
local b6_checkpoint_store=deepCopy(st_b6)
local b6_checkpoint_squares={}
for k,sq in pairs(squares) do
  b6_checkpoint_squares[k]={}
  for i,o in ipairs(sq.objects) do
    local token=o.item:getModData().cfPhysicalToken
    b6_checkpoint_squares[k][i]={token=token}
  end
end

-- Reload while in ring
local st_b6_reload=deepCopy(b6_checkpoint_store)
squares={}
local h_b6_reload=boot(st_b6_reload); installWorld(); h_b6_reload.setPlayerPos(1001,1001)
h_b6_reload.fire("OnGameStart")
squares={}; installWorld()

-- Recreate checkpoint squares
for k,objs in pairs(b6_checkpoint_squares) do
  local parts={}
  for part in k:gmatch("[^,]+") do table.insert(parts,tonumber(part)) end
  local sq=square(parts[1],parts[2],parts[3])
  for i,o_info in ipairs(objs) do
    local item=instanceItem("fake.item")
    item:getModData().cfPhysicalToken=o_info.token
    sq:AddWorldInventoryItem(item)
  end
end

-- Continue ticks after reload until items are placed
local function b6_placed(store)
    local n=0
    for id,a in pairs(store["NHShared.Generated.G2"].campaign.canonical.assignments or {}) do
        if assigned_ids[id] and a.status=="placed" then n=n+1 end
    end
    return n
end
for t=2,400 do h_b6_reload.fire("OnTick") end
local b6_first_placed=b6_placed(st_b6_reload)
assert(b6_first_placed>=2,"B6: at least 2 clues placed after first in-ring reload")

-- Check pieces after first reload before snapshot
local b6_reload_root=st_b6_reload["NHShared.Generated.G2"].campaign.canonical
for id,a in pairs(b6_reload_root.assignments) do
  if assigned_ids[id] then
    local all,onSpot=0,0
    local spot=a.target.x..","..a.target.y..","..a.target.z
    for k,sq in pairs(squares) do for _,o in ipairs(sq.objects) do
        if o.item:getModData().cfPhysicalToken==a.physicalToken then
            all=all+1; if k==spot then onSpot=onSpot+1 end
        end
    end end
    local want=0
    for _,d in ipairs(b6_reload_root.case.documents) do if d.id==id then
        for _,m in ipairs(d.members or {{quantity=d.quantity or 1}}) do want=want+(m.quantity or 1) end
    end end
    assert(want>0 and all==want and onSpot==all,
        "B6 first in-ring reload: clue "..id.." pieces exactly once: "..all.." ("..onSpot.." on spot) of "..want)
  end
end

-- Snapshot after first reload (with items placed)
local b6_checkpoint2_store=deepCopy(st_b6_reload)
local b6_checkpoint2_squares={}
for k,sq in pairs(squares) do
  b6_checkpoint2_squares[k]={}
  for i,o in ipairs(sq.objects) do
    local token=o.item:getModData().cfPhysicalToken
    b6_checkpoint2_squares[k][i]={token=token}
  end
end

-- B6 DOUBLE RELOAD: reload again from the placed-state checkpoint, inside ring
local st_b6_reload2=deepCopy(b6_checkpoint2_store)
squares={}
local h_b6_reload2=boot(st_b6_reload2); installWorld(); h_b6_reload2.setPlayerPos(1001,1001)
h_b6_reload2.fire("OnGameStart")
squares={}; installWorld()

-- Recreate checkpoint squares with already-placed items
for k,objs in pairs(b6_checkpoint2_squares) do
  local parts={}
  for part in k:gmatch("[^,]+") do table.insert(parts,tonumber(part)) end
  local sq=square(parts[1],parts[2],parts[3])
  for i,o_info in ipairs(objs) do
    local item=instanceItem("fake.item")
    item:getModData().cfPhysicalToken=o_info.token
    sq:AddWorldInventoryItem(item)
  end
end

-- Replay from placed state
for t=2,400 do h_b6_reload2.fire("OnTick") end

-- Verify: each clue still has exactly its piece count on its square (no double creation)
local b6_reload2_root=st_b6_reload2["NHShared.Generated.G2"].campaign.canonical
for id,a in pairs(b6_reload2_root.assignments) do
  if assigned_ids[id] then
    local all,onSpot=0,0
    local spot=a.target.x..","..a.target.y..","..a.target.z
    for k,sq in pairs(squares) do for _,o in ipairs(sq.objects) do
        if o.item:getModData().cfPhysicalToken==a.physicalToken then
            all=all+1; if k==spot then onSpot=onSpot+1 end
        end
    end end
    local want=0
    for _,d in ipairs(b6_reload2_root.case.documents) do if d.id==id then
        for _,m in ipairs(d.members or {{quantity=d.quantity or 1}}) do want=want+(m.quantity or 1) end
    end end
    assert(want>0 and all==want and onSpot==all,
        "B6 double in-ring reload: clue "..id.." still exactly one set: "..all.." ("..onSpot.." on spot) of "..want)
  end
end

print("nohelp reload world: K2 ground targets preserve through golden, reload, mid-placement, and double reload")
print("K3: placing clue retries if never shown, ends unknown if shown (B4, 2026-09-28: provisional owner rule)")
print("B6: double reload inside arrival ring re-queues job; clues placed exactly once after each reload")
print("NH-D3: a crash and reload at these save points changes nothing")
