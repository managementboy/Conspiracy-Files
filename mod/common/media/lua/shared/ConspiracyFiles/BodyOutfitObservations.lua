-- Pure domain: durable association between a corpse's provenance token
-- (LocalPersonIntegration's entry.token / cfObservedSource -- the SAME token
-- PersonNameObservations keys on, never a second scheme) and the outfit
-- name the game already reports for that body via IsoDeadBody:getOutfitName().
-- This is an observation, not an interpretation: a body wears whatever the
-- game decided, and once a token is associated with an outfit, a later
-- disagreeing reading is refused outright, never silently rewritten -- same
-- discipline as PersonNameObservations.observe.
-- Never invents an outfit -- callers only ever pass what getOutfitName()
-- returned. Zero PZ dependencies; the client store lives in
-- ConspiracyFiles/BodyOutfitLog.
local V=require("ConspiracyFiles/Validator")
local M={SCHEMA=1,MAX=32}
local FACT_FIELDS={token=true,outfit=true}

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
    return text(f.token,160) and text(f.outfit,120)
end

function M.empty() return {schema=M.SCHEMA,outfits={}} end

function M.validate(root)
    if not plain(root) or root.schema~=M.SCHEMA or not plain(root.outfits) then return false,"invalid body outfit state" end
    for k in pairs(root) do if k~="schema" and k~="outfits" then return false,"unknown body outfit field" end end
    local n=0
    for k,f in pairs(root.outfits) do
        n=n+1
        if n>M.MAX then return false,"outfit capacity exceeded" end
        if type(k)~="string" or not validFact(f) or f.token~=k then return false,"invalid outfit fact" end
    end
    return V.validateStructure(root)
end

-- Append one token->outfit association. A body already carrying this exact
-- outfit is a no-op. A body reporting a DIFFERENT outfit than previously
-- observed is refused rather than overwritten -- same discipline as
-- PersonNameObservations.observe and ObservedKeyLead.observe. (In practice a
-- corpse's outfit does not change, so a contradiction here would mean two
-- distinct bodies were mistaken for one token -- refuse rather than guess.)
function M.observe(root,token,outfit)
    local ok,why=M.validate(root); if not ok then return nil,false,why end
    local fact={token=token,outfit=outfit}
    if not validFact(fact) then return nil,false,"invalid body outfit observation" end
    local staged=M.empty()
    for k,f in pairs(root.outfits) do staged.outfits[k]=copyFact(f) end
    local existing=staged.outfits[token]
    if existing then
        if existing.outfit~=outfit then return nil,false,"contradictory body outfit" end
        return staged,false
    end
    local n=0; for _ in pairs(staged.outfits) do n=n+1 end
    if n>=M.MAX then return staged,false,"outfit capacity exceeded" end
    staged.outfits[token]=copyFact(fact)
    ok,why=M.validate(staged); if not ok then return nil,false,why end
    return staged,true
end

function M.outfitFor(root,token)
    local ok=M.validate(root); if not ok then return nil end
    if type(token)~="string" then return nil end
    local f=root.outfits[token]
    return f and f.outfit or nil
end

return M
