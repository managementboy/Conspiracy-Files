package.preload["ConspiracyFiles/ClueHints"]=function() return {} end
next=nil -- PZ Kahlua: fresh-save setup must not depend on the next global.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path
local events={}
Events={OnTick={Add=function(f) events.tick=f end},OnGameStart={Add=function(f) events.start=f end}}
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
local playerData={}
player.getModData=function() return playerData end
player.getVehicle=function() return nil end
getPlayer=function() return player end
getDebug=function() return true end
isClient=function() return false end
isServer=function() return false end
ZombRand=function() return 1 end
local clock=0; getTimeInMillis=function() clock=clock+0.01; return clock end
local worldAgeHours=0; getGameTime=function() return {getWorldAgeHours=function() return worldAgeHours end} end
getCell=function() return {getGridSquare=function(_,x,y,z)
    if (y~=0 and y~=1) or z~=0 or not containers[x+y/10] then return nil end
    local c=containers[x+y/10]
    return record{getObjects=list{record{getContainerCount=1,getContainerByIndex=c,getSprite=record{getName="desk_sprite"}}},getWorldObjects=list{},getStaticMovingObjects=list{}}
end} end
instanceof=function() return false end
instanceItem=function(fullType)
    local md={}; local item={fullType=fullType,getModData=function() return md end,setName=function() end,setCustomName=function() end}
    item.getOutermostContainer=function() return item.container end
    return item
end
local saved={}
-- Other tags (discovery ledger, visited buildings) get their own isolated
-- store, matching real ModData: distinct tags never share one table. `saved`
-- keeps its prior semantics exactly, since test code reassigns it directly
-- to simulate various G2 store states.
local otherStores={}
ModData={
    getOrCreate=function(tag)
        if tag=="ConspiracyFiles.Generated.G2" then return saved end
        otherStores[tag]=otherStores[tag] or {}; return otherStores[tag]
    end,
    get=function(tag)
        if tag=="ConspiracyFiles.Generated.G2" then return saved end
        return otherStores[tag]
    end
}
local result={version="T3-nearby-2",buildings=4,map="mock",gameVersion="42.20",anchor={x=0,y=0},rows={}}
for _,x in ipairs({0,20,40,60}) do
    result.rows[#result.rows+1]={kind="building",id=tostring(x),x=x,y=0,x2=x+2,y2=2,minLevel=0}
    result.rows[#result.rows+1]={kind="rect",building=tostring(x),x=x,y=0,z=0,w=2,h=2}
end
local probe={start=function() return true end,result=result}
package.preload["ConspiracyFiles/T3Nearby"]=function() return probe end
package.preload["ConspiracyFiles/GeneratedMenu"]=function() return {} end
package.preload["ConspiracyFiles/NotebookToolbar"]=function() return {} end
local R=require("ConspiracyFiles/GeneratedRuntime")
local originalStore=saved
saved=setmetatable({},{__newindex=function() error('injected initial campaign write failure') end})
assert(R.start(1));for i=1,80 do events.tick() end
assert(originalStore.campaign==nil and #R.known()==0,'initial failed write grants no case or knowledge')
for _,c in pairs(containers) do assert(#c.items==0,'initial failed save places nothing') end
saved=originalStore
assert(R.start(1))
for i=1,80 do events.tick() end
assert(saved.campaign and saved.campaign.canonical)
local count=0; local item
for _,c in pairs(containers) do count=count+#c.items; item=item or c.items[1] end
-- One physical item per document, EXCEPT where the count is the evidence: a
-- pile of the same ordinary thing is one document and many items (2026-09-09,
-- ObjectRules.accumulation / misplacedBulk). Summing the documents' own
-- quantities keeps this an exactness check rather than weakening it to ">=".
local firstEvidence=0
for _,d in ipairs(saved.campaign.canonical.case.documents) do firstEvidence=firstEvidence+(d.quantity or 1) end
assert(count==firstEvidence, 'one physical item per evidence role, or one pile of the stated size')
local seenTypes={}
for _,c in pairs(containers) do for _,v in ipairs(c.items) do seenTypes[v.fullType]=true end end
assert(seenTypes['Base.Note'], 'minimum anonymous lead carrier missing')
assert(#R.known()==0, 'placement must not discover')
assert(not R.inspect(item), 'inspection requires possession')
local origin=item.container
for i,v in ipairs(origin.items) do if v==item then table.remove(origin.items,i); break end end
inventory:AddItem(item)
assert(R.inspect(item)); assert(#R.known()==1)
local token=item:getModData().cfPhysicalToken
local body=R.known()[1].body
local function waitPlaced(getRoot,limit)
 for _=1,limit do
  local done=true;for _,a in pairs(getRoot().assignments) do if a.status~="placed" then done=false end end
  if done then return true end;events.tick()
 end
 return false
end
assert(waitPlaced(function() return saved.campaign.canonical end,400),'bounded wait places every first-case item before next case')
-- Exercise additive upgrade from an actual legacy-only save.
local legacyRoot=saved.campaign.canonical
saved={canonical=legacyRoot};assert(R.start(99))
assert(R.known()[1].body==body,'legacy save opens before upgrade')
assert(R.nextCase(2), 'explicit debug next-case request starts')
for i=1,160 do events.tick() end
assert(saved.canonical==legacyRoot,'legacy fallback is retained unchanged')
assert(saved.campaign.successive and #saved.campaign.successive.cases==1, 'second case is staged beside legacy canonical')
count=#inventory.items; for _,c in pairs(containers) do count=count+#c.items end
local secondEvidence=0
for _,d in ipairs(saved.campaign.successive.cases[1].case.documents) do secondEvidence=secondEvidence+(d.quantity or 1) end
assert(count==firstEvidence+secondEvidence, 'second case adds its selected evidence roles')
assert(R.known()[1].body==body, 'old discovery remains first globally')
local newItem
local secondIds={};for id in pairs(saved.campaign.successive.cases[1].assignments) do secondIds[id]=true end
for _,c in pairs(containers) do for _,candidate in ipairs(c.items) do if secondIds[candidate:getModData().cfGeneratedId] then newItem=candidate end end end
local runtimeStart=events.start
getWorld=function() return {getMap=function() return "mock" end} end
local pen=false
inventory.containsTypeRecurse=function(_,name) return pen and name=="BluePen" end
inventory.containsTagRecurse=function() return false end
ItemTag={get=function(v) return v end};ResourceLocation={of=function(v) return v end}
local Markers=require("ConspiracyFiles/ClueMarkers");events.start=runtimeStart
local function capture(item)
 local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
 local root=Cases.find(saved.campaign,item:getModData().cfGeneratedId)
 local t=root.assignments[item:getModData().cfGeneratedId].target
 local sq=record{getX=t.x,getY=t.y,getZ=t.z}
 return Markers.before(player,item,{isInCharacterInventory=function() return false end,getSourceGrid=function() return sq end},{isInCharacterInventory=function() return true end},sq)
end
local newFinding=capture(newItem);assert(newFinding,'real second-case capture')
local newOrigin=newItem.container; for i,v in ipairs(newOrigin.items) do if v==newItem then table.remove(newOrigin.items,i); break end end
inventory:AddItem(newItem);Markers.after(newFinding,newItem); assert(R.inspect(newItem)); assert(#R.known()==2 and R.known()[1].body==body, 'interleaved new discovery appends without renumbering old evidence')
Markers.update();assert(not playerData["ConspiracyFiles.ClueMarkers"].records[newItem:getModData().cfGeneratedId].written)
pen=true;Markers.update()
local mark=playerData["ConspiracyFiles.ClueMarkers"].records[newItem:getModData().cfGeneratedId]
assert(mark.written and mark.ink=="BluePen" and mark.x==newFinding.x)
local late
for _,c in pairs(containers) do for _,v in ipairs(c.items) do if saved.campaign.canonical.assignments[v:getModData().cfGeneratedId] then late=v end end end
assert(late,'remaining old document exists');local lateFinding=capture(late)
local lateOrigin=late.container;for i,v in ipairs(lateOrigin.items) do if v==late then table.remove(lateOrigin.items,i);break end end
inventory:AddItem(late);Markers.after(lateFinding,late)
local stableStore=saved;local stableCampaign=saved.campaign
saved=setmetatable({},{__index=stableStore,__newindex=function() error('injected durable field failure') end})
assert(not pcall(R.inspect,late),'failed single-field write propagates')
assert(stableStore.campaign==stableCampaign and #R.known()==2,'failed write preserves durable and local knowledge')
saved=stableStore;assert(R.inspect(late));assert(R.known()[2].id==newItem:getModData().cfGeneratedId and R.known()[3].id==late:getModData().cfGeneratedId)
Markers.update()
UIFont={Small=1};getTextManager=function() return {getFontHeight=function() return 12 end,MeasureStringX=function(_,_,v) return #v end} end
local texts={};local map={width=1000,height=800,mapAPI={getZoomF=function() return 18 end,worldToUIX=function(_,x) return x+100 end,worldToUIY=function(_,x,y) return y+100 end},drawText=function(_,text) texts[#texts+1]=text end}
Markers.draw(map);local all=table.concat(texts,'|');assert(all:find('#2 ',1,true) and all:find('#3 ',1,true),'global marker numbering matches interleaved notebook projection')
texts={};Markers.drawRecords(map,{known={'fixture'},case={documents={{id='fixture',title='Isolated fixture'}}}},{records={fixture={x=0,y=0,z=0,map='mock',written=true,ink='BluePen'}}})
assert(table.concat(texts,'|'):find('Isolated fixture',1,true),'fixture renderer uses supplied context')
print('PASS two-case marker capture, ink catch-up, interleaved projection and failed durable write')
assert(R.start(999), 'existing case resumes rather than rerolls')
for i=1,80 do events.tick() end
assert(R.known()[1].body==body)
count=#inventory.items; for _,c in pairs(containers) do count=count+#c.items end
assert(count==firstEvidence+secondEvidence, 'resume must not duplicate evidence')
events.start(); for i=1,130 do events.tick() end
assert(R.known()[1].body==body, 'game-load restore retains discoveries')
local duplicate=instanceItem(); duplicate:getModData().cfPhysicalToken=token; inventory:AddItem(duplicate)
for i=1,200 do events.tick() end
local id=item:getModData().cfGeneratedId
assert(saved.campaign.canonical.assignments[id].status=='conflict')
assert(not R.inspect(item))
-- No further distinct observed storage is available after the two retained cases.
assert(R.nextCase(3)); for i=1,160 do events.tick() end
assert(#saved.campaign.successive.cases==1, 'insufficient distinct storage defers without replacing prior cases')
print('PASS G2 mock: loaded storage -> generated case -> 3 placed notes -> owned Inspect -> saved discovery -> resume without reroll/duplication -> duplicate conflict')

local file=assert(io.open('mod/common/media/lua/client/ConspiracyFiles/Notebook.lua','r'));local source=file:read('*a');file:close()
local start=assert(source:find('local function generatedRows(section)',1,true));local finish=assert(source:find('function Window:rows()',start,true))
local chunk=assert(loadstring(source:sub(start,finish-1)..' return generatedRows'))
local env=setmetatable({generated=function() return R end,PlaceNames={render=function(text,case) return case.caseId..'|'..text end}},{__index=_G});setfenv(chunk,env)
local notebookRows=chunk()('evidence')
assert(notebookRows[2].id==newItem:getModData().cfGeneratedId and notebookRows[2].ordinal==2)
assert(notebookRows[2].detailText:find(saved.campaign.successive.cases[1].case.caseId,1,true)==1,'notebook resolves new owning case')
assert(notebookRows[3].detailText:find(saved.campaign.canonical.case.caseId,1,true)==1,'late old clue resolves original owning case')
Markers.update();assert(playerData['ConspiracyFiles.ClueMarkers'].records[newItem:getModData().cfGeneratedId].ink=='BluePen')
assert(saved.canonical==legacyRoot,'later discoveries never rewrite fallback')
print('PASS real notebook projection, legacy upgrade, global ordinals and frozen ink after reload')
-- Inspect every remaining physical kind in both cases, beyond the old aggregate cap.
-- One item per DOCUMENT, not per item: a pile is six bottles of the same
-- ordinary thing and one discovery (2026-09-09). Picking one out of the pile
-- is enough to have found it, which is also the right gameplay answer - nobody
-- should have to pocket all six.
-- Anything already discovered stays discovered, and a pile leaves siblings on
-- the shelf after one of them has been taken. Seeding from what is already
-- known keeps this loop to documents nobody has found yet.
local remaining,seenDocuments={},{}
for _,row in ipairs(R.known()) do seenDocuments[row.id]=true end
seenDocuments[newItem:getModData().cfGeneratedId]=true
for _,c in pairs(containers) do for _,v in ipairs(c.items) do
 local docId=v:getModData().cfGeneratedId
 if not seenDocuments[docId] then seenDocuments[docId]=true; remaining[#remaining+1]=v end
end end
-- Capture the live case before discovering everything: completing a case now
-- retires it, dropping the case envelope this tamper check needs. Retirement
-- is orthogonal to tamper rejection, so the check keeps testing a live case.
local tamperSource=saved.campaign.successive.cases[1].case
for _,v in ipairs(remaining) do
 local finding=assert(capture(v));local c=v.container
 for n,other in ipairs(c.items) do if other==v then table.remove(c.items,n);break end end
 inventory:AddItem(v);Markers.after(finding,v);assert(R.inspect(v))
end
local all=R.known()
-- Documents, not items: a pile is many items and one thing learned.
local firstDocs=#saved.canonical.case.documents
local secondDocs=#tamperSource.documents
assert(#all==firstDocs+secondDocs,'all selected evidence items remain learnable')
local kinds={};for _,v in ipairs(all) do kinds[v.kind]=true end
assert(kinds.dispatch,'every case retains its core dispatch lead')
local G=require('ConspiracyFiles/Generated/Generator')
local altered=assert(G.restore(tamperSource))
altered.documents[1].kind='Base.Axe';assert(not G.validate(altered),'physical kind tampering rejected before placement')
events.start();assert(#R.known()==firstDocs+secondDocs,'all selected discoveries survive runtime reload')
for n,v in ipairs(R.known()) do assert(v.id==all[n].id and v.body==all[n].body,'discovery order and rich text immutable on reload') end
print('PASS variable mixed evidence discoveries, registry projection, tamper rejection and reload')
