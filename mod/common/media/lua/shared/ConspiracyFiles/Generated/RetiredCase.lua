-- Case retirement (docs/design/CASE_RETIREMENT.md): once every document in a
-- generated case has been discovered, its full session root -- assignments,
-- physical targets, container coordinates, sprites, placement status and the
-- now-redundant case envelope (facts, identities, organisation, catalog
-- locations, seed/revision bookkeeping) -- is worthless. Nothing needs to
-- place, reconcile or relocate a clue the player already has. This module
-- replaces a completed root with a much smaller record that keeps only the
-- case id and the discovered evidence rows the notebook renders: an
-- immutable fact the player learned is never dropped, only the placement
-- bookkeeping around it.
-- Pure domain: zero PZ dependencies, testable in plain Lua 5.1.
local V=require("ConspiracyFiles/Validator")
local G=require("ConspiracyFiles/Generated/Generator")
local EvidenceKinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local Session=require("ConspiracyFiles/Generated/Session")
local M={SCHEMA=2}
-- offered / answers ("What do I make of it?", P4-R113, first cut P4-R119 and
-- P4-R121): what the survivor is asked about at a case's end, frozen when the
-- case retires because retirement drops the case envelope that holds the
-- names, and the survivor's answers. Both optional, like lastSeen, so older
-- schema-2 roots still load and SCHEMA stays 2. Only names and choices are
-- stored; the question and reading wording is looked up by premise id.
-- completedHours: the world hour the case finished, so the next case can wait
-- a little for the survivor's answers (P4-R121). Optional, like the rest.
local ROOT_FIELDS={schema=true,caseId=true,rows=true,known=true,offered=true,answers=true,completedHours=true}
local OFFERED_FIELDS={premiseId=true,outline=true,people=true,organisation=true}
local ANSWER_FIELDS={reading=true,matters=true,way=true,changedHours=true,usedBy=true}
M.OUTLINES={corroboration=true,["conflicting-account"]=true}
M.READINGS={one=true,two=true,unsure=true}
M.MATTERS={person1=true,person2=true,organisation=true,nobody=true}
-- "leave it cold" is left out until the cold-trail state exists (P4-R119);
-- "listen" stays and is served by a broadcast paper (P4-R121).
M.WAYS={person=true,records=true,listen=true}
M.NAME_MAX=160
-- lastSeen (P4-R104): where the mod last saw this document's physical paper,
-- in the same words the notebook uses ("Carried, in your Una's Papers.").
-- Owner in play, 2026-09-14, after a case completed: "I lost my files
-- somewhere?" Retirement had dropped every placement detail, so the notebook
-- could no longer say where the papers were. Optional, so a schema-2 root
-- saved before this still validates and SCHEMA stays 2: a save is never
-- refused for lacking a sentence we did not write yet.
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
    local ok,n=dense(o.people,2); if not ok or n~=2 then return false end
    for i=1,2 do if not printable(o.people[i],M.NAME_MAX) then return false end end
    return printable(o.organisation,M.NAME_MAX)
end
local function answersOK(a)
    if not fields(a,ANSWER_FIELDS) then return false end
    if a.reading~=nil and not M.READINGS[a.reading] then return false end
    if a.matters~=nil and not M.MATTERS[a.matters] then return false end
    if a.way~=nil and not M.WAYS[a.way] then return false end
    if a.changedHours~=nil and (type(a.changedHours)~="number" or a.changedHours~=a.changedHours
        or a.changedHours<0 or a.changedHours==math.huge) then return false end
    if a.usedBy~=nil and not text(a.usedBy,300) then return false end
    return true
end

function M.validate(root)
    local safe=V.validateStructure(root); if not safe then return false,"invalid retired case" end
    if not fields(root,ROOT_FIELDS) or root.schema~=M.SCHEMA then return false,"invalid retired case" end
    if not text(root.caseId) then return false,"invalid retired case" end
    -- The relay memo (P4-R96) takes no story role, so the first case of a game
    -- can hold MAX_EVIDENCE story papers plus the memo. Capping rows at
    -- MAX_EVIDENCE refused that case at retirement for good ("Case complete
    -- but not retired: invalid retired rows", core-loop check 2026-09-15; the
    -- "0 of 8 last seen" of 2026-09-14 was the same fault).
    local ok,n=dense(root.rows,G.MAX_EVIDENCE+1); if not ok then return false,"invalid retired rows" end
    if n<G.MIN_EVIDENCE then return false,"invalid retired rows" end
    local ids={}
    for i=1,n do
        local row=root.rows[i]
        if not rowOK(row) then return false,"invalid retired row" end
        if ids[row.id] then return false,"duplicate retired row" end
        ids[row.id]=true
    end
    -- `known` retains exactly the case's own prior discovery order (never
    -- regenerated); retirement requires the whole case to already be known.
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
    if root.answers~=nil and (root.offered==nil or not answersOK(root.answers)) then return false,"invalid retired answers" end
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
    if #root.known~=#root.case.documents then return nil,"case is not fully discovered" end
    local rows,rowsWhy=G.project(root.case,root.known); if not rows then return nil,rowsWhy end
    if type(lastSeen)=="table" then
        for _,row in ipairs(rows) do row.lastSeen=M.cleanLastSeen(lastSeen[row.id]) end
    end
    local out={schema=M.SCHEMA,caseId=root.case.caseId,rows=rows,known=copy(root.known)}
    -- What the survivor will be asked about. Left out rather than failing the
    -- retirement if anything in it would not validate: a case must always be
    -- able to retire, and a missing question costs less than a stuck save.
    local c,who=root.case,root.case.identities or {}
    local offered={premiseId=c.premiseId,outline=c.outline,
        people={who[1] and who[1].name,who[2] and who[2].name},organisation=c.organisation and c.organisation.name}
    if offeredOK(offered) then out.offered=offered end
    if type(completedHours)=="number" and completedHours==completedHours and completedHours>=0
        and completedHours~=math.huge then out.completedHours=completedHours end
    ok,why=M.validate(out); if not ok then return nil,why end
    return out
end

return M
