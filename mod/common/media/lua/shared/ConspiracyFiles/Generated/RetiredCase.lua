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
local ROOT_FIELDS={schema=true,caseId=true,rows=true,known=true}
local ROW_FIELDS={id=true,kind=true,title=true,body=true,locationId=true,leads=true,connections=true}
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

local function rowOK(row)
    if not fields(row,ROW_FIELDS) then return false end
    if not text(row.id,300) or not text(row.title,160) then return false end
    if type(row.body)~="string" or row.body=="" or #row.body>20000 then return false end
    if not EvidenceKinds.get(row.kind) then return false end
    if not text(row.locationId,300) then return false end
    local ok,n=dense(row.leads,8); if not ok then return false end
    for i=1,n do if type(row.leads[i])~="string" then return false end end
    local ok2,n2=dense(row.connections,8); if not ok2 then return false end
    for i=1,n2 do
        local link=row.connections[i]
        if not fields(link,LINK_FIELDS) or type(link.target)~="string" or link.target=="" or type(link.kind)~="string" or link.kind=="" then return false end
    end
    return true
end

function M.validate(root)
    local safe=V.validateStructure(root); if not safe then return false,"invalid retired case" end
    if not fields(root,ROOT_FIELDS) or root.schema~=M.SCHEMA then return false,"invalid retired case" end
    if not text(root.caseId) then return false,"invalid retired case" end
    local ok,n=dense(root.rows,G.MAX_EVIDENCE); if not ok then return false,"invalid retired rows" end
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
    if V.estimateEncodedBytes(root)>500000 then return false,"retired case size exceeded" end
    return true
end

-- Build the retired replacement for a fully-discovered Session root. Never
-- called on an already-retired root (callers check M.isRetired first); this
-- alone does not mutate or replace anything -- the caller validates the
-- whole aggregate and swaps atomically, same as every other canonical
-- mutation.
function M.retire(root)
    local ok,why=Session.validate(root); if not ok then return nil,why end
    if #root.known~=#root.case.documents then return nil,"case is not fully discovered" end
    local rows,rowsWhy=G.project(root.case,root.known); if not rows then return nil,rowsWhy end
    local out={schema=M.SCHEMA,caseId=root.case.caseId,rows=rows,known=copy(root.known)}
    ok,why=M.validate(out); if not ok then return nil,why end
    return out
end

return M
