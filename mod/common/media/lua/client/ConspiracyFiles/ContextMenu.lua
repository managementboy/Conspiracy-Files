local Content=require("ConspiracyFiles/Content")
local UI=require("ConspiracyFiles/Notebook")
ConspiracyFiles=ConspiracyFiles or {}
ConspiracyFiles.ContextMenu=ConspiracyFiles.ContextMenu or {}
local Menu=ConspiracyFiles.ContextMenu
local function runtime() return ConspiracyFiles.Runtime end
local function isItem(value)
    if not value or not instanceof then return false end
    local ok,yes=pcall(instanceof,value,"InventoryItem"); return ok and yes
end
function Menu.normalize(items)
    local out,seen,overflow={}, {},false
    local function add(item)
        if isItem(item) and not seen[item] then
            if #out>=64 then overflow=true; return end
            seen[item]=true; out[#out+1]=item
        end
    end
    for index,value in ipairs(items or {}) do
        if index>64 then overflow=true; break end
        if isItem(value) then add(value)
        elseif type(value)=="table" and type(value.items)=="table" then
            for i=2,math.min(#value.items,65) do add(value.items[i]) end
            if #value.items>65 then overflow=true end
        end
    end
    return out,overflow
end
local function owned(item,playerNum)
    local player=getSpecificPlayer(playerNum)
    return player and item:getOutermostContainer()==player:getInventory()
end
function Menu.subject(item)
    local rt=runtime()
    if not rt or rt.disabled or not rt.state or not isItem(item) then return nil end
    local md=item:getModData()
    if type(md)~="table" or not md.cfAssetId then return nil end
    local asset=Content.assets[md.cfAssetId]
    local assignment=asset and rt.assignment(md.cfAssetId)
    if not asset or md.cfSchema~=2 or md.cfAssetKind~=asset.assetKind or not assignment
        or md.cfPhysicalToken~=assignment.physicalToken or assignment.status~="placed"
        or assignment.availability=="conflict" or assignment.availability=="unavailable" then return nil end
    return asset,assignment
end
local function activate(mark,playerNum,item,expectedToken,expectedContainer)
    local rt=runtime(); if not rt then return end
    rt.boundary(mark and "mark" or "inspect",function()
        local asset,assignment=Menu.subject(item)
        if not asset or assignment.physicalToken~=expectedToken then return end
        if item:getOutermostContainer()~=expectedContainer then return end
        if mark and (not owned(item,playerNum) or rt.isMarked(asset.assetId)) then return end
        local ok,id,changed
        if mark then ok,id,changed=rt.mark(asset.assetId,"Marked "..asset.displayName.." as worth remembering",assignment.locationId)
        else ok,id,changed=rt.inspect(asset.assetId,"Inspected "..asset.displayName,assignment.locationId) end
        if not ok then error(id) end
        local known=rt.state.resolveEvidence(id); if not known then return end
        UI.refresh("evidence",id)
        if not mark then UI.openReader(known.displayName,known.bodyText,asset.contextText) end
        print("[CF-DEAD-AIR]|MANUAL_ACTION|action="..(mark and "mark" or "inspect").."|asset="..asset.assetId.."|changed="..tostring(changed))
    end)
end
local function add(context,key,label,callback,disabled)
    for _,option in ipairs(context.options or {}) do if option.cfDeadAirAction==key then return option end end
    local option=context:addOption(label,nil,callback)
    if option then option.cfDeadAirAction=key; option.notAvailable=disabled==true end
    return option
end
function Menu.fill(playerNum,context,items)
    local rt=runtime(); if not rt or rt.disabled or not context then return end
    add(context,"ConspiracyFiles:OpenNotebook","Open Survivor Notebook",function() UI.open() end)
    local subjects,overflow=Menu.normalize(items)
    local valid={}
    for _,item in ipairs(subjects) do local asset,a=Menu.subject(item); if asset then valid[#valid+1]={item=item,asset=asset,assignment=a} end end
    if overflow or #valid>1 then
        for i=1,#valid do for j=i+1,#valid do
            if valid[i].assignment.physicalToken==valid[j].assignment.physicalToken then rt.conflict(valid[i].asset.assetId) end
        end end
        add(context,"ConspiracyFiles:Inspect","Inspect Document (select one item)",nil,true); return
    end
    if #valid==0 then
        if #subjects~=1 then return end
        local item=subjects[1]; local md=item:getModData()
        if md.cfAssetId or not owned(item,playerNum) then return end
        add(context,"ConspiracyFiles:MarkInteresting","Mark Interesting",function()
            rt.boundary("mark",function()
                if not owned(item,playerNum) then return end
                local current=item:getModData(); if current.cfAssetId then return end
                if current.cfMarkIntent and rt.hasMarkIntent(current.cfMarkIntent) then return end
                local intent=current.cfMarkIntent or rt.newMarkIntent()
                if type(intent)~="string" or #intent>200 then return end
                current.cfMarkIntent=intent
                local ok,id=rt.markGeneric(intent,tostring(item:getName())); if not ok then error(id) end
                UI.refresh("evidence",id)
            end)
        end,md.cfMarkIntent and rt.hasMarkIntent(md.cfMarkIntent))
        return
    end
    local selected=valid[1]
    local mark=selected.asset.assetKind=="ordinary-object"
    local expectedContainer=selected.item:getOutermostContainer()
    local disabled=mark and (not owned(selected.item,playerNum) or rt.isMarked(selected.asset.assetId))
    add(context,mark and "ConspiracyFiles:MarkInteresting" or "ConspiracyFiles:Inspect",mark and "Mark Interesting" or "Inspect Document",
        function() activate(mark,playerNum,selected.item,selected.assignment.physicalToken,expectedContainer) end,disabled)
end
-- One stable forwarding callback survives repeated module loads without removing
-- vanilla/foreign listeners or retaining stale implementations.
if not Menu.handler then
    Menu.handler=function(...)
        local args={...}; local rt=runtime()
        if rt then rt.boundary("menu",function() Menu.fill(args[1],args[2],args[3]) end) end
    end
    Events.OnFillInventoryObjectContextMenu.Add(Menu.handler)
end
return Menu
