-- Pin a mock to the interface it impersonates.
--
-- WHY THIS EXISTS. test/notebook_toolbar.lua stubbed the notebook module with
-- {notebook=..., open=function(section) ... end} and asserted hard on that
-- stub's behaviour. Meanwhile the real module's entry point had become
-- UI.openSurface(section, preferred). The stub went on satisfying the test
-- while the code under test called a function that did not exist on it, so a
-- green suite and a nil call could coexist - and did, for as long as anyone
-- had been running it.
--
-- A mock is a claim about a real interface. This module makes the claim
-- checkable from BOTH ends:
--
--   * the real module must still define every name the mock models, so a
--     rename in production fails the test instead of silently diverging;
--   * the mock must provide every name, so a mock cannot be thinner than the
--     thing it replaces.
--
-- It reads the real file rather than loading it: these are client modules that
-- need the game (ISPanel, getCore) to load at all, which is the reason mocks
-- exist here in the first place.
local C = {}

local function read(path)
    local f = assert(io.open(path, "r"), "contract: cannot read " .. path)
    local s = f:read("*a"); f:close(); return s
end

-- Does `src` define a function reachable as <something>.name or <something>:name,
-- or assign a function to a field of that name? Covers the three shapes this
-- codebase actually uses.
function C.defines(src, name)
    local n = name:gsub("(%W)", "%%%1")
    return src:find("function%s+[%w_]+[.:]" .. n .. "%s*%(") ~= nil
        or src:find("[%w_]+%.\ ?" .. n .. "%s*=%s*function") ~= nil
        or src:find("%f[%w_]" .. n .. "%s*=%s*function") ~= nil
end

-- Assert that `realPath` defines each name AND that `stub` implements each one.
-- Returns the stub, so it reads naturally at the call site.
function C.pin(stub, realPath, names)
    assert(type(stub) == "table", "contract.pin: stub must be a table")
    local src = read(realPath)
    local gone, unimplemented = {}, {}
    for _, name in ipairs(names) do
        if not C.defines(src, name) then gone[#gone + 1] = name end
        if type(stub[name]) ~= "function" then unimplemented[#unimplemented + 1] = name end
    end
    assert(#gone == 0, realPath .. " no longer defines " .. table.concat(gone, ", ")
        .. " - this mock is modelling an interface that has moved; update both.")
    assert(#unimplemented == 0, "this mock does not implement "
        .. table.concat(unimplemented, ", ")
        .. " which the code under test calls - a mock thinner than the real"
        .. " module hides exactly the nil call it is supposed to catch.")
    return stub
end

-- Every name the module under test actually CALLS on a dependency, found in
-- its source. Use it to discover what a mock has to provide rather than
-- guessing, e.g. contract.callsOn(path, "UI").
function C.callsOn(path, holder)
    local src, seen, out = read(path), {}, {}
    for name in src:gmatch("%f[%w_]" .. holder .. "%.([%w_]+)%s*%(") do
        if not seen[name] then seen[name] = true; out[#out + 1] = name end
    end
    table.sort(out)
    return out
end

return C
