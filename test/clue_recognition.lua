-- A clue is an ordinary game item until the survivor recognises it (P4-R132,
-- stage 1). Placement puts the plain item in its container: no title, no
-- Evidence category. Recognition (spotted in Search Mode, or looked over) is a
-- small saved flag in the case record; it stamps every copy the runtime can
-- reach, it survives a reload, and only then does the menu offer Inspect.
package.preload["ConspiracyFiles/ClueHints"]=function() return {} end
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local events={}
Events={OnTick={Add=function(f) events.tick=f end},OnGameStart={Add=function(f) events.start=f end},
    OnFillInventoryObjectContextMenu={Add=function() end}}
local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
local function record(t) local o={} for k,v in pairs(t) do local val=v; o[k]=function() return val end end return o end
local containers={}
local function container()
    local items={}; local c={getType=function() return "desk" end,getItems=function() return list(items) end,items=items}
    function c:AddItem(item) items[#items+1]=item; item.container=c; return item end
    return c
end
for _,x in ipairs({0,20,40,60}) do for _,offset in ipairs({0,0.1,1,1.1}) do containers[x+offset]=container() end end
local inventory=container()
local player=record{getX=0,getY=0,getZ=0,getHoursSurvived=0,getInventory=inventory}
player.getModData=function() return {} end
player.getVehicle=function() return nil end
getPlayer=function() return player end
getSpecificPlayer=getPlayer
getDebug=function() return true end
isClient=function() return false end
isServer=function() return false end
ZombRand=function() return 1 end
local clock=0; getTimeInMillis=function() clock=clock+0.01; return clock end
getGameTime=function() return {getWorldAgeHours=function() return 0 end} end
getCell=function() return {getGridSquare=function(_,x,y,z)
    if (y~=0 and y~=1) or z~=0 or not containers[x+y/10] then return nil end
    local c=containers[x+y/10]
    return record{getObjects=list{record{getContainerCount=1,getContainerByIndex=c,getSprite=record{getName="desk_sprite"}}},getWorldObjects=list{},getStaticMovingObjects=list{}}
end} end
instanceof=function() return false end
-- Items record what was done to them.
instanceItem=function(fullType)
    local md={}
    local item={fullType=fullType,named=nil,category=nil}
    item.getModData=function() return md end
    item.setName=function(self,name) self.named=name end
    item.setCustomName=function() end
    item.setDisplayCategory=function(self,c) self.category=c end
    item.getOutermostContainer=function() return item.container end
    item.getContainer=function() return item.container end
    return item
end
local saved={}
local otherStores={}
ModData={
    getOrCreate=function(tag) if tag=="ConspiracyFiles.Generated.G2" then return saved end; otherStores[tag]=otherStores[tag] or {}; return otherStores[tag] end,
    get=function(tag) if tag=="ConspiracyFiles.Generated.G2" then return saved end; return otherStores[tag] end,
}
local result={version="T3-nearby-2",buildings=4,map="mock",gameVersion="42.20",anchor={x=0,y=0},rows={}}
for _,x in ipairs({0,20,40,60}) do
    result.rows[#result.rows+1]={kind="building",id=tostring(x),x=x,y=0,x2=x+2,y2=2,minLevel=0}
    result.rows[#result.rows+1]={kind="rect",building=tostring(x),x=x,y=0,z=0,w=2,h=2}
end
package.preload["ConspiracyFiles/T3Nearby"]=function() return {start=function() return true end,result=result} end
package.preload["ConspiracyFiles/GeneratedMenu"]=function() return {} end
local R=require("ConspiracyFiles/GeneratedRuntime")
assert(R.start(1)); for _=1,200 do events.tick() end
local root=saved.campaign.canonical
assert(root,"a case was placed")
local placed={}
for _,c in pairs(containers) do for _,item in ipairs(c.items) do placed[#placed+1]=item end end
assert(#placed>0)

-- Placement: the plain item, no title, no category.
for _,item in ipairs(placed) do
    assert(item.named==nil,"placement must not name a clue: "..tostring(item.named))
    assert(item.category==nil,"placement must not categorise a clue: "..tostring(item.category))
    assert(R.subject(item),"it is still the case's clue underneath")
    assert(not R.isRecognised(item),"nobody has recognised it")
end
-- The periodic identity scan sees the clues and still leaves them plain.
for _=1,400 do events.tick() end
for _,item in ipairs(placed) do assert(item.category==nil,"the identity scan must not reveal a clue") end

-- Search Mode rows: every clue, unrecognised.
local rows=R.clueTargets()
assert(#rows==#root.case.documents)
for _,row in ipairs(rows) do assert(row.recognised==false and type(row.x)=="number") end

-- Inspecting an unrecognised clue is refused, even in hand.
local item=placed[1]
local id=item:getModData().cfGeneratedId
local origin=item.container
for i,v in ipairs(origin.items) do if v==item then table.remove(origin.items,i); break end end
inventory:AddItem(item)
assert(not R.inspect(item),"an unrecognised clue cannot be noted")
assert(#R.known()==0)

-- Recognise it: every reachable copy is stamped, the flag is saved, once.
local doc; for _,d in ipairs(root.case.documents) do if d.id==id then doc=d end end
local ok,fresh=R.recognise(item,"search")
assert(ok==true and fresh==true,"recognised")
assert(item.named==(doc.quantity and doc.quantity>1 and doc.label and (doc.label.." (1 of "..doc.quantity..")") or doc.title),"titled: "..tostring(item.named))
assert(item.category=="Evidence","categorised")
assert(R.isRecognised(item) and R.isRecognisedId(id))
local again,second=R.recognise(id,"look")
assert(again==true and second==false,"recognising twice changes nothing")
local stored=saved.campaign.canonical
assert(#stored.recognised==1 and stored.recognised[1]==id,"one small saved flag, in the case record")
for _,row in ipairs(R.clueTargets()) do if row.id==id then assert(row.recognised) end end
-- A clue in its container is stamped where it lies.
local other=placed[2]
local otherId=other:getModData().cfGeneratedId
if otherId~=id then
    assert(R.recognise(otherId,"search"))
    assert(other.category=="Evidence" and other.named~=nil,"stamped in its container")
end
-- Not a clue, or no case: refused, nothing written.
assert(not R.recognise("no-such-document","search"))
assert(not R.recognise(instanceItem("Base.Note"),"search"))

-- Now it can be noted, and noted counts as recognised.
assert(R.inspect(item),"a recognised clue is noted")
assert(#R.known()==1)

-- A reload: recognition is in the save, and only recognised clues are
-- re-stamped (the category is a runtime property the game does not save).
local plain
for _,c in pairs(containers) do for _,v in ipairs(c.items) do if not R.isRecognised(v) then plain=v end end end
for i,v in ipairs(plain.container.items) do if v==plain then table.remove(plain.container.items,i); break end end
inventory:AddItem(plain)
item.category=nil; plain.category=nil
events.start()
assert(item.category=="Evidence","a recognised clue is re-stamped after loading")
assert(plain.category==nil,"an unrecognised clue stays plain after loading")
assert(R.isRecognised(item) and not R.isRecognised(plain),"recognition survives a reload")

-- The saved flag is validated like the rest of the record.
local Session=require("ConspiracyFiles/Generated/Session")
local function copy(v) if type(v)~="table" then return v end local o={} for k,x in pairs(v) do o[k]=copy(x) end return o end
local bad=copy(saved.campaign.canonical); bad.recognised={id,id}
assert(not Session.validate(bad),"a clue recognised twice is refused")
bad.recognised={"invented"}; assert(not Session.validate(bad),"an unknown document is refused")
bad.recognised={[2]=id}; assert(not Session.validate(bad),"a sparse list is refused")
bad.recognised="yes"; assert(not Session.validate(bad))
bad.recognised=nil; assert(Session.validate(bad),"a case nobody has recognised anything in is valid")

-- The menu: nothing on an unrecognised clue, Inspect on a recognised one.
package.loaded["ConspiracyFiles/GeneratedMenu"]=nil
package.preload["ConspiracyFiles/GeneratedMenu"]=nil
instanceof=function(_,class) return class=="InventoryItem" end
local Menu=dofile("mod/common/media/lua/client/ConspiracyFiles/GeneratedMenu.lua")
local function options(target)
    local out={}
    local context={addOption=function(_,label) local o={label=label}; out[#out+1]=o; return o end}
    Menu.fill(0,context,{target})
    return out
end
assert(#options(plain)==0,"no Inspect before recognition")
assert(R.recognise(plain,"look"))
local shown=options(plain)
assert(#shown>=1 and shown[1].label=="Inspect Investigation Evidence","Inspect once recognised")
print("PASS clue recognition: placed plain, recognised once by search or look, stamped where it can be reached, saved and validated, re-stamped on load only when recognised, Inspect only afterwards")
