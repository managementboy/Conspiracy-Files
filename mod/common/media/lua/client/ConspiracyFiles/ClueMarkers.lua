-- Generated-clue finding records and persistent, writing-tool-gated map overlay.
local V=require("ConspiracyFiles/Validator")
local Layout=require("ConspiracyFiles/MarkerLayout")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
ConspiracyFiles=ConspiracyFiles or {}
if ConspiracyFiles.ClueMarkers then ConspiracyFiles.ClueMarkers.stop() end
local M={};ConspiracyFiles.ClueMarkers=M
local TAG="ConspiracyFiles.ClueMarkers"
local handler,last= nil,0
local pens={"Pen","Pencil","RedPen","BluePen","GreenPen"}
-- Vanilla ISWorldMapSymbols palette, in its deterministic tool priority order.
local inks={Pen={0.129,0.129,0.129},Pencil={0.2,0.2,0.2},RedPen={0.65,0.054,0.054},BluePen={0.156,0.188,0.49},GreenPen={0.06,0.39,0.17}}
local questionTexture
local CFLog=require("ConspiracyFiles/Log")
local function log(s) CFLog.message("marker","marker",s) end
local function allowed()
 return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
  and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
end
-- Cached: validating the store every call cost ~20 ms, several times a frame
-- while the map was open (see SuccessiveCases.currentCached).
local function wrapper() local w=ModData.get("ConspiracyFiles.Generated.G2");return w and Cases.currentCached(w,getTimeInMillis and getTimeInMillis()) end
local function session(id)
 local w=wrapper();return w and (id and Cases.find(w,id) or w.canonical)
end
local function discoveries() local w=wrapper();return w and Cases.discoveries(w) or {} end
-- A completed case is retired to {caseId,rows,known}: no assignments and no
-- case envelope. Completing a case threw here and stopped the marker worker
-- (Linux core-loop run, 2026-09-11), the same class as 3fe1813. So every read
-- below goes through these two, which work for live and retired cases alike.
local function conflicted(c,id)
 local a=c and c.assignments and c.assignments[id]
 return a~=nil and a.status=="conflict"
end
local function titleOf(root,id)
 local docs=root and ((root.case and root.case.documents) or root.rows) or {}
 for _,d in ipairs(docs) do if d.id==id then return d.title end end
 return nil
end
local function valid(r)
 local ok=V.validateStructure(r)
 if not ok or type(r)~="table" or r.schema~=1 or type(r.records)~="table" or V.estimateEncodedBytes(r)>24000 then return false end
 for k in pairs(r) do if k~="schema" and k~="records" then return false end end
 local n=0
 for id,v in pairs(r.records) do
  n=n+1
  if n>64 or type(id)~="string" or #id>160 or type(v)~="table" or type(v.map)~="string" or #v.map>1000 or type(v.written)~="boolean" then return false end
  for k in pairs(v) do if k~="x" and k~="y" and k~="z" and k~="map" and k~="written" and k~="ink" then return false end end
  if v.ink~=nil and (type(v.ink)~="string" or not inks[v.ink] or not v.written) then return false end
  for _,k in ipairs({"x","y","z"}) do if type(v[k])~="number" or v[k]~=math.floor(v[k]) or math.abs(v[k])>100000 then return false end end
 end
 return true
end
-- read() runs on every tick through M.update, and valid() walks and measures
-- the whole record store: 1.7 ms average and 20 ms at worst on the Linux test
-- laptop (writecost check, 2026-09-12), over a 2 ms per-frame budget. Every
-- writer here is copy-on-write - commit() always stores a NEW table built by
-- copy() - so the same table validated once is the same data, and the check is
-- skipped by identity. The table being written is always validated in full.
local validated=nil
local function read()
 local p=getPlayer();if not p then return end
 local r=p:getModData()[TAG]
 if r==nil then return {schema=1,records={}} end
 if r~=validated then
  if not valid(r) then error("saved marker records refused") end
  validated=r
 end
 return r
end
local function copy(r)
 local out={schema=1,records={}}
 for id,v in pairs(r.records) do out.records[id]={x=v.x,y=v.y,z=v.z,map=v.map,written=v.written,ink=v.ink} end
 return out
end
local function commit(r)
 if not valid(r) then error("marker data invalid or budget exceeded") end
 local within,why=require("ConspiracyFiles/SaveBudget").check("markers",r)
 if not within then error(why) end
 getPlayer():getModData()[TAG]=r
 validated=r
end
function M.writingTool(player)
 local inv=player and player:getInventory();if not inv then return false end
 for _,name in ipairs(pens) do
  if inv:containsTypeRecurse(name) or inv:containsTagRecurse(ItemTag.get(ResourceLocation.of(name))) then return name end
 end
 return false
end
function M.canWrite(player) return M.writingTool(player)~=false end
local function known(c,id)
 for _,v in ipairs(c.known) do if v==id then return true end end
 return false
end
-- Where a source container stands. A car's part container (glove box, seat,
-- trunk) has no grid square of its own - getSourceGrid() is nil - so a clue
-- taken from a car recorded no finding location and never got a map mark
-- (Linux probe, 2026-09-11: GloveBox getSourceGrid=nil). Its vehicle does.
local function sourceSquare(source)
 if not source then return nil end
 local grid=source:getSourceGrid();if grid then return grid end
 local parent=source:getParent()
 if parent and instanceof and instanceof(parent,"BaseVehicle") then return parent:getSquare() end
 return nil
end
-- Called before vanilla removes the item. Never use a placement target or reading position.
function M.before(character,item,source,destination,square)
 if not allowed() or character~=getPlayer() or not destination or not destination:isInCharacterInventory(character) then return end
 if not session() then return end
 if source and source:isInCharacterInventory(character) then return end
 if item and instanceof and instanceof(item,"InventoryContainer") then
  local w=item:getWorldItem();local origin=square or (w and w:getSquare()) or sourceSquare(source)
  if not origin then return end
  local pending={children={}};local queue={item:getInventory()};local cursor,seen,count=1,{},0
  while queue[cursor] do
   local container=queue[cursor];cursor=cursor+1
   if not seen[container] then
    seen[container]=true;local items=container:getItems()
    for i=0,items:size()-1 do
     count=count+1;if count>512 then error("bag pickup exceeds marker capture limit") end
     local child=items:get(i)
     if instanceof(child,"InventoryContainer") then queue[#queue+1]=child:getInventory()
     else local candidate=M.before(character,child,source,destination,origin)
      if candidate then pending.children[#pending.children+1]={candidate=candidate,item=child} end
     end
    end
   end
  end
  return pending
 end
 local md=item and item:getModData();local c=md and session(md.cfGeneratedId);local a=c and c.assignments[md.cfGeneratedId]
 if not a or a.status=="conflict" or md.cfPhysicalToken~=a.physicalToken then return end
 local r=read();if r.records[md.cfGeneratedId] or known(c,md.cfGeneratedId) then return end
 if not square then local w=item:getWorldItem();square=w and w:getSquare() or sourceSquare(source) end
 if not square then return end
 return {id=md.cfGeneratedId,token=a.physicalToken,x=square:getX(),y=square:getY(),z=square:getZ(),map=tostring(getWorld():getMap())}
end
function M.after(candidate,item)
 if candidate and candidate.children then
  for _,entry in ipairs(candidate.children) do M.after(entry.candidate,entry.item) end
  return
 end
 if not candidate or not item or item:getOutermostContainer()~=getPlayer():getInventory() then return end
 local md=item:getModData();if md.cfGeneratedId~=candidate.id or md.cfPhysicalToken~=candidate.token then return end
 local c=session(candidate.id);local a=c and c.assignments[candidate.id]
 if not a or a.physicalToken~=candidate.token or a.status=="conflict" then return end
 local r=read();if r.records[candidate.id] then return end
 local next=copy(r);next.records[candidate.id]={x=candidate.x,y=candidate.y,z=candidate.z,map=candidate.map,written=false}
 commit(next);log("Finding location recorded. Inspect the item to add it to your evidence.")
end
function M.update()
 if not allowed() or not getPlayer() then return end
 if not session() then return end
 local r=read();local next
 for _,id in ipairs(discoveries()) do local c=session(id)
  local v=r.records[id]
  -- A recorded finding is written once a tool is held, whether its case is
  -- still live or already retired; only a conflicted document is refused.
  if v and not v.written and c and not conflicted(c,id) and v.map==tostring(getWorld():getMap()) then
   local ink=M.writingTool(getPlayer());if not ink then return end
   next=next or copy(r);next.records[id].written=true;next.records[id].ink=ink
  end
 end
 if next then
  commit(next);log("Pending clue locations added to the map.")
  local ui=ConspiracyFiles.NotebookUI
  if ui and ui.refresh then pcall(ui.refresh) end
 end
end
function M.note(id)
 local c=session(id);if not c or not known(c,id) then return nil end
 local r=read();local v=r and r.records[id]
 if not v then return "Finding location was not recorded; no map mark is available." end
 if v.written then return "Finding location marked on your world map." end
 if conflicted(c,id) then return "Map marking is unavailable for this document." end
 return "Finding location remembered. Map marking waits for a pen or pencil."
end
function M.status()
 local r=read();local written,pending,missing=0,0,0
 if r then for _,id in ipairs(discoveries()) do local v=r.records[id]
  if not v then missing=missing+1 elseif v.written then written=written+1 else pending=pending+1 end
 end end
 log("Marked="..written.."; waiting for writing tool="..pending.."; historical finding location unavailable="..missing)
 return written,pending,missing
end
function M.drawRecords(ui,c,r)
 if not ui or not r or not ui.mapAPI or ui.mapAPI:getZoomF()<14 then return end
 local groups,order={},{}
 for i,id in ipairs(c.known) do
  local v=r.records[id]
  if v and v.written and v.map==tostring(getWorld():getMap()) then
   local key=v.x..":"..v.y..":"..v.z
   if not groups[key] then groups[key]={point=v,labels={}};order[#order+1]=key end
   local title=titleOf(c,id) or id
   local g=groups[key];g.labels[#g.labels+1]={number=i,title=title,floor=v.z,ink=v.ink}
  end
 end
 -- Match vanilla ISWorldMapSymbols:onAddNote: use the default text layer font.
 local font=UIFont.Handwritten or UIFont.Small
 local ok,nativeFont=pcall(function()
  local symbols=ui.mapAPI:getSymbolsAPIv2()
  return ui.mapAPI:getStyleAPI():getLayerByName(symbols:getDefaultTextLayerID()):getFont()
 end)
 if ok and nativeFont then font=nativeFont end
 -- Group by where markers land ON SCREEN, not by tile. Grouping only exact
 -- tiles meant two documents a tile apart in one house were laid out as if
 -- alone, and their labels printed over each other (2026-09-11, house 104:
 -- "two markings unreadable due to overwriting"). Markers whose question marks
 -- would sit within a label's height of each other now share one stacked label
 -- list; each keeps its own question mark at its own spot. Zoom in far enough
 -- and they separate again, which is the right behaviour for free.
 local clusters={}
 for _,key in ipairs(order) do
  local g=groups[key];local v=g.point
  local x,y=ui.mapAPI:worldToUIX(v.x+0.5,v.y+0.5),ui.mapAPI:worldToUIY(v.x+0.5,v.y+0.5)
  if x>16 and y>60 and x<ui.width-24 and y<ui.height-80 then
   local home
   for _,cluster in ipairs(clusters) do
    if math.abs(cluster.x-x)<=Layout.CLUSTER_X and math.abs(cluster.y-y)<=Layout.CLUSTER_Y then home=cluster;break end
   end
   if not home then home={x=x,y=y,points={},labels={}};clusters[#clusters+1]=home end
   home.points[#home.points+1]={x=x,y=y,ink=v.ink}
   for _,label in ipairs(g.labels) do home.labels[#home.labels+1]=label end
  end
 end
 local size=math.min(28,getTextManager():getFontHeight(font)+2)
 local h=getTextManager():getFontHeight(font)+2
 local measure=function(text) return getTextManager():MeasureStringX(font,text) end
 if questionTexture==nil and getTexture then questionTexture=getTexture("media/ui/LootableMaps/map_question.png") end
 for _,cluster in ipairs(clusters) do
  for _,point in ipairs(cluster.points) do
   -- Older records did not retain ink; display those in neutral graphite.
   local color=inks[point.ink] or inks.Pencil
   if questionTexture and ui.drawTextureScaled then
    ui:drawTextureScaled(questionTexture,point.x-size/2,point.y-size/2,size,size,1,color[1],color[2],color[3])
   else
    ui:drawText("?",point.x-4,point.y-8,color[1],color[2],color[3],1,font)
   end
  end
  -- Labels in discovery order, whatever tile each came from.
  table.sort(cluster.labels,function(a,b) return a.number<b.number end)
  local labels=Layout.layout(cluster.labels,cluster.x+size/2,cluster.y,{left=16,top=60,right=ui.width-24,bottom=ui.height-80},h,measure)
  for i,label in ipairs(labels) do
   local ink=inks[cluster.labels[i].ink] or inks.Pencil
   ui:drawText(label.text,label.x,label.y,ink[1],ink[2],ink[3],1,font)
  end
 end
end
function M.draw(ui)
 if not allowed() or not getPlayer() then return end
 if not session() then return end
 local c={known=discoveries(),case={documents={}}}
 for _,id in ipairs(c.known) do
  local title=titleOf(session(id),id)
  if title then c.case.documents[#c.case.documents+1]={id=id,title=title} end
 end
 M.drawRecords(ui,c,read())
end
local function safe(fn,...)
 local ok,result=pcall(fn,...);if not ok then log("Skipped: "..tostring(result));return end
 return result
end
function M.stop() if handler then Events.OnTick.Remove(handler);handler=nil end end
function M.start()
 if not allowed() then return false end
 require("TimedActions/ISTransferAction");require("TimedActions/ISGrabItemAction");require("ISUI/Maps/ISWorldMap")
 if not ConspiracyFiles.markerHooks then
  local transfer=ISTransferAction.transferItem
  ISTransferAction.transferItem=function(self,character,item,source,destination,...)
   local m=ConspiracyFiles.ClueMarkers
   local pending=safe(m.before,character,item,source,destination)
   local result=transfer(self,character,item,source,destination,...)
   safe(m.after,pending,result or item)
   return result
  end
  local grab=ISGrabItemAction.transferItem
  ISGrabItemAction.transferItem=function(self,worldItem,...)
   local m=ConspiracyFiles.ClueMarkers;local item=worldItem:getItem()
   local pending=safe(m.before,self.character,item,nil,self.destContainer,worldItem:getSquare())
   local result=grab(self,worldItem,...);safe(m.after,pending,item);return result
  end
  local render=ISWorldMap.render
  ISWorldMap.render=function(ui,...)
   render(ui,...)
   local m=ConspiracyFiles.ClueMarkers
   if not m.renderFailed then local ok,why=pcall(m.draw,ui);if not ok then m.renderFailed=true;log("Map overlay stopped: "..tostring(why)) end end
  end
  ConspiracyFiles.markerHooks=true
 end
 M.stop();last=0
 handler=function()
  if getTimeInMillis()-last<1000 then return end;last=getTimeInMillis()
  local ok,why=pcall(M.update);if not ok then M.stop();log("Worker stopped: "..tostring(why)) end
 end
 Events.OnTick.Add(handler);log("Clue markers active; pickup sources are now recorded.");M.status();return true
end
if not ConspiracyFiles.markerStartHook then
 Events.OnGameStart.Add(function() if ConspiracyFiles.ClueMarkers then safe(ConspiracyFiles.ClueMarkers.start) end end)
 ConspiracyFiles.markerStartHook=true
end
return M
