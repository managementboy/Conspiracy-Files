-- Game-time pacing, for checks/pacing.sh (catalogue AS-02, CP-07, CP-08).
-- The world clock cannot be set from Lua (nightsSurvived is a plain field),
-- so time is run fast instead, the way a player would sleep or fast-forward.
CFPace = CFPace or {}
local P = CFPace
local R = ConspiracyFiles.GeneratedRuntime

function P.speed(n)
    local c = UIManager.getSpeedControls()
    if c then c:SetCurrentGameSpeed(n) end
    return getGameSpeed and getGameSpeed() or n
end

function P.hours() return getGameTime():getWorldAgeHours() end

function P.cases()
    local s = R.automaticStatus()
    return s.count, tostring(s.lastCreatedHours)
end

-- Stand 40 tiles from every document of the case: far enough that relocation
-- is allowed (it waits while the player is within ~20), near enough that the
-- squares stay loaded.
function P.stepAway()
    local docs = CFLoop.docs()
    if #docs == 0 then return false, "no documents" end
    local d = docs[1]
    for _, off in ipairs({ { 40, 0 }, { -40, 0 }, { 0, 40 }, { 0, -40 }, { 40, 40 }, { -40, -40 } }) do
        local x, y = d.x + off[1], d.y + off[2]
        local ok = true
        for _, o in ipairs(docs) do
            if math.abs(o.x - x) < 25 and math.abs(o.y - y) < 25 then ok = false end
        end
        local sq = getCell():getGridSquare(x, y, 0)
        if ok and sq then getPlayer():teleportTo(x + 0.5, y + 0.5, 0); return true, x .. "," .. y end
    end
    return false, "no spot 25+ tiles from every document"
end
