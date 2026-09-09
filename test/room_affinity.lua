-- Phase 2 of docs/design/USING_GAME_ASSETS.md: "room labels constrain roles".
-- Standalone, in the style of test/storage_candidates.lua and
-- test/discovery_ledger.lua. Covers:
--  1. Generated/RoomAffinity.fits: direct unit behaviour.
--  2. Generated/Storage.scan: room-name extraction, joined by building+room
--     ordinal, with an unusable/absent name recorded as nothing (never a
--     guess).
--  3. Generated/Session.createDistributed: a fitting room is preferred; a
--     document falls back to the first unused candidate when nothing fits
--     and generation still succeeds; omitting `rooms` is byte-identical to
--     the pre-Phase-2 behaviour; distinct-container/repeated-container
--     guarantees still hold; a case where NO room fits anything still
--     succeeds, identically to the omitted-rooms case.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

-- 1. RoomAffinity direct checks -------------------------------------------
local RoomAffinity=require("ConspiracyFiles/Generated/RoomAffinity")
assert(RoomAffinity.fits("dispatch","office")==true)
assert(RoomAffinity.fits("dispatch","bathroom")==false)
assert(RoomAffinity.fits("diary","bedroom")==true)
assert(RoomAffinity.fits("idcard","livingroom")==true)
assert(RoomAffinity.fits("idcard","toolstore")==false)
assert(RoomAffinity.fits("not-a-real-kind","office")==false, "unknown kind must never fit")
assert(RoomAffinity.fits("dispatch",nil)==false, "absent room must never fit")
assert(RoomAffinity.fits("dispatch",42)==false, "non-string room must never fit")
print("PASS room affinity: direct fits() checks")

-- 2. Storage.scan room extraction ------------------------------------------
local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
local xs={0,2,4,6}
local objects,containers={},{}
for _,x in ipairs(xs) do
    local c={getType=function() return "desk" end}
    containers[x]=c
    objects[x]={getContainerCount=function() return 1 end,getContainerByIndex=function() return c end,
        getSprite=function() return {getName=function() return "furniture" end} end}
end
package.preload["ConspiracyFiles/WorldAccess"]=function() return {resolve=function(t) return containers[t.x] end} end
getCell=function() return {getGridSquare=function(_,x,y,z) return {getObjects=function() return list{objects[x]} end} end} end
local result={version="T3-nearby-2",buildings=1,map="mock",gameVersion="42.20",rows={
    {kind="building",id="home",x=0,y=0,x2=10,y2=2,minLevel=0},
    -- ordinal=1 "office": usable name, has a matching rect.
    {kind="room",building="home",ordinal=1,name="office",x=0,y=0,x2=2,y2=2,z=0,area=4},
    {kind="rect",building="home",room=1,x=0,y=0,z=0,w=1,h=1},
    -- ordinal=2: unusable (empty) name -- must record nothing, never guess.
    {kind="room",building="home",ordinal=2,name="",x=2,y=0,x2=4,y2=2,z=0,area=4},
    {kind="rect",building="home",room=2,x=2,y=0,z=0,w=1,h=1},
    -- room=99 references no room row at all -- also nothing recorded.
    {kind="rect",building="home",room=99,x=4,y=0,z=0,w=1,h=1},
    -- ordinal=3 "bathroom": usable name, has a matching rect.
    {kind="room",building="home",ordinal=3,name="bathroom",x=6,y=0,x2=8,y2=2,z=0,area=4},
    {kind="rect",building="home",room=3,x=6,y=0,z=0,w=1,h=1},
}}
local Storage=require("ConspiracyFiles/Generated/Storage")
local catalog,targets,candidates,rooms
local step=assert(Storage.scan(result,function(a,b,c,d) catalog,targets,candidates,rooms=a,b,c,d end))
for n=1,1000 do local done=step(); if done then break end end
assert(candidates and #candidates["t3:home"]==4, "expected one candidate per rect")
assert(rooms["t3:home"][1]=="office", "usable room name must be joined to its candidate")
assert(rooms["t3:home"][2]==nil, "an empty room name must record nothing")
assert(rooms["t3:home"][3]==nil, "a rect referencing no room row must record nothing")
assert(rooms["t3:home"][4]=="bathroom", "usable room name must be joined to its candidate")
print("PASS room affinity: Storage.scan joins usable room names only, never guesses")

-- 3. Session.createDistributed ordering -------------------------------------
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
-- Seed 395 against the shared synthetic fixture deterministically produces:
--   document-1 dispatch    @ synthetic-site-06
--   document-2 receipt     @ synthetic-site-04
--   document-3 notepad     @ synthetic-site-04
--   document-4 idcard      @ synthetic-site-06
-- with 2 required distinct containers at each of synthetic-site-06/-04.
-- The seed moved from 17 to 395 when Phase 3 added three roles to the optional
-- pool (2026-09-09): a wider pool changes both which documents a given seed
-- draws and how many, and twenty premises (2026-09-09) shifted every draw
-- again. Pinning a seed made this test re-pin on every generator change, so it
-- now SEARCHES for the shape it needs - four documents, these four carriers,
-- the pairs on one site each - instead of asserting that one seed still
-- produces it. This test is about room-aware placement, not about which seed
-- happens to produce the arrangement.
local case,byKind
for seed=1,4000 do
    local candidate=G.generate(dofile("test/fixtures/synthetic_locations.lua"),seed,
        {mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true})
    if candidate and #candidate.documents==4 then
        local k={}
        for _,d in ipairs(candidate.documents) do k[d.kind]=d end
        if k.dispatch and k.receipt and k.notepad and k.idcard
            and k.dispatch.locationId==k.idcard.locationId
            and k.receipt.locationId==k.notepad.locationId then
            case,byKind=candidate,k; break
        end
    end
end
assert(case,"no seed in 1..4000 produced the four-document arrangement this test needs")
local dispatchSite,idcardSite=byKind.dispatch.locationId,byKind.idcard.locationId
local receiptSite,notepadSite=byKind.receipt.locationId,byKind.notepad.locationId
assert(dispatchSite==idcardSite and receiptSite==notepadSite, "fixture assumption changed; update this test")

local function candidatesFor(case)
    local choices={}
    for _,site in ipairs(case.locations) do
        choices[site.id]={}
        for i=1,3 do
            choices[site.id][i]={x=site.bounds.x1+i-1,y=site.bounds.y1,z=site.bounds.z,
                objectIndex=i-1,containerIndex=0,containerType=site.containerTypes[1],sprite="s"}
        end
    end
    return choices
end
local function sameTarget(a,b) return a and b and a.x==b.x and a.y==b.y and a.z==b.z and a.objectIndex==b.objectIndex and a.containerIndex==b.containerIndex end

-- 3a. Fitting room preferred; falls back to a non-fitting room when nothing
--     fits; generation still succeeds either way.
local choices=candidatesFor(case)
local rooms={
    [dispatchSite]={[1]="bathroom",[2]="office",[3]="bedroom"},
    [receiptSite]={[1]="toolstore",[2]="bedroom"}, -- [3] left unset: absent name, never guessed
}
local root=assert(S.createDistributed(case,choices,rooms))
assert(sameTarget(root.assignments[byKind.dispatch.id].target,choices[dispatchSite][2]),
    "dispatch (office/toolstore/garagestorage) must prefer the office candidate over the bathroom one")
assert(sameTarget(root.assignments[byKind.idcard.id].target,choices[dispatchSite][3]),
    "idcard (bedroom/livingroom/office) must take the remaining fitting bedroom candidate")
assert(sameTarget(root.assignments[byKind.receipt.id].target,choices[receiptSite][1]),
    "receipt (office/toolstore/garagestorage) must prefer the toolstore candidate")
assert(sameTarget(root.assignments[byKind.notepad.id].target,choices[receiptSite][2]),
    "notepad must fall back to the first unused (non-fitting) candidate when nothing fits, and still succeed")
print("PASS room affinity: fitting room preferred; safe fallback to a non-fitting room when nothing fits")

-- 3b. Omitting `rooms` is byte-identical to the pre-Phase-2 behaviour: pure
--     sequential first-unused-candidate assignment per site, in document
--     order, regardless of any room table.
local baselineOmitted=assert(S.createDistributed(case,choices))
local baselineExplicitNil=assert(S.createDistributed(case,choices,nil))
for _,doc in ipairs(case.documents) do
    assert(sameTarget(baselineOmitted.assignments[doc.id].target,baselineExplicitNil.assignments[doc.id].target),
        "omitting rooms vs. passing rooms=nil must be identical")
end
assert(sameTarget(baselineOmitted.assignments[byKind.dispatch.id].target,choices[dispatchSite][1]))
assert(sameTarget(baselineOmitted.assignments[byKind.idcard.id].target,choices[dispatchSite][2]))
assert(sameTarget(baselineOmitted.assignments[byKind.receipt.id].target,choices[receiptSite][1]))
assert(sameTarget(baselineOmitted.assignments[byKind.notepad.id].target,choices[receiptSite][2]))
print("PASS room affinity: omitting `rooms` reproduces the exact pre-Phase-2 sequential assignment")

-- 3c. Distinct-container guarantee still holds when `rooms` is supplied: a
--     preference that would land two documents on the same physical
--     container is still rejected.
local collide=candidatesFor(case)
collide[dispatchSite][1]=collide[dispatchSite][2] -- candidate 1 and 2 are now the same physical container
local collideRooms={[dispatchSite]={[1]="bathroom",[2]="office",[3]="bathroom"}}
-- dispatch prefers idx2 (office); idcard's only remaining fit (idx3) is
-- removed above so it falls back to idx1, which is now a duplicate of idx2.
assert(not S.createDistributed(case,collide,collideRooms),
    "a repeated physical container must still be rejected when rooms are supplied")
print("PASS room affinity: distinct-container / repeated-container guarantees still hold")

-- 3d. A case where NO room fits anything for any document must still
--     succeed, and must fall back to the exact same assignment as the
--     omitted-rooms baseline -- proving the preference never blocks
--     placement (docs/research/T3_LOCATION_CATEGORISATION.md: generic
--     categorisation is not reliable enough to gate generation).
local noFit=candidatesFor(case)
local noFitRooms={}
for _,site in ipairs(case.locations) do
    noFitRooms[site.id]={}
    for i=1,3 do noFitRooms[site.id][i]="derelict" end -- fits no kind in RoomAffinity
end
local rootNoFit=assert(S.createDistributed(case,noFit,noFitRooms), "generation must never fail because no room fits")
for _,doc in ipairs(case.documents) do
    assert(sameTarget(rootNoFit.assignments[doc.id].target,baselineOmitted.assignments[doc.id].target),
        "when nothing fits anywhere, assignment must match the sequential fallback exactly")
end
print("PASS room affinity: generation never fails when no room fits anything; fallback matches baseline exactly")
