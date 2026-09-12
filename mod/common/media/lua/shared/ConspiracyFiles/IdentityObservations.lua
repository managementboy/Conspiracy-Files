local V=require("ConspiracyFiles/Validator")
local M={MAX=128}
local types={['Base.IDcard']=true,['Base.IDcard_Stolen']=true,['Base.IDcard_Female']=true,
 ['Base.IDcard_Male']=true,['Base.CreditCard']=true,['Base.CreditCard_Stolen']=true,['Base.ParkingTicket']=true,['Base.SpeedingTicket']=true,['Base.BusinessCard']=true,['Base.BusinessCard_Personal']=true,['Base.BusinessCard_Nolans']=true,['Base.Passport']=true,['Base.PressID']=true,['Base.Badge']=true,['Base.Diary1']=true,['Base.Diary2']=true}
local fields={id=true,fullType=true,label=true,source=true,container=true,x=true,y=true,z=true,observedAt=true,token=true}
local function finite(v) return type(v)=="number" and v==v and v~=math.huge and v~=-math.huge end
local function text(v,n) return type(v)=="string" and #v<=n and v:find("%S") and not v:find("[%c]") end
local function copyRecord(r) local o={};for k in pairs(fields) do o[k]=r[k] end;return o end
local function validRecord(r)
 if type(r)~="table" or getmetatable(r) then return false end
 for k in pairs(r) do if not fields[k] then return false end end
 return types[r.fullType] and text(r.id,240) and r.id:sub(1,#r.fullType+1)==r.fullType..":"
  and #r.id>#r.fullType+1 and text(r.label,180) and (r.source=="corpse" or r.source=="container" or r.source=="furniture")
  and text(r.container,120) and finite(r.x) and finite(r.y) and finite(r.z)
  and finite(r.observedAt) and r.observedAt>=0
  and (r.token==nil or text(r.token,160))
end
function M.empty() return {schema=1,records={}} end
function M.validate(root)
 if type(root)~="table" or getmetatable(root) or root.schema~=1 or type(root.records)~="table" or getmetatable(root.records) then return false,"invalid observation root" end
 for k in pairs(root) do if k~="schema" and k~="records" then return false,"unknown root field" end end
 local n=0
 for k in pairs(root.records) do
  n=n+1;if n>M.MAX or type(k)~="number" or k<1 or k%1~=0 or k>M.MAX then return false,"invalid record index/count" end
 end
 local seen={}
 for i=1,n do
  local r=root.records[i]
  if not validRecord(r) or seen[r.id] then return false,"invalid/duplicate identity record" end
  seen[r.id]=true
 end
 return V.validateStructure(root)
end
function M.add(root,r)
 local ok,e=M.validate(root);if not ok then return nil,false,e end
 if not validRecord(r) then return nil,false,"invalid observation" end
 local candidate=M.empty();local duplicate=false
 for i,old in ipairs(root.records) do candidate.records[i]=copyRecord(old);if old.id==r.id then duplicate=true end end
 -- A record observed before its body was stamped has no token, and the outfit
 -- lead can never attach without one. Take the token when it finally exists
 -- rather than treating the second sighting as a duplicate with nothing to add.
 -- Nothing else about a stored record is ever rewritten: an observation is a
 -- record of what was seen, not a mutable row.
 if duplicate then
  if r.token~=nil then
   for i,old in ipairs(candidate.records) do
    if old.id==r.id and old.token==nil then
     candidate.records[i].token=r.token
     local okBackfill,eBackfill=M.validate(candidate)
     if not okBackfill then return nil,false,eBackfill end
     return candidate,true
    end
   end
  end
  return candidate,false
 end
 candidate.records[#candidate.records+1]=copyRecord(r)
 ok,e=M.validate(candidate);if not ok then return nil,false,e end
 return candidate,true
end
-- outfitFor is an optional function(token) -> outfit name or nil, supplied
-- by the client (ConspiracyFiles.BodyOutfitLog.outfitFor). This module stays
-- a pure domain with zero PZ dependencies: it only ever calls what it was
-- given, and only when this record actually carries a body's token. A
-- missing outfitFor, a missing token, or an outfit lookup that returns
-- nothing all mean the same thing here -- say nothing about clothing.
-- `placeFor(x,y,z)` names where an observation happened. Optional and guarded
-- exactly like outfitFor: the address book lives client-side, this module has
-- no engine contact, and a missing name must degrade to coordinates rather
-- than stop a row rendering.
-- Which documents shared a container, by provenance token. Two names in one
-- wallet is a fact about the wallet, and the mod was throwing it away.
local function companions(root)
 local byToken={}
 for _,r in ipairs(root.records) do
  if r.token then
   byToken[r.token]=byToken[r.token] or {}
   local list=byToken[r.token]
   list[#list+1]=r
  end
 end
 return byToken
end
-- An ID names the person it was issued to; a business card names somebody
-- else, whose card the carrier kept. That difference is the whole of what can
-- be said about two names in one wallet, and it is a fact about the documents
-- rather than a guess about the people.
local BEARER={["Base.IDcard"]=true,["Base.IDcard_Male"]=true,["Base.IDcard_Female"]=true,
 ["Base.Passport"]=true,["Base.Badge"]=true,["Base.PressID"]=true,
 ["Base.Necklace_DogTag"]=true,["Base.Necklace_DogTag_Male"]=true,
 ["Base.Necklace_DogTag_Female"]=true}
function M.rows(root,outfitFor,placeFor)
 if not M.validate(root) then return {} end
 local rows={}
 local shared=companions(root)
 for i,r in ipairs(root.records) do
  -- Three strengths of the same observation, and the wording carries the
  -- difference. A name on a body is evidence that person was there; a name in
  -- a bag taken off a body is nearly as strong; a name in somebody's dresser
  -- says only that the document was kept in that house.
  local where
  if r.source=="corpse" then where="among a corpse's belongings"
  elseif r.source=="furniture" then where="put away in a "..r.container
  else where="inside "..r.container end
  local detail="I saw a document labelled \""..r.label.."\" "..where.."."
  -- A container carrying a body's provenance token was taken off that body,
  -- and the player is entitled to know it. Saying only "inside Wallet" threw
  -- away a fact the mod had already established - the same failure as losing
  -- the outfit lead, one layer up. Observed 2026-09-09 with Ursula Schultz:
  -- the wallet was stamped, the case was bound to that corpse, and the entry
  -- still read as though the wallet had been found on a shelf.
  --
  -- It still refuses to say whose body, because a wallet on a corpse is a
  -- wallet on a corpse.
  if r.source~="corpse" and r.token then
   detail=detail.." That container was taken off a corpse."
   -- And we know WHICH corpse: the same token binds every document that came
   -- off it. Owner, 2026-09-10: "don't we still know from which corpse I just
   -- took it?" We did, and said nothing.
   local others={}
   for _,other in ipairs(shared[r.token] or {}) do
    if other.id~=r.id then others[#others+1]=other end
   end
   if #others>0 then
    -- Compare the names, not just the kinds. A ticket or credit card usually
    -- names the person it was issued to, so beside an ID with the SAME name it
    -- is not "another person's card". Linnie Weis's own speeding ticket, in her
    -- own wallet next to her own ID, was called exactly that (Linux wallet
    -- check, 2026-09-11). A different name keeps the business-card reading.
    local bearerNames={}
    local function nameOf(label) return type(label)=="string" and label:match(": (.+)$") or nil end
    if BEARER[r.fullType] and nameOf(r.label) then bearerNames[nameOf(r.label)]=true end
    for _,other in ipairs(others) do
     if BEARER[other.fullType] and nameOf(other.label) then bearerNames[nameOf(other.label)]=true end
    end
    local function sameAsBearer(record)
     local name=nameOf(record.label)
     return name~=nil and bearerNames[name]==true
    end
    local names={}
    for _,other in ipairs(others) do
     local note=""
     if not BEARER[other.fullType] then
      note=sameAsBearer(other) and " (same name as the ID)" or " (another person's card, kept)"
     end
     names[#names+1]=other.label..note
    end
    table.sort(names)
    detail=detail.." The same one carried: "..table.concat(names,"; ").."."
    if not BEARER[r.fullType] then
     if sameAsBearer(r) then
      detail=detail.." It carries the same name as the ID it was found with. That ties the two documents together, not either of them to the body."
     else
      detail=detail.." A card like this one names somebody else - it says it was carried, not that they met."
     end
    end
   end
  end
  if r.source=="furniture" then
   detail=detail.."\n\nSomebody kept this here. That is all it shows: not that they lived here, not that they are nearby, and not that they are the person on the document."
  else
   detail=detail.."\n\nThe name on a document is a lead. It does not establish who owned the container or identify the body."
  end
  if r.token and outfitFor then
   local ok,outfit=pcall(outfitFor,r.token)
   if ok and text(outfit,120) then
    detail=detail.."\n\nThe body itself wore: "..outfit..". A worn outfit and a labelled document are two separate observations from the same body; this record does not decide which one, if either, describes who the body is."
   end
  end
  -- An address, when the address book knows one. Owner, 2026-09-10: "under
  -- Journal we are still using coordinates." A survivor writes down a street,
  -- not a grid reference; the numbers stay as the fallback because an
  -- unnamed building is better reported than skipped.
  local place
  if placeFor then
   local ok,label=pcall(placeFor,r.x,r.y,r.z)
   if ok and text(label,120) then place=label end
  end
  -- A grid reference helps nobody. Owner, 2026-09-10, twice: "and again
  -- coordinates not addresses". The address book covers part of the map, so
  -- some buildings genuinely have no name - and saying so is more use than six
  -- digits the player cannot act on. The numbers stay in parentheses for a
  -- developer reading a log, not as the sentence.
  -- No coordinates in the sentence at all. Owner, three times: "still writing
  -- coordinates". The first fallback bracketed them; the owner still read them
  -- as coordinates, which they were. When nothing nearby has a name, saying so
  -- plainly is the honest answer - and "a building the address book does not
  -- name" was not even true for a wallet lying on the street.
  if place then
   -- A phrase ("outdoors, near ...") reads without "at"; an address does.
   -- Tested on a lower-case LETTER, because "114 S Main St" starts with a
   -- digit, and a digit equals its own lower case.
   local lead=string.sub(place,1,1)
   if lead>="a" and lead<="z" then detail=detail.."\n\nObserved "..place.."."
   else detail=detail.."\n\nObserved at "..place.."." end
  else detail=detail.."\n\nObserved somewhere with no address nearby." end
  rows[i]={id="identity:"..r.id,ordinal=i,title="Found "..r.label,summary="Identity document - "..r.source,
   detailText=detail}
 end
 return rows
end
return M
