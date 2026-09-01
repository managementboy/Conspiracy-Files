local PZ = {}

local function report(message)
    print(message)
end

function PZ.environment()
    return {
        isMultiplayer = function()
            if type(isMultiplayer) ~= "function" then error("isMultiplayer is unavailable") end
            return isMultiplayer()
        end,
        clock = function()
            if type(getTimeInMillis) ~= "function" then error("getTimeInMillis is unavailable") end
            return getTimeInMillis()
        end,
        storage = {
            get = function(tag) return ModData.get(tag) end,
            replace = function(tag, root) ModData.add(tag, root) end
        },
        addEvent = function(eventName, callback)
            local event = Events[eventName]
            if not event or type(event.Add) ~= "function" then error("PZ event unavailable: " .. eventName) end
            event.Add(callback)
        end,
        report = report
    }
end

return PZ
