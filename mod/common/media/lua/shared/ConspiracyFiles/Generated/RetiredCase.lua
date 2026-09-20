-- Retire an accounted-for case by removing placement bookkeeping. Every
-- discovered source row, its geographic context, known order, interpretation
-- and last-seen description remain available throughout the campaign.
-- Pure domain: zero PZ dependencies, testable in plain Lua 5.1.
local V=require("ConspiracyFiles/Validator")
local G=require("ConspiracyFiles/Generated/Generator")
local Catalog=require("ConspiracyFiles/Generated/Catalog")
local EvidenceKinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local Pages=require("ConspiracyFiles/Generated/DocumentPages")
local Session=require("ConspiracyFiles/Generated/Session")
local Story=require("ConspiracyFiles/Generated/Story")
local M={SCHEMA=2}
-- Freeze closing choices only when their sources were discovered. Personal
-- names and organisations come from the source documents the survivor read.
-- Completion and gap history survive retirement independently of the choices.
local ROOT_FIELDS={schema=true,caseId=true,rows=true,known=true,offered=true,answers=true,completedHours=true,
                   completion=true,gaps=true,gapsFrom=true,thread=true,followsFrom=true,locations=true,reference=true}
local OFFERED_FIELDS={premiseId=true,outline=true,people=true,organisation=true,readings=true,question=true}
local ANSWER_FIELDS={reading=true,matters=true,way=true,changedHours=true,usedBy=true}
M.OUTLINES={corroboration=true,["conflicting-account"]=true}
M.READINGS={one=true,two=true,unsure=true}
M.MATTERS={person1=true,person2=true,organisation=true,nobody=true}
-- "leave it cold" is left out until the cold-trail state exists (P4-R119);
-- "listen" stays and is served by a broadcast transcript (P4-R121).
M.WAYS={person=true,records=true,listen=true}
-- Lengths are save-budget costs, measured worst case (2026-09-15): a person's
-- name is at most what the cast accepts (Generator.castFrom, 60); the longest
-- organisation the generator writes is 43, so 80 leaves room for a long
-- building name; a case id is "generated:<seed>:case", about 25.
M.NAME_MAX=60
M.ORG_MAX=80
M.CASE_ID_MAX=80
-- Last observed physical location, kept even after placement bookkeeping goes.
local ROW_FIELDS={id=true,kind=true,title=true,body=true,locationId=true,leads=true,connections=true,lastSeen=true}
M.LAST_SEEN_MAX=160
local LINK_FIELDS={target=true,kind=true}

local function copy(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=copy(x) end return o end
local function fields(t,allowed) if type(t)~="table" then return false end for k in pairs(t) do if not allowed[k] then return false end end return true end
local function text(v,max) return type(v)=="string" and v~="" and #v<=(max or 300) end
local function dense(t,max)
    if type(t)~="table" then return false end
    local n=0
    for k in pairs(t) do if type(k)~="number" or k~=math.floor(k) or k<1 then return false end n=n+1 end
    if max and n>max then return false end
    for i=1,n do if t[i]==nil then return false end end
    return true,n
end

-- Distinguishes a retired root from a live Session root (schema 1) so
-- SuccessiveCases can hold a mix of the two without guessing at shape.
function M.isRetired(root) return type(root)=="table" and root.schema==M.SCHEMA end
-- Retained call surface; archives always keep source rows.
function M.isStub(root) return false end

-- Printable text only: a custom container name is player-typed and reaches the
-- save through this field, so a control character is refused, not stored.
local function printable(v,max)
    if not text(v,max) then return false end
    for i=1,#v do local b=string.byte(v,i); if b<32 or b==127 then return false end end
    return true
end
-- What a caller may store: control characters become spaces and the text is
-- cut to the limit, so an over-long vehicle-and-address line is shortened
-- rather than refusing the whole write. nil when nothing printable is left.
function M.cleanLastSeen(v)
    if type(v)~="string" then return nil end
    local out={}
    for i=1,#v do local b=string.byte(v,i); out[#out+1]=(b<32 or b==127) and " " or string.char(b) end
    local s=table.concat(out):gsub("^%s+",""):gsub("%s+$","")
    if #s>M.LAST_SEEN_MAX then s=string.sub(s,1,M.LAST_SEEN_MAX) end
    if s=="" then return nil end
    return s
end

local function rowOK(row)
    if not fields(row,ROW_FIELDS) then return false end
    if not text(row.id,300) or not text(row.title,160) then return false end
    if type(row.body)~="string" or row.body=="" or #row.body>20000 then return false end
    if not EvidenceKinds.get(row.kind) then return false end
    if not text(row.locationId,300) then return false end
    if row.lastSeen~=nil and not printable(row.lastSeen,M.LAST_SEEN_MAX) then return false end
    local ok,n=dense(row.leads,8); if not ok then return false end
    for i=1,n do if type(row.leads[i])~="string" then return false end end
    local ok2,n2=dense(row.connections,8); if not ok2 then return false end
    for i=1,n2 do
        local link=row.connections[i]
        if not fields(link,LINK_FIELDS) or type(link.target)~="string" or link.target=="" or type(link.kind)~="string" or link.kind=="" then return false end
    end
    return true
end

local function offeredOK(o)
    if not fields(o,OFFERED_FIELDS) then return false end
    if not text(o.premiseId,80) or not M.OUTLINES[o.outline] then return false end
    local ok,n=dense(o.people,2); if not ok then return false end
    for i=1,n do if not printable(o.people[i],M.NAME_MAX) then return false end end
    if o.readings~=nil then
        local valid,count=dense(o.readings,2)
        if not valid or count~=2 then return false end
        for _,reading in ipairs(o.readings) do if not printable(reading,400) then return false end end
        if not printable(o.question,400) then return false end
    elseif o.question~=nil then return false end
    return o.organisation==nil or printable(o.organisation,M.ORG_MAX)
end
local function answersOK(a,offered)
    if not fields(a,ANSWER_FIELDS) then return false end
    if a.reading~=nil and not M.READINGS[a.reading] then return false end
    if a.matters~=nil and not M.MATTERS[a.matters] then return false end
    if a.matters=="person1" and (not offered or not offered.people or not offered.people[1]) then return false end
    if a.matters=="person2" and (not offered or not offered.people or not offered.people[2]) then return false end
    if a.matters=="organisation" and (not offered or not offered.organisation) then return false end
    if a.way~=nil and not M.WAYS[a.way] then return false end
    if a.changedHours~=nil and (type(a.changedHours)~="number" or a.changedHours~=a.changedHours
        or a.changedHours<0 or a.changedHours==math.huge) then return false end
    if a.usedBy~=nil and not text(a.usedBy,M.CASE_ID_MAX) then return false end
    return true
end

-- A follow-up must still name a discovered source in this retained archive.
local function threadOK(root)
    if root.thread==nil then return true end
    if not Story.validThread(root.thread,false) or root.completion==Session.INCOMPLETE
        or type(root.known)~="table" then return false end
    for _,id in ipairs(root.known or {}) do if id==root.thread.document then return true end end
    return false
end
local function completionOK(root)
    if root.completion==nil then
        -- No state carried: then no gap list and no history either. An older
        -- record says nothing, and Session.completion reads it as unknown.
        return root.gaps==nil and root.gapsFrom==nil
    end
    if root.completion~=Session.COMPLETE and root.completion~=Session.WITH_GAPS
        and root.completion~=Session.INCOMPLETE then return false end
    if root.completion==Session.COMPLETE then
        return (root.gaps==nil or #root.gaps==0) and root.gapsFrom==nil
    end
    -- An incomplete case carries gaps exactly as a gap-bearing one does: the
    -- difference is WHICH clues they were, not how they are recorded.
    local ok,n=dense(root.gaps,G.MAX_EVIDENCE+1); if not ok or n<1 then return false end
    local seen={}
    for i=1,n do
        local id=root.gaps[i]
        if not text(id,300) or seen[id] then return false end
        seen[id]=true
    end
    -- The history is optional, but if present it may only describe THESE gaps,
    -- and only with a value from the closed set.
    if root.gapsFrom~=nil then
        if type(root.gapsFrom)~="table" then return false end
        local count=0
        for id,from in pairs(root.gapsFrom) do
            if not seen[id] then return false end
            if from~="deferred" and from~="carrier" and from~="unrecorded" then return false end
            count=count+1
        end
        if count>n then return false end
    end
    return true
end
function M.validate(root)
    local safe=V.validateStructure(root); if not safe then return false,"invalid retired case" end
    if not fields(root,ROOT_FIELDS) or root.schema~=M.SCHEMA then return false,"invalid retired case" end
    if not text(root.caseId) then return false,"invalid retired case" end
    if not printable(root.reference,120) then return false,"invalid retired reference" end
    local catalogOK=Catalog.validate({revision="retired-archive",locations=root.locations})
    if not catalogOK or type(root.locations)~="table" or #root.locations~=2 then return false,"invalid retired locations" end
    if root.locations[1].mapId~=root.locations[2].mapId or root.locations[1].buildLine~=root.locations[2].buildLine
        or not Catalog.distinct(root.locations[1],root.locations[2]) then return false,"invalid retired locations" end
    local locationIds={}
    for _,location in ipairs(root.locations) do locationIds[location.id]=true end
    -- The relay memo (P4-R96) takes no story role, so the first case of a game
    -- can hold MAX_EVIDENCE story clues plus the memo. Capping rows at
    -- MAX_EVIDENCE refused that case at retirement for good ("Case complete
    -- but not retired: invalid retired rows", core-loop check 2026-09-15; the
    -- "0 of 8 last seen" of 2026-09-14 was the same fault).
    if not completionOK(root) then return false,"invalid retired completion" end
    if not threadOK(root) then return false,"invalid retired thread" end
    if root.followsFrom~=nil and not text(root.followsFrom,80) then return false,"invalid retired followsFrom" end
    local ok,n=dense(root.rows,G.MAX_EVIDENCE+1); if not ok then return false,"invalid retired rows" end
    -- A CASE THAT ENDED WITHOUT CLUES MAY RETIRE WITH FEWER ROWS, INCLUDING
    -- NONE. The blunt minimum here was the last link in the stall: the drop
    -- paths now re-check retirement (P4-R142), retirement was reached, and then
    -- refused with "invalid retired rows" because dropped clues project no row.
    -- The case kept its active slot anyway, which is the whole fault.
    -- Verified by the owner against a one-container fixture:
    --   known=1 valid=true accounted=true retired=nil reason=invalid retired rows
    -- The minimum is not dropped, it is EXPLAINED: a short case must carry the
    -- gaps that account for the shortfall, so no record can be short for any
    -- other reason.
    if n<G.MIN_EVIDENCE then
        if root.completion~=Session.WITH_GAPS and root.completion~=Session.INCOMPLETE then
            return false,"invalid retired rows"
        end
        if #(root.gaps or {})<G.MIN_EVIDENCE-n then return false,"invalid retired rows" end
    end
    local ids={}
    for i=1,n do
        local row=root.rows[i]
        if not rowOK(row) then return false,"invalid retired row" end
        if not locationIds[row.locationId] then return false,"retired row has unknown location" end
        for _,lead in ipairs(row.leads) do if not locationIds[lead] then return false,"retired row has unknown lead" end end
        if ids[row.id] then return false,"duplicate retired row" end
        ids[row.id]=true
    end
    -- `known` retains exactly the case's own prior discovery order (never
    -- regenerated); only discovered clues receive rows, including gap cases.
    local ok2,kn=dense(root.known,n); if not ok2 then return false,"invalid retired known" end
    if kn~=n then return false,"retired case must be fully discovered" end
    local seen={}
    for i=1,kn do
        local id=root.known[i]
        if not ids[id] or seen[id] then return false,"invalid retired known" end
        seen[id]=true
    end
    for id in pairs(ids) do if not seen[id] then return false,"invalid retired known" end end
    if root.offered~=nil and not offeredOK(root.offered) then return false,"invalid retired offered" end
    -- Answers name "person 1" or "the organisation", so they mean nothing
    -- without the names they were given about.
    if root.answers~=nil and (root.offered==nil or not answersOK(root.answers,root.offered)) then return false,"invalid retired answers" end
    local h=root.completedHours
    if h~=nil and (type(h)~="number" or h~=h or h<0 or h==math.huge) then return false,"invalid retired completion hour" end
    if V.estimateEncodedBytes(root)>500000 then return false,"retired case size exceeded" end
    return true
end

-- Build the retired replacement for a fully-discovered Session root. Never
-- called on an already-retired root (callers check M.isRetired first); this
-- alone does not mutate or replace anything -- the caller validates the
-- whole aggregate and swaps atomically, same as every other canonical
-- mutation. `lastSeen` optionally maps document id -> where the scan last saw
-- it; anything unusable is left out rather than failing the retirement.
function M.retire(root,lastSeen,completedHours)
    local ok,why=Session.validate(root); if not ok then return nil,why end
    -- Every clue accounted for (P4-R133): found, or dropped after three
    -- in-game days with nowhere to go. A dropped clue was never in the world,
    -- so the case closes on the clues it got and keeps no row for it - a
    -- four-clue case is still a case. A clue still WAITING is not accounted
    -- for, and Session.accounted is what the runtime asks before retiring.
    if not Session.accounted(root) then return nil,"case is not fully discovered" end
    local rows,rowsWhy=G.project(root.case,root.known); if not rows then return nil,rowsWhy end
    if type(lastSeen)=="table" then
        for _,row in ipairs(rows) do row.lastSeen=M.cleanLastSeen(lastSeen[row.id]) end
    end
    local out={schema=M.SCHEMA,caseId=root.case.caseId,rows=rows,known=copy(root.known),
        locations=copy(root.case.locations),reference=root.case.facts.code}
    -- What the survivor will be asked about. Left out rather than failing the
    -- retirement if anything in it would not validate: a case must always be
    -- able to retire, and a missing question costs less than a stuck save.
    local c,who=root.case,root.case.identities or {}
    local known={}; for _,id in ipairs(root.known) do known[id]=true end
    local essentialKnown=true
    for _,id in ipairs(c.essential or {}) do if not known[id] then essentialKnown=false end end
    local sourceText={}
    for _,row in ipairs(rows) do sourceText[#sourceText+1]=Pages.text(row.body) or "" end
    sourceText=table.concat(sourceText,"\n")
    local people={}
    for _,person in ipairs(who) do
        if type(person.name)=="string" and sourceText:find(person.name,1,true) then people[#people+1]=person.name end
    end
    local organisation=c.organisation and c.organisation.name
    if organisation and not sourceText:lower():find(organisation:lower(),1,true) then organisation=nil end
    local offered={premiseId=c.premiseId,outline=c.outline,people=people,organisation=organisation}
    if c.story then offered.readings=copy(c.story.readings); offered.question=c.story.unresolved end
    -- Author-written closing choices summarize the completed investigation.
    -- A placement gap cannot reveal that summary before its sources are read.
    if (not c.story or essentialKnown) and offeredOK(offered) then out.offered=offered end
    if type(completedHours)=="number" and completedHours==completedHours and completedHours>=0
        and completedHours~=math.huge then out.completedHours=completedHours end
    -- WHAT THIS CASE FINISHED AS. Carried before the assignments are dropped,
    -- because after that nothing can work it out: a retired record has no
    -- assignments and no case envelope, so asked afterwards it reported no
    -- gaps and every finished case read as clean.
    -- THE THREAD SURVIVES RETIREMENT. A follow-up inherits
    -- a sourced finding from this case, and a retired root keeps no case
    -- envelope at all - so without carrying it here the connection would die
    -- the moment the opening retired, which is precisely when the follow-up is
    -- meant to arrive (PHASE_C_CONTINUITY_CARRIER.md). A few dozen bytes.
    if type(root.case)=="table" and type(root.case.thread)=="table" then
        local complete=essentialKnown and known[root.case.thread.document]==true
        if complete then out.thread=copy(root.case.thread) end
    end
    -- WHICH CASE THIS ONE FOLLOWED, kept so a spent thread stays spent. Without
    -- it, a retired follow-up would forget its own inheritance and the opening's
    -- thread would look unused for ever - offering a third case, then a fourth,
    -- all following the same finding. Only the id, not the whole carrier: it is
    -- the one field the "already followed" test needs, and a retired record is
    -- charged against the aggregate estimated save allowance.
    if type(root.case)=="table" and type(root.case.follows)=="table" then
        out.followsFrom=root.case.follows.fromCase
    end
    local carried=Session.retiredGapFields(root)
    if carried.completion then
        out.completion=carried.completion; out.gaps=carried.gaps; out.gapsFrom=carried.gapsFrom
    end
    ok,why=M.validate(out); if not ok then return nil,why end
    return out
end

-- Retained call surface: requesting compaction never discards source history.
function M.shrink(root)
    local ok,why=M.validate(root); if not ok then return nil,why end
    return root,false
end

return M
