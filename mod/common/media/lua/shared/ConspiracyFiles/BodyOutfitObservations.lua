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

-- getOutfitName returns the outfit's internal id: "ConstructionWorker",
-- "Bathrobe", "Generic03". The raw id is stored, because it is the game's own
-- fact, but it is not what the notebook can say to a player.
--
-- Two rules, both conservative. An outfit that identifies nobody is not a
-- lead: "Generic03" says only that the game dressed a zombie, so it is
-- suppressed and the sentence is omitted entirely rather than padded with
-- noise. Anything else becomes ordinary words - "ConstructionWorker" reads
-- "construction worker" - because a lead the player cannot read is no better
-- than one they never got.
-- Some outfit ids are a STYLE or an ACTIVITY, not clothing. Owner, weekend
-- note 2026-09-12: "They read as 'wore: goth'." A survivor looking at a body
-- writes what they can see, so each of these carries one written line and the
-- raw id is never printed.
local GLOSS={
    biker="leather and heavy boots",
    classy="clothes somebody would call smart",
    goth="a lot of black, chains, heavy boots",
    punk="torn clothes, studs, dyed hair",
    redneck="a work shirt and a cap",
    rocker="denim and a band shirt",
    grunge="flannel over a worn shirt",
    tourist="holiday clothes, nothing for around here",
    hunter="hunting clothes, orange and camouflage",
    golfer="clothes for a golf course",
    party="clothes for a night out",
    clubgoer="clothes for a night out",
    gaudy="bright clothes that do not go together",
    bedroom="what somebody sleeps in",
    jewelry="more jewellery than clothes",
}
-- Ids that are a PERSON, not an outfit. The game dresses named characters this
-- way, and "the body itself wore: frank hemingway" is both nonsense and the
-- one thing this mod must never do -- state who a body is. Suppressed, and
-- suppressed by exact id, so "YoungCowpoke" still describes clothes.
local PERSON={
    bob=true,dean=true,duke=true,joan=true,john=true,kate=true,nolan=true,
    ["frank hemingway"]=true,["jackie jaye"]=true,["judge matt hass"]=true,
    ["kirsty kormick"]=true,["mayor west point"]=true,["rev peter watts"]=true,
    ["sir twiggy"]=true,groucho=true,["groucho tshirt"]=true,spiffo=true,
    santa=true,["santa green"]=true,zed=true,["mannequin 1"]=true,["mannequin 2"]=true,
}
local UNINFORMATIVE={["generic"]=true,["default"]=true,["naked"]=true,["nude"]=true,["bullet"]=true}
local NOT_CLOTHING={["young"]=true}
function M.readable(name)
    if type(name)~="string" then return nil end
    local trimmed=name:gsub("^%s+",""):gsub("%s+$","")
    if trimmed=="" then return nil end
    -- Debug and test wardrobes are not observations about anybody.
    if trimmed:lower():find("test") then return nil end
    -- Judge the LEADING WORD, not the whole string and not a substring. The
    -- game ships Generic01..Generic05, Generic_Skirt, Naked and NakedVeil, all
    -- of which identify nobody - and Cook_Generic, which identifies a cook.
    -- Stripping trailing digits caught Generic03 and missed Generic_Skirt,
    -- which reached a player on 2026-09-09 as "generic skirt".
    local head=trimmed:match("^%u%l+") or trimmed:match("^%a+") or trimmed
    if UNINFORMATIVE[head:lower()] then return nil end
    -- Whole ids that describe the person, not the clothes. "Young" reached the
    -- notebook as "The body itself wore: young." (Linux wallet check,
    -- 2026-09-11). Exact match only: "YoungCowpoke" still describes an outfit.
    if NOT_CLOTHING[trimmed:lower()] then return nil end
    -- CamelCase and underscores into words, without disturbing an id that is
    -- already one plain word.
    local spaced=trimmed:gsub("_"," "):gsub("(%l)(%u)","%1 %2"):gsub("(%u)(%u%l)","%1 %2")
    spaced=spaced:gsub("%s+"," "):gsub("^%s+",""):gsub("%s+$","")
    if spaced=="" then return nil end
    spaced=spaced:lower()
    -- A named character is a person, not an observation about clothes.
    if PERSON[spaced] then return nil end
    -- A style or an activity is written out; everything else is already the
    -- clothes ("construction worker", "nurse") and stands as it is. Nothing is
    -- invented for an id this table has never seen: a future game update can
    -- add outfits, and the worst it can do is read plainly.
    return GLOSS[spaced] or spaced
end
function M.outfitFor(root,token)
    local ok=M.validate(root); if not ok then return nil end
    if type(token)~="string" then return nil end
    local f=root.outfits[token]
    return f and f.outfit or nil
end

return M
