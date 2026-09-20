-- WHOLE-SAVE BUDGET FIXTURE for the map mechanism
-- (MAP_MECHANISM_REVIEW_2026-09-20.md item 1: "a whole-save budget fixture
-- covering the intended catalogue and retained discoveries, with a justified
-- reserve").
--
-- The plan's revision 2 claimed 88,460 bytes were available to the discovery
-- ledger and 50 events were spare after ordinary cases. Both figures were
-- derived by subtraction from a budget the campaign store had already been
-- measured against, so they double-counted the ledger the campaign test
-- already includes, and they ignored the headroom test/case_archive.lua
-- requires. This fixture measures instead of subtracting.
--
-- The reserve is justified, not chosen: test/case_archive.lua asserts the
-- 16-case archive must leave at least the 17,567 bytes the ten-case cap it
-- replaced left spare. The map feature may spend what is left AFTER that
-- reserve, or the archive becomes tighter than the thing it replaced.
--
-- Run under PUC Lua 5.1: `lua5.1 test/map_feature_budget.lua`
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local V=require("ConspiracyFiles/Validator")
local Session=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")
local Ledger=require("ConspiracyFiles/DiscoveryLedger")

local OPTS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end

-- The intended catalogue, from docs/research/vanilla-print-2026-09-19/.
local DESIGNS=125          -- annotated maps with resolved marks
local FRAGMENTS=3          -- local trail fragments a trail, the plan's sample
local RESERVE=17567        -- test/case_archive.lua's headroom assertion

-- 1. The campaign at its worst, measured the same way case_archive.lua does --
-- Same construction, deliberately duplicated rather than shared: this fixture
-- must keep measuring the real worst case even if the archive test changes.
local pool={}
for seed=1,1000 do
    local case=G.generate(catalog(),seed,{mapId=OPTS.mapId,buildLine=OPTS.buildLine,allowSynthetic=true,
        steer={fromCase=string.rep("c",Retired.CASE_ID_MAX),reading="one",way="listen",
            organisation=string.rep("o",G.STEER_ORG_MAX)}})
    if case then
        local targets={}
        for _,site in ipairs(case.locations) do
            targets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
                containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
        end
        local root=assert(Session.create(case,targets))
        local ids={}
        for i,doc in ipairs(case.documents) do ids[i]=doc.id end
        root.known=ids
        local seen={}
        for _,doc in ipairs(case.documents) do seen[doc.id]=string.rep("x",Retired.LAST_SEEN_MAX) end
        local full=assert(Retired.retire(root,seen,1))
        full.offered.people={string.rep("n",Retired.NAME_MAX),string.rep("m",Retired.NAME_MAX)}
        full.offered.organisation=string.rep("o",Retired.ORG_MAX)
        full.answers={reading="unsure",matters="organisation",way="records",
            changedHours=123456.75,usedBy=string.rep("u",Retired.CASE_ID_MAX)}
        assert(Retired.validate(full))
        local stub=assert(Retired.shrink(full))
        pool[#pool+1]={live=root,liveBytes=V.estimateEncodedBytes(root),
            full=full,fullBytes=V.estimateEncodedBytes(full),
            stub=stub,stubBytes=V.estimateEncodedBytes(stub)}
    end
end
assert(#pool>=100,"needed a real sample of generated cases, got "..#pool)
local function take(p,key,n)
    table.sort(p,function(a,b) return a[key]>b[key] end)
    local taken,rest={},{}
    for i,e in ipairs(p) do if i<=n then taken[#taken+1]=e else rest[#rest+1]=e end end
    return taken,rest
end
local stubCount=Cases.MAX_CASES-Cases.MAX_ACTIVE-Cases.MAX_FULL_ARCHIVED
local liveSet,rest=take(pool,"liveBytes",Cases.MAX_ACTIVE)
local fullSet,rest2=take(rest,"fullBytes",Cases.MAX_FULL_ARCHIVED)
local stubSet=take(rest2,"stubBytes",stubCount)
local ordered={}
for _,e in ipairs(stubSet) do ordered[#ordered+1]=e.stub end
for _,e in ipairs(fullSet) do ordered[#ordered+1]=e.full end
for _,e in ipairs(liveSet) do ordered[#ordered+1]=e.live end
local order,hours={},{}
for i,root in ipairs(ordered) do
    hours[i]=i*24
    for _,id in ipairs(root.known) do order[#order+1]=id end
end
local cases={}
for i=2,#ordered do cases[i-1]=ordered[i] end
local worstSave={canonical=ordered[1],successive={schema=1,cases=cases,discoveries=order},
    schedule={schema=1,createdHours=hours}}
assert(Cases.validate(worstSave))
local campaign=V.estimateEncodedBytes(worstSave)

-- 2. The ledger ordinary play already writes ------------------------------
local base=Ledger.empty()
for i,id in ipairs(order) do
    base=assert((Ledger.record(base,"evidence",id,i,"1024 West Point Road, West Point","building:123456")))
end
local baseLedger=V.estimateEncodedBytes(base)
local RESERVED_FOR_OTHER_ROOTS=73000
local committed=campaign+baseLedger+RESERVED_FOR_OTHER_ROOTS
local spendable=V.MAX_ENCODED_BYTES-committed-RESERVE

print(string.format("MEASURED campaign %d + ordinary ledger %d (%d events) + reserved %d = %d of %d",
    campaign,baseLedger,#order,RESERVED_FOR_OTHER_ROOTS,committed,V.MAX_ENCODED_BYTES))
print(string.format("MEASURED reserve %d (case_archive headroom) -> SPENDABLE BY THE MAP FEATURE: %d bytes",
    RESERVE,spendable))
assert(spendable>0,"the reserve already consumes the remaining budget")

-- 3. What one event costs, at the two ref lengths the feature could use ---
-- MAX_REF is 700 and the cost of an event is dominated by its strings, so
-- "about 545 bytes an event" is a property of ORDINARY refs, not of the
-- ledger. Measured both ways rather than assumed.
local function marginal(ref,place,placeId)
    local before=V.estimateEncodedBytes(base)
    local after=assert((Ledger.record(base,"evidence",ref,9999,place,placeId)))
    return V.estimateEncodedBytes(after)-before
end
local ordinaryEvent=math.ceil(baseLedger/#order)
local payoffLong=marginal("generated:1859222568:document-1 read at the Knox County Gallery annex, "..
    "filed under the district transfer desk","Knox County Gallery, Louisville","building:12546,1393")
local payoffShort=marginal("m15:p","Knox County Gallery","b:12546,1393")
local payoffCoded=marginal("m15:p","","") -- place omitted entirely
print(string.format("MEASURED per event: ordinary average %d, long-ref payoff %d, short-ref payoff %d, coded no-place %d",
    ordinaryEvent,payoffLong,payoffShort,payoffCoded))

-- 4. Trail and entry state, measured at the full catalogue ---------------
-- The compact representation the review calls "a candidate to measure":
-- immutable authored content is addressed by design id and fragment index,
-- and only the mutable part is saved.
local trails={schema=1,t={}}
for i=1,DESIGNS do
    trails.t[i]={d=i,s=2,f=FRAGMENTS,at=123456.75}  -- design, state, fragments placed, activated at
end
local trailBytes=V.estimateEncodedBytes(trails)
local entered={schema=1,e={}}
for i=1,DESIGNS do entered.e[i]=i end
local enteredBytes=V.estimateEncodedBytes(entered)
print(string.format("MEASURED whole-catalogue state: %d trail records %d bytes (%d each), %d entry records %d bytes",
    DESIGNS,trailBytes,math.ceil(trailBytes/DESIGNS),DESIGNS,enteredBytes))

-- 5. The four representations, priced against the same spendable figure ---
local function fits(name,events,eventCost,state)
    local cost=events*eventCost+state
    print(string.format("  %-46s %7d bytes (%3d events) %s",
        name,cost,events,cost<=spendable and "FITS" or ("OVER by "..(cost-spendable))))
    return cost<=spendable
end
print("AT THE FULL CATALOGUE OF "..DESIGNS.." DESTINATIONS:")
local A=fits("A every fragment and payoff a ledger event",DESIGNS*(FRAGMENTS+1),ordinaryEvent,trailBytes+enteredBytes)
local B=fits("B payoff in the ledger, fragments compact",DESIGNS,ordinaryEvent,trailBytes+enteredBytes)
local C=fits("C payoff with a short ref, fragments compact",DESIGNS,payoffShort,trailBytes+enteredBytes)
local D=fits("D payoff coded, no place, fragments compact",DESIGNS,payoffCoded,trailBytes+enteredBytes)

-- 6. THE FINDING: how many destinations each representation can fund -----
-- This is the number the plan needed and did not have. It is a capacity, so
-- it is asserted, not printed and forgotten: if a later change makes the
-- campaign store cheaper or dearer, this number moves and the test says so.
local function fundable(eventCost,perTrail)
    local n=0
    while (n+1)*(eventCost+perTrail)<=spendable do n=n+1 end
    return n
end
local perTrail=math.ceil(trailBytes/DESIGNS)+math.ceil(enteredBytes/DESIGNS)
local fundableB=fundable(ordinaryEvent,perTrail)
local fundableD=fundable(payoffCoded,perTrail)
print(string.format("FUNDABLE DESTINATIONS within the measured budget: %d at an ordinary-cost payoff, %d at a coded payoff",
    fundableB,fundableD))
assert(not A,"representation A is expected to be unaffordable - if it now fits, the budget model changed")
assert(fundableB<DESIGNS,"an ordinary-cost payoff is expected not to fund the whole catalogue")
print(string.format("PASS whole-save budget measured: %d bytes spendable after a justified %d reserve; "..
    "the full %d-destination catalogue does NOT fit at any representation measured here",
    spendable,RESERVE,DESIGNS))

-- 7. ONE BOUNDED STORAGE CHANGE, COSTED -----------------------------------
-- The revision-3 review asked for exactly this rather than a compression
-- project: test one bounded change to redundant references and let the
-- measured saving decide whether further engineering is justified.
--
-- These are COSTING MODELS, not implementations. Each builds the root shape
-- the change would produce and measures it with the same estimator, so the
-- saving is comparable with everything above.
--
-- The redundancy is real and visible in the data: every ordinary event stores
-- its own place string and place id, and several documents of one case share a
-- place; and every document reference repeats the "generated:<caseid>:" prefix
-- seven times a case.
local PLACES=48                      -- distinct places across a 16-case save
local placePool={}
for i=1,PLACES do
    placePool[i]={p=string.format("%d West Point Road, West Point",1000+i),
                  id=string.format("building:%d",100000+i)}
end

-- (a) intern the place strings: events carry an index into a table
local interned={schema=2,nextSeq=#order+1,places=placePool,events={}}
for i,id in ipairs(order) do
    interned.events[i]={seq=i,kind="evidence",ref=id,at=i,pi=((i-1)%PLACES)+1}
end
local internedBytes=V.estimateEncodedBytes(interned)

-- (b) intern the reference prefix too: "generated:<caseid>:" is repeated per
-- document, so the case id moves to a table and the event keeps the suffix
local prefixes,prefixIndex={},{}
local shortRefs={}
for i,id in ipairs(order) do
    local head,tail=id:match("^(.*):([^:]+)$")
    head=head or id; tail=tail or id
    if not prefixIndex[head] then
        prefixes[#prefixes+1]=head; prefixIndex[head]=#prefixes
    end
    shortRefs[i]={seq=i,kind="evidence",ri=prefixIndex[head],ref=tail,at=i,pi=((i-1)%PLACES)+1}
end
local both={schema=2,nextSeq=#order+1,places=placePool,refs=prefixes,events=shortRefs}
local bothBytes=V.estimateEncodedBytes(both)

print(string.format("MEASURED bounded changes to the ordinary ledger: as shipped %d, interned places %d (saves %d), places+ref prefixes %d (saves %d)",
    baseLedger,internedBytes,baseLedger-internedBytes,bothBytes,baseLedger-bothBytes))

-- The question the review actually posed: does that saving change the answer?
local bestSaving=baseLedger-bothBytes
local shortfallD=DESIGNS*payoffCoded+trailBytes+enteredBytes-spendable
print(string.format("MEASURED against the shortfall: best bounded saving %d vs representation D shortfall %d",
    bestSaving,shortfallD))
assert(bestSaving<shortfallD,
    "if a bounded ledger change now covers the shortfall, the coverage decision changes - re-read this test")
local fundableAfter=fundable(payoffCoded,perTrail)
print(string.format("FINDING compressing the existing ledger buys about %d bytes - roughly %d more destinations, not %d",
    bestSaving,math.floor(bestSaving/(payoffCoded+perTrail)),DESIGNS-fundableAfter))
print("PASS one bounded storage change measured: it helps and does not come close to funding the catalogue")
