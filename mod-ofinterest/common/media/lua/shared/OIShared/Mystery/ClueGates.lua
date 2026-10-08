-- The authoring gates on a No Help clue row (content-writer handoff, sections
-- 6-7 and 9). Pure: no engine calls. Manifest.validClue calls M.check for a
-- clue that carries any authoring field (prov, axioms, cites, rival_reading,
-- gloss) - that is, a row on its way through tools/nohelp_content/convert.lua.
-- The derived clue file the game loads keeps none of those fields, so in play
-- no clue reaches these gates and nothing here runs per frame.
--
-- Returns true, or false, why, and a reason code from the handoff's list:
--   NO_PROV          provenance {writer, handoff, batch} missing
--   NO_RIVAL         no rival reading (written first, one line)
--   NO_GLOSS         no neutral one-line gloss
--   AXIOM_UNKNOWN    axioms missing, badly shaped, not naming both
--                    conspiracies, or naming an id the approved list lacks
--   DENSITY          too many proper-noun-like or code-like tokens (below)
--   EMPHASIS         capitalised stress or a reveal marker (below)
--   CITE_NOT_VANILLA a citation whose quote is not a literal substring of
--                    the cited vanilla text
--   RESERVED_NAME    echoes a vanilla named character (exact, sound-alike,
--                    one letter away)
--   RETIRED_PREMISE  a word or two-word run of the retired premise pair
--
-- CAPS, chosen for a card of at most 280 characters and a set of at most 240
-- (handoff section 4: "one human detail beats several official ones"):
--   MAX_PROPER  proper-noun-like tokens in the BODY: a capitalised word that
--               does not start a sentence. The title is Title Case by habit
--               and is not counted.
--   MAX_CODES   code-like tokens in title and body together: a word mixing
--               letters and digits (A-12, 4B), or an all-capitals word of three
--               or more letters (an acronym).
-- EMPHASIS, kept simple: an all-capitals word of five or more letters, two
-- all-capitals words in a row, "!!", "?!", "!?", "...?", "?...", *stars* or
-- _underlines_, or a body ending on "!" or "...". Short acronyms are not
-- emphasis; they count toward MAX_CODES instead.
--
-- Configuration, set by the converter (M.configure); absent in play:
--   axioms   {containment={id=true...}, agricultural={id=true...}}, the
--            approved stage-0 list (content/nohelp/approved/axioms.json). Until
--            it exists only the shape is checked.
--   retired  {salt=string, hashes={[hash]=true}} (tools/cluegates/
--            retired_hashes.lua). The terms themselves are never stored.
--   reserved {names={...}} - defaults to Generated/ReservedNames when present.
local M={}
M.MAX_PROPER=4
M.MAX_CODES=2
M.EMPHASIS_CAPS_LETTERS=5
M.config={}

function M.configure(cfg)
    M.config={}
    for k,v in pairs(cfg or {}) do M.config[k]=v end
    M._reserved=nil
end

local AUTHORING={prov=true,axioms=true,cites=true,rival_reading=true,gloss=true}
function M.carries(c)
    if type(c)~="table" then return false end
    for k in pairs(AUTHORING) do if c[k]~=nil then return true end end
    return false
end

local function nonEmpty(s) return type(s)=="string" and s:find("%S")~=nil end

-- A salted hash of a word or two-word run: two independent 31-bit sums, so a
-- chance collision with the few stored terms is negligible. Every step stays
-- below 2^53, so PUC Lua and Kahlua agree.
function M.hash(salt,text)
    local s=tostring(salt)..":"..tostring(text)
    local a,b=5381,52711
    for i=1,#s do
        local c=string.byte(s,i)
        a=(a*33+c)%2147483647
        b=(b*131+c)%2147483629
    end
    for _=1,3 do a=(a*48271)%2147483647; b=(b*16807)%2147483629 end
    return tostring(a).."-"..tostring(b)
end

-- The words of a text, each marked when it starts a sentence.
function M.words(text)
    local out={}
    if type(text)~="string" then return out end
    local i,initial=1,true
    while true do
        local s,e=text:find("[%w][%w'%-]*",i)
        if not s then break end
        if i>1 and text:sub(i,s-1):find("[%.!%?:;\n]") then initial=true end
        local w=text:sub(s,e):gsub("[%-']+$","")
        out[#out+1]={w=w,initial=initial}
        initial=false
        i=e+1
    end
    return out
end

local function allCaps(w) return w:find("^%u[%u%-']*%u$")~=nil end
local function letters(w) local _,n=w:gsub("%a",""); return n end
local function codeLike(w)
    if w:find("%a") and w:find("%d") then return true end
    return allCaps(w) and letters(w)>=3
end
local function properLike(t) return not t.initial and t.w:find("^%u%l")~=nil end

function M.counts(c)
    local proper,codes=0,0
    for _,t in ipairs(M.words(c.body)) do
        if properLike(t) then proper=proper+1 end
        if codeLike(t.w) then codes=codes+1 end
    end
    for _,t in ipairs(M.words(c.title)) do if codeLike(t.w) then codes=codes+1 end end
    return proper,codes
end

local function emphasis(text)
    if type(text)~="string" then return nil end
    local prevCaps=false
    for _,t in ipairs(M.words(text)) do
        local caps=allCaps(t.w) and letters(t.w)>=2
        if caps and letters(t.w)>=M.EMPHASIS_CAPS_LETTERS then return "a word in capitals: stress" end
        if caps and prevCaps then return "capitals in a row: stress" end
        prevCaps=caps
    end
    for _,m in ipairs({"!!","?!","!?","...?","?..."}) do
        if text:find(m,1,true) then return "a reveal marker "..m end
    end
    if text:find("%*%a[^%*]*%*") or text:find("_%a[^_]*_") then return "marked-up stress" end
    return nil
end

-- VANILLA TEXT a citation may quote: a flyer's title and text, a map's own
-- annotation. The catalogue writes a literal percent as "%%", so a quote may
-- use either spelling.
local function vanillaText(source)
    if type(source)~="string" then return nil end
    local ok,Cat=pcall(require,"OIShared/MapMediaCatalogue")
    if not ok or type(Cat)~="table" then return nil end
    local kind,id=source:match("^(%a+):(.+)$")
    if kind=="print" then
        local p=Cat.print(id)
        if p then return {p.title or "",p.text or ""} end
    elseif kind=="map" then
        local b=Cat.get(id)
        if b then return {b.sourceText or "",b.label or ""} end
    end
    return nil
end
local function cited(texts,quote)
    for _,t in ipairs(texts) do
        if t:find(quote,1,true) or t:gsub("%%%%","%%"):find(quote,1,true) then return true end
    end
    return false
end

-- SOUNDEX (the classic American form: first letter, then up to three digits).
local SOUNDEX={b=1,f=1,p=1,v=1,c=2,g=2,j=2,k=2,q=2,s=2,x=2,z=2,d=3,t=3,l=4,m=5,n=5,r=6}
function M.soundex(w)
    w=tostring(w):lower():gsub("[^a-z]","")
    if w=="" then return "" end
    local out,last={w:sub(1,1):upper()},SOUNDEX[w:sub(1,1)]
    for i=2,#w do
        local ch=w:sub(i,i)
        local d=SOUNDEX[ch]
        if d and d~=last then out[#out+1]=tostring(d) end
        if ch~="h" and ch~="w" then last=d end
        if #out==4 then break end
    end
    while #out<4 do out[#out+1]="0" end
    return table.concat(out)
end
-- Exactly one insertion, deletion or substitution apart.
function M.oneEdit(a,b)
    if a==b then return false end
    local la,lb=#a,#b
    if math.abs(la-lb)>1 then return false end
    if la>lb then a,b,la,lb=b,a,lb,la end
    local i=1
    while i<=la and a:sub(i,i)==b:sub(i,i) do i=i+1 end
    if la==lb then return a:sub(i+1)==b:sub(i+1) end
    return a:sub(i)==b:sub(i+1)
end

local function reserved()
    if M._reserved~=nil then return M._reserved or nil end
    local list=M.config.reserved
    if not list then
        local ok,R=pcall(require,"OIShared/Generated/ReservedNames")
        list=ok and type(R)=="table" and R or nil
    end
    if not list or type(list.names)~="table" then M._reserved=false; return nil end
    local idx={exact={},rows={}}
    for _,n in ipairs(list.names) do
        n=tostring(n):lower()
        idx.exact[n]=true
        idx.rows[#idx.rows+1]={name=n,sx=M.soundex(n)}
    end
    M._reserved=idx
    return idx
end
-- A reserved name this word echoes, or nil. Every capitalised word is checked
-- exactly; a word that does not start a sentence, and has four letters or
-- more, is also checked for a sound-alike and for one letter away (a word
-- starting a sentence is capitalised by grammar, not because it is a name).
local function echoes(idx,t,force)
    local w=t.w:gsub("'s$",""):lower():gsub("[^a-z]","")
    if #w<3 then return nil end
    if idx.exact[w] then return w end
    if (t.initial and not force) or #w<4 then return nil end
    local sx=M.soundex(w)
    for _,r in ipairs(idx.rows) do
        if #r.name>=4 then
            if M.oneEdit(w,r.name) then return r.name end
            if sx==r.sx and math.abs(#w-#r.name)<=2 then return r.name end
        end
    end
    return nil
end

local function axiomSides(c)
    local ax=c.axioms
    if type(ax)~="table" then return nil,"no axioms" end
    local approved=M.config.axioms
    local sides={containment={},agricultural={}}
    local flat=#ax>0
    if flat then
        for _,id in ipairs(ax) do
            if not nonEmpty(id) then return nil,"an axiom id is empty" end
            if approved then
                local found=false
                for lean,ids in pairs(approved) do
                    if ids[id] then sides[lean][#sides[lean]+1]=id; found=true end
                end
                if not found then return nil,"unknown axiom "..id end
            end
        end
        if not approved then
            if #ax<2 then return nil,"axioms must name both conspiracies" end
            return sides,nil,true
        end
    else
        for k,ids in pairs(ax) do
            if not sides[k] or type(ids)~="table" then return nil,"axioms are grouped by conspiracy" end
            for _,id in ipairs(ids) do
                if not nonEmpty(id) then return nil,"an axiom id is empty" end
                if approved and not (approved[k] and approved[k][id]) then return nil,"unknown "..k.." axiom "..id end
                sides[k][#sides[k]+1]=id
            end
        end
    end
    if #sides.containment<1 or #sides.agricultural<1 then return nil,"axioms must name both conspiracies" end
    return sides
end

function M.check(c)
    local id=tostring(c.id)
    -- Provenance, rival reading and gloss.
    local p=c.prov
    if type(p)~="table" or not nonEmpty(p.writer) or not nonEmpty(p.handoff) or not nonEmpty(p.batch) then
        return false,id..": provenance {writer, handoff, batch} missing","NO_PROV"
    end
    if not nonEmpty(c.rival_reading) then return false,id..": no rival reading","NO_RIVAL" end
    if not nonEmpty(c.gloss) then return false,id..": no gloss","NO_GLOSS" end
    local _,why=axiomSides(c)
    if why then return false,id..": "..why,"AXIOM_UNKNOWN" end
    -- Density.
    local proper,codes=M.counts(c)
    if proper>M.MAX_PROPER then return false,id..": "..proper.." proper-noun-like words (at most "..M.MAX_PROPER..")","DENSITY" end
    if codes>M.MAX_CODES then return false,id..": "..codes.." code-like words (at most "..M.MAX_CODES..")","DENSITY" end
    -- Emphasis.
    for _,field in ipairs({"title","body"}) do
        local e=emphasis(c[field])
        if e then return false,id..": "..field..": "..e,"EMPHASIS" end
    end
    if type(c.body)=="string" then
        local tail=c.body:gsub("%s+$","")
        if tail:find("!$") or tail:find("%.%.%.$") or tail:find("\226\128\166$") then
            return false,id..": the last line ends on a reveal","EMPHASIS"
        end
    end
    -- Citations.
    if c.cites~=nil then
        local list=c.cites
        if type(list)~="table" then return false,id..": cites is {source, quote}","CITE_NOT_VANILLA" end
        if list.source~=nil or list.quote~=nil then list={list} end
        if #list<1 then return false,id..": cites is empty","CITE_NOT_VANILLA" end
        for _,ci in ipairs(list) do
            if type(ci)~="table" or not nonEmpty(ci.quote) then return false,id..": a citation has no quote","CITE_NOT_VANILLA" end
            local texts=vanillaText(ci.source)
            if not texts then return false,id..": unknown vanilla source "..tostring(ci.source),"CITE_NOT_VANILLA" end
            if not cited(texts,ci.quote) then return false,id..": the quote is not in "..ci.source,"CITE_NOT_VANILLA" end
        end
    end
    -- Reserved names: the clue's own words and its person id.
    local idx=reserved()
    if idx then
        for _,field in ipairs({"title","body"}) do
            for _,t in ipairs(M.words(c[field])) do
                if t.w:find("^%u") then
                    if echoes(idx,t) then return false,id..": "..field.." echoes a vanilla named character","RESERVED_NAME" end
                end
            end
        end
        if type(c.person)=="string" then
            for part in c.person:gmatch("[%a]+") do
                if echoes(idx,{w=part,initial=false},true) then return false,id..": the person id echoes a vanilla named character","RESERVED_NAME" end
            end
        end
    end
    -- The retired premise.
    local r=M.config.retired
    if type(r)=="table" and type(r.hashes)=="table" then
        for _,field in ipairs({"title","body","rival_reading","gloss"}) do
            local prev
            local text=type(c[field])=="string" and c[field]:lower() or ""
            for w in text:gmatch("%a+") do
                if r.hashes[M.hash(r.salt,w)] or (prev and r.hashes[M.hash(r.salt,prev.." "..w)]) then
                    return false,id..": "..field.." touches the retired premise","RETIRED_PREMISE"
                end
                prev=w
            end
        end
    end
    return true
end

return M
