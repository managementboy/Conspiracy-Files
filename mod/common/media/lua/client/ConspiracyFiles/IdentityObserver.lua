-- Observe only rows already displayed by the selected native inventory pane.
require "ISUI/ISInventoryPane"
local Model=require("ConspiracyFiles/IdentityObservations")
local Budget=require("ConspiracyFiles/SaveBudget")
local Log=require("ConspiracyFiles/DiscoveryLog")
ConspiracyFiles=ConspiracyFiles or {}
local I=ConspiracyFiles.IdentityObserver or {}
ConspiracyFiles.IdentityObserver=I
local TAG="ConspiracyFiles.IdentityObservations"
local types={['Base.IDcard']=true,['Base.IDcard_Stolen']=true,['Base.IDcard_Female']=true,
 ['Base.IDcard_Male']=true,['Base.CreditCard']=true,['Base.CreditCard_Stolen']=true,['Base.ParkingTicket']=true,['Base.SpeedingTicket']=true,['Base.BusinessCard']=true,['Base.BusinessCard_Personal']=true,['Base.BusinessCard_Nolans']=true,['Base.Passport']=true,['Base.PressID']=true,['Base.Badge']=true,['Base.Diary1']=true,['Base.Diary2']=true}
local queue,queued,seen={},{},{}
local elapsed=0
local function read(o,key)
 if not o then return nil end
 local ok,v=pcall(function() if o[key] then return o[key](o) end end)
 if ok then return v end
end
local function supported()
 if not (getDebug and getDebug()) or (isClient and isClient()) or (isServer and isServer()) then return false end
 if ConspiracyFiles.T11Mode or ConspiracyFiles.T12Mode then return false end
 local rt=ConspiracyFiles.GeneratedRuntime
 return rt and rt.metrics and rt.metrics()~=nil
end
local function root()
 local store=ModData.get(TAG)
 if not store then return Model.empty() end
 for k in pairs(store) do if k~="canonical" then error("unknown identity store field") end end
 if store.canonical~=nil then return store.canonical end
 return Model.empty()
end
function I.rows()
 local ok,result=pcall(function() local r=root();if Model.validate(r) then return Model.rows(r) end;return {} end)
 return ok and result or {}
end
local function clean(value,limit)
 if type(value)~="string" then return nil end
 value=value:gsub("[%c]"," "):sub(1,limit)
 if not value:find("%S") then return nil end
 return value
end
-- Seven silent early returns made "the pane is open and nothing happens"
-- undiagnosable. Report the gate that stopped a pane, throttled, and only
-- for gates that are actually surprising -- the player's own inventory and
-- invisible panes are the overwhelmingly common benign cases and stay quiet.
local lastGateLog=0
local function gate(reason)
 local now=(getTimeInMillis and getTimeInMillis()) or 0
 if now-lastGateLog>=2000 then lastGateLog=now; print("[CF-IDENTITY] pane skipped: "..tostring(reason)) end
 return nil
end
-- Build 42's default loot view is a merged proximity container (type
-- "proxInv") that is neither a corpse nor a bag. Judging the whole pane by
-- its container therefore switched the observer off in the view players
-- actually use. Resolve each ROW's own container instead: that fixes the
-- merged view and keeps provenance honest when two corpses appear in one
-- list, since each item still reports the body it really came from.
local function describeContainer(c,player)
 if not c or c==read(player,"getInventory") then return nil end
 local owner=read(c,"getParent")
 if owner and instanceof(owner,"IsoDeadBody") then return "corpse","corpse" end
 local bag=read(c,"getContainingItem")
 if bag then
  local name=clean(read(bag,"getDisplayName"),120)
  if name then return name,"container" end
 end
 return nil
end
I.sawRender=false
function I.afterRender(pane)
 if not I.sawRender then I.sawRender=true; print("[CF-IDENTITY] afterRender reached for the first time") end
 if not supported() then return gate("observer unsupported (debug/MP/runtime gate)") end
 if #queue>=16 then return gate("queue full") end
 if pane.mode~="details" then return gate("pane mode is "..tostring(pane.mode)..", expected details") end
 if pane.dragStarted then return end
 if read(pane,"isReallyVisible")~=true then return end
 if not pane.parent or pane.parent.isCollapsed then return end
 if read(pane.parent,"isReallyVisible")~=true then return end
 local player=getSpecificPlayer(pane.player)
 if not player or player~=getPlayer() then return end
 local container=pane.inventory
 if not container then return end
 if container==read(player,"getInventory") then return end
 -- Each row is judged on its own container below, so a mixed or merged pane
 -- contributes exactly the rows that really sit in a corpse or a bag.
 local h,header,scroll,height=pane.itemHgt,pane.headerHgt,read(pane,"getYScroll"),read(pane,"getHeight")
 if type(h)~="number" or h<=0 or type(header)~="number" or type(scroll)~="number" or type(height)~="number" then return end
 local rows=pane.items
 if type(rows)~="table" then return end
 local first=math.max(1,math.ceil(-scroll/h)+1)
 -- At most sixteen fully visible rows per pane/frame; rotate across tall panes.
 local last=math.min(#rows,math.floor((height-header-scroll)/h))
 if last<first then return end
 -- Count what the loop actually accepted. An accepted pane that records
 -- nothing is otherwise indistinguishable from a pane never rendered.
 -- Report only a WATCHED item that went unrecorded, naming the check that
 -- rejected it. Logging every pane that records nothing cried wolf: ten rows
 -- of clothing recording nothing is normal, not a defect.
 local considered,accepted,missed=0,0,nil
 local start=pane.cfIdentityCursor or first
 if start<first or start>last then start=first end
 for n=0,math.min(15,last-first) do
  local index=first+(start-first+n)%(last-first+1)
  local row=rows[index]
  local item=instanceof(row,"InventoryItem") and row or (type(row)=="table" and row.items and row.items[1])
  if not item then missed=missed or ("row "..index.." resolved to no item; rowType="..type(row)) end
  considered=considered+1
  local fullType=read(item,"getFullType")
  local people=ConspiracyFiles.LocalPersonRuntime
  local itemContainer=read(item,"getContainer")
  local label,source=describeContainer(itemContainer,player)
  if people and people.see and fullType and read(item,"isHidden")~=true and itemContainer then
   pcall(people.see,item,itemContainer)
  end
  -- A carrier stamped by GeneratedRuntime (cfGeneratedId set in ModData) is
  -- generated-case evidence, not a plain identity document: it already gets
  -- its own notebook row and ledger event, so it must not also become an
  -- identity observation here. See EvidenceKinds.lua for the shared fullType
  -- collision this guards against (Base.IDcard, Base.CreditCard,
  -- Base.BusinessCard, Base.ParkingTicket).
  local md=read(item,"getModData")
  local generatedEvidence=type(md)=="table" and md.cfGeneratedId~=nil
  if types[fullType] and not generatedEvidence and not label then
   missed=missed or (tostring(fullType).." has no corpse/bag container; itemContainer="..tostring(itemContainer))
  end
  if types[fullType] and not generatedEvidence and read(item,"isHidden")~=true and label then
   local id=read(item,"getID")
   local name=clean(read(item,"getDisplayName"),180)
   if not (type(id)=="number" and id~=0 and name) then
    missed=missed or (tostring(fullType).." rejected: id="..tostring(id).." name="..tostring(name))
   end
   if type(id)=="number" and id==id and math.abs(id)<9007199254740992 and id~=0 and name then
    local key=fullType..":"..tostring(id)
    if not queued[key] and not seen[key] and #queue<16 then
     local record={id=key,fullType=fullType,label=name,source=source,container=label,
      x=read(player,"getX"),y=read(player,"getY"),z=read(player,"getZ"),observedAt=read(getGameTime(),"getWorldAgeHours")}
     queue[#queue+1]=record;queued[key]=true;accepted=accepted+1
    end
   end
  end
 end
 if accepted==0 and missed then
  gate("watched item not recorded: "..missed.." (rows="..#rows..", considered="..considered..
   ", containerType="..tostring(read(container,"getType"))..")")
 end
 pane.cfIdentityCursor=first+(start-first+16)%(last-first+1)
end
function I.flush()
 if not supported() then queue={};queued={};return end
 local record=table.remove(queue,1)
 if not record then return end
 queued[record.id]=nil
 local staged,changed=Model.add(root(),record)
 if not staged then return end
 if not changed then seen[record.id]=true;return end
 if not Budget.check("identities",{canonical=staged}) then return end
 -- Sole replacement only after full domain and aggregate validation.
 local store=ModData.getOrCreate(TAG)
 store.canonical=staged
 seen[record.id]=true
 -- Chronological order lives in one shared ledger, not per-source lists.
 Log.record("identity","identity:"..record.id)
 local ui=ConspiracyFiles.NotebookUI
 if ui and ui.refresh then ui.refresh() end
end
function I.tick()
 elapsed=elapsed+1
 if elapsed%10~=0 then return end
 local ok,err=pcall(I.flush)
 if not ok then print("[CF-IDENTITY] Observation deferred: "..tostring(err)) end
end
print("[CF-IDENTITY] load: renderHookInstalled="..tostring(I.originalRender~=nil)..
 " tickHandler="..tostring(I.tickHandler~=nil))
if not I.originalRender then
 I.originalRender=ISInventoryPane.render
 ISInventoryPane.render=function(self,...)
  I.originalRender(self,...)
  pcall(I.afterRender,self)
 end
end
if Events and Events.OnTick and not I.tickHandler then
 I.tickHandler=function() I.tick() end
 Events.OnTick.Add(I.tickHandler)
end
function I.reset() queue={};queued={};seen={};elapsed=0 end
if Events and Events.OnGameStart and not I.startHandler then
 -- Seven modules are reached only by PZ executing their file, with nothing
 -- requiring them. Two are load-bearing: AutomaticInvestigations makes cases
 -- appear without console commands, and LocalPersonHooks installs the door
 -- and transfer hooks the whole person/key strand depends on. PlayerVoice did
 -- the same thing and silently never loaded (86ade2c), so this reports the
 -- truth at game start instead of leaving it to be discovered mid-test.
 local function reportModules()
  local expected={"AutomaticInvestigations","LocalPersonHooks","LocalPersonRuntime",
   "GeneratedRuntime","DiscoveryLog","PlayerVoice","PersonNameLog","ClueHints",
   "ClueMarkers","IdentityObserver","NotebookUI","ObservedKeyLeads","EvidencePickupHint"}
  local missing={}
  for _,name in ipairs(expected) do
   if ConspiracyFiles[name]==nil then missing[#missing+1]=name end
  end
  if #missing==0 then print("[CF-SELFCHECK] all "..#expected.." expected modules loaded")
  else print("[CF-SELFCHECK] NOT LOADED: "..table.concat(missing,", ")) end
 end
 I.startHandler=function() I.reset(); pcall(reportModules) end
 Events.OnGameStart.Add(I.startHandler)
end
return I
