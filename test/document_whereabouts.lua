-- The organiser should say where a document physically is, and admit when it
-- does not know.
--
-- Found 2026-09-09: generated cases showed nothing at all. The periodic scan
-- reports every document, with an empty list where it found nothing, and that
-- empty case was ignored - so a document could never stop being "placed",
-- however far from the player it went. The old window's PHYSICAL OBJECT section
-- was only reached by the older authored path.
--
-- The states are deliberately about knowledge, not fate. The scan covers the
-- player, two tiles around them, their vehicle and the container the document
-- came from, so absence means "not anywhere we can see", never "destroyed".
local f = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua', 'r'))
local runtime = f:read('*a'); f:close()
local g = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/EvidenceRows.lua', 'r'))
local words = g:read('*a'); g:close()

-- The empty case must be handled, or nothing below it can work.
assert(runtime:find('s.misses=s.misses+1', 1, true),
    'the scan must count misses when a document is not found')
assert(runtime:find('s.seen=true; s.misses=0', 1, true),
    'finding a document must reset its miss count')

-- Uncertainty must take several misses. One doorway is not evidence of loss.
local threshold = runtime:match('MISSES_BEFORE_UNCERTAIN=(%d+)')
assert(threshold, 'the miss threshold must be named, not buried in a literal')
assert(tonumber(threshold) >= 3,
    'a single missed scan must not make the organiser doubt itself, got ' .. threshold)

-- Sightings must not survive a reload: after loading we have not looked yet.
assert(runtime:find('sightings={}', 1, true), 'sightings must be cleared on game start')

-- All four states must reach the player, and none may claim destruction.
for _, state in ipairs({ 'accounted', 'uncertain', 'conflict', 'unchecked' }) do
    assert(words:find(state .. '=', 1, true),
        'there must be wording for the ' .. state .. ' state')
end
-- The wording must be about knowledge. "Uncertain" is a claim we can support;
-- "destroyed" is not, because the scan only sees a small area.
local uncertain = words:match('uncertain="([^"]+)"')
assert(uncertain, 'the uncertain state must have wording')
assert(uncertain:lower():find('uncertain'), 'the uncertain wording must express uncertainty')
assert(not uncertain:lower():find('destroy'), 'the mod cannot know a document was destroyed')
assert(not uncertain:lower():find('lost'), 'the mod cannot know a document is lost')

-- A fresh load must admit it has not looked, rather than inheriting confidence.
local unchecked = words:match('unchecked="([^"]+)"')
assert(unchecked and unchecked:lower():find('not checked'),
    'a fresh load must say it has not checked, not imply the document is fine')

print('PASS document whereabouts: misses counted, uncertainty needs several, '
    .. 'sightings reset on load, and no state claims a document was destroyed')

-- Naming the vehicle (2026-09-10). "In a vehicle" cannot tell a mail van from
-- an unmarked one, and that difference is the whole of what a vehicle adds
-- over a cupboard. Until the organiser says which car, a trade-mismatch rule
-- has nothing a player could ever perceive.
assert(runtime:find('local vehicle=rd(part,"getVehicle")', 1, true),
    'the whereabouts line must reach the vehicle, not just its part')
assert(runtime:find('rd(vehicle,"getScriptName")', 1, true),
    'the vehicle must be named')
assert(runtime:find('string.sub(name,1,5)=="Base."', 1, true),
    'the Base. prefix is engine plumbing and must not reach the player')
-- "VanAmbulance" is a script id, not a name anyone would write. The game
-- already ships the real ones - IGUI_VehicleNameVanAmbulance is "Ambulance" -
-- so we ask it instead of shipping a table that would only ever be English.
assert(runtime:find('"IGUI_VehicleName"..name', 1, true),
    'the vehicle name must come from the game\'s own translation, not a table of ours')
assert(runtime:find('text~=key', 1, true),
    'getText returns the key when there is no translation; an unmatched id must fall through')
assert(not runtime:find('or "In a vehicle." end', 1, true),
    'the old unnamed wording must be gone')
print('PASS document whereabouts: the organiser names the vehicle a clue is in')

-- "Carried, in your Omer's Case File." Seen in play 2026-09-10, once the
-- survivor had a container named after themselves. A bag that already carries
-- a possessive does not take a second one.
assert(runtime:find('string.find(name,"\'s ",1,true)', 1, true),
    'a container whose name already possesses must not be given "your" as well')
assert(runtime:find('"Carried, in "..name', 1, true), 'it reads "Carried, in Omer\'s Case File."')
assert(runtime:find('"Carried, in your "..name', 1, true), 'and an ordinary bag still reads "your"')
print('PASS document whereabouts: no double possessive on a named container')

-- A finished case's evidence (P4-R104). Owner in play, 2026-09-14: "I lost my
-- files somewhere?" Retirement dropped every placement detail, so nothing
-- could say where the evidence was. FILES now says where it
-- was last seen - and still never that it is lost.
assert(runtime:find('return "lastseen",row.lastSeen', 1, true), 'a retired document reports where it was last seen')
local lastseen = words:match('lastseen="([^"]+)"')
assert(lastseen and lastseen:find('Last seen', 1, true), 'there is wording for a finished case')
assert(not lastseen:lower():find('lost') and not lastseen:lower():find('destroy'), 'the last-seen wording claims nothing')
assert(runtime:find('LAST_SEEN_WRITE_MS=60000', 1, true), 'a last-seen write happens at most once a minute per document')
assert(runtime:find('LAST_SEEN_EVERY_MS=10000', 1, true), 'the last-seen scan is throttled to every ten seconds')

-- A CLUE ON A CARRIER (P4-R134, P4-R136). A zombie's inventory answers the
-- container type "none", and the record duly said `accounted In a none at 102
-- Dewey St.` (campaign 20260917T234706); a BODY's answers `inventoryfemale`,
-- whose title the game translates as "Corpse", and the record read `In a corpse
-- at 105 Hill St.` (20260918T055418). Neither the raw type nor the game's
-- title for it is the wording: a carrier is named as what it is, in one line
-- that feeds the case record, the FILES WHERE line and a finished case's
-- last-seen line alike.
assert(not runtime:find('or ("In a "..tostring(kind))', 1, true),
    'the raw container type must never be the fallback wording - that is what "In a none" was')
assert(runtime:find('local carrier=carrierOf(item,container)', 1, true),
    'a container with no usable type must ask whether it is a carrier')
-- AND THE BODY QUESTION COMES FIRST. A body's inventory DOES declare a type -
-- `inventoryfemale`, whose own title the game translates as "Corpse" - so
-- asking the type first read "In a corpse at 105 Hill St." in a real game
-- (20260918T055418-body-carrier.txt). A body is a body, not a kind of
-- furniture, and the owner is what says so about where the clue is NOW.
local onBody = assert(runtime:find('local onBody=carrierByOwner(container)', 1, true),
    "the wording must ask the container's owner whether it is a body")
local byType = assert(runtime:find('local phrase=Words.phrase(tostring(kind),title)', 1, true),
    'and word a container by its type')
assert(onBody < byType,
    'the body question must be asked BEFORE the container type, or a corpse is worded as furniture')
assert(runtime:find('if onBody then return Words.carrier(onBody,address) end', 1, true),
    'and a body is worded as a body')
assert(runtime:find('return Words.carrier(carrier,address)', 1, true),
    'and a carrier must be worded as a carrier (ContainerWords.carrier)')
assert(runtime:find('"In something at "..address', 1, true),
    'a container that declares no type and is no carrier says where, not what')
-- Two ways to know, because a finished case keeps no assignments (P4-R104):
-- the case's own target while it is live, the body itself once it is not.
assert(runtime:find('type(t.carrierMark)=="string" and Carriers.KINDS[t.carrierKind]', 1, true),
    "a live case's own target says which kind of carrier took the clue")
-- P4-R136: a body is the only carrier there is, so the owner question is the
-- one question - and a living zombie's inventory can hold no clue of ours.
assert(runtime:find('instanceof(owner,"IsoDeadBody")', 1, true)
    and not runtime:find('instanceof(owner,"IsoZombie")', 1, true),
    'and a finished case can still tell a body by asking the container owner, with no walker arm left to reach')
local carrierOf = assert(runtime:match('local function carrierOf%(item,container%)(.-)\nend\n'),
    'carrierOf must exist')
assert(not carrierOf:find('setHaloNote', 1, true) and not carrierOf:find('AddItem', 1, true),
    'naming where a clue is only reads; it never says anything and never moves anything')

-- PDA FILES, through fakes: a WHERE field for live and finished documents.
package.path = "mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;" .. package.path
package.preload["ConspiracyFiles/KnoxUI"] = function() return {} end
ConspiracyFiles = ConspiracyFiles or {}
local known = {}
for _, id in ipairs({ "a", "b", "c", "d", "e", "f", "g" }) do known[#known + 1] = { id = id, title = id:upper(), body = "body" } end
local states = { a = { "accounted", "Carried." }, b = { "uncertain", "In a desk." }, c = { "lastseen", "Carried, in Una's Evidence." },
                 d = { "unchecked" }, e = { "lastseen" },
                 -- A carrier reaches FILES in the same words as any container.
                 f = { "accounted", "On a body at 102 Dewey St." },
                 g = { "uncertain", "On a zombie near 102 Dewey St." } }
ConspiracyFiles.GeneratedRuntime = { metrics = function() return {} end, known = function() return known end,
    whereabouts = function(id) local s = states[id]; return s[1], s[2] end }
local okApps, A = pcall(dofile, 'mod/common/media/lua/client/ConspiracyFiles/KnoxApps.lua')
assert(okApps, 'KnoxApps loads under fakes: ' .. tostring(A))
local listed = {}
for _, row in ipairs(A.files.list()) do
    for _, field in ipairs(row.fields) do if field.label == "WHERE" then listed[row.id] = field.value end end
end
assert(listed.a == "Carried.", tostring(listed.a))
assert(listed.b == "Not seen recently. Its whereabouts are uncertain. Last seen: In a desk.", tostring(listed.b))
assert(listed.c == "Last seen: Carried, in Una's Evidence.", tostring(listed.c))
-- The wording is owned by Rows.WHEREABOUTS and policed by
-- test/pda_stays_in_world.lua; here it only has to be that line, taken from
-- the source this test already read rather than transcribed a second time.
local uncheckedLine = words:match('unchecked="([^"]+)"')
assert(uncheckedLine, 'EvidenceRows no longer declares an unchecked whereabouts line')
assert(listed.d == uncheckedLine, tostring(listed.d))
assert(listed.e == nil, 'no WHERE line where nothing is known')
assert(listed.f == "On a body at 102 Dewey St.", tostring(listed.f))
assert(listed.g == "Not seen recently. Its whereabouts are uncertain. Last seen: On a zombie near 102 Dewey St.",
    tostring(listed.g))
for _, v in pairs(listed) do
    assert(not v:lower():find('lost') and not v:lower():find('destroy'), v)
    assert(not v:find('a none', 1, true), 'no surface may ever read "In a none": ' .. v)
end
print('PASS document whereabouts: a finished case says where its evidence was last seen, in FILES, '
    .. 'and a clue on a body or a zombie says so instead of reading "In a none"')
