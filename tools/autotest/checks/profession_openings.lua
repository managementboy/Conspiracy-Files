-- Profession opening families, in a real game. Loaded by
-- checks/profession_openings.sh.
--
-- Written for EVERY profession, not for the first one. The Fitness Instructor
-- is simply the family that exists today; as others are authored, the list
-- below comes from Premises and the engine constant is derived from the id, so
-- nothing here needs editing to cover them.
CFProf = CFProf or {}
local P = CFProf
local R = ConspiracyFiles.GeneratedRuntime
local Premises = require("ConspiracyFiles/Generated/Premises")

-- Which professions the MOD claims an opening family for. Asked of Premises,
-- so a newly authored family is picked up without touching this file.
function P.families()
    local out = {}
    -- M.list() returns IDS, not entries, so each needs a get(). Reading it as
    -- entries silently found zero families and would have reported "no
    -- profession has an opening family" about a build that has one.
    for _, id in ipairs(Premises.list() or {}) do
        local e = Premises.get(id)
        if e and e.profession then
            out[#out + 1] = e.profession .. ":" .. e.id .. ":"
                .. tostring(Premises.openingVariants(e.id))
        end
    end
    return table.concat(out, " ")
end

-- The engine's constant for a profession id: "fitnessinstructor" is
-- CharacterProfession.FITNESS_INSTRUCTOR. Derived rather than tabulated, so a
-- new profession needs no entry here - and if the derivation ever fails for
-- one, the caller is told which rather than silently testing the wrong
-- character.
local KNOWN = {
    fitnessinstructor = "FITNESS_INSTRUCTOR",
}
function P.constantFor(profession)
    if KNOWN[profession] then return KNOWN[profession] end
    -- Try the obvious shapes before giving up: upper case, and upper snake.
    local guesses = { string.upper(profession) }
    for k in pairs(CharacterProfession or {}) do
        if type(k) == "string" and string.lower((k:gsub("_", ""))) == profession then
            guesses[#guesses + 1] = k
        end
    end
    for _, g in ipairs(guesses) do
        if CharacterProfession and CharacterProfession[g] then return g end
    end
    return nil
end

-- Make the survivor that profession. Returns what the descriptor reports
-- afterwards, so the caller asserts on the ENGINE's answer rather than on the
-- fact that a setter was called.
function P.become(profession)
    local key = P.constantFor(profession)
    if not key then return "false", "no CharacterProfession constant for " .. tostring(profession) end
    local d = getPlayer():getDescriptor()
    local ok, err = pcall(function() d:setCharacterProfession(CharacterProfession[key]) end)
    if not ok then return "false", tostring(err) end
    local now = d:getCharacterProfession()
    return "true", tostring(now and now:getName() or "none"), key
end

-- Throw away any generated state and ask for a first case, so the case is
-- built with the profession now in place. This is the shipped path:
-- Trial.start is what AutomaticInvestigations calls.
function P.freshFirstCase()
    local w = ModData.getOrCreate("ConspiracyFiles.Generated.G2")
    for k in pairs(w) do w[k] = nil end
    local ok, why = require("ConspiracyFiles/Trial").start(nil, { firstHouse = true })
    return tostring(ok == true), tostring(why)
end

-- What the first case turned out to be, and whether its opening clue is on
-- the player. Everything a caller needs, in one answer.
function P.result()
    local w = ModData.get("ConspiracyFiles.Generated.G2")
    local root = w and w.canonical
    if not root or not root.case then
        local s = R.automaticStatus() or {}
        return "waiting", tostring(s.preparing), tostring(s.why or "")
    end
    local c = root.case
    local o = c.opening or {}
    local first = c.documents and c.documents[1]
    -- IS THE CLUE ACTUALLY ON THE PLAYER? Asked of the inventory, not of the
    -- assignment's status: "delivered" in the record and "in the survivor's
    -- bag" are different claims, and only the second is what the player sees.
    local onPlayer, where = false, "not in inventory"
    if first then
        local inv = getPlayer():getInventory():getItems()
        for i = 0, inv:size() - 1 do
            local md = inv:get(i):getModData()
            if md and md.cfGeneratedId == first.id then onPlayer = true; where = "player inventory" end
        end
    end
    local a = root.assignments and first and root.assignments[first.id]
    return "ready", tostring(o.variant), tostring(o.profession), tostring(o.premise),
        tostring(first and first.title), tostring(onPlayer), tostring(a and a.status or "none"), where
end
return true
