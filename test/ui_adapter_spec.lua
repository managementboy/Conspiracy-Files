-- Composition mocks only: no engine, rendering, native focus, or GUI input.
test("UI composition shares a clamped document pane, explicit ink and owner key policy",function()
    local names={"ISPanel","ISCollapsableWindow","ISButton","ISScrollingListBox","ISRichTextPanel","ConspiracyFiles","Events","Keyboard","UIFont","keyBinding","getCore","getTextManager","getPlayer","isDebugEnabled","isClient","isServer"}
    local old={}; for _,name in ipairs(names) do old[name]=_G[name] end
    local modules={"ISUI/ISPanel","ISUI/ISCollapsableWindow","ISUI/ISButton","ISUI/ISScrollingListBox","ISUI/ISRichTextPanel","ConspiracyFiles/Notebook","ConspiracyFiles/DocumentPane"}
    local loaded={}; for _,name in ipairs(modules) do loaded[name]=package.loaded[name]; package.loaded[name]=true end
    package.loaded["ConspiracyFiles/Notebook"]=nil; package.loaded["ConspiracyFiles/DocumentPane"]=nil
    local path=package.path
    package.path=TEST_ROOT.."/mod/common/media/lua/client/?.lua;"..path
    local Base={}
    function Base:derive() local class={}; class.__index=class; return setmetatable(class,{__index=self}) end
    function Base:new(x,y,w,h) return setmetatable({x=x,y=y,width=w,height=h,children={},items={},scroll=0,visible=true},{__index=self}) end
    function Base:initialise() end
    function Base:instantiate() if not self.instantiated then self.instantiated=true; if self.createChildren then self:createChildren() end end end
    function Base:createChildren() end
    function Base:addChild(child) self.children[#self.children+1]=child end
    function Base:setText(t) self.text=t end
    function Base:paginate() self.scrollHeight=math.max(self.height,#(self.text or "")*2) end
    function Base:getScrollAreaHeight() return self.height end
    function Base:getScrollHeight() return self.scrollHeight or self.height end
    function Base:getYScroll() return self.scroll end
    function Base:setYScroll(y) self.scroll=math.max(-math.max(0,self:getScrollHeight()-self.height),math.min(0,y)) end
    function Base:onMouseWheel(delta) self:setYScroll(self.scroll-delta*18); return true end
    for _,field in ipairs({"X","Y","Width","Height"}) do local key=field:lower(); Base["set"..field]=function(self,v) self[key]=v end end
    function Base:setTitle(t) self.title=t end
    function Base:setVisible(v) self.visible=v end
    function Base:getIsVisible() return self.visible end
    function Base:titleBarHeight() return 24 end
    function Base:resizeWidgetHeight() return 8 end
    function Base:clear() self.items={} end
    function Base:addItem(t,item) self.items[#self.items+1]={text=t,item=item,index=#self.items+1,height=self.itemheight} end
    for _,name in ipairs({"setResizable","setWantKeyEvents","setOnMouseDownFunction","bringToTop","drawRect","drawRectBorder","prerender","setCapture","drawText"}) do Base[name]=function() end end
    function Base:addToUIManager() self.inUI=true end
    function Base:removeFromUIManager() self.inUI=false end
    for _,name in ipairs({"ISPanel","ISCollapsableWindow","ISButton","ISScrollingListBox","ISRichTextPanel"}) do _G[name]=Base:derive() end
    ConspiracyFiles={}; Events={OnKeyPressed={Add=function() end}}
    Keyboard={KEY_TAB=1,KEY_UP=2,KEY_DOWN=3,KEY_RETURN=4,KEY_PRIOR=5,KEY_NEXT=6,KEY_BACK=7,KEY_ESCAPE=8,KEY_NONE=0}
    UIFont={Small=1}; keyBinding={}
    getCore=function() return {getScreenWidth=function() return 1280 end,getScreenHeight=function() return 800 end,getKey=function() return 0 end} end
    getTextManager=function() return {getFontHeight=function() return 18 end,MeasureStringX=function(_,_,t) return #t*8 end} end
    getPlayer=function() return nil end; isDebugEnabled=function() return true end; isClient=function() return false end; isServer=function() return false end
    local ok,why=pcall(function()
        local UI=require("ConspiracyFiles/Notebook")
        local probe=dofile(TEST_ROOT.."/dev/t12-ui-runtime/common/media/lua/client/ConspiracyFilesT12Probe.lua")
        assertTrue(probe.prepare()); assertEqual(86,#UI.probeState.snapshot().evidence)
        UI.open("evidence"); local window=assert(UI.notebook); assertTrue(window.inUI)
        local drawn={}; window.list.drawText=function(_,text) drawn[#drawn+1]=text end
        local row=window.list.items[1]
        window.list.doDrawItem(window.list,0,row)
        assertEqual(2,#drawn)
        for _,text in ipairs(drawn) do assertTrue(getTextManager():MeasureStringX(UIFont.Small,text)<=window.list.width-32) end
        assertTrue(drawn[2]:find("...",1,true)~=nil)
        drawn={}; window.list.doDrawItem(window.list,window.list.height+10,row); assertEqual(0,#drawn)
        window.list:setWidth(150); window.list.doDrawItem(window.list,0,row)
        for _,text in ipairs(drawn) do assertTrue(getTextManager():MeasureStringX(UIFont.Small,text)<=118) end
        assertTrue(window.document.scroll~=nil); assertTrue(window.header~=window.document.body)
        window.document:setDocument(string.rep("Long document ",300).."<RGB:0,0,0>",false)
        assertTrue(window.document.body.text:find("<RGB:0.10,0.10,0.08>",1,true)==1)
        assertTrue(window.document.body.text:find("&lt;RGB:0,0,0&gt;",1,true)~=nil)
        window.document:page(1); assertTrue(window.document.body:getYScroll()<0)
        window:onContrast(); assertTrue(window.document.body.text:find("<RGB:1,1,1>",1,true)==1)
        assertFalse(window:isKeyConsumed(Keyboard.KEY_ESCAPE)); assertEqual(0,keyBinding[1].key)
        UI.openHelp(); assertTrue(UI.help~=nil); assertTrue(UI.help.document.contrast); UI.help:close(); assertEqual(nil,UI.help)
        window:setWidth(650); window:layout(); assertTrue(window.compact)
        window:onBack(); assertTrue(window.list.visible); assertFalse(window.document.visible)
        window:close(); assertEqual(nil,UI.notebook); assertEqual(650,UI.geometry.width)
        local guide=dofile(TEST_ROOT.."/mod/common/media/lua/client/ConspiracyFiles/SessionGuide.lua")
        local before=UI.probeState.snapshot()
        assertTrue(guide.open()); assertTrue(guide.window.inUI)
        assertFalse(guide.record("Pass")) -- no wrapper: cannot claim T12 observation
        ConspiracyFiles.T12Mode=true; assertTrue(guide.record("Fail")); assertEqual("Fail",guide.verdicts['ui-scroll'])
        guide.index=5; assertFalse(guide.record("Pass")); assertTrue(guide.record("Not tested"))
        assertTrue(guide.capture()); assertDeepEqual(before,UI.probeState.snapshot())
        isDebugEnabled=function() return false end; assertFalse(guide.open()); assertFalse(guide.record("Pass"))
        guide.window:close()
    end)
    for _,name in ipairs(names) do _G[name]=old[name] end
    for _,name in ipairs(modules) do package.loaded[name]=loaded[name] end
    package.path=path; assertTrue(ok,why)
end)
