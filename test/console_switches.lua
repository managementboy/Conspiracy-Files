-- Every diagnostic switch documented for the debug console must exist on a
-- table the console can actually reach.
--
-- On 2026-09-09 `ConspiracyFiles.LocalPersonIntegration.verboseDoors=true`
-- crashed Lua: the module was require-only and never assigned itself to the
-- ConspiracyFiles table, so the console was indexing nil. The switch had been
-- documented in the module's own header. A diagnostic nobody can turn on is
-- not a diagnostic, and this is the second time a documented console line has
-- been wrong about what exists.
local function read(path)
    local f = assert(io.open(path, 'r'), 'cannot open ' .. path)
    local s = f:read('*a')
    f:close()
    return s
end

-- switch name -> file that must both define it and expose its table globally
local SWITCHES = {
    { global = 'ConspiracyFiles.IdentityObserver',
      field  = 'verbose',
      file   = 'mod/common/media/lua/client/ConspiracyFiles/IdentityObserver.lua',
      table  = 'I' },
    { global = 'ConspiracyFiles.LocalPersonIntegration',
      field  = 'verboseDoors',
      file   = 'mod/common/media/lua/client/ConspiracyFiles/LocalPersonIntegration.lua',
      table  = 'P' },
}

for _, s in ipairs(SWITCHES) do
    local src = read(s.file)
    assert(src:find(s.table .. '.' .. s.field, 1, true),
        s.file .. ' must define ' .. s.table .. '.' .. s.field)
    assert(src:find(s.global .. '=' .. s.table, 1, true)
        or src:find(s.global .. ' = ' .. s.table, 1, true),
        s.global .. ' must be assigned, or the console cannot reach '
        .. s.field .. ' and setting it crashes on a nil index')
    -- Anything documented in a comment must be the name that actually works.
    if src:find(s.global .. '.' .. s.field, 1, true) then
        assert(src:find(s.global .. '=' .. s.table, 1, true)
            or src:find(s.global .. ' = ' .. s.table, 1, true),
            s.file .. ' documents ' .. s.global .. '.' .. s.field
            .. ' but never makes it reachable')
    end
end

print('PASS console switches: every documented debug switch is reachable from '
    .. 'the console, not just defined on a local table')

-- A diagnostic that only RETURNS a string shows nothing in the debug console,
-- which is the console it exists for. devLocations read as "does nothing"
-- during the 2026-09-10 playtest for exactly that reason.
local f = assert(io.open('mod/common/media/lua/client/ConspiracyFiles/GeneratedRuntime.lua', 'r'))
local runtime = f:read('*a'); f:close()
local body = runtime:match('function R%.devLocations%(%).-\nend')
assert(body, 'devLocations must exist')
assert(body:find('log(', 1, true), 'a console diagnostic must log its result, not only return it')

-- And placement must say WHICH document and WHERE. Six identical "Document
-- placed" lines answered nothing when the owner asked where the clues were.
assert(runtime:find('CFLog.write("i","placed",{doc=', 1, true),
    'the placement line must carry the document id and its place')
assert(not runtime:find('log("Document placed or reconciled.")', 1, true),
    'the fieldless placement line must be gone')
print('PASS console switches: diagnostics log their answers, and placement says which and where')
