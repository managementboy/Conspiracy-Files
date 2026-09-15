-- Pure domain: token -> observed-name association PlayerVoice's Set B reads.
-- Same discipline as discovery_ledger.lua / observed_key_lead.lua: validate,
-- bound, copy-on-write, never invent, round-trip through ModData shape.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Names=require("ConspiracyFiles/PersonNameObservations")

local e=Names.empty()
assert(Names.validate(e))
assert(next(e.names)==nil)

-- A fresh observation is recorded.
local staged,changed=assert(Names.observe(e,"corpse-item:1","Dana Vale"))
assert(changed and Names.validate(staged))
assert(Names.nameFor(staged,"corpse-item:1")=="Dana Vale")
assert(next(e.names)==nil,"observe never mutates its input")

-- Re-observing the identical name for the same token is a no-op, not a
-- rewrite.
local same,repeated=Names.observe(staged,"corpse-item:1","Dana Vale")
assert(same and not repeated and Names.validate(same))

-- A contradictory name for the same token is refused outright -- never
-- overwritten, never guessed which one is right.
local refused,refusedChanged,why=Names.observe(staged,"corpse-item:1","Someone Else")
assert(refused==nil and not refusedChanged and why=="contradictory person name")
assert(Names.nameFor(staged,"corpse-item:1")=="Dana Vale","the original observation survives a contradiction attempt")

-- A different token can carry a different name.
local two=assert(Names.observe(staged,"corpse-item:2","Alex Roe"))
assert(Names.nameFor(two,"corpse-item:1")=="Dana Vale" and Names.nameFor(two,"corpse-item:2")=="Alex Roe")

-- No name is ever fabricated: an unknown token returns nil, not a guess.
assert(Names.nameFor(two,"corpse-item:999")==nil)
assert(Names.nameFor(Names.empty(),"corpse-item:1")==nil)

-- Invalid observations are refused.
for _,bad in ipairs({
    {"", "Name"},
    {"token", ""},
    {"token", string.rep("x", 121)},
    {"token", "bad\1control"},
    {123, "Name"},
    {"token", 123},
}) do
    assert(not Names.observe(e, bad[1], bad[2]), "expected refusal for "..tostring(bad[1]).."/"..tostring(bad[2]))
end

-- Structural validation rejects metatables and unknown fields.
assert(not Names.validate(setmetatable(Names.empty(),{})))
assert(not Names.validate({schema=1,names={},unknown=true}))
local badFact=Names.empty(); badFact.names.tok={token="tok",name="Name",extra=true}
assert(not Names.validate(badFact))
local mismatched=Names.empty(); mismatched.names.tok={token="other",name="Name"}
assert(not Names.validate(mismatched))

-- Bounded: capacity is exactly Names.MAX, never silently exceeded.
local full=Names.empty()
for i=1,Names.MAX do
    full=assert(Names.observe(full,"corpse-item:"..i,"Person "..i))
end
local overflow,addedOverflow,overflowWhy=Names.observe(full,"corpse-item:overflow","Nobody")
assert(overflow and not addedOverflow and overflowWhy=="name capacity exceeded")
assert(Names.validate(overflow))

-- Round-trips through a plain-table ModData-shaped wrapper exactly like the
-- client store (PersonNameLog) persists and reloads it.
local wrapper={canonical=two}
local reloaded=wrapper.canonical
assert(Names.validate(reloaded))
assert(Names.nameFor(reloaded,"corpse-item:2")=="Alex Roe")

print("person name observations: ok")
