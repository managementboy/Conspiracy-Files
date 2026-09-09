-- An outfit the notebook cannot say out loud is not a lead.
--
-- Playtest 2026-09-08: the first outfit line ever to reach a player read
-- "The body itself wore a Generic03." Two faults in six words. Generic03 is
-- the game's internal id, not prose; and a generic outfit identifies nobody,
-- so saying it at all adds noise to a record whose whole value is restraint.
--
-- The raw id is still what gets stored - it is the game's own fact - so this
-- is a presentation rule, applied when the notebook asks.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local M = require("ConspiracyFiles/BodyOutfitObservations")

-- Suppressed: says nothing about who the body was.
for _, name in ipairs({ 'Generic01', 'Generic03', 'Generic10', 'generic', 'Default', 'Naked', 'bullet' }) do
    assert(M.readable(name) == nil, name .. ' identifies nobody and must be suppressed')
end

-- Suppressed: developer wardrobes are not observations about anybody.
for _, name in ipairs({ 'ArmorTest_Metal', 'ArmorTest_Bone', '1RJTest', 'AlwaysRadioTest' }) do
    assert(M.readable(name) == nil, name .. ' is a test outfit, not a lead')
end

-- Readable: real outfits become ordinary words.
local expected = {
    ConstructionWorker = 'construction worker',
    SecurityGuard = 'security guard',
    AmbulanceDriver = 'ambulance driver',
    ArmyServiceUniform = 'army service uniform',
    Chef = 'chef',
    Bathrobe = 'bathrobe',
    Cook_Spiffos = 'cook spiffos',
    AirportSecurityTarmac = 'airport security tarmac',
}
for raw, want in pairs(expected) do
    local got = M.readable(raw)
    assert(got == want, raw .. ' -> ' .. tostring(got) .. ', wanted ' .. want)
end

-- Nothing readable ever contains a capital or an underscore: those are the
-- marks of an id that escaped into prose, which is what this exists to stop.
for raw in pairs(expected) do
    local got = M.readable(raw)
    assert(not got:find('%u'), raw .. ' left a capital in player-facing text')
    assert(not got:find('_'), raw .. ' left an underscore in player-facing text')
end

-- Junk in, silence out. Never a crash, never a half-formed sentence.
for _, bad in ipairs({ '', '   ', '\n\t' }) do
    assert(M.readable(bad) == nil, 'blank names yield nothing')
end
assert(M.readable(nil) == nil, 'nil yields nothing')
assert(M.readable(42) == nil, 'a non-string yields nothing')

print('PASS outfit readable: generic and test wardrobes suppressed, real outfits '
    .. 'become plain words, no id ever reaches player-facing text')

-- The sentence must not carry an article. getOutfitName returns bare labels -
-- "Police" was observed in play on 2026-09-09 - and "wore a police" is broken
-- English. Generic03 hid this: suppression meant the sentence never once
-- rendered with a real value until a uniformed body turned up.
local Identity = require("ConspiracyFiles/IdentityObservations")
local root = assert(Identity.add(Identity.empty(), {
    id = "Base.IDcard:1", fullType = "Base.IDcard", label = "ID Card: A Name",
    source = "corpse", container = "corpse", x = 1, y = 2, z = 0,
    observedAt = 3, token = "corpse-item:1",
}))
for _, raw in ipairs({ 'Police', 'Bathrobe', 'ConstructionWorker', 'SecurityGuard' }) do
    local text = Identity.rows(root, function() return M.readable(raw) end)[1].detailText
    assert(text:find('The body itself wore: ', 1, true),
        raw .. ': the outfit sentence must not use an article')
    assert(not text:find('wore a ', 1, true),
        raw .. ': "wore a ' .. tostring(M.readable(raw)) .. '" is not English for every label')
end
print('PASS outfit sentence: no article, so a bare label like "police" still reads')
