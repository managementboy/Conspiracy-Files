-- ConspiracyFiles/EvidenceRows: the projection from what the survivor has
-- found to the rows a reading surface shows. The PDA's FILES, NAMES and PLACES
-- all read it, as the old evidence window once did - one store, one projection.
--
-- These are OUTCOME assertions. The three behaviours below used to be checked
-- by searching the old evidence window's source for the literal source lines that implemented
-- them (a window-title test and test/one_story.lua both did it), which
-- asserted nothing about what a reader actually sees and broke the moment the
-- code moved. Here the projection is called and its output inspected.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
package.preload["ConspiracyFiles/Generated/PlaceNames"]=function()
    return {render=function(text,case) return text end}
end
-- A case reaches a row only through the case store, so the two writers of a
-- place (below) need one. Only `current` and `find` are used by Rows.build.
local store
package.preload["ConspiracyFiles/Generated/SuccessiveCases"]=function()
    return {current=function(s) return s end,
        find=function(wrapper,id) return wrapper and wrapper.root end}
end
ConspiracyFiles=ConspiracyFiles or {}
local Rows=require("ConspiracyFiles/EvidenceRows")
-- The very table EvidenceRows holds, so a section below can change what
-- PlaceNames does without reloading the module under test.
local PlaceNames=require("ConspiracyFiles/Generated/PlaceNames")

local function runtimeWith(known)
    return function() return {known=function() return known end} end
end

-- No generated case yet is a NORMAL state: a new world spends its first
-- half-minute indexing, and the organiser tells the player to carry on. This
-- used to throw "attempted index: known of non-table" on every list refresh.
assert(#Rows.build("evidence",nil)==0,"no runtime yields no rows, not an error")
assert(#Rows.build("evidence",function() return nil end)==0,"an inactive runtime yields no rows")

-- An OBJECT carrier's catalogue "label" is its raw id, so a clay pot once
-- reached the reader as "ClayPot - Discovery 1". An object's own title already
-- says what it is; the summary says what KIND of thing it is.
local object=Rows.build("evidence",runtimeWith({
    {id="d1",title="A chipped clay pot",body="on a shelf",kind="ClayPot"},
}))
assert(#object==1,"one discovery, one row")
assert(object[1].cfCarrier=="Object found",
    "an object row must not print its raw catalogue id: got "..tostring(object[1].cfCarrier))
assert(not object[1].summary:find("ClayPot",1,true),
    "the catalogue id must never reach the summary: "..object[1].summary)
assert(object[1].summary=="Object found - Discovery 1",object[1].summary)

-- The opening house key is a physical catalogue object too, but "Object
-- found" made the survivor sound as if they could not identify a key.  The
-- FILES surface should name the thing the survivor is holding.
local key=Rows.build("evidence",runtimeWith({
    {id="d1",title="Loan collection house key / TN-195",body="already in my pocket",kind="Key1"},
}))
assert(key[1].cfCarrier=="Brass key",key[1].cfCarrier)
assert(key[1].summary=="Brass key - Discovery 1",key[1].summary)

-- A document carrier does have a human phrase, and keeps it.
local paper=Rows.build("evidence",runtimeWith({
    {id="d1",title="Dispatch copy / R-482",body="in a desk",kind="dispatch"},
}))
assert(paper[1].cfCarrier=="Note",paper[1].cfCarrier)
assert(paper[1].summary=="Note - Discovery 1",paper[1].summary)

-- Hidden links must never leak an unseen title into a known-only projection.
-- 2026-09-11: not "refers to a second list you have not found" but "probably
-- refers to another list?" - a question can be wrong, which is what keeps it
-- from being a to-do item.
local wondering=Rows.build("evidence",runtimeWith({
    {id="d1",title="First stock list / PS-101",body="in a crate",kind="dispatch",
     unseen={{title="Second stock list / PS-289"}}},
}))
local detail=wondering[1].detailText
assert(detail=="in a crate",
    "a hidden link cannot leak its title or reference: "..detail)

-- A link to a document that HAS been found is a statement, not a question.
local connected=Rows.build("evidence",runtimeWith({
    {id="d1",title="Dispatch copy / R-482",body="in a desk",kind="dispatch",
     connections={{target="d2",kind="corroborates"}}},
    {id="d2",title="Receiving receipt / X-9",body="in a till",kind="receipt"},
}))
assert(connected[1].detailText:find("Agrees with: Receiving receipt / X%-9"),
    "a found link names the document it agrees with: "..connected[1].detailText)
assert(not connected[1].detailText:find("Probably refers",1,true),
    "a found document is not wondered about")

-- Ordinals are global and in discovery order, and a number never changes.
local many=Rows.build("evidence",runtimeWith({
    {id="a",title="One",body="here",kind="dispatch"},
    {id="b",title="Two",body="there",kind="receipt"},
    {id="c",title="Three",body="elsewhere",kind="letter"},
}))
assert(many[1].ordinal==1 and many[2].ordinal==2 and many[3].ordinal==3,"ordinals follow discovery order")
assert(many[3].summary:find("Discovery 3",1,true),many[3].summary)
assert(many[1].id=="a" and many[3].id=="c","rows keep their own ids")

-- "Disputes delivery in" was left over from when every case was about a
-- delivery. The link KIND is an internal id and keeps its name; what the
-- player reads must fit any of the twenty stories. Asserted on the rendered
-- phrase, not on the lookup table: the table was previously pattern-matched
-- out of the old evidence window's source, which said nothing about what a reader sees.
for _,kind in ipairs({"corroborates","disputes-delivery","recontextualises"}) do
    local r=Rows.build("evidence",runtimeWith({
        {id="d1",title="Dispatch copy / R-482",body="in a desk",kind="dispatch",
         connections={{target="d2",kind=kind}}},
        {id="d2",title="Receiving receipt / X-9",body="in a till",kind="receipt"},
    }))
    local text=r[1].detailText
    assert(not text:lower():find("delivery",1,true),
        "the connection verb for '"..kind.."' assumes a delivery: "..text)
    assert(text:find("Receiving receipt / X%-9"),
        "the connection for '"..kind.."' must name the document: "..text)
end

-- An unknown link kind still reads as something, rather than printing nil.
local unknown=Rows.build("evidence",runtimeWith({
    {id="d1",title="Dispatch copy / R-482",body="in a desk",kind="dispatch",
     connections={{target="d2",kind="something-new"}}},
    {id="d2",title="Receiving receipt / X-9",body="in a till",kind="receipt"},
}))
assert(unknown[1].detailText:find("Connected to: Receiving receipt / X%-9"),
    "an unrecognised link kind falls back to a plain phrase: "..unknown[1].detailText)

print("PASS evidence rows: empty runtime, object vs document carrier, the unfound-document question with article and 'another', found connections, and global ordinals, connection verbs that fit any story, and an unknown link kind")

-- THE TWO WRITERS OF A PLACE (fault found in a real game 2026-09-18,
-- 20260918T230942-travel.txt). AddressMap names the sites the shipped address
-- book has a number for; PlaceNames reads whatever place words are LEFT. This
-- used to be an either/or - `describe(...) or PlaceNames.render(...)` - and
-- because describe refused a whole case when ONE of its sites was unnumbered, a
-- case like that showed no address for any of its clues. About one case in five
-- is shaped like that, so this is the composition, in order, asserted on what a
-- reader actually sees.
local body="Dispatched from HOUSE A, received at HOUSE B."
local case={locations={{id="t3:a",name="HOUSE A"},{id="t3:b",name="HOUSE B"}}}
store={root={case=case}}
ModData={get=function(key) return key=="ConspiracyFiles.Generated.G2" and store or nil end}
local sawInPlaceNames
PlaceNames.render=function(text,c)
    sawInPlaceNames=text
    assert(c==case,"PlaceNames must be handed the case the row belongs to")
    return (text:gsub("HOUSE B","the receiving building near B Road"))
end
local function oneRow()
    return Rows.build("evidence",runtimeWith({
        {id="d1",title="Dispatch copy / R-482",body=body,kind="dispatch"},
    }))[1].detailText
end

-- 1. A MIXED CASE: the numbered site is an address, the other reads as it did
-- before AD-10 existed, and both are in the same sentence.
ConspiracyFiles.AddressMap={describe=function(text,c)
    assert(c==case,"describe must be handed the case the row belongs to")
    return (text:gsub("HOUSE A","201 N Carl St"))
end}
local mixed=oneRow()
assert(mixed:find("201 N Carl St",1,true),"the site the book numbers must be written as an address: "..mixed)
assert(mixed:find("the receiving building near B Road",1,true),
    "and the site it does not number must still read as PlaceNames writes it: "..mixed)
assert(not mixed:find("HOUSE A",1,true) and not mixed:find("HOUSE B",1,true),
    "no raw site name may survive: "..mixed)
assert(sawInPlaceNames=="Dispatched from 201 N Carl St, received at HOUSE B.",
    "PlaceNames must be handed what AddressMap left, not the original body: "..tostring(sawInPlaceNames))

-- 2. A CASE THE BOOK CAN NAME NOTHING OF reads exactly as it does today:
-- describe returns nil and PlaceNames gets the untouched body.
ConspiracyFiles.AddressMap={describe=function() return nil end}
local none=oneRow()
assert(sawInPlaceNames==body,"PlaceNames must get the original body when nothing was named: "..tostring(sawInPlaceNames))
assert(none=="Dispatched from HOUSE A, received at the receiving building near B Road.",none)

-- 3. NO ADDRESS BOOK AT ALL (a map the book is not for, or a save read before
-- the book loads) is the same state, and must not throw.
ConspiracyFiles.AddressMap=nil
assert(oneRow()==none,"with no address book the row reads as it did before AD-10")
ConspiracyFiles.AddressMap={}
local ok,why=pcall(oneRow)
assert(ok,"an address book that is still starting up must not break a row: "..tostring(why))

ConspiracyFiles.AddressMap=nil; ModData=nil; store=nil
print("PASS evidence rows: a case's numbered sites are written as addresses and its unnumbered ones still read as PlaceNames writes them")

-- Retirement retains the same geographic context, without a live case envelope.
store={root={locations=case.locations,reference="R-482"}}
ModData={get=function(key) return key=="ConspiracyFiles.Generated.G2" and store or nil end}
ConspiracyFiles.AddressMap={describe=function(text,c)
    assert(c.locations==case.locations and c.facts.code=="R-482")
    return (text:gsub("HOUSE A","201 N Carl St"))
end}
PlaceNames.render=function(text,c)
    assert(c.locations==case.locations)
    return (text:gsub("HOUSE B","the receiving building near B Road"))
end
local archived=Rows.build("evidence",runtimeWith({
    {id="d1",title="Dispatch copy / R-482",body=body,kind="dispatch"},
}))[1]
assert(archived.cfCase=="R-482","retirement must retain the readable case reference")
assert(archived.detailText:find("201 N Carl St",1,true))
assert(archived.detailText:find("the receiving building near B Road",1,true))
print("PASS archived evidence retains address resolution and case reference")
