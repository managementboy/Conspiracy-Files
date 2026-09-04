local separator = package.config:sub(1, 1)
local source = arg and arg[0] or "test/run.lua"
local root = source:gsub("[\\/]test[\\/]run%.lua$", "")
if root == source then root = "." end
package.path = root .. separator .. "mod" .. separator .. "common" .. separator .. "media" .. separator .. "lua" .. separator .. "shared" .. separator .. "?.lua;"
    .. root .. separator .. "mod" .. separator .. "common" .. separator .. "media" .. separator .. "lua" .. separator .. "shared" .. separator .. "?" .. separator .. "init.lua;"
    .. package.path

local tests = {}
local failures = 0

function test(name, body)
    tests[#tests + 1] = { name = name, body = body }
end

function assertTrue(value, message)
    if not value then error(message or "expected true", 2) end
end

function assertFalse(value, message)
    if value then error(message or "expected false", 2) end
end

function assertEqual(expected, actual, message)
    if expected ~= actual then
        error((message or "values differ") .. ": expected " .. tostring(expected) .. ", got " .. tostring(actual), 2)
    end
end

local function deepEqual(left, right, seen)
    if type(left) ~= type(right) then return false end
    if type(left) ~= "table" then return left == right end
    seen = seen or {}
    if seen[left] then return seen[left] == right end
    seen[left] = right
    for key, value in pairs(left) do if not deepEqual(value, right[key], seen) then return false end end
    for key, _ in pairs(right) do if left[key] == nil then return false end end
    return true
end

function assertDeepEqual(expected, actual, message)
    if not deepEqual(expected, actual) then error(message or "tables differ", 2) end
end

dofile(root .. separator .. "test" .. separator .. "domain_core_spec.lua")
dofile(root .. separator .. "test" .. separator .. "placement_spec.lua")

test("traceability matrix covers every plain-Lua acceptance criterion exactly once", function()
    local expected = {
        "CF-V01-P04", "CF-V01-P06", "CF-V01-P07", "CF-V01-P08",
        "CF-V01-P09", "CF-V01-P10", "CF-V01-P11", "CF-V01-P12",
        "CF-V01-P14", "CF-V01-P15", "CF-V01-P16", "CF-V01-P17",
        "CF-V01-P18", "CF-V01-P19", "CF-V01-P24", "CF-V01-P25"
    }
    local requirementsFile = assert(io.open(root .. separator .. "docs" .. separator .. "requirements" .. separator .. "V0_1_ACCEPTANCE_CRITERIA.md", "rb"))
    local requirements = requirementsFile:read("*a")
    requirementsFile:close()
    local classified = {}
    for criterion in string.gmatch(requirements, "|%s*(CF%-V01%-P%d+)%s*|[^\n]-|%s*plain%-Lua automated test%s*|") do
        classified[criterion] = true
    end
    local traceFile = assert(io.open(root .. separator .. "docs" .. separator .. "testing" .. separator .. "V0_1_DOMAIN_CORE_TRACEABILITY.md", "rb"))
    local trace = traceFile:read("*a")
    traceFile:close()
    local expectedSet = {}
    for _, criterion in ipairs(expected) do
        expectedSet[criterion] = true
        assertTrue(classified[criterion], "acceptance source no longer classifies " .. criterion .. " as plain-Lua")
        assertTrue(string.find(trace, "| " .. criterion .. " |", 1, true) ~= nil, "traceability row missing " .. criterion)
        local namedTests = 0
        for _, candidate in ipairs(tests) do
            if string.sub(candidate.name, 1, string.len(criterion)) == criterion then namedTests = namedTests + 1 end
        end
        assertEqual(1, namedTests, "criterion must map to one named automated test")
    end
    for criterion, _ in pairs(classified) do assertTrue(expectedSet[criterion], "new plain-Lua criterion lacks an explicit traceability decision: " .. criterion) end
end)

for _, candidate in ipairs(tests) do
    local ok, message = pcall(candidate.body)
    if ok then
        print("PASS " .. candidate.name)
    else
        failures = failures + 1
        print("FAIL " .. candidate.name .. "\n  " .. tostring(message))
    end
end

print(string.format("%d tests, %d failures", #tests, failures))
if failures > 0 then os.exit(1) end
