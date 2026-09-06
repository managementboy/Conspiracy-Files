-- Single chronological ledger of what the player actually discovered.
-- Pure domain: no PZ runtime dependency.  Sources (generated evidence,
-- identity documents, derived connections) append here in real time so the
-- notebook can render one true discovery order instead of grouping by source.
local V=require("ConspiracyFiles/Validator")
local M={SCHEMA=1,MAX=512,MAX_REF=700}
local KINDS={evidence=true,identity=true,connection=true}
local EVENT_FIELDS={seq=true,at=true,kind=true,ref=true}
local ROOT_FIELDS={schema=true,nextSeq=true,events=true}

local function plain(t) return type(t)=="table" and not getmetatable(t) end
local function finite(v) return type(v)=="number" and v==v and v~=math.huge and v~=-math.huge end
local function counter(v) return finite(v) and v%1==0 and v>=1 and v<=M.MAX+1 end
local function ref(v) return type(v)=="string" and #v>0 and #v<=M.MAX_REF and v:find("%S") and not v:find("[%c]") end

local function copyEvent(e) local o={};for k in pairs(EVENT_FIELDS) do o[k]=e[k] end;return o end

local function validEvent(e)
    if not plain(e) then return false end
    for k in pairs(e) do if not EVENT_FIELDS[k] then return false end end
    return counter(e.seq) and KINDS[e.kind] and ref(e.ref) and finite(e.at) and e.at>=0
end

function M.empty() return {schema=M.SCHEMA,nextSeq=1,events={}} end

function M.validate(root)
    if not plain(root) or root.schema~=M.SCHEMA then return false,"invalid discovery ledger" end
    for k in pairs(root) do if not ROOT_FIELDS[k] then return false,"unknown ledger field" end end
    if not counter(root.nextSeq) or not plain(root.events) then return false,"invalid ledger header" end
    local n=0
    for k in pairs(root.events) do
        n=n+1
        if type(k)~="number" or k%1~=0 or k<1 or k>M.MAX then return false,"invalid event index" end
    end
    if n>M.MAX then return false,"ledger capacity exceeded" end
    local seen,previous={},0
    for i=1,n do
        local e=root.events[i]
        if not validEvent(e) then return false,"invalid discovery event" end
        if e.seq<=previous then return false,"non-increasing discovery sequence" end
        if seen[e.ref] then return false,"duplicate discovery reference" end
        seen[e.ref]=true; previous=e.seq
    end
    if root.nextSeq<=previous then return false,"ledger sequence counter behind events" end
    return V.validateStructure(root)
end

-- Append one discovery.  Returns the staged replacement plus whether it
-- changed; an already recorded reference is a no-op, never a rewrite.
function M.record(root,kind,reference,at)
    local ok,why=M.validate(root); if not ok then return nil,false,why end
    if not KINDS[kind] or not ref(reference) or not finite(at) or at<0 then return nil,false,"invalid discovery" end
    local staged=M.empty(); staged.nextSeq=root.nextSeq
    for i,e in ipairs(root.events) do
        staged.events[i]=copyEvent(e)
        if e.ref==reference then return staged,false end
    end
    if #staged.events>=M.MAX then return staged,false,"ledger capacity exceeded" end
    staged.events[#staged.events+1]={seq=root.nextSeq,at=at,kind=kind,ref=reference}
    staged.nextSeq=root.nextSeq+1
    ok,why=M.validate(staged); if not ok then return nil,false,why end
    return staged,true
end

function M.events(root)
    if not M.validate(root) then return {} end
    local out={}; for i,e in ipairs(root.events) do out[i]=copyEvent(e) end; return out
end

-- Ledger sequence per reference; callers use it to place rows chronologically.
function M.positions(root)
    local out={}
    for _,e in ipairs(M.events(root)) do out[e.ref]=e.seq end
    return out
end

-- Order display rows by true discovery order and renumber them.  Rows the
-- ledger has never seen keep their incoming relative order and follow the
-- recorded ones, so an unledgered source degrades instead of disappearing.
function M.order(root,rows)
    local positions=M.positions(root)
    local ordered={}
    for index,row in ipairs(rows) do ordered[index]={row=row,index=index,seq=positions[row.id]} end
    table.sort(ordered,function(a,b)
        if (a.seq~=nil)~=(b.seq~=nil) then return a.seq~=nil end
        if a.seq and b.seq and a.seq~=b.seq then return a.seq<b.seq end
        return a.index<b.index
    end)
    local out={}
    for index,entry in ipairs(ordered) do out[index]=entry.row; entry.row.ordinal=index end
    return out
end

return M
