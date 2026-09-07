-- Composition mocks only: no engine, rendering, native focus, or GUI input.
test("UI composition shares a clamped document pane, explicit ink and owner key policy",function()
    local names={"ISPanel","ISCollapsableWindow","ISButton","ISScrollingListBox","ISRichTextPanel","ISTextEntryBox","ConspiracyFiles","Events","Keyboard","UIFont","keyBinding","getCore","getTextManager","getPlayer","isDebugEnabled","isClient","isServer"}
    local old={}; for _,name in ipairs(names) do old[name]=_G[name] end
    local modules={"ISUI/ISPanel","ISUI/ISCollapsableWindow","ISUI/ISButton","ISUI/ISScrollingListBox","ISUI/ISRichTextPanel","ISUI/ISTextEntryBox","ConspiracyFiles/Notebook","ConspiracyFiles/DocumentPane"}
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
    function Base:addItem(t,item,tooltip) self.items[#self.items+1]={text=t,item=item,index=#self.items+1,height=self.itemheight,tooltip=tooltip} end
    function Base:getText() return self.text or "" end
    for _,name in ipairs({"setResizable","setWantKeyEvents","setOnMouseDownFunction","bringToTop","drawRect","drawRectBorder","prerender","setCapture","drawText"}) do Base[name]=function() end end
    function Base:addToUIManager() self.inUI=true end
    function Base:removeFromUIManager() self.inUI=false end
    for _,name in ipairs({"ISPanel","ISCollapsableWindow","ISButton","ISScrollingListBox","ISRichTextPanel","ISTextEntryBox"}) do _G[name]=Base:derive() end
    ConspiracyFiles={}; Events={OnKeyPressed={Add=function() end},OnPostUIDraw={Add=function() end},OnGameStart={Add=function() end}}
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
        -- Item 2: ISScrollingListBox honours item.tooltip natively (confirmed
        -- by reading the installed game's ISScrollingListBox.lua: addItem's
        -- third argument sets it, and updateTooltip renders it every render
        -- pass), so the row's tooltip should carry the untruncated pair even
        -- though the on-screen text above was shortened to fit the column.
        local untruncated=row.item.title..(row.item.summary~="" and "\n\n"..row.item.summary or "")
        assertEqual(untruncated,row.tooltip)
        assertTrue(row.tooltip:find(row.item.title,1,true)==1,"tooltip carries the untruncated title")
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
        window:close(); assertEqual(nil,UI.notebook); assertEqual(nil,UI.geometry) -- probes do not overwrite saved player preferences
        local guide=dofile(TEST_ROOT.."/mod/common/media/lua/client/ConspiracyFiles/SessionGuide.lua")
        local before=UI.probeState.snapshot()
        assertTrue(guide.open()); assertTrue(guide.window.inUI)
        assertFalse(guide.record("Pass")) -- no wrapper: cannot claim T12 observation
        ConspiracyFiles.T12Mode=true; assertTrue(guide.record("Fail")); assertEqual("Fail",guide.verdicts['ui-scroll'])
        guide.index=5; assertFalse(guide.record("Pass")); assertTrue(guide.record("Not tested"))
        assertTrue(guide.capture()); assertDeepEqual(before,UI.probeState.snapshot())
        isDebugEnabled=function() return false end; assertFalse(guide.open()); assertFalse(guide.record("Pass"))
        guide.window:close()
        UI.probeState=nil; ConspiracyFiles.T12Mode=nil
        local known={{id="g1",title="Dispatch",body="First document",connections={}},
            {id="g2",title="Receipt",body="Second document",connections={{target="g1",kind="corroborates"},{target="hidden",kind="corroborates"}}}}
        ConspiracyFiles.GeneratedRuntime={metrics=function() return {} end,known=function() return known end}
        ConspiracyFiles.ClueMarkers={note=function() return "Map marking waits for a pen or pencil." end}
        UI.open("evidence","g2")
        local gen=UI.notebook
        assertEqual(2,#gen.list.items); assertEqual("g2",gen.currentId)
        assertTrue(gen.document.plainText:find("Map marking waits for a pen or pencil.",1,true)~=nil)
        assertTrue(gen.document.plainText:find("Supports: Dispatch",1,true)~=nil)
        assertFalse(gen.document.plainText:find("hidden",1,true)~=nil)
        -- The journal no longer prefixes titles with "Inspected ": every row
        -- carried it, so it distinguished nothing and cost ten characters of a
        -- column that is 35% of the window. The summary still says so.
        gen:onSection(gen.journal); assertEqual("Dispatch",gen.list.items[1].item.title)
        assertTrue(gen.list.items[1].item.summary:find("Discovery",1,true)~=nil,
            "the summary still identifies this as a discovery")
        assertEqual("g1",gen.list.items[1].item.id)
        UI.openHelp(); assertTrue(UI.help.text:find("Inspect Investigation Evidence",1,true)~=nil); UI.help:close()
        -- Item 6: the filter narrows the view only. Discovery numbers must
        -- stay the ones the ledger actually assigned, not be renumbered to
        -- reflect position in the filtered list.
        gen.filter:setText("receipt"); gen:refresh()
        assertEqual(1,#gen.list.items); assertEqual("g2",gen.list.items[1].item.id)
        assertEqual(2,gen.list.items[1].item.ordinal,"a filtered view must keep the true discovery number")
        gen.filter:setText("zzz-nothing-matches-this"); gen:refresh()
        assertEqual(0,#gen.list.items)
        assertTrue(gen.document.plainText:find("Clear the filter",1,true)~=nil,"a filter that hides everything must say so, not silently show an empty list")
        gen.filter:setText(""); gen:refresh()
        assertEqual(2,#gen.list.items,"clearing the filter restores everything")
        gen:close()
        assertEqual(2,#known); assertEqual("Second document",known[2].body)
        -- Item 4: entries discovered since the notebook was last closed are
        -- marked, and the stored high-water mark only advances on close, not
        -- on open (an isolated case/ledger so this cannot disturb `known`).
        local known2={{id="k1",title="Alpha",body="A",connections={}},{id="k2",title="Beta",body="B",connections={}}}
        ConspiracyFiles.GeneratedRuntime={metrics=function() return {} end,known=function() return known2 end}
        local seenData={}
        local realGetPlayer=getPlayer
        getPlayer=function() return {getModData=function() return seenData end} end
        ConspiracyFiles.DiscoveryLog={events=function() return {{seq=1,ref="k1",kind="evidence"},{seq=2,ref="k2",kind="evidence"}} end}
        UI.open("journal")
        local w1=assert(UI.notebook)
        for _,it in ipairs(w1.list.items) do assertFalse(it.item.cfNew==true,"nothing is marked new before any seen-sequence is stored") end
        w1:close()
        assertEqual(2,seenData.ConspiracyFilesSeenSeq,"closing records the highest sequence seen so far")
        known2[3]={id="k3",title="Gamma",body="C",connections={}}
        ConspiracyFiles.DiscoveryLog.events=function() return {{seq=1,ref="k1",kind="evidence"},{seq=2,ref="k2",kind="evidence"},{seq=3,ref="k3",kind="evidence"}} end
        UI.open("journal")
        local w2=assert(UI.notebook)
        local flagged={}
        for _,it in ipairs(w2.list.items) do flagged[it.item.id]=it.item.cfNew==true end
        assertTrue(flagged.k3,"the newly discovered row is marked since the last close")
        assertFalse(flagged.k1 or false,"already-seen rows stay unmarked")
        assertFalse(flagged.k2 or false,"already-seen rows stay unmarked")
        w2:close()
        assertEqual(3,seenData.ConspiracyFilesSeenSeq,"closing again advances the stored high-water mark")
        getPlayer=realGetPlayer
    end)
    for _,name in ipairs(names) do _G[name]=old[name] end
    for _,name in ipairs(modules) do package.loaded[name]=loaded[name] end
    package.path=path; assertTrue(ok,why)
end)
