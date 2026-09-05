require "ISUI/ISCollapsableWindow"
require "ISUI/ISButton"
require "ISUI/ISScrollingListBox"
require "ISUI/ISRichTextPanel"
local Document=require("ConspiracyFiles/DocumentPane")
local Projection=require("ConspiracyFiles/NotebookProjection")
ConspiracyFiles=ConspiracyFiles or {}
ConspiracyFiles.NotebookUI=ConspiracyFiles.NotebookUI or {}
local UI=ConspiracyFiles.NotebookUI
UI.VERSION="DEV-0.6-shared-document-panel"
local function safe(fn)
    local rt=ConspiracyFiles.Runtime
    if rt and not rt.disabled then return rt.boundary("ui",fn) end
    local ok,why=pcall(fn); if not ok then print("[CF-UI]|ERROR|"..tostring(why)) end; return ok
end
local function state()
    if UI.probeState then return UI.probeState end
    local rt=ConspiracyFiles.Runtime; return rt and not rt.disabled and rt.state
end
local function rect(width,height,geometry)
    local core=getCore(); local sw,sh=core:getScreenWidth(),core:getScreenHeight()
    local g=geometry or {}
    local function number(v,fallback) return type(v)=="number" and v==v and math.abs(v)<100000 and v or fallback end
    local w=math.max(320,math.min(number(g.width,width),sw-20))
    local h=math.max(260,math.min(number(g.height,height),sh-20))
    local x=math.max(0,math.min(number(g.x,math.floor((sw-w)/2)),sw-w))
    local y=math.max(0,math.min(number(g.y,math.floor((sh-h)/2)),sh-h))
    return x,y,w,h
end
local Reader=ISCollapsableWindow:derive("CFReaderWindow")
function Reader:createChildren()
    ISCollapsableWindow.createChildren(self); self:setResizable(true)
    self.document=Document:new(12,self:titleBarHeight()+12,self.width-24,self.height-self:titleBarHeight()-66)
    self.document:initialise(); self.document:instantiate(); self:addChild(self.document)
    self.document:setDocument(self.text,self.dark)
    self.closeButton=ISButton:new(self.width-108,self.height-42,94,30,"Close",self,Reader.close)
    self.closeButton:initialise(); self:addChild(self.closeButton)
end
function Reader:prerender()
    if self.lastW~=self.width or self.lastH~=self.height then
        self.document:setWidth(self.width-24); self.document:setHeight(self.height-self:titleBarHeight()-66)
        self.closeButton:setX(self.width-108); self.closeButton:setY(self.height-42)
        self.lastW,self.lastH=self.width,self.height
    end
    ISCollapsableWindow.prerender(self)
end
function Reader:isKeyConsumed(key) return key==Keyboard.KEY_PRIOR or key==Keyboard.KEY_NEXT end
function Reader:onKeyRelease(key)
    safe(function() if key==Keyboard.KEY_PRIOR then self.document:page(-1) elseif key==Keyboard.KEY_NEXT then self.document:page(1) end end)
end
function Reader:close()
    self:removeFromUIManager()
    if UI.reader==self then UI.reader=nil end
    if UI.help==self then UI.help=nil end
    if UI.notebook then UI.notebook:bringToTop() end
end
function Reader:new(title,text,dark)
    local x,y,w,h=rect(720,720)
    local o=ISCollapsableWindow.new(self,x,y,w,h)
    o:setTitle(title); o:setWantKeyEvents(true); o.minimumWidth=420; o.minimumHeight=320
    o.text,o.dark=text,dark; return o
end
function UI.openReader(title,body,context)
    safe(function()
        if UI.reader then UI.reader:close() end
        local text=(context and "WHAT THIS IS\n"..context.."\n\n" or "")..tostring(body or "Text unavailable.")
        UI.reader=Reader:new(title,text,UI.highContrast)
        UI.reader:initialise(); UI.reader:instantiate(); UI.reader:addToUIManager()
    end)
end
function UI.openHelp()
    safe(function()
        if UI.help then UI.help:bringToTop(); return end
        UI.help=Reader:new("About these notes", "SURVIVE FIRST\nThe notebook records what you encounter. It assigns no objectives and promises no final answer.\n\nINSPECT\nUse a document's action in your inventory or the Ground/loot inventory pane to read and record it.\n\nMARK INTERESTING\nTake an unusual object before marking it. Its original context stays in your notes even if you lose the object.\n\nNAVIGATION\nTab moves between Journal, Evidence, list, reading area, Help, contrast and Close. Arrow keys select list rows; Enter activates the focused control. Page Up/Down scroll the reading area.\n\nCLOSE\nUse the native X or Close button. Assign Conspiracy-Files: Toggle Survivor Notebook in the game's key bindings. Escape belongs to the game.\n\nController navigation has not been verified for this candidate.",true)
        UI.help:initialise(); UI.help:instantiate(); UI.help:addToUIManager()
    end)
end
local Window=ISCollapsableWindow:derive("CFNotebookWindow")
function Window:drawRow(y,item)
    if self.selected==item.index then self:drawRect(0,y,self.width,item.height,0.8,0.28,0.32,0.25) end
    local title="#"..item.item.ordinal.."  "..item.item.title
    while #title>4 and getTextManager():MeasureStringX(UIFont.Small,title)>self.width-22 do title=title:sub(1,-5).."..." end
    self:drawText(title,8,y+4,1,1,0.95,1,UIFont.Small)
    self:drawText(item.item.summary,8,y+8+getTextManager():getFontHeight(UIFont.Small),0.90,0.90,0.85,1,UIFont.Small)
    return y+item.height
end
function Window:showRow(row)
    if not row then return end
    self.currentId=row.id
    self.header:setText("<RGB:1,1,0.95> "..row.title:gsub("<","&lt;"):gsub(">","&gt;")); self.header:paginate()
    self.document:setDocument(row.detailText,UI.highContrast)
    if self.compact then self.detailOnly=true end
    self:layout()
end
function Window:rows()
    local current=state(); if not current then return {} end
    local rows=self.section=="evidence" and Projection.evidence(current) or Projection.journal(current)
    if self.section=="evidence" then
        local labels={available="Last seen in accessible belongings or nearby storage.",unknown="Its current whereabouts are uncertain.",untracked="These notes do not track the physical object.",unavailable="The physical object is no longer available.",conflict="The physical object cannot be identified reliably."}
        local rt=not UI.probeState and ConspiracyFiles.Runtime
        for _,row in ipairs(rows) do
            local e=current.resolveEvidence(row.id)
            local a=rt and e.assetId and rt.assignment(e.assetId)
            row.detailText=row.detailText.."\n\nPHYSICAL OBJECT\n"..(a and labels[a.availability] or labels.untracked)
        end
    end
    return rows
end
function Window:refresh(preferred)
    self.journal:setTitle(self.section=="journal" and "[Journal]" or "Journal")
    self.evidence:setTitle(self.section=="evidence" and "[Evidence]" or "Evidence")
    local rows=self:rows(); self.list:clear(); local selected=1
    for i,row in ipairs(rows) do self.list:addItem(row.title,row); if row.id==(preferred or self.currentId) then selected=i end end
    if #rows==0 then
        self.header:setText("<RGB:1,1,0.95> Nothing recorded yet"); self.header:paginate()
        self.document:setDocument("Inspect an unusual document or mark an acquired object worth remembering. The notebook records encounters; it does not assign objectives.",UI.highContrast)
        self:layout(); return
    end
    self.list.selected=selected; self:showRow(rows[selected])
end
function Window:onSection(button) self.section=button.internal; self.currentId=nil; self.detailOnly=false; self:refresh(); self:layout() end
function Window:onBack() self.detailOnly=false; self.focusIndex=3; self:layout() end
function Window:onContrast()
    UI.highContrast=not UI.highContrast; self:refresh()
    if UI.reader then UI.reader.document:setDocument(UI.reader.text,UI.highContrast) end
end
local function button(self,x,y,w,label,callback)
    local b=ISButton:new(x,y,w,32,label,self,function(target,control) safe(function() callback(target,control) end) end)
    b:initialise(); b:instantiate(); self:addChild(b); return b
end
function Window:createChildren()
    ISCollapsableWindow.createChildren(self); self:setResizable(true)
    self.journal=button(self,0,0,116,"Journal",Window.onSection); self.journal.internal="journal"
    self.evidence=button(self,0,0,116,"Evidence",Window.onSection); self.evidence.internal="evidence"
    self.help=button(self,0,0,116,"Help",function() UI.openHelp() end)
    self.contrast=button(self,0,0,116,"Contrast",Window.onContrast)
    self.closeButton=button(self,0,0,116,"Close",Window.close)
    self.back=button(self,12,0,116,"Back to list",Window.onBack)
    self.header=ISRichTextPanel:new(12,40,300,90); self.header:initialise(); self.header:instantiate()
    self.header.autosetheight=false; self.header.clip=true; self.header.background=false; self:addChild(self.header)
    self.document=Document:new(12,140,300,300); self.document:initialise(); self.document:instantiate(); self:addChild(self.document)
    self.list=ISScrollingListBox:new(12,40,280,350); self.list:initialise(); self.list:instantiate()
    self.list.itemheight=getTextManager():getFontHeight(UIFont.Small)*2+16; self.list.doDrawItem=Window.drawRow
    self.list:setOnMouseDownFunction(self,function(target,row) safe(function() target:showRow(row) end) end); self:addChild(self.list)
    self:layout(); self:refresh()
end
function Window:layout()
    if not self.list then return end
    local top=self:titleBarHeight()+12; local bottom=self:resizeWidgetHeight()+12
    local usable=self.width-152; local height=self.height-top-bottom
    local line=getTextManager():getFontHeight(UIFont.Small)
    local headerHeight=math.max(72,line*3+12)
    self.compact=usable<650
    local listWidth=self.compact and usable or math.floor(usable*0.35)
    local detailX=self.compact and 12 or 24+listWidth
    local detailW=self.compact and usable or usable-listWidth-12
    local showDetail=not self.compact or self.detailOnly
    self.back:setVisible(self.compact and self.detailOnly); self.back:setY(top)
    local extra=self.compact and 38 or 0
    self.list:setX(12); self.list:setY(top); self.list:setWidth(listWidth); self.list:setHeight(height)
    self.list:setVisible(not self.compact or not self.detailOnly)
    self.header:setX(detailX); self.header:setY(top+extra); self.header:setWidth(detailW); self.header:setHeight(headerHeight); self.header:setVisible(showDetail); self.header:paginate()
    self.document:setX(detailX); self.document:setY(top+extra+headerHeight); self.document:setWidth(detailW); self.document:setHeight(math.max(80,height-headerHeight-extra)); self.document:setVisible(showDetail)
    local controls={self.journal,self.evidence,self.help,self.contrast,self.closeButton}
    for i,b in ipairs(controls) do b:setX(self.width-128); b:setY(top+(i-1)*math.max(42,line+20)); b:setHeight(math.max(32,line+12)) end
    self.list.itemheight=line*2+16
end
function Window:prerender()
    local sw,sh=getCore():getScreenWidth(),getCore():getScreenHeight()
    local signature=self.width..":"..self.height..":"..sw..":"..sh..":"..getTextManager():getFontHeight(UIFont.Small)
    if signature~=self.signature then
        local x,y,w,h=rect(self.width,self.height,{x=self.x,y=self.y,width=math.max(500,self.width),height=math.max(420,self.height)})
        self:setX(x); self:setY(y); self:setWidth(w); self:setHeight(h); self:layout(); self.signature=signature
    end
    ISCollapsableWindow.prerender(self)
    local controls={self.journal,self.evidence,self.list,self.document,self.help,self.contrast,self.closeButton}
    local focused=controls[self.focusIndex or 3]
    if focused and focused:getIsVisible() then self:drawRectBorder(focused.x-2,focused.y-2,focused.width+4,focused.height+4,1,0.95,0.85,0.35) end
end
function Window:isKeyConsumed(key)
    return key==Keyboard.KEY_TAB or key==Keyboard.KEY_UP or key==Keyboard.KEY_DOWN or key==Keyboard.KEY_RETURN
        or key==Keyboard.KEY_PRIOR or key==Keyboard.KEY_NEXT or key==Keyboard.KEY_BACK
end
function Window:onKeyRelease(key)
    safe(function()
        if key==Keyboard.KEY_TAB then
            self.focusIndex=(self.focusIndex or 3)%7+1
            if self.compact and not self.detailOnly and self.focusIndex==4 then self.focusIndex=5 end
            if self.compact and self.detailOnly and self.focusIndex==3 then self.focusIndex=4 end
        elseif key==Keyboard.KEY_BACK and self.compact and self.detailOnly then self:onBack()
        elseif key==Keyboard.KEY_PRIOR then self.document:page(-1)
        elseif key==Keyboard.KEY_NEXT then self.document:page(1)
        elseif (key==Keyboard.KEY_UP or key==Keyboard.KEY_DOWN) and self.focusIndex==3 then
            local index=math.max(1,math.min(#self.list.items,(self.list.selected or 1)+(key==Keyboard.KEY_UP and -1 or 1)))
            self.list.selected=index
            if self.list.items[index] then self:showRow(self.list.items[index].item) end
        elseif key==Keyboard.KEY_RETURN then
            local index=self.focusIndex or 3
            if index==1 then self:onSection(self.journal) elseif index==2 then self:onSection(self.evidence)
            elseif index==3 and self.list.items[self.list.selected] then self:showRow(self.list.items[self.list.selected].item)
            elseif index==5 then UI.openHelp() elseif index==6 then self:onContrast() elseif index==7 then self:close() end
        end
    end)
end
function Window:close()
    safe(function()
        UI.geometry={x=self.x,y=self.y,width=self.width,height=self.height}
        local player=getPlayer and getPlayer()
        if player and not UI.probeState then player:getModData().ConspiracyFilesUI=UI.geometry end
        if UI.reader then UI.reader:close() end; if UI.help then UI.help:close() end
        self:removeFromUIManager(); if UI.notebook==self then UI.notebook=nil end
    end)
end
function Window:new(section)
    local player=getPlayer and getPlayer()
    local geometry=UI.geometry or (player and player:getModData().ConspiracyFilesUI)
    local x,y,w,h=rect(1000,680,type(geometry)=="table" and geometry or nil)
    local o=ISCollapsableWindow.new(self,x,y,w,h)
    o:setTitle("Survivor's Notebook"..((isDebugEnabled and isDebugEnabled()) and " ["..UI.VERSION.."]" or "")); o:setWantKeyEvents(true)
    o.section=section or "journal"; o.focusIndex=3; o.minimumWidth=500; o.minimumHeight=420; return o
end
function UI.open(section,preferred)
    safe(function()
        if not state() then return end
        if not UI.notebook then UI.notebook=Window:new(section); UI.notebook:initialise(); UI.notebook:instantiate(); UI.notebook:addToUIManager() end
        if section then UI.notebook.section=section end
        UI.notebook:refresh(preferred); UI.notebook:bringToTop()
    end)
end
function UI.refresh(section,id)
    if not UI.notebook then return end
    safe(function() if section then UI.notebook.section=section end; UI.notebook:refresh(id) end)
end
function UI.toggle() if UI.notebook then UI.notebook:close() else UI.open() end end
local BIND="Conspiracy-Files: Toggle Survivor Notebook"
if keyBinding then
    local exists=false; for _,entry in ipairs(keyBinding) do if entry.value==BIND then exists=true end end
    if not exists then table.insert(keyBinding,{value=BIND,key=Keyboard.KEY_NONE}) end
end
if Events and Events.OnKeyPressed and not UI.keyHandler then
    UI.keyHandler=function(key) safe(function() local assigned=getCore():getKey(BIND); if assigned and assigned>0 and key==assigned then UI.toggle() end end) end
    Events.OnKeyPressed.Add(UI.keyHandler)
end
return UI
