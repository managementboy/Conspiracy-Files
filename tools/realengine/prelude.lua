-- Loaded before every real-engine test. Helpers only; no test logic.
-- Real objects are built through RE.* so the harness (not the test) counts that a
-- test genuinely touched the game: a test that never builds one is a pure-Lua test.
RE.paths = {}
for root in string.gmatch(RE.roots or "", "[^;]+") do RE.paths[#RE.paths + 1] = root end

local loaded = {}
function require(name)
    if loaded[name] ~= nil then return loaded[name] end
    for _, root in ipairs(RE.paths) do
        local path = root .. "/" .. name .. ".lua"
        local src = RE.readfile(path)
        if src then
            local fn = loadstring(src, "@" .. path)
            if not fn then error("could not compile " .. path) end
            local value = fn(name)
            if value == nil then value = true end
            loaded[name] = value
            return value
        end
    end
    error("module '" .. name .. "' not found in RE.paths")
end

-- Real objects, built without a loaded world.
function RE.square(x, y, z)
    RE.touch()
    return IsoGridSquare.new(nil, nil, x or 5, y or 5, z or 0)
end
function RE.visited()
    RE.touch()
    return WorldMapVisited.new()
end

-- A call the game must REJECT. Fails the test if it is accepted.
function RE.mustReject(label, fn)
    local ok, err = pcall(fn)
    if ok then error("expected the game to reject: " .. label) end
    return tostring(err)
end
