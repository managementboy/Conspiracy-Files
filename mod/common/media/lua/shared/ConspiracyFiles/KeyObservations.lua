-- Keys found on a body, recorded in the journal before any door is tried.
--
-- Owner, 2026-09-11, having searched a corpse carrying two keys and an ID:
-- "would be cool that we write the information about the keys into our
-- journal. not evidence." Until now a key entered the journal only once it had
-- opened a door (ObservedKeyLead). A key in a dead man's pocket, with the name
-- on his ID beside it, was recorded nowhere.
--
-- WHAT MAY BE SAID. The engine gives every building a lock number and every
-- key the lock number it opens, so "cut for 105 4th St" is a fact about the
-- key. It is not a claim that the body lived there, owned it, or had any right
-- to be in it - and no wording here may say otherwise.
--
-- Pure domain: zero engine dependencies. The client store and observer live in
-- ConspiracyFiles/KeyObserver.
local V=require("ConspiracyFiles/Validator")
local M={SCHEMA=1,MAX=64}
local FIELDS={id=true,keyId=true,token=true,carrier=true,building=true,label=true,
    x=true,y=true,z=true,observedAt=true}

local function plain(t) return type(t)=="table" and not getmetatable(t) end
local function text(v,n) return type(v)=="string" and #v>0 and #v<=(n or 160) and not v:find("[%c]") end
local function finite(n) return type(n)=="number" and n==n and n~=math.huge and n~=-math.huge end
local function copy(r) local o={}; for k in pairs(FIELDS) do o[k]=r[k] end; return o end

local function valid(r)
    if not plain(r) then return false end
    for k in pairs(r) do if not FIELDS[k] then return false end end
    return text(r.id,160) and type(r.keyId)=="number" and r.keyId==math.floor(r.keyId)
        and (r.token==nil or text(r.token,160)) and (r.carrier==nil or text(r.carrier,80))
        and (r.building==nil or text(r.building,80)) and (r.label==nil or text(r.label,120))
        and finite(r.x) and finite(r.y) and finite(r.z) and finite(r.observedAt) and r.observedAt>=0
end

function M.empty() return {schema=M.SCHEMA,keys={}} end

function M.validate(root)
    if not plain(root) or root.schema~=M.SCHEMA or not plain(root.keys) then return false,"invalid key observation state" end
    for k in pairs(root) do if k~="schema" and k~="keys" then return false,"unknown key observation field" end end
    local n=0
    for id,r in pairs(root.keys) do
        n=n+1
        if n>M.MAX then return false,"key observation capacity exceeded" end
        if type(id)~="string" or not valid(r) or r.id~=id then return false,"invalid key observation" end
    end
    return V.validateStructure(root)
end

-- Append one key. Seeing the same key again is a no-op: a key is observed
-- once, where it was first found.
function M.observe(root,record)
    local ok,why=M.validate(root); if not ok then return nil,false,why end
    if not valid(record) then return nil,false,"invalid key observation" end
    local staged=M.empty()
    local n=0
    for id,r in pairs(root.keys) do staged.keys[id]=copy(r); n=n+1 end
    if staged.keys[record.id] then return staged,false end
    if n>=M.MAX then return staged,false,"key observation capacity exceeded" end
    staged.keys[record.id]=copy(record)
    ok,why=M.validate(staged); if not ok then return nil,false,why end
    return staged,true
end

local NUMBERS={"One","Two","Three","Four","Five","Six"}
local function count(n) return NUMBERS[n] or tostring(n) end

-- Journal rows, one per body or bag, so two keys from one corpse read as one
-- entry about that corpse rather than two unrelated finds.
--
-- nameFor(token): the name recorded off an ID on the same body, if any.
-- caseFor(building): a short phrase if that building holds a case document,
-- such as "where the file marked PS-289 was found". Both optional.
function M.rows(root,nameFor,caseFor)
    if not M.validate(root) then return {} end
    local groups,order={},{}
    for _,r in pairs(root.keys) do
        local key=r.token or ("loose:"..r.id)
        if not groups[key] then groups[key]={token=r.token,keys={},first=r.observedAt,carrier=r.carrier};order[#order+1]=key end
        local g=groups[key]
        g.keys[#g.keys+1]=r
        if r.observedAt<g.first then g.first=r.observedAt end
    end
    table.sort(order,function(a,b)
        if groups[a].first~=groups[b].first then return groups[a].first<groups[b].first end
        return a<b end)
    local rows={}
    for i,key in ipairs(order) do
        local g=groups[key]
        table.sort(g.keys,function(a,b) return a.id<b.id end)
        local name=nil
        if g.token and nameFor then
            local ok,found=pcall(nameFor,g.token)
            if ok and text(found,120) then name=found end
        end
        local who
        if name then who="the body carrying "..name.."'s ID"
        elseif g.token then who="a body"
        else who="nobody in particular" end
        local plural=#g.keys>1
        local detail=count(#g.keys)..(plural and " keys were" or " key was").." with "..who.."."
        for n,r in ipairs(g.keys) do
            local where
            if r.label then where="cut for "..r.label
            elseif r.building then where="cut for a building the address book does not name"
            else where="cut for a lock I have not matched to any building" end
            local lead=plural and (n==1 and " One is " or (n==#g.keys and " The other is " or " Another is ")) or " It is "
            if plural and #g.keys>2 and n==#g.keys then lead=" The last is " end
            detail=detail..lead..where.."."
            if r.building and caseFor then
                local ok,phrase=pcall(caseFor,r.building)
                if ok and text(phrase,160) then detail=detail:sub(1,-2)..", "..phrase.."." end
            end
        end
        -- The claim stays at the strength a key supports.
        detail=detail.."\n\nA key says which lock it opens. It does not say whose it was, or that they lived where it fits."
        local title=(plural and count(#g.keys).." keys" or "A key")..(name and (" on "..name) or (g.token and " on a body" or ""))
        rows[#rows+1]={id="keys:"..key,ordinal=i,title=title,summary="Keys - "..(g.carrier or "found"),detailText=detail}
    end
    return rows
end

return M
