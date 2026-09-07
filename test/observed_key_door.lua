-- A real key looted from a body, used on any door, names a building the mod
-- never chose. Engine doubles demand a receiver, exactly like Kahlua.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Lead=require("ConspiracyFiles/ObservedKeyLead")

-- The fact a door match produces must satisfy the existing lead schema
-- unchanged: this path adds evidence, not a new shape.
local root=Lead.empty()
local fact={id="door:corpse-item:77",sourceToken="corpse-item:77",keyId=412,buildingId="10977700185374755"}
local staged,changed=Lead.observe(root,fact)
assert(staged and changed,"a door-derived lead is a valid observed-key lead")
assert(Lead.validate(staged))

-- Re-opening the same door must not add a second lead.
local again,addedAgain=Lead.observe(staged,fact)
assert(again and not addedAgain,"repeating a door match is a duplicate, not a new lead")

-- The same body's key cannot later claim a different building.
local moved={id="door:corpse-item:77",sourceToken="corpse-item:77",keyId=412,buildingId="99999999"}
local refused=Lead.observe(staged,moved)
assert(not refused,"a contradictory building for one body is refused, never overwritten")

-- A catalogue lead and a door lead for one body use different ids, so the
-- guard in observeKeyLead is what prevents duplication, not the schema.
assert(fact.id~=fact.sourceToken,"the door path is distinguishable from the catalogue path")

-- Wording must not assert who the body was or where they lived.
local rows=Lead.rows(staged)
assert(#rows==1,"one lead renders one row")
local text=(rows[1].detailText or "")..(rows[1].summary or "")..(rows[1].title or "")
assert(text:find("does not establish",1,true),"the row must state its own limits")
-- Naive word blacklists fail here: the cautious sentence legitimately
-- contains "owned" inside "does not establish ... that they owned it".
-- Test the claim being made, not the vocabulary.
assert(text:find("suggests a possible connection",1,true),"the link is offered as possible, not proven")
for _,overclaim in ipairs({"proves","confirms","definitely","must have","this body was"}) do
    assert(not text:lower():find(overclaim,1,true),"row must not overclaim: "..overclaim)
end

-- keyId -1 is PZ's "no lock" sentinel and must never become a lead.
for _,bad in ipairs({-1,-5,1.5,0/0}) do
    local nope={id="door:x",sourceToken="corpse-item:1",keyId=bad,buildingId="b"}
    assert(not Lead.observe(Lead.empty(),nope),"invalid keyId refused: "..tostring(bad))
end

print("PASS observed key door: door-derived leads, duplicate and contradiction handling, cautious wording, keyId sentinel")
