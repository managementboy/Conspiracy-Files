package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")

local catalog=dofile("test/fixtures/synthetic_locations.lua")
local case=assert(G.generate(catalog,1,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}))
local sites={}
for _,site in ipairs(case.locations) do sites[site.id]=site end
local plannedId=case.documents[1].id
local documentTargets={}
for index,doc in ipairs(case.documents) do
    local site=sites[doc.locationId]
    if doc.id==plannedId then
        documentTargets[doc.id]={buildingId=site.id,x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,
            sprite="fixture_indexed",containerType=site.containerTypes[1],room="office",indexed=true}
    else
        documentTargets[doc.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=index,
            containerIndex=0,containerType=site.containerTypes[1],sprite="fixture_live_"..index}
    end
end

local root=assert(S.create(case,nil,documentTargets,40))
assert(S.validate(root))
assert(#S.indexedIds(root)==1 and S.indexedIds(root)[1]==plannedId)
local assignment=root.assignments[plannedId]
assert(assignment.status=="indexed" and assignment.target==nil and assignment.planned.indexed,
    "an indexed plan is canonical but is not yet an exact live target")
assert(#S.expiredIds(root,40+S.DEFER_EXPIRE_HOURS-0.1)==0)
assert(S.expiredIds(root,40+S.DEFER_EXPIRE_HOURS)[1]==plannedId,
    "indexed waiting time shares the bounded deferred expiry")

local api=assert(S.open(root,function() end))
local exact={x=assignment.planned.x,y=assignment.planned.y,z=assignment.planned.z,objectIndex=3,containerIndex=0,
    containerType=assignment.planned.containerType,sprite=assignment.planned.sprite}
assert(api.assign(plannedId,exact,41))
assignment=api.assignment(plannedId)
assert(assignment.status=="pending" and assignment.planned==nil and assignment.target.objectIndex==3,
    "live validation turns a compact plan into the ordinary exact-once placement path")

local fallback=assert(S.create(case,nil,documentTargets,40))
local fallbackApi=assert(S.open(fallback,function() end))
assert(fallbackApi.unplan(plannedId,50))
assignment=fallbackApi.assignment(plannedId)
assert(assignment.status=="deferred" and assignment.planned==nil and assignment.deferredHours==40,
    "a stale index uses modified-building fallback without restarting its expiry clock")

local dropped=assert(S.create(case,nil,documentTargets,40))
local droppedApi=assert(S.open(dropped,function() end))
assert(droppedApi.drop(plannedId))
assert(S.validate(droppedApi.snapshot()) and droppedApi.assignment(plannedId).planned==nil,
    "an expired indexed plan can retire without retaining placement details")

print("PASS fixed container session: indexed wait, live assignment, modified-building fallback and bounded expiry")
