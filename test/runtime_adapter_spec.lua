local Content=require("ConspiracyFiles/Content")
local runtimePath=TEST_ROOT..TEST_SEPARATOR.."mod/common/media/lua/shared/ConspiracyFiles/Runtime.lua"
local menuPath=TEST_ROOT..TEST_SEPARATOR.."mod/common/media/lua/client/ConspiracyFiles/ContextMenu.lua"
local function environment(fn,server)
    local names={"ConspiracyFiles","Events","ModData","isClient","isServer","isDebugEnabled","getTimestampMs","getGameVersion","ZombRand","getCell","getPlayer","getSpecificPlayer","instanceItem","instanceof","print"}
    local previous={}; for _,name in ipairs(names) do previous[name]=_G[name] end
    local oldUI=package.loaded["ConspiracyFiles/Notebook"]
    local logs,handlers,stored={},{},{}
    _G.print=function(text) logs[#logs+1]=text end
    _G.ConspiracyFiles=nil
    _G.Events={}
    for _,name in ipairs({"OnGameStart","OnTick","LoadGridsquare","OnFillInventoryObjectContextMenu"}) do
        handlers[name]={}; Events[name]={Add=function(f) handlers[name][#handlers[name]+1]=f end}
    end
    local writes=0
    _G.ModData={getOrCreate=function(tag) writes=writes+1; stored[tag]=stored[tag] or {}; return stored[tag] end}
    _G.isClient=function() return false end; _G.isServer=function() return server==true end
    _G.isDebugEnabled=function() return true end
    local clock=0; _G.getTimestampMs=function() clock=clock+0.01; return clock end
    _G.getGameVersion=function() return "mock-42.20.4" end; _G.ZombRand=function() return 71 end
    local function list(values) return {size=function() return #values end,get=function(_,i) return values[i+1] end} end
    local function container(kind)
        local values={}; local c={values=values}
        c.getItems=function() return list(values) end; c.getType=function() return kind end
        c.AddItem=function(_,item) values[#values+1]=item; item.outer=c; return item end
        return c
    end
    local inventory=container("inventory")
    local player={getInventory=function() return inventory end,getVehicle=function() return nil end,getX=function() return 10614 end,getY=function() return 9604 end,getZ=function() return 0 end}
    _G.getPlayer=function() return player end; _G.getSpecificPlayer=getPlayer
    local containers={}; local objects={}
    for index=1,7 do
        local c=container(index<=3 and "shelves" or "counter"); containers[index]=c
        objects[index]={getContainerCount=function() return 1 end,getContainerByIndex=function(_,i) if i==0 then return c end end,
            getSprite=function() return {getName=function() return "sprite-"..index end} end}
    end
    local function square(x,y,z)
        local found={}
        if x==10614 and y==9604 then found={objects[1],objects[2],objects[3]}
        elseif x==10637 and y==10410 then found={objects[4],objects[5],objects[6],objects[7]} end
        return {getObjects=function() return list(found) end,getWorldObjects=function() return list({}) end,getStaticMovingObjects=function() return list({}) end,
            getX=function() return x end,getY=function() return y end,getZ=function() return z end}
    end
    _G.getCell=function() return {getGridSquare=function(_,x,y,z) return square(x,y,z) end} end
    _G.instanceItem=function()
        local md={}; local item={isMockItem=true,getModData=function() return md end,setName=function(self,name) self.name=name end,setCustomName=function() end}
        item.getName=function(self) return self.name end; item.getOutermostContainer=function(self) return self.outer end
        return item
    end
    _G.instanceof=function(item,kind) return kind=="InventoryItem" and type(item)=="table" and item.isMockItem==true end
    local readerCalls,readerContext=0,nil
    package.loaded["ConspiracyFiles/Notebook"]={open=function() end,refresh=function() end,openReader=function(_,_,context) readerCalls=readerCalls+1; readerContext=context end}
    local rt=dofile(runtimePath)
    local e={rt=rt,stored=stored,containers=containers,inventory=inventory,handlers=handlers,logs=logs,
        writes=function() return writes end,reader=function() return readerCalls,readerContext end}
    function e.tick(count) for _=1,count do for _,handler in ipairs(handlers.OnTick) do handler() end end end
    function e.menu(item)
        local menu={options={}}
        menu.addOption=function(self,name,target,callback)
            local option={name=name,callback=callback,target=target}; self.options[#self.options+1]=option; return option
        end
        for _,handler in ipairs(handlers.OnFillInventoryObjectContextMenu) do handler(0,menu,{item}) end
        return menu
    end
    function e.find(id)
        for _,c in ipairs(containers) do for _,item in ipairs(c.values) do if item:getModData().cfAssetId==id then return item,c end end end
    end
    local ok,why=pcall(fn,e)
    for _,name in ipairs(names) do _G[name]=previous[name] end
    package.loaded["ConspiracyFiles/Notebook"]=oldUI
    assertTrue(ok,why)
end
test("runtime mock composes seven exact placements and reloads without duplicate items",function()
    environment(function(e)
        e.rt.start(); e.tick(500)
        assertTrue(e.rt.allPlacementsSettled())
        local total=0; for _,c in ipairs(e.containers) do total=total+#c.values end; assertEqual(7,total)
        local before=e.rt.placementSummary(); e.rt.start(); e.tick(150)
        total=0; for _,c in ipairs(e.containers) do total=total+#c.values end; assertEqual(7,total)
        assertEqual(before.seed,e.rt.placementSummary().seed)
    end)
end)
test("runtime mock reconciles after-add interruption and never retries an empty persisted intent",function()
    environment(function(e)
        e.rt.start(); e.rt.faultPoint="after-add"; e.tick(500)
        assertTrue(e.rt.allPlacementsSettled())
        local total=0; for _,c in ipairs(e.containers) do total=total+#c.values end; assertEqual(7,total)
    end)
    environment(function(e)
        e.rt.start(); e.rt.faultPoint="after-intent"; e.tick(500)
        local total=0; for _,c in ipairs(e.containers) do total=total+#c.values end; assertEqual(6,total)
        e.rt.start(); e.tick(250)
        total=0; for _,c in ipairs(e.containers) do total=total+#c.values end; assertEqual(6,total)
    end)
end)
test("runtime mock server disablement performs no ModData access",function()
    environment(function(e) e.rt.start(); e.tick(20); assertTrue(e.rt.disabled); assertEqual(0,e.writes()) end,true)
end)

test("runtime mock client and T12 disable before writes; T11 shares adapters with one item",function()
    environment(function(e) isClient=function() return true end; e.rt.start(); assertTrue(e.rt.disabled); assertEqual(0,e.writes()) end)
    environment(function(e) ConspiracyFiles.T12Mode=true; e.rt.start(); assertTrue(e.rt.disabled); assertEqual(0,e.writes()) end)
    environment(function(e)
        ConspiracyFiles.T11Mode=true; e.rt.start(); e.tick(500)
        local total=0; for _,c in ipairs(e.containers) do total=total+#c.values end; assertEqual(1,total)
        assertTrue(e.stored["ConspiracyFiles.T11.Session"]~=nil); assertEqual(nil,e.stored["ConspiracyFiles.DeadAir"])
    end)
end)

test("runtime mock malformed roots preserve storage and disable initialization",function()
    environment(function(e)
        local bad={unexpected="preserve me"}; e.stored["ConspiracyFiles.DeadAir"]=bad
        e.rt.start(); e.tick(30); assertTrue(e.rt.disabled); assertDeepEqual({unexpected="preserve me"},bad)
    end)
end)

test("menu mock generic marks require ownership and retain a durable single intent",function()
    environment(function(e)
        e.rt.start(); e.tick(500); dofile(menuPath)
        local item=instanceItem(); item:setName("Spare radio"); item.outer=e.inventory
        local action=e.menu(item).options[2]
        item.outer=nil; action.callback(); assertEqual(0,#e.rt.state.snapshot().evidence)
        item.outer=e.inventory; e.rt.faultPoint="before-canonical-swap"; action.callback()
        local intent=item:getModData().cfMarkIntent; assertTrue(intent~=nil); assertEqual(0,#e.rt.state.snapshot().evidence)
        action.callback(); action.callback(); assertEqual(1,#e.rt.state.snapshot().evidence)
        assertEqual(intent,item:getModData().cfMarkIntent); assertTrue(e.menu(item).options[2].notAvailable)
        e.rt.start(); assertTrue(e.menu(item).options[2].notAvailable)
    end)
end)
test("menu mock delivers approved context only after a successful committed discovery",function()
    environment(function(e)
        e.rt.start(); e.tick(500); dofile(menuPath)
        local item=e.find(Content.ids.d1)
        local menu=e.menu(item); local action=menu.options[2]
        local source=item.outer; item.outer=nil; action.callback(); assertEqual(0,e.reader()); item.outer=source
        e.rt.faultPoint="before-canonical-swap"; action.callback()
        assertEqual(0,e.reader()); assertEqual(0,#e.rt.state.snapshot().evidence)
        action.callback(); local count,context=e.reader()
        assertEqual(1,count); assertEqual(Content.assets[Content.ids.d1].contextText,context)
        assertEqual(2,#e.rt.state.snapshot().journal)
        action.callback(); assertEqual(2,#e.rt.state.snapshot().journal)
        item:getModData().cfPhysicalToken="stale"; action.callback(); assertEqual(2,e.reader())
        dofile(menuPath); assertEqual(1,#e.handlers.OnFillInventoryObjectContextMenu)
    end)
end)
test("menu mock preserves foreign actions, deduplicates groups and rejects token ambiguity",function()
    environment(function(e)
        e.rt.start(); e.tick(500); local menuModule=dofile(menuPath)
        local item=e.find(Content.ids.d1)
        local normalized=menuModule.normalize({{items={item,item,item}},item}); assertEqual(1,#normalized)
        local copy=instanceItem(); for k,v in pairs(item:getModData()) do copy:getModData()[k]=v end
        local menu=e.menu(item); table.insert(menu.options,1,{name="Foreign option"})
        menuModule.fill(0,menu,{item}); assertEqual(3,#menu.options); assertEqual("Foreign option",menu.options[1].name)
        local ambiguous={options={},addOption=menu.addOption}; menuModule.fill(0,ambiguous,{item,copy})
        assertTrue(ambiguous.options[2].notAvailable)
        assertEqual("conflict",e.rt.assignment(Content.ids.d1).availability)
    end)
end)
