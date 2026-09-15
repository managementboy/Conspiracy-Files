-- Bounded set of building ids the player has actually stood inside. Feeds
-- stale-clue relocation destination selection (docs/management/
-- STALE_CLUE_RELOCATION.md). Pure domain: no PZ runtime dependency.
local V=require("ConspiracyFiles/Validator")
local M={SCHEMA=1,MAX=256}
local ROOT_FIELDS={schema=true,ids=true}

local function plain(t) return type(t)=="table" and not getmetatable(t) end
local function text(v) return type(v)=="string" and #v>0 and #v<=200 and v:find("%S") and not v:find("[%c]") end

function M.empty() return {schema=M.SCHEMA,ids={}} end

function M.validate(root)
    if not plain(root) or root.schema~=M.SCHEMA then return false,"invalid visited-buildings state" end
    for k in pairs(root) do if not ROOT_FIELDS[k] then return false,"unknown visited-buildings field" end end
    if not plain(root.ids) then return false,"invalid visited-buildings list" end
    local n=0
    for k in pairs(root.ids) do
        n=n+1
        if type(k)~="number" or k%1~=0 or k<1 or k>M.MAX then return false,"invalid visited-buildings index" end
    end
    if n>M.MAX then return false,"visited-buildings capacity exceeded" end
    local seen={}
    for i=1,n do
        local id=root.ids[i]
        if not text(id) then return false,"invalid visited building id" end
        if seen[id] then return false,"duplicate visited building id" end
        seen[id]=true
    end
    return V.validateStructure(root)
end

function M.has(root,id)
    for _,v in ipairs(root.ids) do if v==id then return true end end
    return false
end

-- Append one visited building id. An already recorded id is a no-op, never
-- a rewrite; capacity is bounded rather than growing without limit.
function M.record(root,id)
    local ok,why=M.validate(root); if not ok then return nil,false,why end
    if not text(id) then return nil,false,"invalid building id" end
    if M.has(root,id) then return root,false end
    if #root.ids>=M.MAX then return root,false,"visited-buildings capacity exceeded" end
    local staged={schema=M.SCHEMA,ids={}}
    for i,v in ipairs(root.ids) do staged.ids[i]=v end
    staged.ids[#staged.ids+1]=id
    ok,why=M.validate(staged); if not ok then return nil,false,why end
    return staged,true
end

return M
