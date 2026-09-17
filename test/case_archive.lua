-- The archive (P4-R111): "finished cases are archived, so the tenth case is
-- not the last." A finished case leaves the live budget in two steps. First it
-- retires (RetiredCase.retire, docs/design/CASE_RETIREMENT.md): placement
-- bookkeeping goes, the rows FILES renders stay. Then, when more cases have
-- finished than MAX_FULL_ARCHIVED, the OLDEST archived case loses its bulk too
-- (RetiredCase.shrink) and keeps only what the rest of the mod still reads:
-- its id, its documents' ids in the order they were found, and what the
-- survivor was asked and answered.
--
-- This test covers the archive's rules and measures the whole save, because
-- the cap is only worth what it measures: the campaign store AND the discovery
-- ledger, which grows with every document ever found whatever tier its case
-- is in. Run under PUC Lua 5.1: `lua5.1 test/case_archive.lua`.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local V=require("ConspiracyFiles/Validator")
local Session=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")
local Ledger=require("ConspiracyFiles/DiscoveryLedger")

local OPTS={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function makeCase(seed,opts)
    for s=seed,seed+50 do local case=G.generate(catalog(),s,opts or OPTS); if case then return case end end
    error("no generated case near seed "..seed)
end
local function rootFor(case)
    local targets={}
    for _,site in ipairs(case.locations) do
        targets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
            containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
    end
    return assert(Session.create(case,targets))
end
local function makeRoot(seed) return rootFor(makeCase(seed)) end
local function deepEqual(a,b)
    if type(a)~=type(b) then return false end
    if type(a)~="table" then return a==b end
    for k,v in pairs(a) do if not deepEqual(v,b[k]) then return false end end
    for k in pairs(b) do if a[k]==nil then return false end end
    return true
end
local function tiers(wrapper)
    local live,full,stub=0,0,0
    for _,root in ipairs(Cases.sessions(wrapper)) do
        if not Retired.isRetired(root) then live=live+1
        elseif Retired.isStub(root) then stub=stub+1
        else full=full+1 end
    end
    return live,full,stub
end

-- 1. What shrinking keeps and what it drops -------------------------------
local base=makeRoot(501)
local known={}
do
    local current=base
    local api=assert(Session.open(current,function(saved) current=saved end))
    for _,doc in ipairs(current.case.documents) do assert(api.status(doc.id,"placed",0)) end
    for _,doc in ipairs(current.case.documents) do assert(api.inspect(doc.id)) end
    base=api.snapshot()
end
for i,id in ipairs(base.known) do known[i]=id end
local lastSeen={}
for _,doc in ipairs(base.case.documents) do lastSeen[doc.id]="Carried, in Una's Evidence." end
local retired=assert(Retired.retire(base,lastSeen,720))
retired.answers={reading="one",matters="person1",way="listen",changedHours=721}
assert(Retired.validate(retired))
local stub,shrunk=assert(Retired.shrink(retired))
assert(shrunk,"shrinking a full archived case must report a real change")
assert(Retired.isRetired(stub),"a stubbed case is still an archived case, never a live session")
assert(Retired.isStub(stub))
assert(Retired.validate(stub))
assert(stub.caseId==retired.caseId,"the case id is kept: nothing may collide with it")
assert(deepEqual(stub.known,known),"every document id is kept, in the order they were found")
assert(deepEqual(stub.offered,retired.offered),"what the survivor was asked is kept (P4-R113)")
assert(deepEqual(stub.answers,retired.answers),"the survivor's answers are kept (P4-R122)")
assert(stub.completedHours==720,"when the case finished is kept")
assert(stub.rows==nil,"the rows are what a stub drops")
local retiredBytes,stubBytes=V.estimateEncodedBytes(retired),V.estimateEncodedBytes(stub)
assert(stubBytes<retiredBytes/2,"a stub must be far smaller, or the archive buys nothing: "..stubBytes.." vs "..retiredBytes)
local again,changedAgain=Retired.shrink(stub)
assert(again==stub and changedAgain==false,"shrinking a stub is a recognised no-op, not a second shrink")
-- The full archive keeps everything FILES renders (P4-R118, P4-R104).
for _,row in ipairs(retired.rows) do
    assert(type(row.title)=="string" and row.title~="" and type(row.body)=="string" and row.body~="")
    assert(row.lastSeen=="Carried, in Una's Evidence.","a full archived row still says where the evidence was")
end
print(string.format("PASS shrink keeps id, document ids, questions and answers; drops the rows: %d -> %d bytes (-%.0f%%)",
    retiredBytes,stubBytes,(retiredBytes-stubBytes)/retiredBytes*100))

-- 2. Archived cases do not block a new case -------------------------------
-- The same path GeneratedRuntime uses in play: stage, discover, retire the
-- oldest unfinished case when the live bound is reached, stage again.
local wrapper={canonical=makeRoot(601),schedule={schema=1,createdHours={1}}}
local function discoverIndex(index)
    local root=Cases.sessions(wrapper)[index]
    local api=assert(Session.open(root,function(staged) wrapper=assert(Cases.replace(wrapper,index,staged)) end))
    for _,doc in ipairs(root.case.documents) do assert(api.status(doc.id,"placed",0)) end
    for _,doc in ipairs(root.case.documents) do assert(api.inspect(doc.id)) end
end
local function retireOldestLive(hour)
    local roots=Cases.sessions(wrapper)
    for index=1,#roots do
        if not Retired.isRetired(roots[index]) then
            local seen={}
            for _,id in ipairs(roots[index].known) do seen[id]="In the filing cabinet." end
            return assert(Cases.retire(wrapper,index,seen,hour))
        end
    end
    error("nothing live to retire")
end
discoverIndex(1)
local staged=1
for case=2,Cases.MAX_CASES do
    local live=select(1,tiers(wrapper))
    if live>=Cases.MAX_ACTIVE then wrapper=retireOldestLive(case*24) end
    wrapper=assert(Cases.stage(wrapper,makeRoot(600+case*7),case))
    staged=staged+1
    discoverIndex(#Cases.sessions(wrapper))
    local roots=Cases.sessions(wrapper)
    assert(#roots==staged,"a finished case must never be dropped from the store")
    local _,full=tiers(wrapper)
    assert(full<=Cases.MAX_FULL_ARCHIVED,"the full archive must stay inside its cap at every step")
end
assert(staged==Cases.MAX_CASES and staged>10,
    "the archive must carry a save past the old ten-case ceiling, got "..staged)
local live,full,stubs=tiers(wrapper)
assert(live<=Cases.MAX_ACTIVE,"live cases still cap at MAX_ACTIVE")
assert(full==Cases.MAX_FULL_ARCHIVED,"the most recent finished cases keep their rows")
assert(stubs==Cases.MAX_CASES-live-full and stubs>0,"older finished cases are archived as stubs")
assert(Cases.validate(wrapper))
print(string.format("PASS %d cases in one save (%d live, %d archived with rows, %d stubbed); ten is no longer the last",
    Cases.MAX_CASES,live,full,stubs))

-- 3. The oldest go first, positions never move, the ledger stays whole ----
local roots=Cases.sessions(wrapper)
for index=1,#roots-1 do
    local here,next=roots[index],roots[index+1]
    if Retired.isStub(next) then assert(Retired.isStub(here),"a stub after a full archived case means the wrong one was shrunk") end
end
-- Every document of every case is still named by the store: this is what the
-- runtime builds its Evidence / Old set from (P4-R118) and what a reshuffle
-- would have to clean up.
local manifest=assert(Cases.abandon(wrapper))
local named={}
for _,id in ipairs(manifest.documentIds) do named[id]=true end
local discoveries=Cases.discoveries(wrapper)
assert(#discoveries>0)
for _,id in ipairs(discoveries) do assert(named[id],"a stubbed case must still name its documents: "..id) end
assert(#manifest.caseIds==#roots,"every case, stubbed or not, is still in the store")
-- Nothing is renumbered: the case at each index is the same case it was, and
-- the next compaction does not move it.
local idsBefore={}
for index,root in ipairs(roots) do idsBefore[index]=Retired.isStub(root) and root.caseId or (root.caseId or root.case.caseId) end
local discoveriesBefore=table.concat(discoveries,"\1")
local compacting=retireOldestLive(9999)
local after=Cases.sessions(compacting)
assert(#after==#roots,"compaction never removes a case")
for index,root in ipairs(after) do
    local id=Retired.isStub(root) and root.caseId or (root.caseId or root.case.caseId)
    assert(id==idsBefore[index],"compaction must not move a case to another index")
end
assert(table.concat(Cases.discoveries(compacting),"\1")==discoveriesBefore,
    "the discovery order is never rewritten by the archive")
local liveAfter,fullAfter=tiers(compacting)
assert(fullAfter==Cases.MAX_FULL_ARCHIVED,"retiring another case shrinks the oldest archived one in the same swap")
assert(liveAfter==live-1)
-- A reload validates: this is exactly what Session/Validator see on load.
local reloaded,why=Cases.current({campaign=compacting})
assert(reloaded==compacting,"a save holding stubs must load again: "..tostring(why))
assert(select(1,Cases.validate(compacting)))
print("PASS the oldest archived case loses its bulk first; indices, discovery order and reload unchanged")

-- 4. A stubbed case's answers still steer the next case (P4-R113) ---------
local steerable
for index,root in ipairs(Cases.sessions(compacting)) do
    if Retired.isStub(root) then steerable=index; break end
end
assert(steerable,"the fixture must have produced a stub")
local answered=assert(Cases.setAnswers(compacting,steerable,{reading="one",matters="person1",way="records"},10000))
local steer,fromIndex=Cases.pendingSteer(answered)
assert(steer,"a stubbed case must still be able to steer the next case")
assert(fromIndex==steerable)
assert(steer.person and steer.person~="","the names the answers were given about survive the shrink")
print("PASS a stubbed case can still be answered about, and its answers still steer")

-- 5. Old saves' shapes still load ----------------------------------------
-- Ten roots, six of them full-size archived: what the cap allowed before the
-- archive existed. Such a save is not refused for keeping what it was allowed
-- to keep; the next retirement compacts it.
local legacy={canonical=nil,successive={schema=1,cases={},discoveries={}}}
do
    local sources={}
    for i=1,Cases.LEGACY_MAX_CASES do sources[i]=makeRoot(2000+i*11) end
    local order={}
    for i,root in ipairs(sources) do
        local current=root
        local api=assert(Session.open(current,function(saved) current=saved end))
        for _,doc in ipairs(current.case.documents) do assert(api.status(doc.id,"placed",0)) end
        for _,doc in ipairs(current.case.documents) do assert(api.inspect(doc.id)) end
        current=api.snapshot()
        -- Six retired, four still live: the shape the old cap allowed. The
        -- four live ones are fully discovered but not yet retired, which is
        -- the most expensive a live root can be.
        if i<=Cases.LEGACY_MAX_CASES-Cases.MAX_ACTIVE then
            sources[i]=assert(Retired.retire(current,nil,i*24))
        else
            sources[i]=current
        end
        for _,id in ipairs(sources[i].known) do order[#order+1]=id end
    end
    legacy.canonical=sources[1]
    for i=2,#sources do legacy.successive.cases[i-1]=sources[i] end
    legacy.successive.discoveries=order
end
local okLegacy,whyLegacy=Cases.validate(legacy)
assert(okLegacy,"a save written before the archive must still load: "..tostring(whyLegacy))
local _,legacyFull=tiers(legacy)
assert(legacyFull>Cases.MAX_FULL_ARCHIVED,"the fixture must hold more full-size archived cases than the new cap")
-- The next finished case compacts it instead of refusing the save, and the
-- case at every index is still the case that was there.
local legacyIds={}
for index,root in ipairs(Cases.sessions(legacy)) do legacyIds[index]=root.caseId or root.case.caseId end
local compactedLegacy=assert(Cases.retire(legacy,Cases.LEGACY_MAX_CASES-Cases.MAX_ACTIVE+1,nil,999))
local legacyLive,newFull,newStubs=tiers(compactedLegacy)
assert(newFull==Cases.MAX_FULL_ARCHIVED,"the old save's archive is brought inside the new cap")
assert(newStubs==legacyFull+1-Cases.MAX_FULL_ARCHIVED,"exactly the excess is stubbed, oldest first")
assert(legacyLive==Cases.MAX_ACTIVE-1)
local compactedRoots=Cases.sessions(compactedLegacy)
assert(#compactedRoots==Cases.LEGACY_MAX_CASES,"compaction never drops a case")
for index,root in ipairs(compactedRoots) do
    assert((root.caseId or root.case.caseId)==legacyIds[index],"an old save's cases must not be renumbered")
end
assert(Cases.validate(compactedLegacy))
-- And it can grow past the old ceiling. A save from before the schedule
-- existed has none, so no hour is given.
local grown=assert(Cases.stage(compactedLegacy,makeRoot(2999)))
assert(#Cases.sessions(grown)==Cases.LEGACY_MAX_CASES+1,"a pre-archive save keeps getting new cases after ten")
assert(Cases.validate(grown))
print("PASS a pre-archive save loads unchanged, is compacted by the next finished case, and grows past ten")

-- 6. The measured budget -------------------------------------------------
-- Worst case over a thousand real seeds, per tier, then the whole save:
-- the campaign store plus the discovery ledger plus what is reserved for
-- every other canonical root.
local worst={live=0,full=0,stub=0,docs=0}
local pool={}
for seed=1,1000 do
    -- The most expensive case the generator writes: steered by a finished
    -- case's answers, with the longest source id and returning organisation
    -- allowed, and "Listen for it", which adds the radio transcript (P4-R123).
    local case=G.generate(catalog(),seed,{mapId=OPTS.mapId,buildLine=OPTS.buildLine,allowSynthetic=true,
        steer={fromCase=string.rep("c",Retired.CASE_ID_MAX),reading="one",way="listen",
            organisation=string.rep("o",G.STEER_ORG_MAX)}})
    if case then
        local root=rootFor(case)
        local ids={}
        for i,doc in ipairs(case.documents) do ids[i]=doc.id end
        root.known=ids
        -- Worst case for every tier: every line at the longest text allowed.
        local seen={}
        for _,doc in ipairs(case.documents) do seen[doc.id]=string.rep("x",Retired.LAST_SEEN_MAX) end
        local fullRoot=assert(Retired.retire(root,seen,1))
        fullRoot.offered.people={string.rep("n",Retired.NAME_MAX),string.rep("m",Retired.NAME_MAX)}
        fullRoot.offered.organisation=string.rep("o",Retired.ORG_MAX)
        fullRoot.answers={reading="unsure",matters="organisation",way="records",
            changedHours=123456.75,usedBy=string.rep("u",Retired.CASE_ID_MAX)}
        assert(Retired.validate(fullRoot))
        local stubRoot=assert(Retired.shrink(fullRoot))
        pool[#pool+1]={live=root,liveBytes=V.estimateEncodedBytes(root),
            full=fullRoot,fullBytes=V.estimateEncodedBytes(fullRoot),
            stub=stubRoot,stubBytes=V.estimateEncodedBytes(stubRoot)}
        if #case.documents>worst.docs then worst.docs=#case.documents end
    end
end
assert(#pool>=100,"needed a real sample of generated cases, got "..#pool)
for _,e in ipairs(pool) do
    if e.liveBytes>worst.live then worst.live=e.liveBytes end
    if e.fullBytes>worst.full then worst.full=e.fullBytes end
    if e.stubBytes>worst.stub then worst.stub=e.stubBytes end
end
-- One worst-case save, built from distinct seeds (no case id or document id
-- may repeat) with the most expensive root of each tier in the tier it costs
-- most in, and validated as a real wrapper - so the schedule and the whole
-- discovery order are measured too, not just the roots.
local function take(pool,key,n)
    table.sort(pool,function(a,b) return a[key]>b[key] end)
    local taken,rest={},{}
    for i,e in ipairs(pool) do if i<=n then taken[#taken+1]=e else rest[#rest+1]=e end end
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
local okWorst,whyWorst=Cases.validate(worstSave)
assert(okWorst,"the worst case must be a save the mod would accept: "..tostring(whyWorst))
local campaignBytes=V.estimateEncodedBytes(worstSave)
-- The discovery ledger: one event per document ever found, whatever tier its
-- case is in. Measured with the real module, at the shape play writes - a
-- document id, an address label and the building's own id.
local ledger=Ledger.empty()
for i,id in ipairs(order) do
    ledger=assert((Ledger.record(ledger,"evidence",id,i,"1024 West Point Road, West Point","building:123456")))
end
local ledgerBytes=V.estimateEncodedBytes(ledger)
-- 120,000 was reserved for every other canonical root while the ledger was
-- counted inside that figure; at the old ten-case cap the ledger itself was
-- about 38,000 of it. The rest - identities, key connections, local people,
-- clue markers, the address book, visited buildings - is reserved here, and
-- the ledger is measured rather than assumed, because it is the one other
-- root that grows with the number of cases.
local RESERVED_FOR_OTHER_ROOTS=73000
local total=campaignBytes+ledgerBytes+RESERVED_FOR_OTHER_ROOTS
assert(total<=V.MAX_ENCODED_BYTES,string.format(
    "a full %d-case save must fit the budget: campaign %d + ledger %d + reserved %d = %d of %d",
    Cases.MAX_CASES,campaignBytes,ledgerBytes,RESERVED_FOR_OTHER_ROOTS,total,V.MAX_ENCODED_BYTES))
-- Headroom, not just a fit: the ten-case cap this replaces left 17,567 bytes
-- spare on the same measurement, and the archive must not be tighter than
-- what it replaces.
local HEADROOM=17567
assert(V.MAX_ENCODED_BYTES-total>=HEADROOM,string.format(
    "the archive cap must leave at least the headroom the ten-case cap did (%d): %d",
    HEADROOM,V.MAX_ENCODED_BYTES-total))
print(string.format("PASS worst case per root: live %d, archived %d, stubbed %d (%d documents a case)",
    worst.live,worst.full,worst.stub,worst.docs))
print(string.format("PASS %d-case save fits with headroom: campaign %d + ledger %d (%d events) + reserved %d = %d of %d, %d spare",
    Cases.MAX_CASES,campaignBytes,ledgerBytes,#order,RESERVED_FOR_OTHER_ROOTS,total,V.MAX_ENCODED_BYTES,
    V.MAX_ENCODED_BYTES-total))
