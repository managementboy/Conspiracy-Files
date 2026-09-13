-- Reproduces the owner's crash, 2026-09-13: the game died while the four
-- program keys were being pressed with the device in hand and the address
-- index still building. The log ended on "knox key MODE" with no Lua stack
-- trace, which means it was not a caught script error.
CFKey = CFKey or {}
local O = ConspiracyFiles.Organiser
local S = ConspiracyFiles.OrganiserScreen

function CFKey.openHeld()
    local player = getPlayer()
    local item = O.held(player)
    if not item then return false, "no organiser" end
    player:setPrimaryHandItem(item)
    local w = S.open()
    if not w then return false, "no screen" end
    w.booting = false
    w.on = true
    return true, tostring(w.on)
end

-- One press, and then the render that follows it - which is where a crash
-- during drawing would actually land, not in the press itself.
function CFKey.press(id)
    local w = S.window; if not w then return false, "no screen" end
    w.on = true; w:touch()
    local ok, why = pcall(function() w:press(id) end)
    if not ok then return false, "press: " .. tostring(why) end
    local ok2, why2 = pcall(function() w:render() end)
    if not ok2 then return false, "render: " .. tostring(why2) end
    local program = w:program()
    return true, tostring(program and program.title), tostring(w.app or 1)
end

-- The whole cycle the owner pressed, several times over.
function CFKey.cycle(times)
    local order = { "MODE", "PREV", "NEXT", "INDEX" }
    for _ = 1, tonumber(times) do
        for _, id in ipairs(order) do
            local ok, a, b = CFKey.press(id)
            if not ok then return false, id .. " -> " .. tostring(a) end
        end
    end
    return true, "survived"
end

function CFKey.addressStatus()
    local A = ConspiracyFiles.AddressMap
    if not A then return false, "no address map" end
    local ready = A.ready and A.ready()
    return true, tostring(ready), tostring(A.status and A.status() or "?")
end

-- Every program's list, drawn, which is the part a partly-built address book
-- would break.
function CFKey.listAll()
    local w = S.window; if not w then return false, "no screen" end
    local out = {}
    local programs = w:programs()
    for i, p in ipairs(programs) do
        w.app = i; w.record = nil; w.launcher = false
        w.entry, w.card, w.cachedList = 1, 1, nil
        local ok, why = pcall(function() return #w:list() end)
        local ok2, why2 = pcall(function() w:render() end)
        out[#out + 1] = tostring(p.id) .. "=" ..
            (ok and "list-ok" or "LIST-FAIL:" .. tostring(why)) .. "/" ..
            (ok2 and "draw-ok" or "DRAW-FAIL:" .. tostring(why2))
    end
    return true, table.concat(out, " ")
end
