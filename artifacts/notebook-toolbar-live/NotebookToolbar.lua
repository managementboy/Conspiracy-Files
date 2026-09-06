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
local Button=ISButton:derive("ConspiracyFilesNotebookToolbarButton")

function Button:render()
    ISButton.render(self)
    local w,h=self.width,self.height
    local inset=math.max(4,math.floor(w*0.18))
    local pageW=w-inset*2
    local pageH=h-inset*2
    -- Restrained paper notebook: dark PZ-style outline, page fold, pencil
    -- lines, and a single muted red evidence pin at native toolbar scale.
    self:drawRect(inset+2,inset-1,pageW-2,pageH-2,0.90,0.08,0.08,0.07)
    self:drawRect(inset,inset,pageW-2,pageH-2,0.95,0.73,0.69,0.56)
    self:drawRectBorder(inset,inset,pageW-2,pageH-2,0.95,0.12,0.12,0.10)
    self:drawRect(inset+3,inset+3,2,pageH-8,0.90,0.18,0.16,0.12)
    local lineX=inset+7
    for row=0,2 do
        self:drawRect(lineX,inset+7+row*5,pageW-12,1,0.75,0.20,0.19,0.16)
    end
    self:drawRect(w-inset-7,inset+3,4,4,0.95,0.45,0.12,0.09)
    self:drawRectBorder(w-inset-7,inset+3,4,4,0.95,0.22,0.07,0.06)
end

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
    if UI.reader then UI.reader:close() end
    UI.open("evidence")
end

function Toolbar.ensure()
    local sidebar=ISEquippedItem and ISEquippedItem.instance
    local search=sidebar and sidebar.searchBtn
    if not supported() or not sidebar or not search then
        if Toolbar.button then Toolbar.button:setVisible(false) end
        return false
    end
    if Toolbar.sidebar and Toolbar.sidebar~=sidebar then closeButton() end
    local button=Toolbar.button
    if not button then
        button=Button:new(0,0,search:getWidth(),search:getHeight(),"",nil,function() Toolbar.open() end)
        button:initialise(); button:instantiate()
        button:setDisplayBackground(false)
        button:ignoreWidthChange(); button:ignoreHeightChange()
        button:setTooltip("Open Survivor Notebook")
        button:addToUIManager()
        Toolbar.button=button; Toolbar.sidebar=sidebar
    end
    button:setWidth(search:getWidth()); button:setHeight(search:getHeight())
    button:setX(sidebar:getAbsoluteX()+search:getRight()+GAP)
    button:setY(sidebar:getAbsoluteY()+search:getY())
    button:setVisible(sidebar:getIsVisible() and search:getIsVisible())
    return true
end

function Toolbar.stop()
    closeButton()
end

if not Toolbar.handler then
    Toolbar.handler=function()
        if Toolbar.failed then return end
        local ok,why=pcall(Toolbar.ensure)
        if not ok then Toolbar.failed=true;closeButton();print("[CF-NOTEBOOK] Toolbar stopped: "..tostring(why)) end
    end
    Events.OnTick.Add(Toolbar.handler)
end
return Toolbar
