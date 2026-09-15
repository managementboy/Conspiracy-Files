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
-- The real uninformative set, read from media/clothing/clothing.xml:
-- Generic01..Generic05, Generic_Skirt, Naked, NakedVeil. Generic_Skirt reached
-- a player on 2026-09-09 as "generic skirt", because the old rule stripped
-- trailing digits and compared the whole stem.
for _, name in ipairs({ 'Generic01', 'Generic03', 'Generic05', 'Generic_Skirt',
                        'Naked', 'NakedVeil', 'generic', 'Default', 'bullet' }) do
    assert(M.readable(name) == nil, name .. ' identifies nobody and must be suppressed')
end

-- Suppressed: developer wardrobes are not observations about anybody.
for _, name in ipairs({ 'ArmorTest_Metal', 'ArmorTest_Bone', '1RJTest', 'AlwaysRadioTest' }) do
    assert(M.readable(name) == nil, name .. ' is a test outfit, not a lead')
end

-- Cook_Generic identifies a cook. Suppressing anything merely CONTAINING
-- "generic" would lose it, which is why the rule judges the leading word.
assert(M.readable('Cook_Generic') ~= nil, 'Cook_Generic identifies a cook and must survive')

-- An id that describes the person, not the clothes. "Young" reached the
-- notebook as "The body itself wore: young." (Linux wallet check, 2026-09-11).
-- Exact match only: YoungCowpoke is still an outfit.
assert(M.readable('Young') == nil, 'Young describes the person, not what they wore')
assert(M.readable('YoungCowpoke') == 'young cowpoke', tostring(M.readable('YoungCowpoke')))

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

-- ------------------------------------------------------------- WP3 ------
-- "The body itself wore: goth" prints a game id in a lower-case hat. Nobody
-- looking at a corpse thinks the word "goth"; they think what they can see.
-- M.describe is a CLOSED table of written lines, and everything else is
-- silence.
for _, style in ipairs({ 'Goth', 'Classy', 'Punk', 'Redneck', 'Biker', 'Hunter' }) do
    local line = M.describe(style)
    assert(type(line) == 'string' and #line > 0, style .. ' must have a written line')
    -- A description, not a relabelled id: it must not simply be the id again.
    assert(line:lower() ~= style:lower(), style .. ' is not a description of itself')
    assert(not line:find('%u'), style .. ' left a capital in player-facing text')
    assert(not line:find('_'), style .. ' left an underscore in player-facing text')
end
assert(M.describe('Goth') == 'a lot of black, chains, boots', tostring(M.describe('Goth')))

-- FAIL CLOSED. This is the whole rule. A future game update ships a new
-- outfit id; the survivor must say nothing rather than something nobody
-- wrote. Three ids have already leaked into prose this way - Generic03,
-- Generic_Skirt and Young - which is why this is a table and not a transform.
for _, invented in ipairs({ 'Nonsense', 'Outfit_From_A_Future_Patch', 'Goth2',
                            'goth', 'GOTH', ' Nonsense ', 'Generic03', 'Young',
                            'ArmorTest_Metal', '', '   ' }) do
    assert(M.describe(invented) == nil,
        'an id with no written line must produce silence, got ' .. tostring(M.describe(invented)))
end
assert(M.describe(nil) == nil and M.describe(42) == nil and M.describe({}) == nil)
-- Surrounding whitespace is trimmed, so a padded real id still resolves.
assert(M.describe('  Goth  ') == M.describe('Goth'))

-- The table is real writing, not a stub with six entries in it: the uniforms
-- and trades a body in Muldraugh actually wears are covered too, or the
-- closed rule would be a large regression dressed as a safety measure.
assert(M.describedCount() >= 60, 'only ' .. M.describedCount() .. ' outfits described')
for _, common in ipairs({ 'Police', 'ConstructionWorker', 'Doctor', 'Nurse',
                          'Fireman', 'Bathrobe', 'Farmer', 'Mechanic', 'Chef', 'Inmate' }) do
    assert(M.describe(common), common .. ' is common enough that silence would be a regression')
end

-- Every written line has to survive the sentence it is dropped into:
-- "The body itself wore: " .. line .. "." Nothing may already end in a stop,
-- start with a capital, or contain the kind of punctuation that would break
-- the clause in two.
local seen = {}
for _, id in ipairs(M.describedIds()) do
    local line = M.describe(id)
    assert(type(line) == 'string' and #line > 2, id .. ': a description must be words')
    assert(not line:find('%.$'), id .. ': the sentence supplies the full stop')
    assert(not line:find('^%u'), id .. ': the line continues a sentence, it does not start one')
    assert(not seen[line], 'two outfits share a description: ' .. line)
    seen[line] = true
end

local described = Identity.rows(root, function() return M.describe('Goth') end)[1].detailText
assert(described:find('The body itself wore: a lot of black, chains, boots.', 1, true), described)
local silent = Identity.rows(root, function() return M.describe('Outfit_From_A_Future_Patch') end)[1].detailText
assert(not silent:find('The body itself wore', 1, true),
    'an undescribed outfit must omit the whole sentence, not render it empty')

print('PASS outfit described: the six styles read as sentences, uniforms and '
    .. 'trades are covered, and an invented id produces silence')
