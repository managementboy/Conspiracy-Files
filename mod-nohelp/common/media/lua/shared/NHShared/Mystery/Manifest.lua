-- The No Help clue list's shape, and its rules (task 3 plan, step 3).
--
-- Every clue is written in advance (owner, 2026-09-26: "evidence will not be
-- generated procedurally"); only where it lands is decided in play. A clue is
-- either WRITTEN (a note, a receipt...) or an object SET: 2-4 real vanilla
-- items that only mean something together. Each clue lists the kinds of place
-- it may go, and for each which of the two conspiracies it leans toward there
-- and which it cuts against (the rival reading, design doc section 2).
--
-- The real clues are proposed to the owner a few at a time and are not in this
-- file yet (DECISIONS.md, DR-20260927-NOHELP-RULE-PLACEMENT); until then the
-- list is empty and the picker is tested on a placeholder inventory.
local Catalogue=require("NHShared/Generated/ObjectCatalogue")
local Kinds=require("NHShared/Generated/EvidenceKinds")
local Outfits=require("NHShared/BodyOutfitObservations")
local M={}

M.LEANS={"containment","agricultural"}
-- The interesting places clues go around (owner, 2026-09-27): research place
-- types (T3), places named on vanilla maps and flyers, farms and checkpoints.
M.PLACES={"police","hospital","office","bookstore","transmission","warehouse","government",
    "mapNamed","farm","checkpoint"}
-- Where inside a place a clue lies: the four the engine already supports, and
-- open ground.
M.SPOTS={"furniture","mailbox","vehicle","corpse","ground"}
-- A loose note is how a written clue is carried, so a set made of notes is a
-- written clue in disguise.
M.WRITTEN_CARRIERS={Note=true}

-- The clue list's version. Every area records the version it was picked with,
-- so a later list never rewrites an area already decided.
M.VERSION="nohelp-clues-0"

-- The written kinds that are a person's card.
M.CARD_KINDS={idcard=true,businesscard=true}

M.clues={}

local function set(list) local out={}; for _,v in ipairs(list) do out[v]=true end; return out end
local LEAN,PLACE,SPOT=set(M.LEANS),set(M.PLACES),set(M.SPOTS)

-- One clue's own shape. Returns false and why.
function M.validClue(c)
    if type(c)~="table" or type(c.id)~="string" or c.id=="" or #c.id>60 then return false,"clue id" end
    if c.kind~="set" and c.kind~="written" then return false,c.id..": a clue is a set or written" end
    if type(c.pieces)~="table" or #c.pieces<1 then return false,c.id..": no pieces" end
    if c.kind=="set" then
        for _,p in ipairs(c.pieces) do
            if not Catalogue.get(p) then return false,c.id..": "..tostring(p).." is not a vanilla item" end
        end
    else
        -- A written clue is carried on a vanilla paper item the engine can
        -- print on: one of the written evidence kinds (letter, receipt...).
        local carrier=Kinds.get(c.pieces[1])
        if not carrier or carrier.capacity=="object" then
            return false,c.id..": a written clue is carried on a written kind, not "..tostring(c.pieces[1])
        end
        -- A card holds a card's worth of text, never a letter's.
        if c.body~=nil and not Kinds.fits(c.pieces[1],c.body) then
            return false,c.id..": its text does not fit on a "..c.pieces[1]
        end
    end
    if c.kind=="set" then
        if #c.pieces<2 or #c.pieces>4 then return false,c.id..": a set holds 2-4 pieces" end
        for _,p in ipairs(c.pieces) do
            if M.WRITTEN_CARRIERS[p] then return false,c.id..": a set is not a written clue in disguise" end
        end
    elseif #c.pieces~=1 then
        return false,c.id..": a written clue is carried on one item"
    end
    if type(c.where)~="table" or #c.where<1 then return false,c.id..": goes nowhere" end
    -- A person thread (owner, 2026-09-27): clues about one person share a
    -- person id. An id, never a name - the name lives in the authored text.
    if c.person~=nil and (type(c.person)~="string" or not c.person:find("^[%w%-_]+$") or #c.person>40) then
        return false,c.id..": a person is named by a short id"
    end
    for _,w in ipairs(c.where) do
        if not PLACE[w.place] then return false,c.id..": unknown place "..tostring(w.place) end
        if not SPOT[w.spot] then return false,c.id..": unknown spot "..tostring(w.spot) end
        if not LEAN[w.lean] then return false,c.id..": unknown lean "..tostring(w.lean) end
        if not LEAN[w.rival] or w.rival==w.lean then return false,c.id..": must name the other theory it cuts against" end
        -- Clothing as a soft hint (owner, 2026-09-27): a clue on a body may
        -- name the kind of clothes it would rather be found on. A preference
        -- among bodies in reach, never a rule; only for a body spot.
        if w.outfit~=nil then
            if w.spot~="corpse" then return false,c.id..": only a body spot takes an outfit hint" end
            if not Outfits.isClass(w.outfit) then return false,c.id..": unknown outfit class "..tostring(w.outfit) end
        end
    end
    return true
end

-- The whole list against the owner's directives. Returns false and why.
--   NH-D1 two conspiracies: every kind of place and every kind of spot used
--         can host a clue of each, and every clue names its rival reading;
--   NH-D5 at least half of clues are object sets, counted per clue.
function M.lint(list)
    list=list or M.clues
    local ids,sets=set({}),0
    local placeLeans,spotLeans={}, {}
    for _,c in ipairs(list) do
        local ok,why=M.validClue(c); if not ok then return false,why end
        if ids[c.id] then return false,"duplicate clue "..c.id end
        ids[c.id]=true
        if c.kind=="set" then sets=sets+1 end
        for _,w in ipairs(c.where) do
            placeLeans[w.place]=placeLeans[w.place] or {}; placeLeans[w.place][w.lean]=true
            spotLeans[w.spot]=spotLeans[w.spot] or {}; spotLeans[w.spot][w.lean]=true
        end
    end
    if #list==0 then return true end
    -- Every person has exactly one identity card or business card among their
    -- clues, and at least one other clue that mentions them: a card alone is
    -- only a name, a mention alone is nobody.
    local cards,mentions={}, {}
    for _,c in ipairs(list) do
        if c.person then
            if M.CARD_KINDS[c.pieces[1]] then cards[c.person]=(cards[c.person] or 0)+1
            else mentions[c.person]=(mentions[c.person] or 0)+1 end
        end
    end
    for person,n in pairs(cards) do
        if n~=1 then return false,"person "..person.." has "..n.." cards" end
        if not mentions[person] then return false,"person "..person.." is never mentioned by another clue" end
    end
    for person in pairs(mentions) do
        if not cards[person] then return false,"person "..person.." has no card" end
    end
    if sets*2<#list then return false,"fewer than half of the clues are object sets" end
    -- Every kind of place used needs an object SET for each conspiracy: sets
    -- are what may be placed again (no maximum), so a place and conspiracy
    -- with only written clues could never be refilled once those are placed,
    -- and an area there would miss a conspiracy.
    local setLeans={}
    for _,c in ipairs(list) do
        if c.kind=="set" then
            for _,w in ipairs(c.where) do setLeans[w.place..":"..w.lean]=true end
        end
    end
    for place in pairs(placeLeans) do
        for _,lean in ipairs(M.LEANS) do
            if not setLeans[place..":"..lean] then return false,place.." has no object set for "..lean end
        end
    end
    for place,leans in pairs(placeLeans) do
        for _,lean in ipairs(M.LEANS) do
            if not leans[lean] then return false,place.." can host no "..lean.." clue" end
        end
    end
    for spot,leans in pairs(spotLeans) do
        for _,lean in ipairs(M.LEANS) do
            if not leans[lean] then return false,"the "..spot.." spot can host no "..lean.." clue" end
        end
    end
    return true
end

return M
