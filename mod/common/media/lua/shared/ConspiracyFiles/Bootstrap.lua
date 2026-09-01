local Bootstrap = {}

function Bootstrap.decide(isMultiplayer)
    if type(isMultiplayer) ~= "function" then
        return { enabled = false, reason = "multiplayer-detector-unavailable" }
    end
    local ok, result = pcall(isMultiplayer)
    if not ok then
        return { enabled = false, reason = "multiplayer-detection-failed", diagnostic = tostring(result) }
    end
    if result == true then return { enabled = false, reason = "multiplayer" } end
    if result ~= false then return { enabled = false, reason = "multiplayer-detection-indeterminate" } end
    return { enabled = true, reason = "singleplayer" }
end

return Bootstrap
