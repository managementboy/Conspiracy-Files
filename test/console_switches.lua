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
