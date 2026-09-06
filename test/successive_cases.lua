package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local A=require("ConspiracyFiles/Generated/SuccessiveCases")
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function root(seed)
 local c=assert(G.generate(catalog(),seed,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true})); local targets={}
 for _,site in ipairs(c.locations) do targets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,containerIndex=0,containerType="shelves",sprite="shelf_sprite"} end
 return assert(S.create(c,targets))
end
local first=root(17); local wrapper={canonical=first}; assert(A.validate(wrapper))
local opened=assert(S.open(first,function() end)); assert(opened.status(first.case.documents[1].id,"placed")); assert(opened.inspect(first.case.documents[1].id))
-- Simulate the existing runtime's committed first-case discovery before adding another case.
local retained=opened.snapshot(); wrapper={canonical=retained}
local second=root(18); local staged=assert(A.stage(wrapper,second)); assert(staged.canonical==retained,"legacy root is retained, not rebuilt")
assert(#A.sessions(staged)==2 and A.find(staged,retained.case.documents[1].id)==retained and A.find(staged,second.case.documents[1].id)==staged.successive.cases[1])
assert(#staged.canonical.known==1 and staged.canonical.case.documents[1].body==retained.case.documents[1].body,"old facts and discovery survive")
local duplicate=assert(S.create(second.case,(function() local t={} for id,a in pairs(second.assignments) do t[(function() for _,d in ipairs(second.case.documents) do if d.id==id then return d.locationId end end end)()]=a.target end return t end)()))
assert(not A.stage(staged,duplicate),"duplicate generated case is rejected atomically")
local failed=staged; local invalid={schema=1,case=second.case,assignments={},known={}}
assert(not A.stage(failed,invalid) and failed.canonical==retained and #failed.successive.cases==1,"failed save candidate preserves prior state")
local reload=assert(A.sessions(staged)); assert(#reload==2 and reload[1].known[1]==retained.known[1] and reload[2].case.caseId==second.case.caseId,"both cases reload")
print("PASS SuccessiveCases: additive legacy retention, global IDs, duplicate rejection, atomic refusal, and two-case reload")

local store={canonical=retained}
assert(A.current(store).canonical==retained,'legacy fallback readable')
store.campaign=staged;assert(A.current(store)==staged,'active campaign preferred')
assert(not A.current({canonical=retained,successive=staged.successive}),'undeployed sibling scheme refused')
local unknown=second.case.documents[1].id
staged.successive.discoveries[#staged.successive.discoveries+1]=unknown
assert(not A.validate(staged),'global order cannot grant unknown evidence')
table.remove(staged.successive.discoveries)
assert(A.validate(staged))
print('PASS campaign envelope and fabricated discovery rejection')
