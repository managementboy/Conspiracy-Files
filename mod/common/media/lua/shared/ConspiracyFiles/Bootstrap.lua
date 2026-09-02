local Bootstrap = {}

function Bootstrap.decide(isMultiplayer, runtimeVersion)
    if type(isMultiplayer) ~= "function" then
        return { enabled = false, reason = "multiplayer-detector-unavailable" }
    end
    local ok, result = pcall(isMultiplayer)
    if not ok then
        return { enabled = false, reason = "multiplayer-detection-failed", diagnostic = tostring(result) }
    end
    if result == true then return { enabled = false, reason = "multiplayer" } end
    if result ~= false then return { enabled = false, reason = "multiplayer-detection-indeterminate" } end
    if runtimeVersion ~= nil then
        if type(runtimeVersion) ~= "function" then return { enabled = false, reason = "runtime-version-unavailable" } end
        local versionOk, version = pcall(runtimeVersion)
        if not versionOk then return { enabled = false, reason = "runtime-version-unavailable" } end
        if type(version) ~= "table" or version.major ~= 42 or version.minor ~= 20 then
            return { enabled = false, reason = "unsupported-pz-minor-line" }
        end
    end
    return { enabled = true, reason = "singleplayer" }
end

return Bootstrap
