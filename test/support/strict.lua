-- Engine doubles that behave like Kahlua.
--
-- PZ's Kahlua refuses a Java method invoked without a receiver. A plain Lua
-- table does not: it happily accepts both obj:method() and obj.method().
-- That difference is why three call-form defects shipped on 2026-09-07 while
-- the suite stayed green -- see AGENTS.md, "Engine call form".
--
--   local strict = dofile("test/support/strict.lua")
--   local square = strict.object("square", { HasStairs = function() return true end })
--   square:HasStairs()   -- fine
--   square.HasStairs()   -- error: HasStairs needs a receiver
--
-- Use this for anything standing in for an engine object. Do not use it for
-- doubles of our own plain-Lua modules, where the extracted form is legitimate.
local strict = {}

function strict.object(name, methods)
    local target = {}
    for key, value in pairs(methods) do
        if type(value) == "function" then
            target[key] = function(self, ...)
                if self ~= target then
                    error(name .. ":" .. key .. " needs a receiver; Kahlua refuses "
                        .. name .. "." .. key .. "(). See AGENTS.md.", 2)
                end
                return value(self, ...)
            end
        else
            target[key] = value
        end
    end
    return target
end

-- Convenience for the common shape: methods that ignore self and return a value.
function strict.returning(name, values)
    local methods = {}
    for key, value in pairs(values) do
        methods[key] = function() return value end
    end
    return strict.object(name, methods)
end

return strict
