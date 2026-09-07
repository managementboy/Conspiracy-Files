package.path="mod/common/media/lua/shared/?.lua;"..package.path
local M=require("ConspiracyFiles/IdentityObservations");local r={id="Base.IDcard:7",fullType="Base.IDcard",label="Ada Vale ID",source="corpse",container="Corpse inventory",x=1,y=2,z=0,observedAt=3}
local e=M.empty();assert(M.validate(e));local n,changed=assert(M.add(e,r));assert(changed and #e.records==0 and #n.records==1);local same,c=assert(M.add(n,r));assert(not c and #same.records==1)
local bad=select(1,M.add(e,{id="Base.Note:1",fullType="Base.Note",label="x",source="corpse",container="x",x=0,y=0,z=0,observedAt=0}));assert(not bad)
for i=2,128 do n=assert(M.add(n,{id="Base.CreditCard:"..i,fullType="Base.CreditCard",label="Card",source="container",container="Wallet",x=i,y=0,z=0,observedAt=i})) end
assert(not M.add(n,{id="Base.IDcard:129",fullType="Base.IDcard",label="x",source="corpse",container="x",x=0,y=0,z=0,observedAt=0}))
local rows=assert(M.rows(n));assert(rows[1].title=="Found Ada Vale ID" and rows[1].detailText:find("corpse",1,true))
local function clone(t) local o={};for k,v in pairs(t) do o[k]=type(v)=='table' and clone(v) or v end;return o end
local extra=clone(e);extra.unknown=true;assert(not M.validate(extra))
local sparse=clone(e);sparse.records[2]=clone(r);assert(not M.validate(sparse))
for _,change in ipairs({{label=string.rep('x',181)},{label='   '},{source='zombie'},{x=math.huge},{observedAt=-1},{unknown=true}}) do
 local bad=clone(r);for k,v in pairs(change) do bad[k]=v end;assert(not M.add(e,bad))
end
local unsafe=clone(r);unsafe.label={};assert(not M.add(e,unsafe))
assert(not M.validate(setmetatable(M.empty(),{})))
local copied=assert(M.add(e,r));r.label='changed afterwards';assert(copied.records[1].label=='Ada Vale ID')
local dup=clone(copied.records[1]);dup.label='renamed card';local unchanged,added=M.add(copied,dup)
assert(not added and unchanged.records[1].label=='Ada Vale ID')
for _,kind in ipairs({'Base.IDcard_Stolen','Base.IDcard_Female','Base.IDcard_Male','Base.CreditCard_Stolen','Base.ParkingTicket','Base.SpeedingTicket'}) do
 local rr=clone(r);rr.fullType=kind;rr.id=kind..':8';assert(M.add(e,rr))
end
local blank=clone(r);blank.fullType='Base.IDcard_Blank';blank.id=blank.fullType..':1';assert(not M.add(e,blank))
print("PASS IdentityObservations: strict bounds/fields, unsafe data, immutable snapshots, dedup, variants, factual rows")

-- Build 42 marks name-bearing items with Tags = base:applyownername. Sixteen
-- items carry it; the original whitelist guessed eleven and missed the strongest
-- documents of all. See docs/research/OWNER_NAMED_ITEMS.md.
for _,kind in ipairs({'Base.Passport','Base.PressID','Base.Badge','Base.Diary1','Base.Diary2'}) do
 local rr=clone(r);rr.fullType=kind;rr.id=kind..':500'
 assert(M.add(e,rr),'owner-named item must be observable: '..kind)
end
-- Not yet adopted: dog tags and the security-pass key ring are owner-named but
-- are not documents, and the row wording would have to change first.
for _,kind in ipairs({'Base.Necklace_DogTag','Base.KeyRing_SecurityPass'}) do
 local rr=clone(r);rr.fullType=kind;rr.id=kind..':501'
 assert(not M.add(e,rr),'deliberately not observed until the wording generalises: '..kind)
end
print('PASS identity observations: owner-named documents accepted, non-documents deliberately excluded')

-- Phase 1 (docs/design/USING_GAME_ASSETS.md): a document found directly on a
-- corpse can carry that body's provenance token, and the notebook row for it
-- can mention the outfit BodyOutfitLog observed on the SAME token -- two
-- independent leads, stated side by side, never resolved.
local withToken=clone(r);withToken.token='corpse-item:7'
local tokenRoot=assert(M.add(M.empty(),withToken))
local outfits={['corpse-item:7']='PoliceStory'}
local outfitFor=function(token) return outfits[token] end
local rowsWithOutfit=assert(M.rows(tokenRoot,outfitFor))
assert(rowsWithOutfit[1].detailText:find('PoliceStory',1,true),'the outfit observed on the same body must appear in its identity row')
-- The pre-existing wording is untouched when there is nothing to add.
assert(M.rows(tokenRoot)[1].detailText==M.rows(tokenRoot,nil)[1].detailText)
assert(not M.rows(tokenRoot,nil)[1].detailText:find('PoliceStory',1,true))
-- No token on the record: never fabricate a body connection that was not
-- observed. No outfitFor supplied: the row renders exactly as before.
local noToken=assert(M.rows(n,outfitFor))
assert(not noToken[1].detailText:find('PoliceStory',1,true),'a record with no token must never gain an outfit line')
-- An unknown or unreadable outfit (outfitFor returns nil, or throws) is
-- silence, never a guess.
assert(not M.rows(tokenRoot,function() return nil end)[1].detailText:find('wore',1,true))
assert(not M.rows(tokenRoot,function() error('unreadable') end)[1].detailText:find('wore',1,true))
-- The added sentence -- and only the added sentence, since the pre-existing
-- identity wording above it already uses "owned" in its own caution clause
-- -- asserts nothing about who the body was: it never uses "was",
-- "worked as" or "owned" to settle the two observations against each other.
local outfitSentence=assert(rowsWithOutfit[1].detailText:match('The body itself wore.-\n\n'),
 'expected an appended outfit sentence')
for _,forbidden in ipairs({'was','worked as','owned'}) do
 assert(not outfitSentence:find(forbidden,1,true),'outfit sentence must not assert: found "'..forbidden..'"')
end
print('PASS identity observations: outfit observed on the same body is surfaced, never asserted, degrades silently')
