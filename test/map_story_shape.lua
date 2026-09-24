-- A MAP STORY DECLARES WHAT IT EARNS, AND ITS COMPARISONS MUST REACH IT.
--
-- CENTRAL_MYSTERY_REVIEW_2026-09-19.md:19 records the direction: "Intermediate
-- stops are optional, not compulsory padding." MapMediaContent asserted
-- #f.parts==4, which made them compulsory - an author could not write an
-- incident that one local record tells completely.
--
-- Allowing fewer parts exposes a defect that was harmless while every story had
-- four. `requirements={{1,2},{3,4},{1,2,3,4}}` and `at={2,4,4}` were MODULE
-- constants shared by all seventeen stories. Give a story three parts and its
-- third comparison still asks for slot 4; `known[4]` is nil, `visible` stays
-- false, and the synthesis line SILENTLY never fires. Not a crash - a quiet
-- loss nobody would notice, which is the same shape of bug that cost the
-- scenario system twenty incoherent comparison lines earlier today.
--
-- So the contract is: a comparison may only require slots its own story uses,
-- and a story that breaks that must fail loudly at load rather than lose a line
-- in play.
--
-- SLOTS ARE NOT PART INDICES. Saved state keeps fragments in slots 1..3 and the
-- payoff in slot 4 (MapMediaState.lua:52,84). A story's parts map onto those
-- slots: the last part is always the payoff and always takes slot 4, so a
-- two-part story uses slots 1 and 4. That keeps every existing save valid.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Content=require("ConspiracyFiles/MapMediaContent")
local Catalogue=require("ConspiracyFiles/MapMediaCatalogue")

-- 1. EVERY SHIPPED STORY HAS A COHERENT SHAPE.
local stories=Content.families
assert(#stories==17,"expected 17 authored map stories, found "..#stories)
for _,f in ipairs(stories) do
    local ok,why=Content.checkShape(f)
    assert(ok,"shipped story "..tostring(f.id)..": "..tostring(why))
    assert(#f.parts>=2 and #f.parts<=4,
        f.id.." declares "..#f.parts.." parts; a trail is a payoff plus up to three local records")
    -- The payoff is DECLARED, and whichever part it is lands in slot 4.
    -- An implicit "last element" invites reading a two-part story's second
    -- source as local fragment 2 when it is the destination payoff.
    assert(type(f.payoff)=="number",f.id..": the payoff must be declared, not inferred")
    local slots=Content.slots(f)
    assert(slots[f.payoff]==4,f.id..": the declared payoff must occupy slot 4")
    assert(#slots==#f.parts,f.id..": every part needs a slot")
end

-- 2. A COMPARISON MAY ONLY REQUIRE SLOTS ITS STORY USES.
--    This is the assertion that would have caught the silent loss.
local shortStory={
    id="test-short",organisation="X",grounding="X",siteRole="recipient-copy",
    question="q",event="e",outcome="o",professional="p",
    parts={
        {kind="notepad",title="t1",observation="o1",source="s1",note="n1"},
        {kind="receipt",title="t2",observation="o2",source="s2",note="n2"},
    },
    payoff=2,
    findings={"only comparison"},
    requires={{1,4}},at={4},
}
local ok,why=Content.checkShape(shortStory)
assert(ok,"a two-part story with a reachable comparison must be valid: "..tostring(why))

-- The defect: a comparison reaching for a slot this story does not fill.
local phantom={}
for k,v in pairs(shortStory) do phantom[k]=v end
phantom.requires={{1,2}}          -- slot 2 is not used by a two-part story
local bad,reason=Content.checkShape(phantom)
assert(bad==false,"a comparison requiring an unused slot must be refused, not silently dropped")
assert(tostring(reason):find("slot",1,true),"the refusal must name the unreachable slot: "..tostring(reason))

-- And the count must line up: one authored line per requirement.
local mismatched={}
for k,v in pairs(shortStory) do mismatched[k]=v end
mismatched.findings={"one","two"}
assert(Content.checkShape(mismatched)==false,
    "a story with more authored lines than requirements must be refused")

-- A story that leaves the payoff to position must be refused.
local implicit={}
for k,v in pairs(shortStory) do implicit[k]=v end
implicit.payoff=nil
assert(Content.checkShape(implicit)==false,
    "a story that does not declare its payoff must be refused")

-- 3. RENDERING ASKS FOR A SLOT AND GETS THE RIGHT PART.
for _,f in ipairs(stories) do
    local slots=Content.slots(f)
    for i,slot in ipairs(slots) do
        assert(Content.partForSlot(f,slot)==i,
            f.id..": slot "..slot.." does not resolve to part "..i)
    end
    -- An unused slot resolves to nothing rather than to the wrong record.
    for slot=1,4 do
        local used=false
        for _,s in ipairs(slots) do if s==slot then used=true end end
        if not used then
            assert(Content.partForSlot(f,slot)==nil,
                f.id..": unused slot "..slot.." resolved to a part")
        end
    end
end

-- 4. THE SHIPPED CORPUS STILL RENDERS, at every slot it claims to use.
local rendered=0
for _,id in ipairs({Catalogue.list[1],Catalogue.list[60],Catalogue.list[#Catalogue.list]}) do
    local b=Catalogue.get(id)
    local f=Content.scenario(b,7)
    for _,slot in ipairs(Content.slots(f)) do
        local d=Content.render(b,7,slot)
        assert(type(d)=="table" and type(d.body)=="string" and d.body~="",
            id..": slot "..slot.." rendered nothing")
        assert(not d.body:find("{%a+}"),id..": slot "..slot.." left a placeholder unfilled")
        rendered=rendered+1
    end
end
assert(rendered>=9,"only "..rendered.." renders; the sweep is too thin to mean anything")

print(string.format("PASS map story shape: %d stories, 2-4 parts each, every comparison "
    .."reaches a slot its own story fills, %d renders clean",#stories,rendered))
