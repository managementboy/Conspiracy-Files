-- Mock-only sidebar composition check. Native placement/hover remains manual.
package.path="mod/common/media/lua/client/?.lua;"..package.path
local added,removed=0,0
local events={}
Events={OnTick={Add=function(handler) events.tick=handler end,Remove=function() removed=removed+1 end},
    OnPostUIDraw={Add=function(handler) events.draw=handler;added=added+1 end}}
local Base={}
function Base:derive() local class={}; class.__index=class; return setmetatable(class,{__index=self}) end
function Base:new(x,y,w,h,title,target,click) return setmetatable({x=x,y=y,width=w,height=h,title=title,target=target,onclick=click,visible=true},{__index=self}) end
for _,name in ipairs({"initialise","instantiate","ignoreWidthChange","ignoreHeightChange","setDisplayBackground","addToUIManager","removeFromUIManager","drawRect","drawRectBorder","render"}) do Base[name]=function(self) if name=="removeFromUIManager" then self.removed=true end end end
for _,field in ipairs({"X","Y","Width","Height"}) do local key=field:lower(); Base["set"..field]=function(self,value) self[key]=value end; Base["get"..field]=function(self) return self[key] end end
function Base:getRight() return self.x+self.width end
function Base:setVisible(value) self.visible=value end
function Base:getIsVisible() return self.visible end
function Base:isMouseOver() return self.mouseOver==true end
function Base:setTooltip(text) self.tooltip=text end
function Base:setImage(image) self.image=image end
ISButton=Base:derive()
package.preload["ISUI/ISButton"]=function() return ISButton end
local opened=0
local notebook={visible=false,getIsVisible=function(self) return self.visible end,close=function(self) self.visible=false end}
package.preload["ConspiracyFiles/Notebook"]=function()
    return {notebook=notebook,open=function(section) opened=opened+1; assert(section=="evidence"); notebook.visible=true end}
end
ConspiracyFiles={GeneratedRuntime={metrics=function() return {} end}}
getDebug=function() return true end; isClient=function() return false end; isServer=function() return false end
local requestedTexture
getTexture=function(path) requestedTexture=path; return {getWidthOrig=function() return 128 end,getHeightOrig=function() return 128 end} end
local now,mouseX,mouseY=0,0,0
getTimestampMs=function() return now end; getMouseX=function() return mouseX end; getMouseY=function() return mouseY end
local function sidebar(x,y,searchX,searchY,w,h)
    local search=Base:new(searchX,searchY,w,h,"",nil,nil)
    return {searchBtn=search,prerender=function(self) self.prerendered=(self.prerendered or 0)+1 end,
        getAbsoluteX=function() return x end,getAbsoluteY=function() return y end,getIsVisible=function() return true end}
end
ISEquippedItem={instance=sidebar(10,20,0,100,52,52)}
local toolbar=require("ConspiracyFiles/NotebookToolbar")
events.draw()
assert(toolbar.button and not toolbar.button.visible,"toolbar is hidden at rest")
ISEquippedItem.instance.searchBtn.mouseOver=true;events.draw()
assert(toolbar.button.x==66 and toolbar.button.y==120 and toolbar.button.visible)
assert(requestedTexture=="media/ui/ConspiracyFiles/notebook.png" and toolbar.button.image,"provided notebook texture is attached")
assert(not ISEquippedItem.instance.cfNotebookToolbarPrerender,"UI draw lifecycle does not patch sidebar prerender")
assert(toolbar.button.tooltip=="Open Survivor Notebook")
local first=toolbar.button; first.onclick(); assert(opened==1 and notebook.visible)
first.onclick(); assert(not notebook.visible,"second click closes the visible notebook")
first.onclick(); assert(opened==2 and notebook.visible,"third click reopens the notebook")
ISEquippedItem.instance.searchBtn.mouseOver=false;now=100;mouseX=64;mouseY=120;events.draw();assert(first.visible,"bridge keeps shortcut reachable")
mouseX=80;first.mouseOver=true;events.draw();assert(first.visible,"button hover keeps revealed shortcut reachable")
first.mouseOver=false;mouseX=500;now=400;events.draw();assert(not first.visible,"leaving combined hover region hides shortcut")
ISEquippedItem.instance.searchBtn.y=140; events.draw(); assert(toolbar.button==first and first.y==160)
ISEquippedItem.instance=sidebar(30,40,0,200,40,40); events.draw()
assert(first.removed and toolbar.button~=first and toolbar.button.x==74 and toolbar.button.y==240)
ISEquippedItem.instance.searchBtn.mouseOver=true;events.draw();assert(toolbar.button.visible)
ConspiracyFiles.GeneratedRuntime.metrics=function() return nil end; events.draw(); assert(toolbar.button.visible==false)
print("PASS notebook toolbar mock: paused UI-draw hover, bridge, toggle, adjacent placement, reuse/recreate and visibility")

ConspiracyFiles.GeneratedRuntime.metrics=function() return {} end
events.draw();local stable=toolbar.button
stable.cfNotebookToolbarVersion=1 -- simulate the prior procedural-button module.
package.loaded["ConspiracyFiles/NotebookToolbar"]=nil
assert(require("ConspiracyFiles/NotebookToolbar")==toolbar);events.draw()
assert(added==1 and removed==0 and toolbar.button~=stable and stable.removed,"reload reuses listener and replaces stale button class")
stable=toolbar.button
ISEquippedItem.instance.searchBtn.visible=false;events.draw();assert(not stable.visible,"hidden search hides notebook")
ISEquippedItem.instance.searchBtn.visible=true;ConspiracyFiles.T12Mode=true;events.draw();assert(not stable.visible,"T12 disables toolbar")
ConspiracyFiles.T12Mode=nil;events.draw();assert(stable.visible)
print("PASS toolbar reload, paused UI draw, native anchor visibility and T12 isolation")

local old=function() end
ConspiracyFiles.NotebookToolbar.handler=old;ConspiracyFiles.NotebookToolbar.event=nil
package.loaded["ConspiracyFiles/NotebookToolbar"]=nil
require("ConspiracyFiles/NotebookToolbar")
assert(removed==1,"hot load removes previous tick listener")
print("PASS upgrade from tick listener")
