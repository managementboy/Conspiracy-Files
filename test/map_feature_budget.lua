-- WHOLE-SAVE BUDGET FIXTURE for the map mechanism
-- (MAP_MECHANISM_REVIEW_2026-09-20.md item 1: "a whole-save budget fixture
-- covering the intended catalogue and retained discoveries, with a justified
-- reserve").
--
-- Price the actual production representations together. Historical estimates
-- omitted feature costs and assumed event sizes; the ordinary ledger must be
-- counted exactly once. This is an estimator fixture, not an engine benchmark.
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
local State=require("ConspiracyFiles/MapMediaState")
local Catalogue=require("ConspiracyFiles/MapMediaCatalogue")
assert(V.MAX_ENCODED_BYTES==1000000, "update the measured development-budget fixture when policy changes")

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

-- Real production shapes: retained campaign, ordinary ledger, all map designs,
-- and the existing other-root allowance. This measures estimates, not disk bytes.
local base=Ledger.empty()
for i,id in ipairs(order) do
    base=assert((Ledger.record(base,"evidence",id,i,"1024 West Point Road, West Point","building:123456")))
end
local RESERVED_FOR_OTHER_ROOTS=73000
local function scenario(name,notedPart)
    local maps=State.empty()
    local ledger=base
    for i,id in ipairs(Catalogue.list) do
        maps=assert(State.activate(maps,id,100000+i,12345.75+i,Catalogue))
        maps=assert(State.enter(maps,id,12346+i))
        for part=1,4 do
            local value
            if notedPart(i,part) then
                value={state="noted",noted=true,recognised=true,at=12347+i,attempt=19,observation="electrician"}
                ledger=assert((Ledger.record(ledger,"evidence",State.reference(id,part),12348+i,
                    "1024 West Point Road, West Point","building:123456")))
            else
                value={state=(part==1 and "unknown" or "placed"),at=12347+i,attempt=19,
                    target={x=10000+i,y=10000+part,z=0,objectIndex=15,containerIndex=0,
                        sprite="furniture_storage_01_012",containerType="filingcabinet"}}
            end
            maps=assert(State.set(maps,id,part,value))
        end
    end
    for _,id in ipairs(Catalogue.printList) do maps=assert(State.printRead(maps,id,12346)) end
    assert(State.validate(maps,Catalogue))
    assert(Ledger.validate(ledger))
    local roots={generated=worstSave,discoveries={canonical=ledger},mapMedia={canonical=maps}}
    local total=RESERVED_FOR_OTHER_ROOTS
    for _,root in pairs(roots) do total=total+assert(V.estimateEncodedBytes(root)) end
    print(string.format("ESTIMATE %s: campaign=%d, ledger=%d (%d events), maps=%d, other allowance=%d, total=%d, headroom=%d",
        name,campaign,V.estimateEncodedBytes(roots.discoveries),#ledger.events,
        V.estimateEncodedBytes(roots.mapMedia),RESERVED_FOR_OTHER_ROOTS,total,V.MAX_ENCODED_BYTES-total))
    assert(total+RESERVE<=V.MAX_ENCODED_BYTES,"whole-catalogue state must preserve the existing headroom: "..name)
    return maps,ledger
end
scenario("all placements retained",function() return false end)
scenario("mixed placements and discoveries",function(i,part) return (i+part)%2==0 end)
local all,ledger=scenario("all discoveries retained",function() return true end)
assert(#ledger.events==#order+#Catalogue.list*4,"every fragment and payoff remains in shared chronology")
assert(Ledger.MAX>=#ledger.events,"ledger cap must accommodate full catalogue plus ordinary investigations")
print("PASS full-catalogue estimate fixtures; native save/load and write latency remain separate measurements")
