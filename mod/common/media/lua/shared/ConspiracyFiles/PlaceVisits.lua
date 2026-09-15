-- How many times the player has come back to a place having learned
-- something since. Pure domain: no PZ runtime, testable in plain Lua 5.1.
--
-- WHY THIS IS NOT IN THE DISCOVERY LEDGER. The ledger is closed-world, capped
-- at 512 events, refuses a duplicate reference and raises rather than degrade
-- when validation fails - all correct for discoveries, all wrong for visits.
-- Visits are orders of magnitude more frequent: a single afternoon of walking
-- would burn a case's entire history. This is small, bounded, evictable
-- bookkeeping that lives beside the notebook's other player-save state, and
-- losing all of it costs headings, never a discovery.
--
-- THE RULE IT EXISTS TO ENFORCE (P4-R81): a return only counts if something
-- changed. Each place remembers the highest discovery sequence that existed
-- the last time the player was there. Coming back with the same number means
-- the player learned nothing in between, so the visit is swallowed silently -
-- pacing a doorway earns nothing. A higher number is a real return.
local V=require("ConspiracyFiles/Validator")
local M={SCHEMA=1,MAX=24,MAX_PLACE=160,MAX_N=9999}
local FIELDS={seq=true,n=true}

local function plain(t) return type(t)=="table" and not getmetatable(t) end
local function count(v) return type(v)=="number" and v==v and v%1==0 and v>=0 and v<=M.MAX_N end
local function label(v) return type(v)=="string" and #v>0 and #v<=M.MAX_PLACE and v:find("%S") and not v:find("[%c]") end

function M.empty() return {schema=M.SCHEMA,places={}} end

function M.validate(root)
    if not plain(root) or root.schema~=M.SCHEMA or not plain(root.places) then return false,"invalid place visits" end
    for k in pairs(root) do if k~="schema" and k~="places" then return false,"unknown place visits field" end end
    local n=0
    for k,e in pairs(root.places) do
        n=n+1
        if n>M.MAX then return false,"place visit capacity exceeded" end
        if not label(k) or not plain(e) then return false,"invalid place visit" end
        for f in pairs(e) do if not FIELDS[f] then return false,"unknown place visit field" end end
        if not count(e.seq) or not count(e.n) or e.n<1 then return false,"invalid place visit" end
    end
    return V.validateStructure(root)
end

local function copy(root)
    local staged=M.empty()
    for k,e in pairs(root.places) do staged.places[k]={seq=e.seq,n=e.n} end
    return staged
end

-- Make room by dropping the place the player has been away from longest.
-- Eviction costs a heading and nothing else, which is why a fixed small cap
-- is safe here and would not be in the ledger.
local function evict(places)
    local n=0; for _ in pairs(places) do n=n+1 end
    while n>=M.MAX do
        local oldest,at=nil,nil
        for k,e in pairs(places) do if at==nil or e.seq<at then oldest,at=k,e.seq end end
        if not oldest then return end
        places[oldest]=nil; n=n-1
    end
end

-- Record that the player was at `place` while the ledger's highest discovery
-- number was `seq`. Returns the staged replacement, the verdict
-- ("first" | "swallowed" | "returned"), and the place's visit count.
--
-- "first" is not a return: being somewhere once is how you get anywhere.
-- "returned" at n==2 is the moment a place earns its heading.
function M.visit(root,place,seq)
    local ok,why=M.validate(root); if not ok then return nil,"invalid",0,why end
    if not label(place) or not count(seq) then return copy(root),"invalid",0,"invalid place visit" end
    local staged=copy(root)
    local existing=staged.places[place]
    if not existing then
        evict(staged.places)
        staged.places[place]={seq=seq,n=1}
        ok,why=M.validate(staged); if not ok then return nil,"invalid",0,why end
        return staged,"first",1
    end
    -- Nothing was learned between the last visit and this one. Say nothing,
    -- change nothing: a player standing in a doorway must not be able to
    -- manufacture a heading out of their own feet.
    if seq<=existing.seq then return staged,"swallowed",existing.n end
    existing.seq=seq
    existing.n=math.min(existing.n+1,M.MAX_N)
    ok,why=M.validate(staged); if not ok then return nil,"invalid",0,why end
    return staged,"returned",existing.n
end

-- Visit count per place, for PlaceIndex.headings.
function M.counts(root)
    local out={}
    if not M.validate(root) then return out end
    for k,e in pairs(root.places) do out[k]=e.n end
    return out
end

return M
