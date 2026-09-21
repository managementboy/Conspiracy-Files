-- Escapes Lua 5.1 does not have, in text a player reads.
--
-- Written 2026-09-21 after shipping "MULDRAUGH — loading bay" into a
-- parking ticket. Lua 5.1's lexer has no \u: on an unknown escape it drops the
-- backslash and keeps the letter, so the string became "MULDRAUGH u2014
-- loading bay". It parsed, it loaded, the boot check passed and 124 of 124
-- files were fine. The only thing wrong was the sentence, and nothing in the
-- suite reads sentences.
--
-- \u is the one that bit, because it is what every other language uses for a
-- dash. The others here are the same trap: valid in Python, JSON, C# or Java,
-- silently mangled by Lua 5.1.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path

local FAMILIES = {
    "OrdinaryScenarios", "InventoryScenarios", "AdministrativeScenarios",
    "CorrespondenceScenarios", "PersonalScenarios",
}
-- The letters a backslash may legally precede in Lua 5.1: a b f n r t v,
-- a quote, a backslash, a newline, or a digit. Everything else is a mistake
-- that the lexer will not report.
local LEGAL = { a = true, b = true, f = true, n = true, r = true, t = true, v = true,
                ['"'] = true, ["'"] = true, ["\\"] = true }

local function walk(value, path, found)
    local kind = type(value)
    if kind == "string" then
        -- The SOURCE is what matters, not the loaded value: by the time the
        -- module is loaded the damage is done and the backslash is gone. So
        -- this looks for the wreckage instead - a lone "u" followed by four
        -- hex digits is what \uXXXX leaves behind.
        local mangled = value:match("%f[%w]u(%x%x%x%x)%f[%W]")
        if mangled then
            error(path .. ' reads "' .. value:sub(1, 70) .. '" - that is a \\u'
                .. mangled .. ' escape Lua 5.1 threw the backslash away from')
        end
    elseif kind == "table" then
        for key, item in pairs(value) do
            walk(item, path .. "." .. tostring(key), found)
        end
    end
end

local checked = 0
for _, name in ipairs(FAMILIES) do
    local module = require("ConspiracyFiles/Generated/" .. name)
    walk(module, name, {})
    checked = checked + 1
end

-- And the same check against the files themselves, which catches an escape in
-- a family this list has not been told about yet.
local BAD = {}
for letter in pairs({ u = true, x = true, e = true, s = true, d = true, w = true,
                      p = true, N = true, U = true }) do
    if not LEGAL[letter] then BAD[letter] = true end
end
local files, offenders = 0, {}
local listing = io.popen("ls mod/common/media/lua/shared/ConspiracyFiles/Generated/*.lua")
for path in listing:lines() do
    files = files + 1
    local handle = assert(io.open(path, "r"))
    local text = handle:read("*a"); handle:close()
    local line = 1
    for index = 1, #text do
        if text:sub(index, index) == "\n" then line = line + 1 end
        if text:sub(index, index) == "\\" then
            local next = text:sub(index + 1, index + 1)
            if BAD[next] then
                offenders[#offenders + 1] = path .. ":" .. line .. " \\" .. next
            end
        end
    end
end
listing:close()
assert(#offenders == 0,
    "escape sequences Lua 5.1 does not have: " .. table.concat(offenders, ", "))

print(string.format("PASS escape sequences: %d scenario families and %d generated files carry "
    .. "no escape Lua 5.1 would silently mangle", checked, files))
