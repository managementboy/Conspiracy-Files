-- NH-D3: Kill points K0 and K1 — reload guard.
-- K0: before the area decision is saved (after OnGameStart + decideNearby(), before ticks; #areas==0).
-- K1: after the clues are saved as waiting.
-- Both test reload + replay. Double-reload from K1 verifies no growth.
-- NOTE: targets are nil at these kill points (clues are only waiting); target preservation is checklist item B3.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path

local function deepCopy(t)
    if type(t)~="table" then return t end
    local copy={}
    for k,v in pairs(t) do copy[k]=deepCopy(v) end
    return copy
end

local boot=dofile("test/fixtures/nohelp_runtime_stub.lua")

-- Build doc id -> {kind, lean, areaId} map.
local function docsById(world)
    local map={}
    if not world or not world.case then return map end
    for i=1,#(world.case.documents or {}) do
        local d=world.case.documents[i]
        local areaId
        for j,a in ipairs(world.case.areas or {}) do
            if i>=a.first and i<a.first+a.count then areaId=a.id; break end
        end
        map[d.id]={kind=d.kind,lean=d.lean,areaId=areaId}
    end
    return map
end

-- Build doc id -> {status, target} map.
local function assignmentsById(world)
    local map={}
    if not world or not world.case then return map end
    for docId,a in pairs(world.assignments or {}) do
        map[docId]={status=a.status,target=a.target}
    end
    return map
end

-- Assert maps are equal both ways.
local function mapsEqual(golden, reload, label)
    for id,val in pairs(golden) do
        assert(reload[id], label.." missing id "..id)
        for k,v in pairs(val) do
            assert(reload[id][k]==v, label.." id "..id.." key "..k.." mismatch")
        end
    end
    for id,_ in pairs(reload) do
        assert(golden[id], label.." extra id "..id.." (no peek)")
    end
end

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

-- GOLDEN RUN
local store={}
local harness=boot(store)
local R=harness.R
harness.fire("OnGameStart")
local S=require("NHShared/Generated/Session")

assert(R.decideNearby()==true,"scan starts")
-- K0 snapshot: before ticks (areas not yet decided)
local K0_store=deepCopy(store)
assert(#K0_store["NHShared.Generated.G2"].campaign.canonical.case.areas==0,"K0 is before decision")

harness.probe.result=result
for _=1,20 do harness.fire("OnTick") end
local root=store["NHShared.Generated.G2"].campaign.canonical
assert(#root.case.areas==1 and root.case.areas[1].id=="t3:p1","area decided")
local waiting=0
for _,a in pairs(root.assignments or {}) do if a.status=="deferred" then waiting=waiting+1 end end
assert(waiting==#root.case.documents and waiting>0,"clues wait")

-- K1 snapshot: after decision and waiting
local K1_store=deepCopy(store)
local golden_root=K1_store["NHShared.Generated.G2"].campaign.canonical
local golden_docs=docsById(golden_root)
local golden_assigns=assignmentsById(golden_root)
local golden_seed=golden_root.case.seed
local golden_area_count=#golden_root.case.areas

-- RELOAD FROM K0
local reload0_store=deepCopy(K0_store)
local reload0_harness=boot(reload0_store)
local reload0_R=reload0_harness.R
reload0_harness.fire("OnGameStart")
assert(reload0_R.decideNearby()==true,"K0 replay: scan starts")
reload0_harness.probe.result=result
for _=1,20 do reload0_harness.fire("OnTick") end
local reload0_root=reload0_store["NHShared.Generated.G2"].campaign.canonical
local reload0_docs=docsById(reload0_root)
local reload0_assigns=assignmentsById(reload0_root)

mapsEqual(golden_docs, reload0_docs, "K0 reload docs")
mapsEqual(golden_assigns, reload0_assigns, "K0 reload assigns")
assert(#reload0_root.case.areas==golden_area_count, "K0 reload: no area growth")
assert(reload0_root.case.seed==golden_seed, "K0 reload: seed preserved")
assert(reload0_harness.getRolls()==0, "K0 reload: seed not redrawn")

-- RELOAD FROM K1
local reload1_store=deepCopy(K1_store)
local reload1_harness=boot(reload1_store)
local reload1_R=reload1_harness.R
reload1_harness.fire("OnGameStart")
local ok1,why1=reload1_R.decideNearby()
-- After K1 (clues already waiting), decideNearby should return true with no reason (already decided)
assert(ok1==true and why1==nil, "K1 replay: a fresh boot scans again (lastDecide is not saved); the area-count and doc checks below prove nothing is decided twice")
reload1_harness.probe.result=result
for _=1,20 do reload1_harness.fire("OnTick") end
local reload1_root=reload1_store["NHShared.Generated.G2"].campaign.canonical
local reload1_docs=docsById(reload1_root)
local reload1_assigns=assignmentsById(reload1_root)

mapsEqual(golden_docs, reload1_docs, "K1 reload docs")
mapsEqual(golden_assigns, reload1_assigns, "K1 reload assigns")
assert(#reload1_root.case.areas==golden_area_count, "K1 reload: no area growth")
assert(reload1_root.case.seed==golden_seed, "K1 reload: seed preserved")
assert(reload1_harness.getRolls()==0, "K1 reload: seed not redrawn")

-- DOUBLE-RELOAD FROM K1
local reload1b_store=deepCopy(reload1_store)
local reload1b_harness=boot(reload1b_store)
local reload1b_R=reload1b_harness.R
reload1b_harness.fire("OnGameStart")
local ok1b,why1b=reload1b_R.decideNearby()
assert(ok1b==true and why1b==nil, "double reload K1: a fresh boot scans again; the checks below prove nothing is decided twice")
reload1b_harness.probe.result=result
for _=1,20 do reload1b_harness.fire("OnTick") end
local reload1b_root=reload1b_store["NHShared.Generated.G2"].campaign.canonical
local reload1b_docs=docsById(reload1b_root)
local reload1b_assigns=assignmentsById(reload1b_root)

mapsEqual(reload1_docs, reload1b_docs, "double reload docs")
mapsEqual(reload1_assigns, reload1b_assigns, "double reload assigns")
assert(#reload1b_root.case.areas==#reload1_root.case.areas, "double reload: no area growth")
assert(reload1b_root.case.seed==golden_seed, "double reload: seed preserved")
assert(reload1b_harness.getRolls()==0, "double reload: seed not redrawn")

-- DOUBLE-RELOAD FROM K0: reload K0, replay to K1, snapshot, reload, replay
local reload0_k1_store=deepCopy(reload0_store)
-- Reconstruct K1 state from replay
local reload0_k1_harness=boot(reload0_k1_store)
local reload0_k1_R=reload0_k1_harness.R
reload0_k1_harness.fire("OnGameStart")
assert(reload0_k1_R.decideNearby()==true,"K0->K1 replay: scan starts")
reload0_k1_harness.probe.result=result
for _=1,20 do reload0_k1_harness.fire("OnTick") end
local reload0_k1_root=reload0_k1_store["NHShared.Generated.G2"].campaign.canonical

-- Now reload from that K1 and replay again
local reload0b_store=deepCopy(reload0_k1_store)
local reload0b_harness=boot(reload0b_store)
local reload0b_R=reload0b_harness.R
reload0b_harness.fire("OnGameStart")
local ok0b,why0b=reload0b_R.decideNearby()
assert(ok0b==true and why0b==nil, "double reload K0: a fresh boot scans again; the checks below prove nothing is decided twice")
reload0b_harness.probe.result=result
for _=1,20 do reload0b_harness.fire("OnTick") end
local reload0b_root=reload0b_store["NHShared.Generated.G2"].campaign.canonical
local reload0b_docs=docsById(reload0b_root)
local reload0b_assigns=assignmentsById(reload0b_root)
local reload0_k1_docs=docsById(reload0_k1_root)
local reload0_k1_assigns=assignmentsById(reload0_k1_root)

mapsEqual(reload0_k1_docs, reload0b_docs, "double reload K0 docs")
mapsEqual(reload0_k1_assigns, reload0b_assigns, "double reload K0 assigns")
assert(#reload0b_root.case.areas==#reload0_k1_root.case.areas, "double reload K0: no area growth")
assert(reload0b_root.case.seed==golden_seed, "double reload K0: seed preserved")
assert(reload0b_harness.getRolls()==0, "double reload K0: seed not redrawn")

print("nohelp reload guard: K0 and K1 reloads + replays preserve state, double reload stable")
