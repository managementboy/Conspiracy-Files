-- The survivor names what they actually picked up. Owner, 2026-09-18, reading
-- "I saw a document labelled \"Badge: Roger Whitfield\"": "a badge is not a
-- document". A badge is a badge, an ID card an ID card, a diary a diary; only
-- something unrecognised falls back to "document".
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local M=require("ConspiracyFiles/IdentityObservations")

assert(M.noun("Base.Badge")=="badge")
assert(M.noun("Base.IDcard")=="ID card" and M.noun("Base.IDcard_Female")=="ID card")
assert(M.noun("Base.CreditCard")=="credit card" and M.noun("Base.Diary2")=="diary")
assert(M.noun("Base.PressID")=="press card" and M.noun("Base.ParkingTicket")=="parking ticket")
assert(M.noun("Base.Unknown")=="document","anything unrecognised is still a document")
assert(M.aNoun("Base.Badge")=="a badge" and M.aNoun("Base.IDcard")=="an ID card","the article follows the noun")

-- The rendered record, as the organiser shows it.
local root={schema=1,records={{id="Base.Badge:1",fullType="Base.Badge",label="Badge: Roger Whitfield",
    source="corpse",container="Wallet",x=100,y=100,z=0,observedAt=1,token="corpse-item:1"}}}
local rows=M.rows(root)
assert(#rows==1,"one observation, one row")
local detail=rows[1].detailText
assert(detail:find("I saw a badge with the name \"Roger Whitfield\" on it",1,true),detail)
assert(not detail:find("document",1,true),"a badge is never called a document: "..detail)
assert(detail:find("The name on a badge is a lead",1,true),detail)
assert(rows[1].summary:find("^Badge"),"the row says what it is: "..rows[1].summary)

-- An ID card keeps the article right, and an unknown kind still reads.
root.records[1]={id="Base.IDcard:2",fullType="Base.IDcard",label="ID Card: Ines Kubiak",source="corpse",container="Wallet",
    x=100,y=100,z=0,observedAt=2,token="corpse-item:2"}
local card=M.rows(root)[1].detailText
assert(card:find("I saw an ID card with the name \"Ines Kubiak\" on it",1,true),card)
assert(card:find("The name on an ID card is a lead",1,true),card)

-- A container reads as a survivor would write it.
root.records[1]={id="Base.IDcard:3",fullType="Base.IDcard",label="ID Card: Ines Kubiak",source="container",
    container="Wallet",x=100,y=100,z=0,observedAt=3,token="corpse-item:3"}
local inside=M.rows(root)[1].detailText
assert(inside:find("inside a wallet",1,true),inside)
assert(not inside:find("inside Wallet",1,true),"never the raw item name: "..inside)
assert(M.aContainer("Una's Evidence")=="Una's Evidence","a name that already possesses is left alone")

print("PASS identity nouns: a badge is a badge, an ID card an ID card, and only the unrecognised is a document")
