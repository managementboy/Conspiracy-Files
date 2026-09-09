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
