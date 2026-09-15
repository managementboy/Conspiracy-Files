-- ConspiracyFiles/EvidenceRows: the projection from what the survivor has
-- found to the rows a reading surface shows. The PDA's FILES, NAMES and PLACES
-- all read it, and so does the notebook window - one store, one projection,
-- two surfaces.
--
-- These are OUTCOME assertions. The three behaviours below used to be checked
-- by searching Notebook.lua for the literal source lines that implemented
-- them (test/notebook_title.lua and test/one_story.lua both did it), which
-- asserted nothing about what a reader actually sees and broke the moment the
-- code moved. Here the projection is called and its output inspected.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
package.preload["ConspiracyFiles/Generated/PlaceNames"]=function()
    return {render=function(text,case) return text end}
end
ConspiracyFiles=ConspiracyFiles or {}
local Rows=require("ConspiracyFiles/EvidenceRows")

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

-- A paper carrier does have a human phrase, and keeps it.
local paper=Rows.build("evidence",runtimeWith({
    {id="d1",title="Dispatch copy / R-482",body="in a desk",kind="dispatch"},
}))
assert(paper[1].cfCarrier=="Dispatch document",paper[1].cfCarrier)
assert(paper[1].summary=="Dispatch document - Discovery 1",paper[1].summary)

-- A link to a document NOT yet found is a question, never a waypoint. Owner,
-- 2026-09-11: not "refers to a second list you have not found" but "probably
-- refers to another list?" - a question can be wrong, which is what keeps it
-- from being a to-do item.
local wondering=Rows.build("evidence",runtimeWith({
    {id="d1",title="First stock list / PS-101",body="in a crate",kind="dispatch",
     unseen={{title="Second stock list / PS-289"}}},
}))
local detail=wondering[1].detailText
assert(detail:find("Probably refers to ",1,true),"the survivor must wonder: "..detail)
assert(detail:sub(-1)=="?","and wonder as a question: "..detail)
-- "another stock list", because this row IS a stock list - not "a stock list".
assert(detail:find("another stock list?",1,true),
    "a second one of the same kind reads as 'another': "..detail)
-- Only the unfound document's title may travel, never its text.
assert(not detail:find("PS%-289"),"the unfound document's own id must not travel: "..detail)

-- A different kind of unfound document takes an article, and the right one.
local article=Rows.build("evidence",runtimeWith({
    {id="d1",title="Dispatch copy / R-482",body="in a desk",kind="dispatch",
     unseen={{title="Employee roster"}}},
}))
assert(article[1].detailText:find("Probably refers to an employee roster?",1,true),
    "a vowel takes 'an': "..article[1].detailText)

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
-- out of Notebook.lua's source, which said nothing about what a reader sees.
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

print("PASS evidence rows: empty runtime, object vs paper carrier, the unfound-document question with article and 'another', found connections, and global ordinals, connection verbs that fit any story, and an unknown link kind")
