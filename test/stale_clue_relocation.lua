package.path="mod/common/media/lua/shared/?.lua;"..package.path
-- Stale clue relocation (docs/management/STALE_CLUE_RELOCATION.md): staleness
-- boundary, untouched-item guard, player-carrying guard, no-candidate case,
-- relocation cap, and the discovery ledger left untouched throughout.
local G=require("ConspiracyFiles/Generated/Generator")
local S=require("ConspiracyFiles/Generated/Session")
local SC=require("ConspiracyFiles/StaleClue")
local Ledger=require("ConspiracyFiles/DiscoveryLedger")

local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local case=assert(G.generate(catalog(),17,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}))
assert(#case.locations==2,"fixture must generate the standard two-location case")
local siteA,siteB=case.locations[1],case.locations[2]
local function targetAt(site,slot)
    return {x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=slot or 0,containerIndex=0,containerType=site.containerTypes[1],sprite="fixture"}
end
local targets={[siteA.id]=targetAt(siteA,0),[siteB.id]=targetAt(siteB,0)}

-- Locate one document at each site (Generator always seats document 1 at the
-- first site and document 2 at the second).
local docA,docB
for _,d in ipairs(case.documents) do
    if d.locationId==siteA.id and not docA then docA=d.id end
    if d.locationId==siteB.id and not docB then docB=d.id end
end
assert(docA and docB,"fixture must place a document at each of the two sites")

------------------------------------------------------------------
-- Staleness boundary, discovery guard, and non-placed statuses.
------------------------------------------------------------------
do
    local root=assert(S.create(case,targets))
    local api=assert(S.open(root,function() end))
    assert(api.status(docA,"placing")); assert(api.status(docA,"placed",100))
    assert(api.status(docB,"placing")); assert(api.status(docB,"placed",100))

    local snap=api.snapshot()
    assert(#SC.staleIds(snap,100+S.RELOCATE_AFTER_HOURS-1)==0,"not yet stale one hour short of the threshold")
    local stale=SC.staleIds(snap,100+S.RELOCATE_AFTER_HOURS)
    assert(#stale==2 and stale[1]==docA and stale[2]==docB,"both undiscovered placed documents are stale exactly at the threshold")

    -- Discovery removes a document from staleness forever, however old it gets.
    assert(api.inspect(docA))
    snap=api.snapshot()
    stale=SC.staleIds(snap,100+5000)
    assert(#stale==1 and stale[1]==docB,"a discovered document is never relocated")

    -- A sticky conflict (and by the same rule: pending/placing/unknown) is
    -- never a relocation candidate no matter how much time passes.
    assert(api.status(docB,"conflict"))
    snap=api.snapshot()
    assert(#SC.staleIds(snap,100+5000)==0,"a non-placed assignment is never relocated")
    print("PASS staleness boundary, discovery guard, and non-placed statuses")
end

------------------------------------------------------------------
-- Untouched-item guard, player-carrying guard, and proximity guard: all
-- pure predicates over plain numbers/booleans, no engine access at all.
------------------------------------------------------------------
do
    assert(SC.canRelocate(1,0),"exactly one match at the original container and nothing carried is safe")
    assert(not SC.canRelocate(0,0),"the original container no longer shows the item")
    assert(not SC.canRelocate(2,0),"a duplicate at the original container is ambiguous, never safe")
    assert(not SC.canRelocate(1,1),"the same token also found on the player refuses the move -- they may be carrying it")
    assert(not SC.canRelocate(0,1),"carried and missing from the original container both refuse the move")

    local t=targetAt(siteA,0)
    assert(SC.tooClose(t.x,t.y,t.z,t),"standing on the target itself is too close")
    assert(SC.tooClose(t.x+SC.PROXIMITY_GUARD_TILES,t.y,t.z,t),"exactly at the guard radius is still too close")
    assert(not SC.tooClose(t.x+SC.PROXIMITY_GUARD_TILES+1,t.y,t.z,t),"one tile past the guard radius is clear")
    assert(not SC.tooClose(t.x,t.y,t.z+1,t),"a different floor is never close, regardless of x/y")
    print("PASS untouched-item guard, player-carrying guard, and proximity guard")
end

------------------------------------------------------------------
-- No-candidate case: the only other site is occupied by another placed
-- clue, so relocation must do nothing rather than double up a building.
-- Freeing that clue, or marking the site visited, changes the outcome.
------------------------------------------------------------------
do
    local root=assert(S.create(case,targets))
    local api=assert(S.open(root,function() end))
    assert(api.status(docB,"placing")); assert(api.status(docB,"placed",0))
    assert(api.status(docA,"placing")); assert(api.status(docA,"placed",0))

    local snap=api.snapshot()
    assert(#SC.destinations(snap,{})==0,"the only other site is occupied by docA; no candidate exists")

    assert(api.status(docA,"unknown"))
    snap=api.snapshot()
    local free=SC.destinations(snap,{})
    assert(#free==1 and free[1].id==siteA.id,"the vacated, unvisited site becomes the sole candidate")
    assert(#SC.destinations(snap,{[siteA.id]=true})==0,"a visited building is never offered as a destination")
    print("PASS no-candidate case: occupancy and visited-building destination guards")
end

------------------------------------------------------------------
-- Relocation cap: api.relocate keeps status "placed", moves the target to a
-- different site, resets placedHours, and refuses once the per-document cap
-- is reached. It also refuses a document that is not currently placed.
------------------------------------------------------------------
do
    local root=assert(S.create(case,targets))
    local api=assert(S.open(root,function() end))
    assert(api.status(docB,"placing")); assert(api.status(docB,"placed",0))

    local ledger=assert(Ledger.record(Ledger.empty(),"evidence","unrelated-fixture",5))
    local ledgerEventsBefore,ledgerNextSeqBefore=#ledger.events,ledger.nextSeq

    local moved=targetAt(siteA,9)
    for i=1,S.RELOCATE_CAP do
        local before=api.assignment(docB).relocations
        assert(api.relocate(docB,moved,1000+i),"relocation "..i.." must succeed within the cap")
        local after=api.assignment(docB)
        assert(after.relocations==before+1,"relocation counter must increment by exactly one")
        assert(after.status=="placed","relocation must never reset placement")
        assert(after.placedHours==1000+i,"relocation must reset the staleness clock to the supplied hours")
        assert(after.target.objectIndex==9 and after.locationId==siteA.id,"relocation must move the physical target to the new site")
    end
    assert(api.assignment(docB).relocations==S.RELOCATE_CAP)
    assert(not api.relocate(docB,moved,9999),"the relocation cap refuses a further move")
    assert(api.assignment(docB).relocations==S.RELOCATE_CAP,"a refused relocation must not advance the counter")

    assert(not api.relocate(docA,moved,1),"relocation refuses a document that is not currently placed")

    assert(#ledger.events==ledgerEventsBefore and ledger.nextSeq==ledgerNextSeqBefore and ledger.events[1].ref=="unrelated-fixture",
        "the discovery ledger is never touched by relocation")
    print("PASS relocation cap, atomic target/placedHours update, and untouched discovery ledger")
end
