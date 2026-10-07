-- A person thread (owner, 2026-09-27): some written clues are ID cards placed
-- on bodies, and other clues elsewhere are about the same person. Only cards
-- we write belong to a conspiracy; every other ID stays vanilla.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;"..package.path
local Manifest=require("OIShared/Mystery/Manifest")
local AreaCase=require("OIShared/Generated/AreaCase")
local S=require("OIShared/Generated/Session")

-- Placeholder ids only; no names or story.
local card={id="C1",kind="written",pieces={"idcard"},person="p1",title="ID Card: placeholder",body="Placeholder card.",
    where={{place="police",spot="corpse",lean="containment",rival="agricultural"},
           {place="farm",spot="corpse",lean="agricultural",rival="containment"}}}
local note={id="N1",kind="written",pieces={"letter"},person="p1",
    where={{place="police",spot="furniture",lean="containment",rival="agricultural"},
           {place="farm",spot="furniture",lean="agricultural",rival="containment"}}}
local function set(id,place)
    return {id=id,kind="set",pieces={"Twine","Tarp"},where={
        {place=place,spot="ground",lean="containment",rival="agricultural"},
        {place=place,spot="ground",lean="agricultural",rival="containment"}}}
end
local list={card,note,set("S1","police"),set("S2","farm")}
assert(Manifest.lint(list),"NH-D1: a person with one card and one mention is a valid thread")

-- The rules.
assert(not Manifest.lint({card,set("S1","police"),set("S2","farm"),set("S3","police")}),"a card nobody mentions is refused")
assert(not Manifest.lint({note,set("S1","police"),set("S2","farm"),set("S3","farm")}),"a mention with no card is refused")
local card2={}; for k,v in pairs(card) do card2[k]=v end; card2.id="C2"
assert(not Manifest.lint({card,card2,note,set("S1","police"),set("S2","farm"),set("S3","police"),set("S4","farm")}),
    "a person has exactly one card")
local long={}; for k,v in pairs(card) do long[k]=v end; long.body=string.rep("x",300)
assert(not Manifest.validClue(long),"a card holds a card's worth of text, never a letter's")
local named={}; for k,v in pairs(card) do named[k]=v end; named.person="A Full Name"
assert(not Manifest.validClue(named),"a person is an id, never a name")

-- Through the world record: the card keeps its person and goes only to a body.
local root=assert(S.createArea(7)); local saved=root
local api=assert(S.open(root,function(n) saved=n end))
local site={id="t3:b1",bounds={x1=0,y1=0,x2=10,y2=10,z=0},containerTypes={"shelves"}}
local ok,ids=api.addArea{site=site,place="police",clues=list,version="v1",hours=1}
assert(ok,tostring(ids))
local cardDoc
for _,d in ipairs(saved.case.documents) do if d.clue=="C1" then cardDoc=d end end
if cardDoc then
    assert(cardDoc.person=="p1" and cardDoc.kind=="idcard" and cardDoc.spot=="corpse","the card keeps its person, kind and spot")
    local body={x=1,y=1,z=0,objectIndex=0,containerIndex=0,containerType=S.CARRIER_CONTAINER,sprite="body",carrierKind="corpse",carrierMark="m"}
    local drawer={x=1,y=1,z=0,objectIndex=0,containerIndex=0,containerType="shelves",sprite="s"}
    assert(S.intentMatches(cardDoc,body) and not S.intentMatches(cardDoc,drawer),"our ID card only ever goes to a body")
end
assert(AreaCase.validate(saved.case),"the world record with a person thread is valid")
print("nohelp person: card and mentions form a thread; the card goes only to a body")
