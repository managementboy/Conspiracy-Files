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
local ContainerKinds=require("NHShared/Generated/ContainerKinds")
local Gates=require("NHShared/Mystery/ClueGates")
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

-- THE CLUE LIST is the derived file tools/nohelp_content/convert.lua writes
-- from accepted content rows (content/nohelp/accepted/). No file, or a file
-- that fails to load, is an empty list: nothing written yet is not an error.
M.clues={}
do
    local ok,list=pcall(require,"NHShared/Mystery/Content/Clues")
    if ok and type(list)=="table" and type(list.clues)=="table" then M.clues=list.clues end
end

-- ANCHOR (content-writer handoff, section 6): which vanilla map mark or
-- annotation, flyer, scene or scene version a clue belongs to. Optional.
--   {map=<design>, mark=<n>}   one of the design's own marks (MapSites)
--   {map=<design>, note=<n>}   one of its annotations (MapSites, area places)
--   {print=<name>}             a flyer or brochure (MapSites.prints)
--   {scene=<kind>}             a vanilla scene kind (Generated/VanillaScenes)
--   {scene=<kind>, version="A"|"B"}  one version per conspiracy: A leans
--                              containment, B agricultural, everywhere it goes
-- Map and flyer anchors must go to the kind of place their marks are
-- ("mapNamed"). A scene anchor is checked against Generated/VanillaScenes when
-- that file exists; until then it is accepted as UNVERIFIED (M.anchorStatus),
-- and the converter checks it against the writer-only draft table instead.
-- A scene clue's `place` is the kind of place it reads as; a scene clue is
-- only ever placed at its scene (AreaCase.decideScene), never at a place.
-- "carried": vanilla drops a grabbed bag on the road (javap 42.20:
-- addItemOnGround of the bag), so the clue lies on the ground beside it.
M.SCENE_SPOTS={["room-container"]="furniture",body="corpse",vehicle="vehicle",ground="ground",carried="ground"}
local anchorIndex
local function anchors()
    if anchorIndex then return anchorIndex end
    local Sites=require("NHShared/Generated/MapSites")
    local idx={designs={},prints={},keys={},places={}}
    for _,d in ipairs(Sites.designs or {}) do idx.designs[d]=true end
    for _,p in ipairs(Sites.prints or {}) do idx.prints[p]=true end
    for _,e in ipairs(Sites.sites or {}) do
        for _,m in ipairs(e.marks or {}) do
            local k=M.markKey(m)
            if k then idx.keys[k]=true; idx.places[k]=idx.places[k] or {}; idx.places[k][e.place]=true end
        end
    end
    anchorIndex=idx
    return idx
end
local sceneTable
local function scenes()
    if sceneTable==nil then
        local ok,S=pcall(require,"NHShared/Generated/VanillaScenes")
        sceneTable=ok and type(S)=="table" and S or false
    end
    return sceneTable or nil
end
-- The key a MapSites mark, or a clue's anchor, is known by: "map:D:mark:n",
-- "map:D:note:n", "print:P", "scene:K". Nil for anything else.
function M.markKey(m)
    if type(m)~="table" then return nil end
    if m.design and m.mark then return "map:"..m.design..":mark:"..m.mark end
    if m.design and m.note then return "map:"..m.design..":note:"..m.note end
    if m.print then return "print:"..m.print end
    return nil
end
function M.anchorKey(a)
    if type(a)~="table" then return nil end
    if a.map~=nil then
        if a.mark~=nil then return "map:"..tostring(a.map)..":mark:"..tostring(a.mark) end
        return "map:"..tostring(a.map)..":note:"..tostring(a.note)
    end
    if a.print~=nil then return "print:"..tostring(a.print) end
    if a.scene~=nil then return "scene:"..tostring(a.scene) end
    return nil
end
local ANCHOR_FIELDS={map=true,mark=true,note=true,print=true,scene=true,version=true}
local function whole(n) return type(n)=="number" and n>=1 and n==math.floor(n) end
-- An anchor's own shape and whether it names something real. Returns
-- true, or false, why and a reason code.
function M.validAnchor(c)
    local a=c.anchor
    if type(a)~="table" then return false,c.id..": an anchor is a table","ANCHOR_UNKNOWN" end
    for k in pairs(a) do if not ANCHOR_FIELDS[k] then return false,c.id..": unknown anchor field "..tostring(k),"ANCHOR_UNKNOWN" end end
    local forms=(a.map~=nil and 1 or 0)+(a.print~=nil and 1 or 0)+(a.scene~=nil and 1 or 0)
    if forms~=1 then return false,c.id..": an anchor names one map, flyer or scene","ANCHOR_UNKNOWN" end
    local idx
    if a.map~=nil then
        if a.print~=nil or a.version~=nil or (a.mark==nil)==(a.note==nil) then
            return false,c.id..": a map anchor names one mark or one note","ANCHOR_UNKNOWN"
        end
        if not whole(a.mark or a.note) then return false,c.id..": a map anchor's mark or note is a number","ANCHOR_UNKNOWN" end
        idx=anchors()
        if type(a.map)~="string" or not idx.designs[a.map] then return false,c.id..": unknown map "..tostring(a.map),"ANCHOR_UNKNOWN" end
        if not idx.keys[M.anchorKey(a)] then return false,c.id..": that map has no such mark","ANCHOR_UNKNOWN" end
    elseif a.print~=nil then
        if a.mark~=nil or a.note~=nil or a.version~=nil then return false,c.id..": a flyer anchor names the flyer only","ANCHOR_UNKNOWN" end
        idx=anchors()
        if type(a.print)~="string" or not idx.prints[a.print] then return false,c.id..": unknown flyer "..tostring(a.print),"ANCHOR_UNKNOWN" end
    else
        if a.mark~=nil or a.note~=nil then return false,c.id..": a scene anchor names the scene kind only","ANCHOR_UNKNOWN" end
        if type(a.scene)~="string" or not a.scene:find("^%w+$") then return false,c.id..": a scene kind is one word","ANCHOR_UNKNOWN" end
        if a.version~=nil and a.version~="A" and a.version~="B" then return false,c.id..": a scene version is A or B","ANCHOR_UNKNOWN" end
        if a.version~=nil then
            local lean=a.version=="A" and "containment" or "agricultural"
            for _,w in ipairs(c.where) do
                if w.lean~=lean then return false,c.id..": version "..a.version.." leans "..lean.." wherever it goes","ANCHOR_SPOT_MISMATCH" end
            end
        end
        local S=scenes()
        if S then
            local row=S.get and S.get(a.scene) or (S.kinds or {})[a.scene]
            if type(row)~="table" then return false,c.id..": unknown scene "..a.scene,"ANCHOR_UNKNOWN" end
            local spot=row.spot or M.SCENE_SPOTS[row.anchor]
            if not spot then return false,c.id..": scene "..a.scene.." holds no clue","ANCHOR_UNKNOWN" end
            for _,w in ipairs(c.where) do
                if w.spot~=spot then return false,c.id..": scene "..a.scene.." takes its clue on its "..spot,"ANCHOR_SPOT_MISMATCH" end
            end
        end
        return true
    end
    local places=idx.places[M.anchorKey(a)] or {}
    for _,w in ipairs(c.where) do
        if not places[w.place] then return false,c.id..": its anchor marks no "..tostring(w.place).." place","ANCHOR_SPOT_MISMATCH" end
    end
    return true
end
-- "verified", "unverified" (a scene anchor before Generated/VanillaScenes
-- exists) or nil (no anchor).
function M.anchorStatus(c)
    if type(c)~="table" or c.anchor==nil then return nil end
    if type(c.anchor)=="table" and c.anchor.scene~=nil and not scenes() then return "unverified" end
    return "verified"
end

local function set(list) local out={}; for _,v in ipairs(list) do out[v]=true end; return out end
local LEAN,PLACE,SPOT=set(M.LEANS),set(M.PLACES),set(M.SPOTS)

-- One clue's own shape. Returns false, why and a reason code (the list in
-- the content-writer handoff, section 7).
function M.validClue(c)
    if type(c)~="table" or type(c.id)~="string" or c.id=="" or #c.id>60 then return false,"clue id","SCHEMA" end
    if c.kind~="set" and c.kind~="written" then return false,c.id..": a clue is a set or written","SCHEMA" end
    if type(c.pieces)~="table" or #c.pieces<1 then return false,c.id..": no pieces","SET_SIZE" end
    if c.kind=="set" then
        for _,p in ipairs(c.pieces) do
            if not Catalogue.get(p) then return false,c.id..": "..tostring(p).." is not a vanilla item","BAD_ITEM" end
        end
    else
        -- A written clue is carried on a vanilla paper item the engine can
        -- print on: one of the written evidence kinds (letter, receipt...).
        local carrier=Kinds.get(c.pieces[1])
        if not carrier or carrier.capacity=="object" then
            return false,c.id..": a written clue is carried on a written kind, not "..tostring(c.pieces[1]),"BAD_CARRIER"
        end
        -- A card holds a card's worth of text, never a letter's.
        if c.body~=nil and not Kinds.fits(c.pieces[1],c.body) then
            return false,c.id..": its text does not fit on a "..c.pieces[1],"TOO_LONG"
        end
    end
    if c.kind=="set" then
        if #c.pieces<2 or #c.pieces>4 then return false,c.id..": a set holds 2-4 pieces","SET_SIZE" end
        for _,p in ipairs(c.pieces) do
            if M.WRITTEN_CARRIERS[p] then return false,c.id..": a set is not a written clue in disguise","NOTE_IN_SET" end
        end
    elseif #c.pieces~=1 then
        return false,c.id..": a written clue is carried on one item","BAD_CARRIER"
    end
    -- A set's text is said by the survivor on Inspect, a piece at a time
    -- (E1): no maximum (owner, 2026-09-29, DR-20260929-NOHELP-GAP-PLAN).
    if c.kind=="set" and c.body~=nil and (type(c.body)~="string" or c.body=="") then
        return false,c.id..": a set's text is a string","SCHEMA"
    end
    if type(c.where)~="table" or #c.where<1 then return false,c.id..": goes nowhere","SCHEMA" end
    -- A person thread (owner, 2026-09-27): clues about one person share a
    -- person id. An id, never a name - the name lives in the authored text.
    if c.person~=nil and (type(c.person)~="string" or not c.person:find("^[%w%-_]+$") or #c.person>40) then
        return false,c.id..": a person is named by a short id","SCHEMA"
    end
    for _,w in ipairs(c.where) do
        if not PLACE[w.place] then return false,c.id..": unknown place "..tostring(w.place),"SCHEMA" end
        if not SPOT[w.spot] then return false,c.id..": unknown spot "..tostring(w.spot),"SCHEMA" end
        if not LEAN[w.lean] then return false,c.id..": unknown lean "..tostring(w.lean),"SCHEMA" end
        if not LEAN[w.rival] or w.rival==w.lean then return false,c.id..": must name the other theory it cuts against","SAME_LEAN" end
        -- Clothing as a soft hint (owner, 2026-09-27): a clue on a body may
        -- name the kind of clothes it would rather be found on. A preference
        -- among bodies in reach, never a rule; only for a body spot.
        if w.outfit~=nil then
            if w.spot~="corpse" then return false,c.id..": only a body spot takes an outfit hint","SCHEMA" end
            if not Outfits.isClass(w.outfit) then return false,c.id..": unknown outfit class "..tostring(w.outfit),"SCHEMA" end
        end
        -- The container kinds it would be found in, in order (E2, owner
        -- 2026-09-29): the exact one, then up to five fallbacks; a furniture
        -- spot only.
        if w.containers~=nil then
            if w.spot~="furniture" then return false,c.id..": only a furniture spot names containers","SCHEMA" end
            if not ContainerKinds.valid(w.containers) then
                return false,c.id..": containers are 1-"..ContainerKinds.MAX.." known container kinds, no repeats","BAD_CONTAINER"
            end
        end
    end
    if c.anchor~=nil then
        local ok,why,code=M.validAnchor(c)
        if not ok then return false,why,code end
    end
    -- A row on its way through the content converter carries its authoring
    -- fields (provenance, axioms, citations...): the authoring gates.
    if Gates.carries(c) then
        local ok,why,code=Gates.check(c)
        if not ok then return false,why,code end
    end
    return true
end

-- The whole list against the owner's directives. Returns false, why, a
-- reason code and (when one clue is to blame) that clue's id.
--   NH-D1 two conspiracies: every kind of place and every kind of spot used
--         can host a clue of each, and every clue names its rival reading;
--   NH-D5 at least half of clues are object sets, counted per clue.
function M.lint(list)
    list=list or M.clues
    local ids,sets=set({}),0
    local placeLeans,spotLeans={}, {}
    for _,c in ipairs(list) do
        local ok,why,code=M.validClue(c); if not ok then return false,why,code,c.id end
        if ids[c.id] then return false,"duplicate clue "..c.id,"DUPLICATE",c.id end
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
        if n~=1 then return false,"person "..person.." has "..n.." cards","PERSON_SPLIT" end
        if not mentions[person] then return false,"person "..person.." is never mentioned by another clue","PERSON_ORPHAN" end
    end
    for person in pairs(mentions) do
        if not cards[person] then return false,"person "..person.." has no card","PERSON_ORPHAN" end
    end
    if sets*2<#list then return false,"fewer than half of the clues are object sets","SET_RATIO" end
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
            if not setLeans[place..":"..lean] then return false,place.." has no object set for "..lean,"ONE_SIDED" end
        end
    end
    for place,leans in pairs(placeLeans) do
        for _,lean in ipairs(M.LEANS) do
            if not leans[lean] then return false,place.." can host no "..lean.." clue","ONE_SIDED" end
        end
    end
    for spot,leans in pairs(spotLeans) do
        for _,lean in ipairs(M.LEANS) do
            if not leans[lean] then return false,"the "..spot.." spot can host no "..lean.." clue","ONE_SIDED" end
        end
    end
    return true
end

return M
