-- A document you have read should say so when you hover it. One you have not
-- read must say nothing at all.
--
-- The owner asked for this so he can tell which of several documents he is
-- carrying without opening the notebook. The item already carries its real
-- title as its name, so the tooltip only has to confirm the notebook has it.
--
-- The restriction is the important half. A tooltip on an UNDISCOVERED document
-- would let a player find every clue by hovering over furniture, which
-- replaces the investigation with a sweep. So it is written on inspection and
-- never at placement.
local function read(path)
    local f = assert(io.open(path, 'r'), 'cannot open ' .. path)
    local s = f:read('*a'); f:close(); return s
end

local runtime = read('mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua')

-- Written exactly once, and inside the inspect path.
-- inspect gained an `inPlace` argument on 2026-09-10 (noting a document
-- without taking it), so the signature is matched loosely enough to survive
-- another one.
local inspect = runtime:match('function R%.inspect%(item[^)]*%)(.-)\nfunction ')
assert(inspect, 'R.inspect must exist')
assert(inspect:find('setTooltip', 1, true),
    'the tooltip must be written when a document is inspected')

-- And nowhere else. Placement must not touch it, or every clue announces
-- itself before it has been read.
local _, count = runtime:gsub('setTooltip', '')
assert(count == 1, 'setTooltip must appear exactly once, found ' .. count)

-- Placement sets the item's name; it must not also set a tooltip.
local place = runtime:match('(newItem:setName.-\n.-\n)')
if place then
    assert(not place:find('setTooltip', 1, true),
        'placement must never mark a document a player has not read')
end

-- The key must exist in the shipped translations, or the tooltip shows the
-- raw key to the player.
local key = runtime:match('setTooltip%("([%w_]+)"%)')
assert(key, 'the tooltip key must be a plain literal so it can be checked')
local translations = read('mod/common/media/lua/shared/Translate/EN/Tooltip.json')
assert(translations:find('"' .. key .. '"', 1, true),
    'the key ' .. key .. ' must be defined in Translate/EN/Tooltip.json, or the '
    .. 'player sees the key itself')

-- The wording must not announce importance; it reports that a note exists.
local phrase = translations:match('"' .. key .. '"%s*:%s*"([^"]+)"')
assert(phrase, 'the key must have wording')
for _, banned in ipairs({ 'important', 'evidence', 'clue', 'objective' }) do
    assert(not phrase:lower():find(banned),
        'the tooltip must not tell the player something is important: ' .. phrase)
end

print('PASS inspected tooltip: written only on inspection, key ships with the '
    .. 'mod, wording reports a note rather than announcing importance')

-- Noting a document without taking it (owner, 2026-09-10: "we should be able
-- to right click and add it to our Notebook without adding them to our
-- inventory"). A pile of eleven credit cards should not have to be pocketed.
--
-- Possession was required so discovery stayed deliberate - a player must not
-- sweep a street by hovering over furniture. A right-click on a named option is
-- just as deliberate, so the guarantee survives and the guard moves rather than
-- disappearing.
assert(inspect:find('if not inPlace and item:getOutermostContainer()', 1, true),
    'possession must still be required on the ordinary path')
assert(inspect:find('container==getPlayer():getInventory() then return false', 1, true),
    'noting in place must refuse an item already in hand: that is the ordinary path')
local menu = read('mod/common/media/lua/client/ConspiracyFiles/GeneratedMenu.lua')
assert(menu:find('"Note in the Investigation"', 1, true), 'the option must exist')
assert(menu:find('R.inspect,item,true', 1, true), 'it must record in place')
assert(menu:find('if not carried then', 1, true),
    'it must appear only when the item is NOT already carried, or it duplicates Inspect')
print('PASS inspected tooltip: a document can be noted where it lies, and possession still gates the ordinary path')
