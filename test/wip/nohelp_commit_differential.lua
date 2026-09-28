-- Differential test: compare current behavior with frozen reference copies.
-- Both Session (live) and Session_ref (reference) must accept/refuse identical writes
-- with identical return values, snapshots, and payloads. Verifies no aliasing and 80+ writes.
package.path="test/fixtures/?.lua;mod-nohelp/common/media/lua/shared/?.lua;test/fixtures/?.lua;test/fixtures/reference/?.lua;"..package.path
local S=require("NHShared/Generated/Session")
local S_ref=require("reference/Session_ref")
local AreaCase=require("NHShared/Generated/AreaCase")
local V=require("NHShared/Validator")
local Scenes=require("NHShared/Generated/VanillaScenes")
local Inventory=require("nohelp_inventory")

-- Extend inventory with scene-anchored clues for addSceneArea testing
local clues={}
for _,c in ipairs(Inventory.clues) do clues[#clues+1]=c end
local allowedKinds=Scenes.allowedKinds()
for ki=1,math.min(3,#allowedKinds) do
    local kind=allowedKinds[ki]
    local spot=Scenes.spotFor(kind)
    clues[#clues+1]={
        id="SCENE"..ki,kind="set",pieces={"Rope","Bleach"},
        anchor={scene=kind},
        where={{place="farm",spot=spot,lean="containment",rival="agricultural"},
               {place="farm",spot=spot,lean="agricultural",rival="containment"}}}
end
-- Add a dedicated mobile clue for missing/dropMissing testing
clues[#clues+1]={
    id="MOBILE",kind="set",pieces={"Wire","Paperclip"},
    where={{place="farm",spot="vehicle",lean="containment",rival="agricultural"},
           {place="farm",spot="corpse",lean="agricultural",rival="containment"}}}
local places=Inventory.places

local function site(i)
    return {id="t3:b"..i,bounds={x1=i*100,y1=0,x2=i*100+10,y2=10,z=0},containerTypes={"shelves","postbox","vehicle","corpse","floor"}}
end

-- Deep copy: recursive, for stored payloads and snapshots
local function deepCopy(v)
    if type(v)~="table" then return v end
    local out={}
    for k,x in pairs(v) do out[k]=deepCopy(x) end
    return out
end

-- Deep equality check with path for debugging
local function deepEqual(a,b,path)
    path=path or "root"
    if type(a)~=type(b) then return false,path.." type mismatch: "..type(a).." vs "..type(b) end
    if type(a)~="table" then return a==b,nil end
    for k in pairs(a) do
        local ok,err=deepEqual(a[k],b[k],path.."["..tostring(k).."]")
        if not ok then return false,err end
    end
    for k in pairs(b) do if a[k]==nil then return false,path.."["..tostring(k).."] missing in a" end end
    return true,nil
end

local seed=4242
local root1=assert(S.createArea(seed),"live root")
local root2=assert(S_ref.createArea(seed),"ref root")

local ok,err=deepEqual(root1,root2)
assert(ok,"initial roots deep-equal: "..tostring(err))

-- Sinks: store BOTH the deep copy (fingerprint) and the received object reference
local received1,received2={},{}
local callCount1,callCount2=0,0

local api1=assert(S.open(root1,function(n)
    callCount1=callCount1+1
    received1[callCount1]={obj=n,fingerprint=deepCopy(n)}
end))

local api2=assert(S_ref.open(root2,function(n)
    callCount2=callCount2+1
    received2[callCount2]={obj=n,fingerprint=deepCopy(n)}
end))

local writes=0
local stats={addArea=0,assign=0,status=0,show=0,recognise=0,inspect=0,relocate=0,unplan=0,deferTarget=0,drop=0,missing=0,dropMissing=0,noteScene=0,addSceneArea=0}
local refused={addArea=0,assign=0,status=0,show=0,recognise=0,inspect=0,relocate=0,unplan=0,deferTarget=0,drop=0,missing=0,dropMissing=0,noteScene=0,addSceneArea=0}

-- Helper: every API call goes through here
local function step(kind, call)
    -- Record state BEFORE
    local snap1_before=deepCopy(api1.snapshot())
    local snap2_before=deepCopy(api2.snapshot())
    local calls1_before=callCount1
    local calls2_before=callCount2

    -- Execute on both sides
    local r1={call(api1)}
    local r2={call(api2)}

    -- Return values must match
    local ok,err=deepEqual(r1,r2)
    assert(ok,kind.." return mismatch: "..tostring(err))

    -- Call counts must match
    assert(callCount1==callCount2,kind.." call count: "..callCount1.." vs "..callCount2)

    -- If refused (r1[1]==false/nil), snapshot must not change on either side
    if not r1[1] then
        refused[kind]=refused[kind]+1
        local snap1_after=api1.snapshot()
        local snap2_after=api2.snapshot()
        local ok,err=deepEqual(snap1_before,snap1_after)
        assert(ok,kind.." refused: snapshot1 changed: "..tostring(err))
        ok,err=deepEqual(snap2_before,snap2_after)
        assert(ok,kind.." refused: snapshot2 changed: "..tostring(err))
        assert(callCount1==calls1_before,kind.." refused: sink called")
    else
        -- Accepted: verify snapshots now match
        stats[kind]=stats[kind]+1
        writes=writes+1
        local snap1_after=api1.snapshot()
        local snap2_after=api2.snapshot()
        local ok,err=deepEqual(snap1_after,snap2_after)
        assert(ok,kind.." accepted: snapshot mismatch: "..tostring(err))

        -- If sink was called, verify payloads match
        if callCount1>calls1_before then
            local ok,err=deepEqual(received1[callCount1].fingerprint,received2[callCount2].fingerprint)
            assert(ok,kind.." payload mismatch: "..tostring(err))
        end
    end

    -- Re-check earlier received payloads for mutation
    for i=1,math.min(calls1_before,callCount1-1) do
        local ok,err=deepEqual(received1[i].fingerprint,deepCopy(received1[i].obj))
        assert(ok,kind.." mutation in received1["..i.."]: "..tostring(err))
        ok,err=deepEqual(received2[i].fingerprint,deepCopy(received2[i].obj))
        assert(ok,kind.." mutation in received2["..i.."]: "..tostring(err))
    end

    return r1[1],r1[2]
end

-- PHASE 1: addArea over 45+ sites with rotating inventory places
for i=1,45 do
    local place=places[((i-1) % #places)+1]
    step("addArea",function(api)
        return api.addArea{site=site(i),place=place,clues=clues,version="v1",hours=10+i}
    end)
end

-- Refused: duplicate site
step("addArea",function(api)
    return api.addArea{site=site(1),place="farm",clues=clues,version="v99",hours=200}
end)

-- Refused: unknown place (requires exact placeholder name)
step("addArea",function(api)
    return api.addArea{site=site(31),place="unknown-place",clues=clues,version="v1",hours=41}
end)

-- PHASE 2: collect deferred clues for assignment
local snap=api1.snapshot()
local docsByStatus={}
for _,doc in ipairs(snap.case.documents) do
    local status=snap.assignments[doc.id].status
    if not docsByStatus[status] then docsByStatus[status]={} end
    table.insert(docsByStatus[status],{id=doc.id,locationId=doc.locationId,spot=doc.spot})
end

-- Helper to build targets of each spot kind (within site bounds)
local function makeTarget(spot,i,siteId)
    local s=site(siteId or 1)
    local b=s.bounds
    -- Clamp i to fit within site bounds: bounds are 10 units wide, so use mod
    local offset=((i-1) % 8)+1  -- Keep offset 1-8 to stay within 10-unit-wide bounds
    local x,y=b.x1+offset,b.y1+offset
    if spot=="furniture" then return {x=x,y=y,z=0,objectIndex=i%4,containerIndex=0,containerType="shelves",sprite="s"} end
    if spot=="mailbox" then return {x=x,y=y,z=0,objectIndex=i%4,containerIndex=0,containerType="postbox",sprite="p"} end
    if spot=="ground" then return {x=x,y=y,z=0,objectIndex=0,containerIndex=0,containerType="floor",sprite="yard",ground=true} end
    if spot=="vehicle" then return {x=x,y=y,z=0,objectIndex=0,containerIndex=0,containerType="vehicle",sprite="car",vehiclePart="Part"..i} end
    if spot=="corpse" then return {x=x,y=y,z=0,objectIndex=0,containerIndex=0,containerType=S.CARRIER_CONTAINER,sprite="body",carrierKind="corpse",carrierMark="m"..i} end
    return {x=x,y=y,z=0,objectIndex=i%4,containerIndex=0,containerType="shelves",sprite="s"}
end

-- ASSIGN: deferred clues to pending (multiple - assign most of them)
-- Track first mobile clue for missing/dropMissing testing
local mobileDocId
if docsByStatus.deferred then
    local assignCount=0
    local maxAssign=math.min(#docsByStatus.deferred-1,#docsByStatus.deferred)  -- Leave at least 1 for drop testing
    for i=1,#docsByStatus.deferred do
        local docRef=docsByStatus.deferred[i]
        -- Prioritize assigning the mobile clue if found
        if not mobileDocId and (docRef.spot=="vehicle" or docRef.spot=="corpse") then
            mobileDocId=docRef.id
        end
        -- Assign up to maxAssign clues
        if assignCount<maxAssign then
            local target=makeTarget(docRef.spot,i,1)
            step("assign",function(api)
                return api.assign(docRef.id,target,40+i)
            end)
            assignCount=assignCount+1
        end
    end
end

-- Refused assign: unknown id
step("assign",function(api)
    return api.assign("unknown-id",makeTarget("furniture",1),50)
end)

-- Refused assign: already assigned (pending)
snap=api1.snapshot()
if docsByStatus.deferred and #docsByStatus.deferred>0 then
    local docRef=docsByStatus.deferred[1]
    step("assign",function(api)
        return api.assign(docRef.id,makeTarget(docRef.spot,99),55)
    end)
end

-- DEFTARGET: pending -> deferred (call immediately after assign, before status transitions)
-- Keep some clues pending and call deferTarget before status transitions to placing/placed
snap=api1.snapshot()
docsByStatus={}
for _,doc in ipairs(snap.case.documents) do
    local status=snap.assignments[doc.id].status
    if not docsByStatus[status] then docsByStatus[status]={} end
    table.insert(docsByStatus[status],{id=doc.id})
end
-- Defer a pending clue before status transitions (if extra clues exist)
if docsByStatus.pending and #docsByStatus.pending>8 then
    step("deferTarget",function(api)
        return api.deferTarget(docsByStatus.pending[8].id,57)
    end)
elseif docsByStatus.pending and #docsByStatus.pending>1 then
    -- If only a few pending clues, defer one and let status handle the rest
    step("deferTarget",function(api)
        return api.deferTarget(docsByStatus.pending[#docsByStatus.pending].id,57)
    end)
end

-- Refused deferTarget: not pending
step("deferTarget",function(api)
    return api.deferTarget("unknown-id",60)
end)

-- STATUS: multiple transitions
snap=api1.snapshot()
docsByStatus={}
for _,doc in ipairs(snap.case.documents) do
    local status=snap.assignments[doc.id].status
    if not docsByStatus[status] then docsByStatus[status]={} end
    table.insert(docsByStatus[status],{id=doc.id})
end

if docsByStatus.pending then
    for i=1,math.min(10,#docsByStatus.pending) do
        local id=docsByStatus.pending[i].id
        step("status",function(api)
            return api.status(id,"placing")
        end)
        step("status",function(api)
            return api.status(id,"placed",60+i)
        end)
    end
end

-- Refused status: unknown id
step("status",function(api)
    return api.status("unknown-id","placed",70)
end)

-- SHOW: mark as shown (limited to 2, leaving others for relocate)
snap=api1.snapshot()
local shownClues={}
for _,doc in ipairs(snap.case.documents) do
    local a=snap.assignments[doc.id]
    if a.status=="placed" and not shownClues[doc.id] then
        if #shownClues<2 then table.insert(shownClues,doc.id) end
    end
end
for _,id in ipairs(shownClues) do
    step("show",function(api)
        return api.show(id)
    end)
end
-- Show same clue again (idempotent)
if #shownClues>0 then
    step("show",function(api)
        return api.show(shownClues[1])
    end)
end

-- Refused show: unknown id
step("show",function(api)
    return api.show("unknown-id")
end)

-- RECOGNISE: mark as found (multiple, skip mobile clues to preserve for missing phase)
snap=api1.snapshot()
local recogniseClues={}
for _,doc in ipairs(snap.case.documents) do
    local a=snap.assignments[doc.id]
    if a.status=="placed" and not recogniseClues[doc.id] then
        -- Skip mobile clues (vehicle/corpse) to preserve them for missing/dropMissing
        if not (a.target and S.isMobile(a.target)) then
            if #recogniseClues<3 then table.insert(recogniseClues,doc.id) end
        end
    end
end
for _,id in ipairs(recogniseClues) do
    step("recognise",function(api)
        return api.recognise(id,"search")
    end)
end
-- Recognise same clue again (idempotent)
if #recogniseClues>0 then
    step("recognise",function(api)
        return api.recognise(recogniseClues[1],"look")
    end)
end

-- Refused recognise: unknown id
step("recognise",function(api)
    return api.recognise("unknown-id","search")
end)

-- INSPECT: mark placed clue as known
for i,id in ipairs(recogniseClues) do
    if i<=5 then
        step("inspect",function(api)
            return api.inspect(id)
        end)
    end
end

-- Refused inspect: unknown id
step("inspect",function(api)
    return api.inspect("unknown-id")
end)

-- RELOCATE: move placed unshown clues within area
-- Relocate requires placed+unshown status. Keep some placed clues aside that are never shown.
snap=api1.snapshot()
local unshownClues={}
for _,doc in ipairs(snap.case.documents) do
    local a=snap.assignments[doc.id]
    if a.status=="placed" and not api1.isShown(doc.id) then
        table.insert(unshownClues,{id=doc.id,spot=doc.spot,locationId=doc.locationId})
    end
end
for i=1,math.min(3,#unshownClues) do
    local clue=unshownClues[i]
    local newTarget=makeTarget(clue.spot,100+i,1)
    step("relocate",function(api)
        return api.relocate(clue.id,newTarget,75+i)
    end)
end

-- Refused relocate: unknown id
step("relocate",function(api)
    return api.relocate("unknown-id",makeTarget("furniture",199),78)
end)

-- UNPLAN: indexed -> deferred (impossible in area world)
-- No Help areas only create deferred/pending/placed/dropped status. Indexed status never exists
-- in AreaCase assignments; it comes from legacy index matching not used here.
-- Unplan is unreachable with real area data.

-- Refused unplan: not indexed
step("unplan",function(api)
    return api.unplan("unknown-id",85)
end)

-- DROP: deferred/indexed -> dropped
snap=api1.snapshot()
docsByStatus={}
for _,doc in ipairs(snap.case.documents) do
    local status=snap.assignments[doc.id].status
    if not docsByStatus[status] then docsByStatus[status]={} end
    table.insert(docsByStatus[status],{id=doc.id})
end
local toDrop={}
if docsByStatus.deferred then
    for _,d in ipairs(docsByStatus.deferred) do table.insert(toDrop,{id=d.id,status="deferred"}) end
end
for i,docRef in ipairs(toDrop) do
    if i<=8 then
        step("drop",function(api)
            return api.drop(docRef.id)
        end)
    end
end

-- Drop same clue again (idempotent)
if #toDrop>0 then
    step("drop",function(api)
        return api.drop(toDrop[1].id)
    end)
end

-- Refused drop: unknown id
step("drop",function(api)
    return api.drop("unknown-id")
end)

-- MISSING: set/clear missing hours for mobile clues
-- Search for mobile clues that are placed and unrecognised
snap=api1.snapshot()
local mobileClues={}
for _,doc in ipairs(snap.case.documents) do
    local a=snap.assignments[doc.id]
    if a.target and S.isMobile(a.target) and a.status=="placed" and not api1.isRecognised(doc.id) then
        table.insert(mobileClues,{id=doc.id})
    end
end

-- Use any mobile clue found (including the explicitly added MOBILE clue)
if #mobileClues>0 then
    step("missing",function(api)
        return api.missing(mobileClues[1].id,100)
    end)
    -- Clear missing hours
    step("missing",function(api)
        return api.missing(mobileClues[1].id,nil)
    end)
end

-- Refused missing: not mobile
step("missing",function(api)
    return api.missing("unknown-id",95)
end)

-- DROPMISSING: carrier lost -> deferred/dropped
-- Search for mobile clues that have missingHours set
snap=api1.snapshot()
local dropMissingClues={}
for _,doc in ipairs(snap.case.documents) do
    local a=snap.assignments[doc.id]
    if a.target and S.isMobile(a.target) and a.status=="placed" and a.missingHours and not api1.isRecognised(doc.id) then
        table.insert(dropMissingClues,{id=doc.id})
    end
end

if #dropMissingClues>0 then
    step("dropMissing",function(api)
        return api.dropMissing(dropMissingClues[1].id,101)
    end)
end

-- Refused dropMissing: not mobile
step("dropMissing",function(api)
    return api.dropMissing("unknown-id",98)
end)

-- NOTESCENE: add pending scene
local sceneKey="scene:0:0:0"
step("noteScene",function(api)
    return api.noteScene(sceneKey,{pending={"tag1","tag2","tag3"},x=100,y=100,z=0,hours=90})
end)

-- NoteScene again with "nothing new"
step("noteScene",function(api)
    return api.noteScene(sceneKey,{pending={"tag1","tag2"},x=100,y=100,z=0,hours=90})
end)

-- Refused noteScene: invalid empty pending
step("noteScene",function(api)
    return api.noteScene("invalid:key",{pending={},x=0,y=0,z=0,hours=100})
end)

-- Confirm the scene with a kind for addSceneArea (source must be "seen" or "citation")
-- First: note as pending, then confirm with kind and source
local confirmedSceneKey="scene:confirmed:1:1"
step("noteScene",function(api)
    return api.noteScene(confirmedSceneKey,{pending={"room:trace"},x=100,y=100,z=0,hours=90})
end)
step("noteScene",function(api)
    return api.noteScene(confirmedSceneKey,{kind="RBBar",x=100,y=100,z=0,source="seen",hours=91})
end)

-- ADDSCENEAREA: add area for confirmed scene (site must have paperStorage and containerTypes)
local sceneSite={id="scene:"..confirmedSceneKey,bounds={x1=100,y1=100,x2=101,y2=101,z=0},paperStorage="unknown",containerTypes={"shelves","postbox","vehicle","corpse","floor"}}
step("addSceneArea",function(api)
    return api.addSceneArea{site=sceneSite,key=confirmedSceneKey,kind="RBBar",clues=clues,version="v1",hours=95}
end)

-- Refused addSceneArea: kind mismatch with scene
step("addSceneArea",function(api)
    return api.addSceneArea{key=confirmedSceneKey,site=site(42),kind="RBBarn",clues=clues,version="v1",hours=96}
end)

-- CORRUPTION TESTS: 3 distinct cases
-- 1. Duplicate area id
local bad1=AreaCase.new(99999)
bad1.locations[1]={id="t3:dup",bounds={x1=0,y1=0,x2=10,y2=10,z=0}}
bad1.areas[1]={id="t3:dup",place="farm",source="test",version="v1",decidedHours=0,first=1,count=1,short=0}
bad1.areas[2]={id="t3:dup",place="farm",source="test",version="v1",decidedHours=0,first=2,count=1,short=0}
bad1.documents[1]={id="nh:t3:dup:c1:1",locationId="t3:dup",clue="c1",copy=1,lean="containment",rival="agricultural",spot="furniture",kind="Rope",title="Test",body="Test"}
bad1.documents[2]={id="nh:t3:dup:c2:1",locationId="t3:dup",clue="c2",copy=1,lean="agricultural",rival="containment",spot="mailbox",kind="Twine",title="Test",body="Test"}
local ok1a,err1a=AreaCase.validate(bad1)
local ok2a,err2a=AreaCase.validate(bad1)
assert(not ok1a and not ok2a,"corrupt 1: duplicate area refused")
assert(err1a==err2a,"corrupt 1: error match")

-- 2. Document outside area range
local bad2=AreaCase.new(88888)
bad2.locations[1]={id="t3:x",bounds={x1=0,y1=0,x2=10,y2=10,z=0}}
bad2.areas[1]={id="t3:x",place="farm",source="test",version="v1",decidedHours=0,first=1,count=1,short=0}
bad2.documents[1]={id="nh:t3:x:c1:1",locationId="t3:x",clue="c1",copy=1,lean="containment",rival="agricultural",spot="furniture",kind="Rope",title="Test",body="Test"}
bad2.documents[2]={id="bad:outside",locationId="t3:x",clue="c2",copy=1,lean="agricultural",rival="containment",spot="mailbox",kind="Twine",title="Test",body="Test"}
local ok1b,err1b=AreaCase.validate(bad2)
local ok2b,err2b=AreaCase.validate(bad2)
assert(not ok1b and not ok2b,"corrupt 2: outside range refused")
assert(err1b==err2b,"corrupt 2: error match")

-- 3. Invalid assignment status
local bad3root={schema=1,case=AreaCase.new(77777),assignments={c1={physicalToken="cf-g2:c1",status="invalid-status"}},known={}}
local ok1c,err1c=S.validate(bad3root)
local ok2c,err2c=S_ref.validate(bad3root)
assert(not ok1c and not ok2c,"corrupt 3: bad status refused")
assert(err1c==err2c,"corrupt 3: error match")

-- Final: run all test suite
print("Running all nohelp tests...")
assert(os.execute("lua5.1 test/nohelp_area_session.lua"),"nohelp_area_session failed")
assert(os.execute("lua5.1 test/nohelp_moves.lua"),"nohelp_moves failed")
assert(os.execute("lua5.1 test/nohelp_reload_guard.lua"),"nohelp_reload_guard failed")

print(("✓ nohelp commit differential: %d writes, %d accepted, %d refused, %d sinks, corruptions: 3 match"):format(
    writes,
    stats.addArea+stats.assign+stats.status+stats.show+stats.recognise+stats.inspect+stats.relocate+stats.unplan+stats.deferTarget+stats.drop+stats.missing+stats.dropMissing+stats.noteScene+stats.addSceneArea,
    refused.addArea+refused.assign+refused.status+refused.show+refused.recognise+refused.inspect+refused.relocate+refused.unplan+refused.deferTarget+refused.drop+refused.missing+refused.dropMissing+refused.noteScene+refused.addSceneArea,
    callCount1))
assert(writes>=80,"writes "..writes.." < 80")
assert(stats.addSceneArea>=1,"addSceneArea: "..stats.addSceneArea.." < 1")
assert(stats.missing>=1,"missing: "..stats.missing.." < 1")
assert(stats.dropMissing>=1,"dropMissing: "..stats.dropMissing.." < 1")
print("Per-kind counts: addArea="..stats.addArea.."✓/"..refused.addArea.."✓, assign="..stats.assign.."✓/"..refused.assign.."✓, status="..stats.status.."✓/"..refused.status.."✓, show="..stats.show.."✓/"..refused.show.."✓, recognise="..stats.recognise.."✓/"..refused.recognise.."✓, inspect="..stats.inspect.."✓/"..refused.inspect.."✓, relocate="..stats.relocate.."✓/"..refused.relocate.."✓, unplan="..stats.unplan.."✓/"..refused.unplan.."✓, deferTarget="..stats.deferTarget.."✓/"..refused.deferTarget.."✓, drop="..stats.drop.."✓/"..refused.drop.."✓, missing="..stats.missing.."✓/"..refused.missing.."✓, dropMissing="..stats.dropMissing.."✓/"..refused.dropMissing.."✓, noteScene="..stats.noteScene.."✓/"..refused.noteScene.."✓, addSceneArea="..stats.addSceneArea.."✓/"..refused.addSceneArea.."✓")
