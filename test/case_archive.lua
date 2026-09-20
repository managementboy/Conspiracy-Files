-- Full archive retention, campaign bounds and aggregate estimated cost.
-- Claude runs this after implementation; no source row may age out of FILES.
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

-- 1. Retirement preserves all discovered source facts and context.
local base=rootFor(makeCase(501,{mapId=OPTS.mapId,buildLine=OPTS.buildLine,
    allowSynthetic=true,opening=true,self="Buddy Schuster"}))
local api=assert(Session.open(base,function(saved) base=saved end))
for _,doc in ipairs(base.case.documents) do assert(api.status(doc.id,"placed",0)) end
for _,doc in ipairs(base.case.documents) do assert(api.inspect(doc.id)) end
local known=base.known
local lastSeen={}
for _,doc in ipairs(base.case.documents) do lastSeen[doc.id]="Carried, in Una's Evidence." end
local retired=assert(Retired.retire(base,lastSeen,720))
retired.answers={reading="one",matters="person1",way="listen",changedHours=721}
assert(Retired.validate(retired))
local retained,changed=Retired.shrink(retired)
assert(retained==retired and changed==false,"compaction must not remove source history")
assert(not Retired.isStub(retained))
assert(deepEqual(retired.known,known),"discovery order survives retirement")
assert(deepEqual(retired.locations,base.case.locations),"geographic context survives retirement")
assert(retired.reference==base.case.facts.code and retired.completedHours==720)
local expected=assert(G.project(base.case,base.known))
assert(#retired.rows==#expected)
for i,row in ipairs(retired.rows) do
    assert(row.lastSeen==lastSeen[row.id])
    expected[i].lastSeen=lastSeen[row.id]
    assert(deepEqual(row,expected[i]),"every projected fact, lead and connection survives retirement")
end
print("PASS retirement retains complete source rows, discovery order, context and answers")

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
    assert(full==math.max(0,staged-Cases.MAX_ACTIVE),"each retired case keeps its rows")
end
assert(staged==Cases.MAX_CASES and staged>10,
    "the archive must carry a save past the old ten-case ceiling, got "..staged)
local live,full,stubs=tiers(wrapper)
assert(live<=Cases.MAX_ACTIVE,"live cases still cap at MAX_ACTIVE")
assert(full==Cases.MAX_CASES-live,"all finished cases keep their rows")
assert(stubs==0,"no archived case loses its source rows")
assert(not Cases.stage(wrapper,makeRoot(8999),100),"the total case limit still refuses another case")
assert(Cases.validate(wrapper))
print(string.format("PASS %d cases in one save (%d live, %d archived with rows, %d stubbed); ten is no longer the last",
    Cases.MAX_CASES,live,full,stubs))

-- 3. Earlier evidence, positions and discovery order remain intact. -------
local roots=Cases.sessions(wrapper)
local archivedBefore={}
for index,root in ipairs(roots) do
    if Retired.isRetired(root) then archivedBefore[index]=root end
end
-- Every document of every case is still named by the store: this is what the
-- runtime builds its Evidence / Old set from (P4-R118) and what a reshuffle
-- would have to clean up.
local manifest=assert(Cases.abandon(wrapper))
local named={}
for _,id in ipairs(manifest.documentIds) do named[id]=true end
local discoveries=Cases.discoveries(wrapper)
assert(#discoveries>0)
for _,id in ipairs(discoveries) do assert(named[id],"an archived case must still name its documents: "..id) end
assert(#manifest.caseIds==#roots,"every case, retired or not, is still in the store")
-- Nothing is renumbered: the case at each index is the same case it was, and
-- the next retirement does not move it.
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
assert(fullAfter==full+1,"another retirement adds a complete archive entry")
for index,root in pairs(archivedBefore) do
    assert(deepEqual(after[index],root),"later retirement must not alter earlier source history or answers")
end
assert(liveAfter==live-1)
-- A reload validates: this is exactly what Session/Validator see on load.
local reloaded,why=Cases.current({campaign=compacting})
assert(reloaded==compacting,"a save retaining all rows must load again: "..tostring(why))
assert(select(1,Cases.validate(compacting)))
print("PASS all archive entries, indices, discovery order and reload remain unchanged")

-- 4. An archived case's answers still steer the next case (P4-R113) ---------
local steerable
for index,root in ipairs(Cases.sessions(compacting)) do
    if Retired.isRetired(root) and root.offered and root.offered.people[1] then steerable=index; break end
end
assert(steerable,"the fixture must have produced an archived source with a named person")
local answered=assert(Cases.setAnswers(compacting,steerable,{reading="one",matters="person1",way="records"},10000))
local steer,fromIndex=Cases.pendingSteer(answered)
assert(steer,"an archived case must still be able to steer the next case")
assert(fromIndex==steerable)
assert(steer.person and steer.person~="","the names the answers were given about survive retirement")
print("PASS an archived case can still be answered, and its answers still steer")

-- 6. The measured budget -------------------------------------------------
-- Worst case over a thousand real seeds, per tier, then the whole save:
-- the campaign store plus the discovery ledger plus what is reserved for
-- every other canonical root.
local worst={live=0,full=0,docs=0}
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
        pool[#pool+1]={live=root,liveBytes=V.estimateEncodedBytes(root),
            full=fullRoot,fullBytes=V.estimateEncodedBytes(fullRoot)}
        if #case.documents>worst.docs then worst.docs=#case.documents end
    end
end
assert(#pool>=100,"needed a real sample of generated cases, got "..#pool)
for _,e in ipairs(pool) do
    if e.liveBytes>worst.live then worst.live=e.liveBytes end
    if e.fullBytes>worst.full then worst.full=e.fullBytes end
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
local liveSet,rest=take(pool,"liveBytes",Cases.MAX_ACTIVE)
local fullSet=take(rest,"fullBytes",Cases.MAX_CASES-Cases.MAX_ACTIVE)
local ordered={}
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
print(string.format("PASS worst case per root: live %d, archived %d (%d documents a case)",
    worst.live,worst.full,worst.docs))
print(string.format("PASS %d-case save fits with headroom: campaign %d + ledger %d (%d events) + reserved %d = %d of %d, %d spare",
    Cases.MAX_CASES,campaignBytes,ledgerBytes,#order,RESERVED_FOR_OTHER_ROOTS,total,V.MAX_ENCODED_BYTES,
    V.MAX_ENCODED_BYTES-total))
