package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Lead=require("ConspiracyFiles/ObservedKeyLead")

-- Exactly one catalogued building shares the observed keyId: a match.
local one={{id="t3:house-a",keyId=7},{id="t3:house-b",keyId=9}}
local matched,status=assert(Lead.match(7,one))
assert(status=="matched" and matched.id=="t3:house-a" and matched.keyId==7)

-- No catalogued building shares it: silence, not a guess.
local none,why=Lead.match(11,one)
assert(none==nil and why=="no-match")

-- Two catalogued buildings sharing the same keyId is ambiguous and must be
-- refused outright, never resolved by picking either one.
local ambiguous={{id="t3:house-a",keyId=7},{id="t3:house-c",keyId=7}}
local refused,ambig=Lead.match(7,ambiguous)
assert(refused==nil and ambig=="ambiguous")

-- PZ's "no key id" sentinel (-1, or any negative) never matches, even
-- against a candidate that also reports a negative keyId.
local negative,negWhy=Lead.match(-1,{{id="t3:house-a",keyId=-1}})
assert(negative==nil and negWhy=="invalid key id")

-- Malformed candidate input is refused rather than tolerated.
for _,bad in ipairs({
    "not a table",
    {[0]={id="x",keyId=1}},
    {{id="",keyId=1}},
    {{id="x",keyId=-1}},
    {{id="x",keyId=1.5}},
    {{id="x",keyId=1},{id="x",keyId=1}}, -- duplicate id
    setmetatable({{id="x",keyId=1}},{}),
}) do
    assert(Lead.match(1,bad)==nil,"expected refusal for malformed candidates")
end

-- Bounded: more than MAX_CANDIDATES rows is refused rather than scanned.
local many={}
for i=1,Lead.MAX_CANDIDATES do many[i]={id="t3:b"..i,keyId=i} end
assert(Lead.match(1,many))
many[#many+1]={id="t3:overflow",keyId=Lead.MAX_CANDIDATES+1}
assert(Lead.match(1,many)==nil)

-- The lead ledger itself: append, dedupe, refuse contradictions, and cap.
local empty=Lead.empty()
assert(Lead.validate(empty))
local fact={id="corpse-1",sourceToken="corpse-item:1",keyId=7,buildingId="t3:house-a"}
local staged,changed=assert(Lead.observe(empty,fact))
assert(changed and Lead.validate(staged))
assert(staged.leads["corpse-1"].buildingId=="t3:house-a")
assert(next(empty.leads)==nil,"observe never mutates its input")

-- Re-observing the identical fact is a no-op, not a rewrite.
local same,repeated=Lead.observe(staged,fact)
assert(same and not repeated and Lead.validate(same))

-- A contradictory fact under the same id is refused outright.
local contradiction={id="corpse-1",sourceToken="corpse-item:1",keyId=7,buildingId="t3:house-b"}
assert(Lead.observe(staged,contradiction)==nil)

-- Invalid facts (bad id, negative keyId, wrong field set, non-string
-- building) are refused.
for _,bad in ipairs({
    {id="",sourceToken="s",keyId=7,buildingId="b"},
    {id="i",sourceToken="",keyId=7,buildingId="b"},
    {id="i",sourceToken="s",keyId=-1,buildingId="b"},
    {id="i",sourceToken="s",keyId=1.5,buildingId="b"},
    {id="i",sourceToken="s",keyId=7,buildingId=""},
    {id="i",sourceToken="s",keyId=7,buildingId="b",extra=true},
}) do
    assert(Lead.observe(empty,bad)==nil)
end
assert(not Lead.validate(setmetatable(Lead.empty(),{})))
assert(not Lead.validate({schema=1,leads={},unknown=true}))

-- Bounded ledger capacity.
local full=Lead.empty()
for i=1,Lead.MAX do
    full=assert(Lead.observe(full,{id="c"..i,sourceToken="corpse-item:"..i,keyId=i,buildingId="t3:b"..i}))
end
local overflow,addedOverflow,overflowWhy=Lead.observe(full,{id="cN",sourceToken="corpse-item:N",keyId=999,buildingId="t3:bN"})
assert(overflow and not addedOverflow and overflowWhy=="lead capacity exceeded")

-- Player-facing wording is a lead, never an identity or residence claim: no
-- row may name a person, assert who lived somewhere, or claim ownership.
local rows=Lead.rows(staged)
assert(#rows==1)
local text=rows[1].title.." "..rows[1].summary.." "..rows[1].detailText
assert(text:find("does not establish who the body was, that they lived there, or that they owned it",1,true))
for _,forbidden in ipairs({"was the body","identified as","they lived at","they owned the building"}) do
    assert(not text:find(forbidden,1,true),"row text must not assert identity or residence: "..forbidden)
end
assert(rows[1].id=="observedKeyLead:corpse-1")

print("observed_key_lead: ok")
