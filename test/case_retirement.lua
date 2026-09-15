-- Case retirement (docs/design/CASE_RETIREMENT.md): a completed case's full
-- session root shrinks to just its discovered rows once every document is
-- found. Covers: measurable shrink, refusal on an incomplete case,
-- idempotence, the discovery ledger staying byte-identical, retired rows
-- still rendering in true ledger order, and a many-case campaign fitting the
-- shared 500 kB budget.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local G=require("ConspiracyFiles/Generated/Generator")
local V=require("ConspiracyFiles/Validator")
local Session=require("ConspiracyFiles/Generated/Session")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Retired=require("ConspiracyFiles/Generated/RetiredCase")
local Ledger=require("ConspiracyFiles/DiscoveryLedger")

local function catalog() return dofile("test/fixtures/synthetic_locations.lua") end
local function makeCase(seed)
    local opts={mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true}
    for s=seed,seed+50 do local case=G.generate(catalog(),s,opts); if case then return case end end
    error("no generated case near seed "..seed)
end
local function makeRoot(seed)
    local case=makeCase(seed); local targets={}
    for _,site in ipairs(case.locations) do
        targets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
            containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
    end
    return assert(Session.create(case,targets))
end
-- Places and inspects every document of a root, in array order, and returns
-- the fully-discovered snapshot.
local function discoverAll(root)
    local current=root
    local api=assert(Session.open(current,function(saved) current=saved end))
    for _,doc in ipairs(current.case.documents) do assert(api.status(doc.id,"placed",0)) end
    for _,doc in ipairs(current.case.documents) do assert(api.inspect(doc.id)) end
    return api.snapshot()
end
local function deepEqual(a,b,seen)
    if type(a)~=type(b) then return false end
    if type(a)~="table" then return a==b end
    seen=seen or {}; if seen[a] then return seen[a]==b end; seen[a]=b
    for k,v in pairs(a) do if not deepEqual(v,b[k],seen) then return false end end
    for k in pairs(b) do if a[k]==nil then return false end end
    return true
end
local function activeCount(wrapper)
    local n=0; for _,root in ipairs(Cases.sessions(wrapper)) do if not Retired.isRetired(root) then n=n+1 end end
    return n
end
local function retireOldestActive(wrapper)
    local roots=Cases.sessions(wrapper)
    for idx=1,#roots do if not Retired.isRetired(roots[idx]) then return assert(Cases.retire(wrapper,idx)) end end
    return wrapper
end

-- 1. A completed case retires and measurably shrinks.
local full=discoverAll(makeRoot(101))
assert(#full.known==#full.case.documents,"fixture must be fully discovered")
local before=V.estimateEncodedBytes(full)
local retiredWrapper,changed=assert(Cases.retire({canonical=full},1))
assert(changed,"first retirement must report a real change")
local retiredRoot=Cases.sessions(retiredWrapper)[1]
assert(Retired.isRetired(retiredRoot),"retired root must be recognisably retired")
local after=V.estimateEncodedBytes(retiredRoot)
assert(after<before,"retired case must shrink: "..after.." vs "..before)
assert(Cases.validate(retiredWrapper))
print(string.format("PASS retirement shrinks a completed case: %d -> %d bytes (-%d, -%.1f%%)",
    before,after,before-after,(before-after)/before*100))

-- 2. Never retire a case with an undiscovered document.
local partial=makeRoot(102)
local api=assert(Session.open(partial,function(saved) partial=saved end))
assert(api.status(partial.case.documents[1].id,"placed",0))
assert(api.inspect(partial.case.documents[1].id))
partial=api.snapshot()
assert(#partial.known<#partial.case.documents,"fixture must stay incomplete")
local refused,why=Cases.retire({canonical=partial},1)
assert(refused==nil,"an incomplete case must never retire")
assert(type(why)=="string" and #why>0)
print("PASS incomplete case refuses retirement: "..why)

-- 3. Retirement is idempotent and never runs twice on one case.
local again,changedAgain=Cases.retire(retiredWrapper,1)
assert(again==retiredWrapper,"retiring an already-retired case must be a recognised no-op, not a second shrink")
assert(changedAgain==false)
assert(V.estimateEncodedBytes(Cases.sessions(again)[1])==after,"a second retirement attempt must not shrink further")

-- 4. The discovery ledger is byte-identical before and after retirement.
local ledger=Ledger.empty()
for i=1,3 do ledger=assert(Ledger.record(ledger,"evidence","doc-"..i,i)) end
local ledgerSnapshot={}
for k,v in pairs(ledger) do ledgerSnapshot[k]=type(v)=="table" and (function() local o={} for i,e in ipairs(v) do o[i]={seq=e.seq,at=e.at,kind=e.kind,ref=e.ref} end return o end)() or v end
local unrelated=discoverAll(makeRoot(103))
local _=assert(Cases.retire({canonical=unrelated},1)) -- retirement never touches or receives the ledger
assert(deepEqual(ledger,ledgerSnapshot),"discovery ledger must be untouched by retirement")
assert(Ledger.validate(ledger))
print("PASS discovery ledger untouched by retirement")

-- 5. Retired rows still render, in true ledger discovery order -- not the
--    case's own internal array order.
local root2=discoverAll(makeRoot(104))
local docs=root2.case.documents
assert(#docs>=3,"fixture needs enough documents to prove order is not array order")
local shuffled={}; for i=#docs,1,-1 do shuffled[#shuffled+1]=docs[i].id end
local ledger2=Ledger.empty()
for i,id in ipairs(shuffled) do ledger2=assert(Ledger.record(ledger2,"evidence",id,i)) end
local retired2=assert(Cases.retire({canonical=root2},1))
local rows2=Cases.sessions(retired2)[1].rows
assert(#rows2==#docs)
local ordered=Ledger.order(ledger2,rows2)
for i,row in ipairs(ordered) do
    assert(row.id==shuffled[i],"retired rows must render in ledger order, not internal array order")
    assert(row.ordinal==i)
    assert(type(row.title)=="string" and row.title~="","retired row title still renders")
    assert(type(row.body)=="string" and row.body~="","retired row body -- a fact the player learned -- still renders")
end
print("PASS retired rows still render in original ledger discovery order")

-- 6. A many-case campaign stays within the shared 500 kB budget. Cases are
--    staged fresh (undiscovered) and then discovered through the same
--    Session.open/Cases.replace commit path GeneratedRuntime uses, so the
--    global discovery order is built incrementally exactly as in play,
--    never by pre-discovering a root before it joins the wrapper.
local wrapper={canonical=makeRoot(301)}
local function discoverIndex(index)
    local root=Cases.sessions(wrapper)[index]
    local api=assert(Session.open(root,function(staged) wrapper=assert(Cases.replace(wrapper,index,staged)) end))
    for _,doc in ipairs(root.case.documents) do assert(api.status(doc.id,"placed",0)) end
    for _,doc in ipairs(root.case.documents) do assert(api.inspect(doc.id)) end
end
discoverIndex(1)
for i=2,Cases.MAX_CASES do
    if activeCount(wrapper)>=Cases.MAX_ACTIVE then wrapper=retireOldestActive(wrapper) end
    wrapper=assert(Cases.stage(wrapper,makeRoot(300+i*7)))
    discoverIndex(#Cases.sessions(wrapper))
end
while activeCount(wrapper)>Cases.MAX_ACTIVE do wrapper=retireOldestActive(wrapper) end
assert(Cases.validate(wrapper))
local roots=Cases.sessions(wrapper)
assert(#roots==Cases.MAX_CASES,"campaign must reach the cap")
local retiredTotal=0; for _,root in ipairs(roots) do if Retired.isRetired(root) then retiredTotal=retiredTotal+1 end end
assert(retiredTotal==Cases.MAX_CASES-Cases.MAX_ACTIVE,"only the active bound may remain unretired at the cap")
local total=0; for _,root in ipairs(roots) do total=total+V.estimateEncodedBytes(root) end
local RESERVED_FOR_OTHER_ROOTS=120000
assert(total+RESERVED_FOR_OTHER_ROOTS<=V.MAX_ENCODED_BYTES,
    string.format("a full %d-case campaign must fit the shared budget: %d root bytes + %d reserved",Cases.MAX_CASES,total,RESERVED_FOR_OTHER_ROOTS))
print(string.format("PASS %d-case campaign (%d retired, %d active) fits budget: %d root bytes + %d reserved = %d of %d",
    Cases.MAX_CASES,retiredTotal,Cases.MAX_ACTIVE,total,RESERVED_FOR_OTHER_ROOTS,total+RESERVED_FOR_OTHER_ROOTS,V.MAX_ENCODED_BYTES))

-- 7. Where a finished case's evidence was last seen (P4-R104). Owner in play,
--    2026-09-14: "I lost my files somewhere?" - retirement had dropped every
--    placement detail. Retired rows keep an optional lastSeen line.
local lsRoot=discoverAll(makeRoot(401))
local firstId,secondId=lsRoot.known[1],lsRoot.known[2]
local lsWrapper=assert(Cases.retire({canonical=lsRoot},1,{[firstId]="Carried, in Una's Evidence.",[secondId]="bad\nline"}))
local lsRows=Cases.sessions(lsWrapper)[1].rows
local byId={}; for _,row in ipairs(lsRows) do byId[row.id]=row end
assert(byId[firstId].lastSeen=="Carried, in Una's Evidence.","retirement keeps where a paper was last seen")
assert(byId[secondId].lastSeen=="bad line","control characters become spaces rather than refusing retirement")
assert(Cases.validate(lsWrapper))
-- Round trip: the stored root validates again on load.
assert(Retired.validate(Cases.sessions(lsWrapper)[1]))
-- An old schema-2 root saved before lastSeen existed must still load.
local old=Cases.sessions(retiredWrapper)[1]
for _,row in ipairs(old.rows) do assert(row.lastSeen==nil,"fixture retired without sightings") end
assert(old.schema==2 and Retired.validate(old),"a retired root without lastSeen is still valid")
-- Bad stored values are refused by the validator, never silently kept.
local function withLastSeen(v) local r=Cases.sessions(lsWrapper)[1]; local c={} for k,x in pairs(r) do c[k]=x end
    c.rows={}; for i,row in ipairs(r.rows) do local o={} for k,x in pairs(row) do o[k]=x end c.rows[i]=o end
    c.rows[1].lastSeen=v; return c end
assert(not Retired.validate(withLastSeen("")),"empty lastSeen refused")
assert(not Retired.validate(withLastSeen(string.rep("a",Retired.LAST_SEEN_MAX+1))),"over-long lastSeen refused")
assert(Retired.validate(withLastSeen(string.rep("a",Retired.LAST_SEEN_MAX))),"max-length lastSeen accepted")
assert(not Retired.validate(withLastSeen("tab\there")),"control characters refused")
assert(not Retired.validate(withLastSeen(7)),"non-string refused")
assert(Retired.cleanLastSeen(string.rep("b",400))==string.rep("b",Retired.LAST_SEEN_MAX),"long text is cut, not refused")
assert(Retired.cleanLastSeen(" \n ")==nil and Retired.cleanLastSeen(nil)==nil)
-- Updating it later is copy-on-write and reports whether anything changed.
local before=Cases.sessions(lsWrapper)[1].rows
local moved,changedLs=assert(Cases.noteLastSeen(lsWrapper,{[firstId]="In a counter at 102 Pattern St."}))
assert(changedLs==true and moved~=lsWrapper)
local movedRows={}; for _,row in ipairs(Cases.sessions(moved)[1].rows) do movedRows[row.id]=row end
assert(movedRows[firstId].lastSeen=="In a counter at 102 Pattern St.","the new place is stored")
assert(byId[firstId].lastSeen=="Carried, in Una's Evidence." and Cases.sessions(lsWrapper)[1].rows==before,"the old wrapper is untouched")
local same,changedSame=Cases.noteLastSeen(moved,{[firstId]="In a counter at 102 Pattern St.",["not-a-document"]="Carried."})
assert(same==moved and changedSame==false,"unchanged text and unknown ids write nothing")
-- A live case is not touched: it has its own scan.
local live={canonical=makeRoot(402)}
local liveId=live.canonical.case.documents[1].id
local liveSame,liveChanged=Cases.noteLastSeen(live,{[liveId]="Carried."})
assert(liveSame==live and liveChanged==false,"live documents are not given a stored last-seen")
print("PASS retired evidence keeps where it was last seen: stored, cleaned, validated, old roots still load, updates copy-on-write")

-- 8. What the survivor is asked about at a case's end, and the answers
--    ("What do I make of it?", P4-R113; first cut P4-R119, P4-R121). Retirement
--    drops the case envelope, so the names are frozen on the retired record.
local oRoot=discoverAll(makeRoot(501))
local oRetired=Cases.sessions(assert(Cases.retire({canonical=oRoot},1)))[1]
local off=oRetired.offered
assert(off,"retirement keeps what the questions are about")
assert(off.premiseId==oRoot.case.premiseId and off.outline==oRoot.case.outline,"premise and outline kept")
assert(off.people[1]==oRoot.case.identities[1].name and off.people[2]==oRoot.case.identities[2].name,"both people's names kept")
assert(off.organisation==oRoot.case.organisation.name,"the organisation's name kept")
assert(oRetired.answers==nil,"nothing is answered at retirement")
assert(Retired.validate(oRetired))
local function withRoot(mutate) local c={} for k,x in pairs(oRetired) do c[k]=x end; mutate(c); return c end
local function withOffered(mutate) return withRoot(function(c) local o={} for k,x in pairs(off) do o[k]=x end
    o.people={off.people[1],off.people[2]}; mutate(o); c.offered=o end) end
assert(Retired.validate(withRoot(function(c) c.answers={reading="two",matters="person1",way="listen",changedHours=12.5} end)),"a full answer set is accepted")
assert(Retired.validate(withRoot(function(c) c.answers={way="records"} end)),"a partial answer set is accepted")
assert(Retired.validate(withRoot(function(c) c.answers={reading="unsure",changedHours=0,usedBy="generated:9:case"} end)),"used answers are accepted")
assert(not Retired.validate(withRoot(function(c) c.answers={reading="maybe"} end)),"an unknown reading is refused")
assert(not Retired.validate(withRoot(function(c) c.answers={matters="somebody"} end)),"an unknown person choice is refused")
assert(not Retired.validate(withRoot(function(c) c.answers={way="cold"} end)),"'leave it cold' is not in the first cut (P4-R119)")
assert(not Retired.validate(withRoot(function(c) c.answers={way="person",verdict="right"} end)),"no extra field, and never a verdict")
assert(not Retired.validate(withRoot(function(c) c.answers={changedHours=-1} end)),"negative hours refused")
assert(not Retired.validate(withRoot(function(c) c.answers={changedHours=0/0} end)),"NaN hours refused")
assert(not Retired.validate(withRoot(function(c) c.answers={usedBy=""} end)),"empty usedBy refused")
assert(not Retired.validate(withRoot(function(c) c.offered=nil; c.answers={way="person"} end)),"answers without what they are about are refused")
assert(Retired.validate(withRoot(function(c) c.offered=nil end)),"a retired root saved before offered existed still loads")
assert(not Retired.validate(withOffered(function(o) o.outline="maybe" end)),"an unknown outline is refused")
assert(not Retired.validate(withOffered(function(o) o.people={o.people[1]} end)),"exactly two people")
assert(not Retired.validate(withOffered(function(o) o.organisation="bad\nname" end)),"control characters in a name are refused")
assert(not Retired.validate(withOffered(function(o) o.organisation=string.rep("a",Retired.ORG_MAX+1) end)),"an over-long organisation is refused")
assert(Retired.validate(withOffered(function(o) o.organisation=string.rep("a",Retired.ORG_MAX) end)),"an organisation at the limit is accepted")
assert(not Retired.validate(withOffered(function(o) o.people={string.rep("a",Retired.NAME_MAX+1),o.people[2]} end)),"an over-long person's name is refused")
assert(not Retired.validate(withRoot(function(c) c.answers={usedBy=string.rep("u",Retired.CASE_ID_MAX+1)} end)),"an over-long case id is refused")
print("PASS a retired case keeps what the survivor will be asked about; answers validated, old roots still load")

-- 9. The first case of a game can hold every story clue PLUS the relay memo
--    (P4-R96), and must still retire. It did not: rows were capped at
--    MAX_EVIDENCE, so such a case finished and never retired (core-loop check
--    2026-09-15: "Case complete but not retired: invalid retired rows").
local memoCase=assert(G.generate(catalog(),3,{mapId="SYNTHETIC-MAP",buildLine="TEST-ONLY",allowSynthetic=true,relayMemo=true}))
assert(#memoCase.documents==G.MAX_EVIDENCE+1,"fixture: seed 3 must give every story clue plus the memo")
local memoTargets={}
for _,site in ipairs(memoCase.locations) do
    memoTargets[site.id]={x=site.bounds.x1,y=site.bounds.y1,z=site.bounds.z,objectIndex=0,
        containerIndex=0,containerType=site.containerTypes[1],sprite="sprite_placeholder"}
end
local memoRoot=discoverAll(assert(Session.create(memoCase,memoTargets)))
local memoRetired=assert(Cases.retire({canonical=memoRoot},1))
local memoRows=Cases.sessions(memoRetired)[1].rows
assert(#memoRows==G.MAX_EVIDENCE+1,"every clue, the memo included, survives retirement")
assert(Cases.validate(memoRetired))
print("PASS a first case with every story clue and the relay memo retires")
