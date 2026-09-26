local Integration=require("NHShared/LocalPersonIntegration")
NHShared=NHShared or {}
local H=NHShared.LocalPersonHooks or {}
NHShared.LocalPersonHooks=H
NHInteract=NHInteract or {};NHInteract.LocalPersonHooks=H
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
function H.installTransfer()
    if H.transferInstalled then return end
    local ok=pcall(require,"TimedActions/ISInventoryTransferAction")
    if not ok or not ISInventoryTransferAction or type(ISInventoryTransferAction.perform)~="function" then return end
    local original=ISInventoryTransferAction.perform
    ISInventoryTransferAction.perform=function(action,...)
        local item,source,destination=action.item,action.srcContainer,action.destContainer
        local result=original(action,...)
        pcall(Integration.observeTransfer,action,item,source,destination)
        return result
    end
    H.transferInstalled=true
end
if Events and not H.installed then
    if Events.OnTick then require("NHShared/Events/InteractionEvents").on("OnTick", Integration.tick) end
    if Events.OnGameStart then require("NHShared/Events/InteractionEvents").on("OnGameStart", function()
        Integration.reset()
        H.installDoor()
        H.installTransfer()
    end) end
    H.installTransfer()
    H.installed=true
end
return H
