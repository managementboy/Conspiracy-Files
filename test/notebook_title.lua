-- The notebook is titled with the survivor's own forename when the game has
-- one, and falls back to "Survivor's Notebook" when it does not.
--
-- The name is a fact PZ already owns, so this reads it and never invents it. A
-- descriptor can be absent mid-load and a getter can throw, and neither may
-- break the window, so every failure path is asserted here rather than assumed.
--
-- The player and descriptor are strict doubles: Kahlua refuses a Java method
-- invoked without a receiver, so player.getDescriptor() would fail in game
-- while a plain table would accept it. See AGENTS.md, "Engine call form".
local strict = dofile('test/support/strict.lua')

local f = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/Notebook.lua', 'r'))
local src = f:read('*a')
f:close()

local a = assert(src:find('local function survivorForename(', 1, true))
local b = assert(src:find('function Window:new(section)', a, true))
local helper = src:sub(a, b - 1)

local c = assert(src:find('local forename=survivorForename(player)', 1, true))
local d = assert(src:find('o:setWantKeyEvents(true)', c, true))
local title = src:sub(c, d - 1)

local debugOn = false
local env = {
    pcall = pcall, type = type, tostring = tostring, string = string,
    isDebugEnabled = function() return debugOn end,
    UI = { VERSION = 'TEST-VERSION' },
}

local chunk = assert(loadstring(helper .. '\nreturn function(player, o)\n' .. title .. '\nend'))
setfenv(chunk, env)
local applyTitle = chunk()

local function titleFor(player)
    local captured
    local o = { setTitle = function(self, t) captured = t end }
    applyTitle(player, o)
    return captured
end

local function playerNamed(forename)
    local descriptor = strict.object('descriptor', { getForename = function() return forename end })
    return strict.object('player', { getDescriptor = function() return descriptor end })
end

assert(titleFor(playerNamed('Bob')) == "Bob's Notebook", 'a named survivor owns the notebook')
assert(titleFor(nil) == "Survivor's Notebook", 'no player falls back')

local noDescriptor = strict.object('player', { getDescriptor = function() return nil end })
assert(titleFor(noDescriptor) == "Survivor's Notebook", 'absent descriptor falls back')

assert(titleFor(playerNamed('')) == "Survivor's Notebook", 'empty name falls back')
assert(titleFor(playerNamed('   ')) == "Survivor's Notebook", 'whitespace-only name falls back')
assert(titleFor(playerNamed(nil)) == "Survivor's Notebook", 'nil name falls back')
assert(titleFor(playerNamed(42)) == "Survivor's Notebook", 'a non-string name falls back')

local throws = strict.object('player', { getDescriptor = function() error('descriptor exploded') end })
assert(titleFor(throws) == "Survivor's Notebook", 'a throwing getter falls back rather than breaking the window')

local throwsName = strict.object('player', {
    getDescriptor = function()
        return strict.object('descriptor', { getForename = function() error('no name') end })
    end,
})
assert(titleFor(throwsName) == "Survivor's Notebook", 'a throwing forename falls back')

assert(titleFor(playerNamed('Bob\nRobert')) == "Bob Robert's Notebook", 'newlines cannot break the title bar')

local long = string.rep('A', 60)
local longTitle = titleFor(playerNamed(long))
assert(#longTitle < #long, 'an absurd name is bounded')
assert(longTitle:sub(-11) == "'s Notebook", 'a bounded name still reads as a notebook')

debugOn = true
assert(titleFor(playerNamed('Bob')) == "Bob's Notebook [TEST-VERSION]", 'debug still shows the build')
assert(titleFor(nil) == "Survivor's Notebook [TEST-VERSION]", 'debug fallback still shows the build')
debugOn = false

-- The whole point of the strict doubles: prove they would catch the call form
-- Kahlua rejects, so this test cannot quietly pass on a plain table.
local receiverEnforced = false
local p = playerNamed('Bob')
local ok = pcall(function() return p.getDescriptor() end)
receiverEnforced = not ok
assert(receiverEnforced, 'the double must reject a receiverless call, or this test proves nothing')

print('PASS notebook title: survivor forename, fallbacks for absent/empty/throwing descriptors, bounded, debug build suffix')
