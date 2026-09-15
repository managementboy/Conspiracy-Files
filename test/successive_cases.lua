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

-- currentCached revalidates only when the stored tables change or the cache is
-- ten minutes old (the map markers called current() several times a frame).
do
    local calls, real = 0, A.current
    A.current = function(store) calls = calls + 1; return real(store) end
    local store = { campaign = { canonical = {} } }
    A.currentCached(store, 1000); A.currentCached(store, 1500); A.currentCached(store, 2000)
    assert(calls == 1, "same tables within a minute: validated once, got " .. calls)
    store.campaign = { canonical = {} }
    A.currentCached(store, 2500)
    assert(calls == 2, "a write replaces the table, so it validates again")
    A.currentCached(store, 2500 + A.CACHE_MS + 1)
    assert(calls == 3, "and again once the cache is ten minutes old")
    A.current = real
    print("PASS successive cases: current() is cached until the store changes")
end

-- A reshuffle replaces every case in the save the player is standing in, so
-- the ids and tokens of what is already lying in the world must be captured
-- BEFORE the swap: afterwards nothing knows those papers exist. Retired cases
-- count too - their documents were placed in the world like any other.
local manifest = assert(A.abandon(staged))
local documents = 0
for _, r in ipairs(A.sessions(staged)) do documents = documents + #r.case.documents end
assert(#manifest.documentIds == documents,
    'every document of every case is listed, got ' .. #manifest.documentIds .. ' of ' .. documents)
assert(#manifest.physicalTokens == documents, 'every live document contributes its physical token')
assert(#manifest.caseIds == 2, 'both cases are named')
local seen = {}
for _, id in ipairs(manifest.documentIds) do
    assert(not seen[id], 'a document is listed once'); seen[id] = true
    assert(A.find(staged, id), 'a listed document really belongs to this store')
end
assert(not A.abandon(nil), 'no store, no manifest')
assert(#A.abandon({canonical = first}).documentIds == #first.case.documents, 'a single-case store lists its own')
print('PASS SuccessiveCases: a reshuffle can name every paper it is about to abandon')
