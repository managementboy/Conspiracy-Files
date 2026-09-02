local WindowGeometry = {}

local function clamp(value, minimum, maximum)
    if value < minimum then return minimum end
    if value > maximum then return maximum end
    return value
end

function WindowGeometry.centered(screenWidth, screenHeight, kind)
    assert(type(screenWidth) == "number" and screenWidth > 0, "screen width is required")
    assert(type(screenHeight) == "number" and screenHeight > 0, "screen height is required")
    local margin = clamp(math.floor(math.min(screenWidth, screenHeight) * 0.04), 16, 48)
    local maximumWidth = math.max(120, screenWidth - margin * 2)
    local maximumHeight = math.max(120, screenHeight - margin * 2)
    local widthRatio = kind == "reader" and 0.62 or 0.76
    local widthCap = kind == "reader" and 860 or 1040
    local widthFloor = kind == "reader" and 460 or 560
    local width = clamp(math.floor(screenWidth * widthRatio), math.min(widthFloor, maximumWidth), math.min(widthCap, maximumWidth))
    local height = clamp(math.floor(screenHeight * 0.78), math.min(380, maximumHeight), math.min(820, maximumHeight))
    return {
        x = math.floor((screenWidth - width) / 2),
        y = math.floor((screenHeight - height) / 2),
        width = width,
        height = height
    }
end

return WindowGeometry
