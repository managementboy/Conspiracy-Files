-- Pure domain: durable association between a corpse/wallet provenance token
-- (LocalPersonIntegration's entry.token / cfObservedSource) and the name
-- observed on an identity document found with it. This is evidence, not
-- interpretation: once a token is associated with a name, a later
-- observation must agree or be refused outright, never silently rewritten.
-- Never invents a name -- callers only ever pass what they parsed off a
-- document label. Zero PZ dependencies; the client store lives in
-- ConspiracyFiles/PersonNameLog.
local V=require("ConspiracyFiles/Validator")
local M={SCHEMA=1,MAX=32}
local FACT_FIELDS={token=true,name=true}

local function plain(t) return type(t)=="table" and not getmetatable(t) end
local function text(v,n) return type(v)=="string" and #v>0 and #v<=(n or 160) and v:find("%S") and not v:find("[%c]") end

local function copyFact(f)
    local o={}
    for k in pairs(FACT_FIELDS) do o[k]=f[k] end
    return o
end

local function validFact(f)
    if not plain(f) then return false end
    for k in pairs(f) do if not FACT_FIELDS[k] then return false end end
    return text(f.token,160) and text(f.name,120)
end

function M.empty() return {schema=M.SCHEMA,names={}} end

function M.validate(root)
    if not plain(root) or root.schema~=M.SCHEMA or not plain(root.names) then return false,"invalid person name state" end
    for k in pairs(root) do if k~="schema" and k~="names" then return false,"unknown person name field" end end
    local n=0
    for k,f in pairs(root.names) do
        n=n+1
        if n>M.MAX then return false,"name capacity exceeded" end
        if type(k)~="string" or not validFact(f) or f.token~=k then return false,"invalid name fact" end
    end
    return V.validateStructure(root)
end

-- Append one token->name association. An already-recorded token is a no-op
-- unless the new observation contradicts it, which is refused rather than
-- overwritten -- the same discipline as ObservedKeyLead.observe.
function M.observe(root,token,name)
    local ok,why=M.validate(root); if not ok then return nil,false,why end
    local fact={token=token,name=name}
    if not validFact(fact) then return nil,false,"invalid person name observation" end
    local staged=M.empty()
    for k,f in pairs(root.names) do staged.names[k]=copyFact(f) end
    local existing=staged.names[token]
    if existing then
        if existing.name~=name then return nil,false,"contradictory person name" end
        return staged,false
    end
    local n=0; for _ in pairs(staged.names) do n=n+1 end
    if n>=M.MAX then return staged,false,"name capacity exceeded" end
    staged.names[token]=copyFact(fact)
    ok,why=M.validate(staged); if not ok then return nil,false,why end
    return staged,true
end

function M.nameFor(root,token)
    local ok=M.validate(root); if not ok then return nil end
    if type(token)~="string" then return nil end
    local f=root.names[token]
    return f and f.name or nil
end

-- Every name recorded so far, ordered by token so the list is the same on every
-- machine. Used to build a new case around people the player has already met.
function M.names(root)
    local ok=M.validate(root); if not ok then return {} end
    local tokens={}
    for token in pairs(root.names) do tokens[#tokens+1]=token end
    table.sort(tokens)
    local out={}
    for _,token in ipairs(tokens) do out[#out+1]=root.names[token].name end
    return out
end
return M
