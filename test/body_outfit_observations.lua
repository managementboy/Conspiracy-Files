-- Pure domain: token -> observed-outfit association the notebook reads to
-- mention a corpse's clothing alongside a document found on the same body
-- (docs/design/USING_GAME_ASSETS.md, Phase 1). Same discipline as
-- person_name_observations.lua: validate, bound, copy-on-write, never
-- invent, round-trip through ModData shape.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Outfits=require("ConspiracyFiles/BodyOutfitObservations")

local e=Outfits.empty()
assert(Outfits.validate(e))
assert(next(e.outfits)==nil)

-- A fresh observation is recorded against its body's token.
local staged,changed=assert(Outfits.observe(e,"corpse-item:1","PoliceStory"))
assert(changed and Outfits.validate(staged))
assert(Outfits.outfitFor(staged,"corpse-item:1")=="PoliceStory")
assert(next(e.outfits)==nil,"observe never mutates its input")

-- Re-observing the identical outfit for the same token is a no-op, not a
-- rewrite.
local same,repeated=Outfits.observe(staged,"corpse-item:1","PoliceStory")
assert(same and not repeated and Outfits.validate(same))

-- A contradictory outfit for the same token is refused outright -- never
-- overwritten, never guessed which reading is right. In practice a corpse's
-- outfit never changes, so a contradiction here would mean two distinct
-- bodies were mistaken for one token; refusing is the safe response.
local refused,refusedChanged,why=Outfits.observe(staged,"corpse-item:1","JanitorFemale")
assert(refused==nil and not refusedChanged and why=="contradictory body outfit")
assert(Outfits.outfitFor(staged,"corpse-item:1")=="PoliceStory","the original observation survives a contradiction attempt")

-- Two adjacent bodies keep separate outfits: a different token can carry a
-- different outfit, and neither observation leaks into the other.
local two=assert(Outfits.observe(staged,"corpse-item:2","JanitorFemale"))
assert(Outfits.outfitFor(two,"corpse-item:1")=="PoliceStory" and Outfits.outfitFor(two,"corpse-item:2")=="JanitorFemale")

-- No outfit is ever fabricated: an unknown token returns nil, not a guess.
assert(Outfits.outfitFor(two,"corpse-item:999")==nil)
assert(Outfits.outfitFor(Outfits.empty(),"corpse-item:1")==nil)

-- An unreadable or absent outfit is never something this module invents --
-- callers simply never call observe() for it. Confirm nil/empty-string
-- outfits are refused rather than silently accepted as "something".
for _,bad in ipairs({
    {"corpse-item:3", nil},
    {"corpse-item:3", ""},
    {"corpse-item:3", "   "},
}) do
    assert(not Outfits.observe(e, bad[1], bad[2]), "expected refusal for outfit "..tostring(bad[2]))
end

-- Invalid observations are refused.
for _,bad in ipairs({
    {"", "PoliceStory"},
    {"token", ""},
    {"token", string.rep("x", 121)},
    {"token", "bad\1control"},
    {123, "PoliceStory"},
    {"token", 123},
}) do
    assert(not Outfits.observe(e, bad[1], bad[2]), "expected refusal for "..tostring(bad[1]).."/"..tostring(bad[2]))
end

-- Structural validation rejects metatables and unknown fields.
assert(not Outfits.validate(setmetatable(Outfits.empty(),{})))
assert(not Outfits.validate({schema=1,outfits={},unknown=true}))
local badFact=Outfits.empty(); badFact.outfits.tok={token="tok",outfit="PoliceStory",extra=true}
assert(not Outfits.validate(badFact))
local mismatched=Outfits.empty(); mismatched.outfits.tok={token="other",outfit="PoliceStory"}
assert(not Outfits.validate(mismatched))

-- Bounded: capacity is exactly Outfits.MAX, never silently exceeded.
local full=Outfits.empty()
for i=1,Outfits.MAX do
    full=assert(Outfits.observe(full,"corpse-item:"..i,"Outfit"..i))
end
local overflow,addedOverflow,overflowWhy=Outfits.observe(full,"corpse-item:overflow","Nobody")
assert(overflow and not addedOverflow and overflowWhy=="outfit capacity exceeded")
assert(Outfits.validate(overflow))

-- Round-trips through a plain-table ModData-shaped wrapper exactly like the
-- client store (BodyOutfitLog) persists and reloads it.
local wrapper={canonical=two}
local reloaded=wrapper.canonical
assert(Outfits.validate(reloaded))
assert(Outfits.outfitFor(reloaded,"corpse-item:2")=="JanitorFemale")

print("body outfit observations: ok")
