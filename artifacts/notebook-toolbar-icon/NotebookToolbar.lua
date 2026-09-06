-- Additive sidebar shortcut.  It deliberately does not patch ISEquippedItem:
-- Build 42 exposes no sidebar-button event, so this follows the existing
-- Project Cook pattern of a separately managed sibling beside the anchor.
require "ISUI/ISButton"
local UI=require("ConspiracyFiles/Notebook")
ConspiracyFiles=ConspiracyFiles or {}
local Toolbar=ConspiracyFiles.NotebookToolbar or {}
ConspiracyFiles.NotebookToolbar=Toolbar

Toolbar.failed=false
local GAP=4
local HOVER_GRACE_MS=250
local TOOLBAR_VERSION=2
local NOTEBOOK_TEXTURE="media/ui/ConspiracyFiles/notebook.png"

local function supported()
    if not (getDebug and getDebug()) then return false end
    if (isClient and isClient()) or (isServer and isServer()) then return false end
    if ConspiracyFiles.T11Mode or ConspiracyFiles.T12Mode then return false end
    local runtime=ConspiracyFiles.GeneratedRuntime
    return runtime and runtime.metrics and runtime.metrics() ~= nil
end

local function closeButton()
    local button=Toolbar.button
    if button and button.removeFromUIManager then button:removeFromUIManager() end
    Toolbar.button=nil
    Toolbar.sidebar=nil
end

function Toolbar.open()
    if not supported() then return end
    if UI.notebook and UI.notebook:getIsVisible() then
        UI.notebook:close()
        return
    end
    if UI.reader then UI.reader:close() end
    UI.open("evidence")
end

function Toolbar.refresh()
    if Toolbar.failed then return end
    local ok,why=pcall(Toolbar.ensure)
    if not ok then Toolbar.failed=true;closeButton();print("[CF-NOTEBOOK] Toolbar stopped: "..tostring(why)) end
end

function Toolbar.ensure()
    local sidebar=ISEquippedItem and ISEquippedItem.instance
    local search=sidebar and sidebar.searchBtn
    if not supported() or not sidebar or not search then
        if Toolbar.button then Toolbar.button:setVisible(false) end
        Toolbar.revealed=false
        return false
    end
    if Toolbar.sidebar and Toolbar.sidebar~=sidebar then closeButton() end
    local button=Toolbar.button
    if button and button.cfNotebookToolbarVersion~=TOOLBAR_VERSION then
        closeButton(); button=nil
    end
    if not button then
        button=ISButton:new(0,0,search:getWidth(),search:getHeight(),"",nil,function() Toolbar.open() end)
        button:initialise(); button:instantiate()
        button:setDisplayBackground(false)
        button:ignoreWidthChange(); button:ignoreHeightChange()
        button:setImage(getTexture(NOTEBOOK_TEXTURE))
        button:setTooltip("Open Survivor Notebook")
        button:addToUIManager()
        button.cfNotebookToolbarVersion=TOOLBAR_VERSION
        Toolbar.button=button; Toolbar.sidebar=sidebar
    end
    button:setWidth(search:getWidth()); button:setHeight(search:getHeight())
    button:setX(sidebar:getAbsoluteX()+search:getRight()+GAP)
    button:setY(sidebar:getAbsoluteY()+search:getY())
    if not sidebar:getIsVisible() or not search:getIsVisible() then
        Toolbar.revealed=false
        button:setVisible(false)
        return true
    end
    local now=getTimestampMs and getTimestampMs() or 0
    local bridge=false
    if Toolbar.revealed and getMouseX and getMouseY then
        local mouseX,mouseY=getMouseX(),getMouseY()
        bridge=mouseX>=sidebar:getAbsoluteX()+search:getRight()
            and mouseX<=button.x and mouseY>=button.y and mouseY<=button.y+button.height
    end
    if search:isMouseOver() then
        Toolbar.revealed=true; Toolbar.hoverUntil=now+HOVER_GRACE_MS
    elseif Toolbar.revealed and (button:isMouseOver() or bridge) then
        Toolbar.hoverUntil=now+HOVER_GRACE_MS
    elseif Toolbar.revealed and now>(Toolbar.hoverUntil or 0) then
        Toolbar.revealed=false
    end
    button:setVisible(Toolbar.revealed==true)
    return true
end

function Toolbar.stop()
    closeButton()
end

if Toolbar.handler and Toolbar.event~="post-ui" then
    if Events.OnTick and Events.OnTick.Remove then Events.OnTick.Remove(Toolbar.handler) end
    Toolbar.handler=nil
end
if not Toolbar.handler then
    Toolbar.handler=function() Toolbar.refresh() end
    Events.OnPostUIDraw.Add(Toolbar.handler)
    Toolbar.event="post-ui"
end
return Toolbar
