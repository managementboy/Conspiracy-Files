-- Debug fixture only.  It never participates in generated evidence or marker saves.
ConspiracyFiles=ConspiracyFiles or {}
local T=ConspiracyFiles.MarkerColourTest or {};ConspiracyFiles.MarkerColourTest=T
if T.loaded then return T end
local items,records,started,tick={},{},false,nil
local owner,last=nil,0
local KEY="cfMarkerColourTest"
local function allowed()
 return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
  and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
end
local function player() return getPlayer and getPlayer() end
local function owned(item,p) return item and p and item:getOutermostContainer()==p:getInventory() end
local function currentMap() return tostring(getWorld():getMap()) end
local function add(context,key,label,callback,disabled)
 for _,option in ipairs(context.options or {}) do if option.cfMarkerColourTest==key then return option end end
 local option=context:addOption(label,nil,callback)
 if option then option.cfMarkerColourTest=key;option.notAvailable=disabled==true end
 return option
end
local function isFixture(item)
 for _,candidate in ipairs(items) do if candidate==item then return true end end
 return false
end
local function inspect(item)
 local p=player();if not isFixture(item) or not owned(item,p) then return end
 local r=records[item];if r then r.known=true end
end
function T.fill(playerNum,context,selected)
 if not allowed() or not context or playerNum~=0 or player()~=owner then return end
 local normalize=ConspiracyFiles.ContextMenu and ConspiracyFiles.ContextMenu.normalize
 if not normalize then return end
 local choices,overflow=normalize(selected)
 if overflow or #choices~=1 or not isFixture(choices[1]) then return end
 local item=choices[1];local p=getSpecificPlayer(playerNum)
 add(context,"ConspiracyFiles:MarkerColourTest","Inspect Temporary Marker Test",function()
  local m=ConspiracyFiles.MarkerColourTest;if m then pcall(inspect,item) end
 end,not owned(item,p))
end
function T.update()
 if not allowed() or player()~=owner then return end
 local p=player();local markers=ConspiracyFiles.ClueMarkers
 if not p or not markers or not markers.writingTool then return end
 local ink=markers.writingTool(p);if not ink then return end
 for _,item in ipairs(items) do
  local r=records[item]
  if r and r.known and not r.written then r.written=true;r.ink=ink end
 end
end
function T.draw(ui)
 if not allowed() or not started or player()~=owner then return end
 local markers=ConspiracyFiles.ClueMarkers;if not markers or not markers.drawRecords then return end
 local known,documents,out={}, {},{schema=1,records={}}
 for i,item in ipairs(items) do
  local r=records[item]
  if r and r.known then
   local id="temporary-marker-colour-"..i;known[#known+1]=id
   documents[#documents+1]={id=id,title=item:getName()}
   out.records[id]={x=r.x,y=r.y,z=r.z,map=r.map,written=r.written,ink=r.ink}
  end
 end
 markers.drawRecords(ui,{known=known,case={documents=documents}},out)
end
function T.start()
 if not allowed() then return false end
 if started then return true end
 local p=player();local square=p and p:getCurrentSquare();if not square then return false end
 -- Mark the attempt before creating anything: a partial engine failure stays bounded.
 started=true;owner=p
 for i,name in ipairs({"TEMP TEST A - marker colour","TEMP TEST B - marker colour"}) do
  -- Vanilla OnBreak.lua: string overload returns InventoryItem, not IsoWorldInventoryObject.
  local item=square:AddWorldInventoryItem("Base.Note",0.5,0.5,0.0)
 if not item then print("[CF-MARKER-TEST] Spawn stopped before all notes were created.");return false end
  item:setName(name);item:setCustomName(true);item:getModData()[KEY]=true
  items[i]=item;records[item]={x=square:getX(),y=square:getY(),z=square:getZ(),map=currentMap(),known=false,written=false}
 end
 if not T.menuHandler then
  T.menuHandler=function(playerNum,context,selected) local m=ConspiracyFiles.MarkerColourTest;if m then pcall(m.fill,playerNum,context,selected) end end
  Events.OnFillInventoryObjectContextMenu.Add(T.menuHandler)
 end
 if not T.renderHook then
  require("ISUI/Maps/ISWorldMap");local previous=ISWorldMap.render
  ISWorldMap.render=function(ui,...)
   previous(ui,...);local m=ConspiracyFiles.MarkerColourTest;if m then pcall(m.draw,ui) end
  end
  T.renderHook=true
 end
 if tick then Events.OnTick.Remove(tick) end
 tick=function()
  local now=getTimeInMillis();if now-last<1000 then return end;last=now
  local m=ConspiracyFiles.MarkerColourTest;if m then pcall(m.update) end end
 Events.OnTick.Add(tick)
 print("[CF-MARKER-TEST] Spawned two temporary notes at the current square. Pick up one, then inspect it from inventory.")
 return true
end
function T.stop() if tick then Events.OnTick.Remove(tick);tick=nil end end
T.loaded=true
return T
