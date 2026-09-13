-- A local declared after its use is a nil GLOBAL, and the game only finds out
-- when that line runs.
--
-- test/log_format.lua enforces this for one name, CFLog, because a module once
-- used the logger above its own require. The rule is general and the cost of
-- breaking it is severe: on 2026-09-13 a helper was added to Organiser.lua
-- below the two functions that call it, so O.held resolved it as a global,
-- found nil, and threw "Object tried to call nil in held" - which stopped the
-- organiser being found OR issued at all. Every offline test passed. Only a
-- real game said so, six minutes later.
--
-- This catches it in a second, offline. It is deliberately conservative: it
-- only looks at `local function NAME(...)` declarations, only counts calls
-- written as NAME(, ignores comments and strings, and accepts a forward
-- declaration, because those are the shapes this codebase actually uses.
local function read(path)
    local f = assert(io.open(path, "r"), "cannot read " .. path)
    local s = f:read("*a"); f:close(); return s
end

local function lines(path)
    local out = {}
    for line in read(path):gmatch("([^\n]*)\n?") do out[#out + 1] = line end
    return out
end

-- Comments and string bodies removed, so a name mentioned in prose or a
-- message does not read as a call.
local function code(line)
    line = line:gsub("%-%-.*$", "")
    line = line:gsub('"[^"]*"', '""'):gsub("'[^']*'", "''")
    return line
end

local dirs = {"mod/common/media/lua/client/ConspiracyFiles/",
              "mod/common/media/lua/shared/ConspiracyFiles/"}
local problems, checked, declarations = {}, 0, 0

for _, dir in ipairs(dirs) do
    local listing = io.popen("ls " .. dir .. "*.lua 2>/dev/null")
    for path in listing:lines() do
        checked = checked + 1
        local src = lines(path)
        local declaredAt, forwardAt = {}, {}
        for n, raw in ipairs(src) do
            local line = code(raw)
            local name = line:match("^%s*local%s+function%s+([%w_]+)%s*%(")
            if name and not declaredAt[name] then declaredAt[name] = n end
            -- `local NAME` on its own, or `local NAME, OTHER` - a forward
            -- declaration means the local exists from that point.
            for fwd in line:gmatch("^%s*local%s+([%w_,%s]+)$") do
                for one in fwd:gmatch("[%w_]+") do
                    if not forwardAt[one] then forwardAt[one] = n end
                end
            end
        end
        for name, decl in pairs(declaredAt) do
            declarations = declarations + 1
            local firstUse
            for n, raw in ipairs(src) do
                if n ~= decl then
                    local line = code(raw)
                    -- Not preceded by . or : - Journal.observe(fact) is a
                    -- method call on a table, not a reference to a local of
                    -- the same name, and a word frontier alone matches it.
                    if (" " .. line):find("[^%w_.:]" .. name .. "%s*%(")
                       and not line:match("^%s*local%s+function%s+" .. name) then
                        firstUse = n; break
                    end
                end
            end
            if firstUse and firstUse < decl
               and not (forwardAt[name] and forwardAt[name] < firstUse) then
                problems[#problems + 1] = string.format(
                    "%s: %s is called at line %d but declared local at line %d",
                    path, name, firstUse, decl)
            end
        end
    end
    listing:close()
end

assert(checked > 50, "expected to scan the whole mod, scanned " .. checked .. " files")
assert(#problems == 0,
    "these resolve as nil globals until their declaration runs:\n  "
    .. table.concat(problems, "\n  "))

print("PASS local before use: " .. declarations .. " local functions across "
      .. checked .. " modules, none called above its own declaration")
