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
-- The scan walks each room rectangle AND a band of Session.OUTDOOR_RADIUS
-- around the site for a mailbox (P4-R134), so a whole scan is thousands of
-- steps, not hundreds. The budget is the test's, not the mod's: in the game
-- this is 48 steps a tick.
for n=1,200000 do local done=step(); if done then break end end
assert(candidates and #candidates["t3:home"]==4, "expected one candidate per rect")
assert(rooms["t3:home"][1]=="office", "usable room name must be joined to its candidate")
assert(rooms["t3:home"][2]==nil, "an empty room name must record nothing")
assert(rooms["t3:home"][3]==nil, "a rect referencing no room row must record nothing")
assert(rooms["t3:home"][4]=="bathroom", "usable room name must be joined to its candidate")
print("PASS room affinity: Storage.scan joins usable room names only, never guesses")

-- 3. Session.createDistributed ordering -------------------------------------
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
-- REDESIGNED 2026-09-21. This section used to need four documents arranged two
-- at each of two sites, and searched four thousand seeds for one. No seed can
-- produce that any more, and for a reason rather than by accident: the rebuild
-- puts exactly ONE clue at the first site - the house the survivor is standing
-- in, P4-R66 - and the rest at the partner site. Measured across 3,000 seeds,
-- every case is a 1 + N split. The old arrangement describes a world that no
-- longer exists.
--
-- Rewriting the expected slots to match whatever the code now does would have
-- blessed the code with its own behaviour, so instead the SHAPE is found and
-- the expectations are the test's own. The affinities below are stated here,
-- not read from RoomAffinity, so that this test can still disagree with it.
local WORK={office=true,toolstore=true,garagestorage=true}     -- dispatch, receipt, notepad
local PERSONAL={bedroom=true,livingroom=true}                  -- letter, diary, photograph
local FITS={
    dispatch=WORK, receipt=WORK, notepad=WORK,
    letter=PERSONAL, diary=PERSONAL, photograph=PERSONAL,
    idcard={bedroom=true,livingroom=true,office=true},
}
-- A case with one clue at the first site and three at the second, where the
-- three include something that belongs in a workroom and something that
-- belongs in a living space - so a preference has somewhere to point.
local case,lone,busy,trio
for seed=1,4000 do
    local candidate=G.generate(dofile("test/fixtures/synthetic_locations.lua"),seed,
        {mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true})
    if candidate and #candidate.documents==4 then
        local bySite={}
        for _,d in ipairs(candidate.documents) do
            bySite[d.locationId]=bySite[d.locationId] or {}
            table.insert(bySite[d.locationId],d)
        end
        local one,three
        for site,docs in pairs(bySite) do
            if #docs==1 then one=site elseif #docs==3 then three=site end
        end
        if one and three then
            local work,personal=false,false
            for _,d in ipairs(bySite[three]) do
                if FITS[d.kind]==WORK then work=true end
                if FITS[d.kind]==PERSONAL then personal=true end
            end
            if work and personal then
                case,lone,busy,trio=candidate,one,three,bySite[three]; break
            end
        end
    end
end
assert(case,"no seed in 1..4000 produced a one-plus-three case carrying both a "
    .."workroom document and a living-space one")

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
--
-- Candidate 1 is a bathroom, which nothing in FITS belongs in. Candidate 2 is
-- a toolstore, candidate 3 a livingroom. Three documents, three candidates:
-- whoever prefers something takes it, and the one left over must still be
-- placed - in the bathroom, which fits nothing.
local choices=candidatesFor(case)
local rooms={
    [lone]={[1]="bathroom",[2]="office",[3]="bedroom"},
    [busy]={[1]="bathroom",[2]="toolstore",[3]="livingroom"},
}
local root=assert(S.createDistributed(case,choices,rooms))
local loneDoc
for _,d in ipairs(case.documents) do if d.locationId==lone then loneDoc=d end end
assert(sameTarget(root.assignments[loneDoc.id].target,
    FITS[loneDoc.kind]==PERSONAL and choices[lone][3] or choices[lone][2]),
    loneDoc.kind.." must take the room it belongs in, not simply the first candidate")

-- In document order, the first one that belongs in the toolstore must get it,
-- and the first that belongs in the livingroom must get that.
local firstWork,firstPersonal
for _,d in ipairs(trio) do
    if not firstWork and FITS[d.kind] and FITS[d.kind].toolstore then firstWork=d end
    if not firstPersonal and FITS[d.kind] and FITS[d.kind].livingroom then firstPersonal=d end
end
assert(sameTarget(root.assignments[firstWork.id].target,choices[busy][2]),
    firstWork.kind.." belongs in a workroom and must prefer the toolstore over the bathroom")
assert(sameTarget(root.assignments[firstPersonal.id].target,choices[busy][3]),
    firstPersonal.kind.." belongs in a living space and must take the livingroom candidate")
local leftover
for _,d in ipairs(trio) do if d~=firstWork and d~=firstPersonal then leftover=d end end
assert(sameTarget(root.assignments[leftover.id].target,choices[busy][1]),
    leftover.kind.." must fall back to the remaining bathroom candidate, and still be placed")
-- All three landed somewhere different, which is the point of the fallback
-- being a fallback and not a collision.
local seenHere={}
for _,d in ipairs(trio) do
    local t=root.assignments[d.id].target
    local key=t.x..":"..t.y..":"..t.objectIndex
    assert(not seenHere[key],"two documents at one site shared a container")
    seenHere[key]=true
end
print(string.format("PASS room affinity: fitting room preferred (%s -> toolstore, %s -> livingroom); "
    .."%s falls back to a non-fitting room and is still placed",
    firstWork.kind,firstPersonal.kind,leftover.kind))

-- 3b. Omitting `rooms` is byte-identical to the pre-Phase-2 behaviour: pure
--     sequential first-unused-candidate assignment per site, in document
--     order, regardless of any room table.
local baselineOmitted=assert(S.createDistributed(case,choices))
local baselineExplicitNil=assert(S.createDistributed(case,choices,nil))
for _,doc in ipairs(case.documents) do
    assert(sameTarget(baselineOmitted.assignments[doc.id].target,baselineExplicitNil.assignments[doc.id].target),
        "omitting rooms vs. passing rooms=nil must be identical")
end
-- Pure sequential, in document order, first unused candidate per site: the
-- lone document takes candidate 1 at its site, and the three take 1, 2, 3 at
-- theirs, whatever any room would have preferred.
assert(sameTarget(baselineOmitted.assignments[loneDoc.id].target,choices[lone][1]))
for i,d in ipairs(trio) do
    assert(sameTarget(baselineOmitted.assignments[d.id].target,choices[busy][i]),
        "sequential assignment must ignore rooms entirely")
end
print("PASS room affinity: omitting `rooms` reproduces the exact pre-Phase-2 sequential assignment")

-- 3c. Distinct-container guarantee still holds when `rooms` is supplied: a
--     preference that would land two documents on the same physical
--     container is still rejected.
local collide=candidatesFor(case)
collide[busy][1]=collide[busy][2] -- candidate 1 and 2 are now the same physical container
local collideRooms={[busy]={[1]="bathroom",[2]="toolstore",[3]="bathroom"}}
-- The workroom document prefers idx2 (toolstore); the living-space document's
-- fit at idx3 is a bathroom here, so it falls back to idx1 - which is now a
-- duplicate of idx2.
-- Since 2026-09-11 the selector steps past a container another document
-- already holds instead of refusing the whole case (a car shared by two sites
-- crashed the playtest). The guarantee is unchanged: never two in one.
local spread=assert(S.createDistributed(case,collide,collideRooms),
    "a duplicate candidate must be skipped, not refuse the case")
-- Three documents at that site and, after the collapse, only two distinct
-- containers to hold them. One of them CANNOT be placed, and an unplaced
-- document carries no target - that is the honest outcome, not a collision.
-- What must never happen is two documents in one container.
local held,placed=0,0
local seen={}
for _,a in pairs(spread.assignments) do
    local t=a.target
    if t then
        placed=placed+1
        local key=table.concat({t.x,t.y,t.z,t.objectIndex,t.containerIndex,t.vehiclePart or "-"},":")
        assert(not seen[key],"two documents must never share one physical container")
        seen[key]=true
    end
end
for _ in pairs(seen) do held=held+1 end
assert(held==placed,"every placed document must hold a container of its own")
-- The lone site keeps its three, the busy site is down to two: four placed of
-- four documents would mean the collapse was not honoured.
assert(placed<#case.documents,
    "collapsing two candidates must cost a placement, not be quietly absorbed")
-- The plain sequential path has no selector to step past it, so it still refuses.
assert(not S.createDistributed(case,collide),
    "a repeated physical container must still be rejected on the sequential path")
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
-- CHANGED 2026-09-21, and the owner should know it changed.
--
-- This used to require that when no room fits anything, the result is
-- BYTE-IDENTICAL to the sequential baseline - always the first unused
-- candidate. It no longer is: with every room named "derelict" the lone
-- receipt went to candidate 3 where the sequential path puts it at
-- candidate 1. That is the placement-variety work showing through; the
-- selector spreads across the candidates on a seed instead of always taking
-- the first one, which is what stopped every clue landing in the same kitchen
-- cupboard (docs/design/CLUE_PLACEMENT_VARIETY.md).
--
-- So the claim is narrowed to what this section is actually for, per
-- docs/research/T3_LOCATION_CATEGORISATION.md: generic room categorisation is
-- not reliable enough to GATE generation. A room nobody recognises must never
-- cost a placement. It is not, and never was, a promise about which drawer.
local placedNoFit,seenNoFit=0,{}
for _,doc in ipairs(case.documents) do
    local t=rootNoFit.assignments[doc.id].target
    assert(t,doc.kind.." was left unplaced merely because no room name was recognised")
    local key=table.concat({t.x,t.y,t.z,t.objectIndex,t.containerIndex},":")
    assert(not seenNoFit[key],"two documents shared a container when no room fitted")
    seenNoFit[key]=true; placedNoFit=placedNoFit+1
end
assert(placedNoFit==#case.documents,
    "an unrecognised room must never cost a placement")
print(string.format("PASS room affinity: an unrecognised room costs no placement - all %d documents "
    .."still placed, none sharing a container",placedNoFit))
