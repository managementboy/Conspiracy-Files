-- Cooperative native-reader hooks. No acquisition/reveal trigger, no stash calls.
local CFLog=require("ConspiracyFiles/Log")
ConspiracyFiles=ConspiracyFiles or {}
local H=ConspiracyFiles.MapMediaRead or {}
ConspiracyFiles.MapMediaRead=H
local function pack(...) return {n=select("#",...),...} end
local function allowed()
    return not (isClient and isClient()) and not (isServer and isServer())
end
local function report(why) CFLog.message("mapread","note","read hook: "..tostring(why)) end
function H.stop()
    H.active=false; H.frame=nil
    for i=#(H.hooks or {}),1,-1 do
        local h=H.hooks[i]; h.enabled=false
        if h.target[h.key]==h.wrapper then h.target[h.key]=h.own end
    end
    H.hooks={}
end
local function wrap(target,key,before,after)
    local original=target and target[key]
    assert(type(original)=="function","missing native Lua reader: "..key)
    local h={target=target,key=key,own=rawget(target,key),enabled=true}
    h.wrapper=function(...)
        if not H.active or not h.enabled or not allowed() then return original(...) end
        local ok,context=true,nil
        if before then ok,context=pcall(before,...) end
        if not ok then report(context); context=nil end
        local result=pack(pcall(original,...))
        if after then
            local done,why=pcall(after,context,result[1],...)
            if not done then report(why) end
        end
        if not result[1] then error(result[2],0) end
        return unpack(result,2,result.n)
    end
    H.hooks[#H.hooks+1]=h; target[key]=h.wrapper
end
function H.start(onMap,onPrint)
    if not allowed() then return false,"single-player only" end
    if H.active then return true end
    H.hooks={}
    local ok,why=pcall(function()
        require "ISUI/ISInventoryPaneContextMenu"
        require "ISUI/Maps/ISMap"
        require "TimedActions/ISReadABook"
        wrap(ISInventoryPaneContextMenu,"onCheckMap",function(item,playerNum)
            -- Capture before vanilla consumes/changes stash metadata.
            local design=item:getStashMap()
            local frame={item=item,player=playerNum,design=design,parent=H.frame}
            H.frame=frame; return frame
        end,function(frame,nativeOK)
            if not frame then return end
            H.frame=frame.parent
            if nativeOK and frame.attached and frame.player==0 and type(frame.design)=="string" then
                onMap(frame.design,frame.item)
            end
        end)
        wrap(ISMapWrapper,"addToUIManager",nil,function(_,nativeOK,window)
            local f=H.frame; local ui=window and window.mapUI
            if nativeOK and f and ui and ui.mapObj==f.item and ui.playerNum==f.player then f.attached=true end
        end)
        -- Vanilla displayPrintMedia creates and opens the physical print reader.
        -- Reveal-on-map and the read flag alone are deliberately not used.
        wrap(ISReadABook,"displayPrintMedia",nil,function(_,nativeOK,action)
            if not nativeOK or not action.character or action.character:getPlayerNum()~=0 then return end
            local media=action.item:getModData().printMedia
            local id=type(media)=="table" and media.id or media
            if type(id)=="string" then onPrint(id) end
        end)
        H.active=true
    end)
    if not ok then H.stop(); report(why); return false,why end
    return true
end
return H
