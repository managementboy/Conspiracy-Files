-- The notebook should say where a document physically is, and admit when it
-- does not know.
--
-- Found 2026-09-09: generated cases showed nothing at all. The periodic scan
-- reports every document, with an empty list where it found nothing, and that
-- empty case was ignored - so a document could never stop being "placed",
-- however far from the player it went. The notebook's PHYSICAL OBJECT section
-- was only reached by the older authored path.
--
-- The states are deliberately about knowledge, not fate. The scan covers the
-- player, two tiles around them, their vehicle and the container the document
-- came from, so absence means "not anywhere we can see", never "destroyed".
local f = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua', 'r'))
local runtime = f:read('*a'); f:close()
local g = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/Notebook.lua', 'r'))
local notebook = g:read('*a'); g:close()

-- The empty case must be handled, or nothing below it can work.
assert(runtime:find('s.misses=s.misses+1', 1, true),
    'the scan must count misses when a document is not found')
assert(runtime:find('s.seen=true; s.misses=0', 1, true),
    'finding a document must reset its miss count')

-- Uncertainty must take several misses. One doorway is not evidence of loss.
local threshold = runtime:match('MISSES_BEFORE_UNCERTAIN=(%d+)')
assert(threshold, 'the miss threshold must be named, not buried in a literal')
assert(tonumber(threshold) >= 3,
    'a single missed scan must not make the notebook doubt itself, got ' .. threshold)

-- Sightings must not survive a reload: after loading we have not looked yet.
assert(runtime:find('sightings={}', 1, true), 'sightings must be cleared on game start')

-- All four states must reach the player, and none may claim destruction.
for _, state in ipairs({ 'accounted', 'uncertain', 'conflict', 'unchecked' }) do
    assert(notebook:find(state .. '=', 1, true),
        'the notebook must have wording for the ' .. state .. ' state')
end
-- The wording must be about knowledge. "Uncertain" is a claim we can support;
-- "destroyed" is not, because the scan only sees a small area.
local uncertain = notebook:match('uncertain="([^"]+)"')
assert(uncertain, 'the uncertain state must have wording')
assert(uncertain:lower():find('uncertain'), 'the uncertain wording must express uncertainty')
assert(not uncertain:lower():find('destroy'), 'the mod cannot know a document was destroyed')
assert(not uncertain:lower():find('lost'), 'the mod cannot know a document is lost')

-- A fresh load must admit it has not looked, rather than inheriting confidence.
local unchecked = notebook:match('unchecked="([^"]+)"')
assert(unchecked and unchecked:lower():find('not checked'),
    'a fresh load must say it has not checked, not imply the document is fine')

print('PASS document whereabouts: misses counted, uncertainty needs several, '
    .. 'sightings reset on load, and no state claims a document was destroyed')

-- Naming the vehicle (2026-09-10). "In a vehicle" cannot tell a mail van from
-- an unmarked one, and that difference is the whole of what a vehicle adds
-- over a cupboard. Until the notebook says which car, a trade-mismatch rule
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
print('PASS document whereabouts: the notebook names the vehicle a clue is in')

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
-- could say where the evidence was. The notebook and FILES now say where it
-- was last seen - and still never that it is lost.
assert(runtime:find('return "lastseen",row.lastSeen', 1, true), 'a retired document reports where it was last seen')
local lastseen = notebook:match('lastseen="([^"]+)"')
assert(lastseen and lastseen:find('Last seen', 1, true), 'the notebook has wording for a finished case')
assert(not lastseen:lower():find('lost') and not lastseen:lower():find('destroy'), 'the last-seen wording claims nothing')
assert(runtime:find('LAST_SEEN_WRITE_MS=60000', 1, true), 'a last-seen write happens at most once a minute per document')
assert(runtime:find('LAST_SEEN_EVERY_MS=10000', 1, true), 'the last-seen scan is throttled to every ten seconds')

-- PDA FILES, through fakes: a WHERE field for live and finished documents.
package.path = "mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;" .. package.path
package.preload["ConspiracyFiles/KnoxUI"] = function() return {} end
ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.NotebookUI = { generatedRows = function()
    return { { id = "a", title = "A", detailText = "body" }, { id = "b", title = "B", detailText = "body" },
             { id = "c", title = "C", detailText = "body" }, { id = "d", title = "D", detailText = "body" },
             { id = "e", title = "E", detailText = "body" } }
end }
local states = { a = { "accounted", "Carried." }, b = { "uncertain", "In a desk." }, c = { "lastseen", "Carried, in Una's Evidence." },
                 d = { "unchecked" }, e = { "lastseen" } }
ConspiracyFiles.GeneratedRuntime = { whereabouts = function(id) local s = states[id]; return s[1], s[2] end }
local okApps, A = pcall(dofile, 'mod/common/media/lua/client/ConspiracyFiles/KnoxApps.lua')
assert(okApps, 'KnoxApps loads under fakes: ' .. tostring(A))
local listed = {}
for _, row in ipairs(A.files.list()) do
    for _, field in ipairs(row.fields) do if field.label == "WHERE" then listed[row.id] = field.value end end
end
assert(listed.a == "Carried.", tostring(listed.a))
assert(listed.b == "Not seen recently. Last seen: In a desk.", tostring(listed.b))
assert(listed.c == "Last seen: Carried, in Una's Evidence.", tostring(listed.c))
assert(listed.d == nil and listed.e == nil, 'no WHERE line where nothing is known')
for _, v in pairs(listed) do assert(not v:lower():find('lost') and not v:lower():find('destroy'), v) end
print('PASS document whereabouts: a finished case says where its evidence was last seen, in the notebook and in FILES')
