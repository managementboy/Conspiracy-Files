local Integration=require("ConspiracyFiles/LocalPersonIntegration")
ConspiracyFiles=ConspiracyFiles or {}
local H=ConspiracyFiles.LocalPersonHooks or {}
ConspiracyFiles.LocalPersonHooks=H
function H.installDoor()
    if H.doorInstalled then return end
    local ok=pcall(require,"TimedActions/ISOpenCloseDoor")
    if not ok or not ISOpenCloseDoor or type(ISOpenCloseDoor.complete)~="function" then return end
    local original=ISOpenCloseDoor.complete
    ISOpenCloseDoor.complete=function(action,...)
        local result=original(action,...)
        if result==true then pcall(Integration.observeDoor,action) end
        return result
    end
    H.doorInstalled=true
    local lockLoaded=pcall(require,"TimedActions/ISLockDoor")
    if lockLoaded and ISLockDoor and type(ISLockDoor.complete)=="function" then
        local originalLock=ISLockDoor.complete
        ISLockDoor.complete=function(action,...)
            local result=originalLock(action,...)
            if result==true then
                pcall(Integration.observeDoor,{character=action.character,item=action.door})
            end
            return result
        end
    end
end
if Events and not H.installed then
    if Events.OnTick then Events.OnTick.Add(Integration.tick) end
    if Events.OnGameStart then Events.OnGameStart.Add(function()
        Integration.reset()
        H.installDoor()
    end) end
    H.installed=true
end
return H
