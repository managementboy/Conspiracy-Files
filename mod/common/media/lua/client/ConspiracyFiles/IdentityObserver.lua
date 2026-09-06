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
 ['Base.IDcard_Male']=true,['Base.CreditCard']=true,['Base.CreditCard_Stolen']=true,['Base.ParkingTicket']=true,['Base.SpeedingTicket']=true,['Base.BusinessCard']=true,['Base.BusinessCard_Personal']=true,['Base.BusinessCard_Nolans']=true}
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
function I.afterRender(pane)
 if not supported() or #queue>=16 or pane.mode~="details" or pane.dragStarted then return end
 if read(pane,"isReallyVisible")~=true or not pane.parent or pane.parent.isCollapsed then return end
 if read(pane.parent,"isReallyVisible")~=true then return end
 local player=getSpecificPlayer(pane.player)
 if not player or player~=getPlayer() then return end
 local container=pane.inventory
 if not container or container==read(player,"getInventory") then return end
 local owner=read(container,"getParent")
 local bag=read(container,"getContainingItem")
 local corpse=owner and instanceof(owner,"IsoDeadBody")
 if not corpse and not bag and (not owner or read(container,"getType")=="floor") then return end
 local label=bag and clean(read(bag,"getDisplayName"),120) or (corpse and "corpse" or clean(read(container,"getType"),120))
 if not label then return end
 local h,header,scroll,height=pane.itemHgt,pane.headerHgt,read(pane,"getYScroll"),read(pane,"getHeight")
 if type(h)~="number" or h<=0 or type(header)~="number" or type(scroll)~="number" or type(height)~="number" then return end
 local rows=pane.items
 if type(rows)~="table" then return end
 local first=math.max(1,math.ceil(-scroll/h)+1)
 -- At most sixteen fully visible rows per pane/frame; rotate across tall panes.
 local last=math.min(#rows,math.floor((height-header-scroll)/h))
 if last<first then return end
 local start=pane.cfIdentityCursor or first
 if start<first or start>last then start=first end
 for n=0,math.min(15,last-first) do
  local index=first+(start-first+n)%(last-first+1)
  local row=rows[index]
  local item=instanceof(row,"InventoryItem") and row or (type(row)=="table" and row.items and row.items[1])
  local fullType=read(item,"getFullType")
  local people=ConspiracyFiles.LocalPersonRuntime
  if people and people.see and fullType and read(item,"isHidden")~=true and read(item,"getContainer")==container then
   pcall(people.see,item,container)
  end
  -- A carrier stamped by GeneratedRuntime (cfGeneratedId set in ModData) is
  -- generated-case evidence, not a plain identity document: it already gets
  -- its own notebook row and ledger event, so it must not also become an
  -- identity observation here. See EvidenceKinds.lua for the shared fullType
  -- collision this guards against (Base.IDcard, Base.CreditCard,
  -- Base.BusinessCard, Base.ParkingTicket).
  local md=read(item,"getModData")
  local generatedEvidence=type(md)=="table" and md.cfGeneratedId~=nil
  if types[fullType] and not generatedEvidence and read(item,"isHidden")~=true and read(item,"getContainer")==container then
   local id=read(item,"getID")
   local name=clean(read(item,"getDisplayName"),180)
   if type(id)=="number" and id==id and math.abs(id)<9007199254740992 and id~=0 and name then
    local key=fullType..":"..tostring(id)
    if not queued[key] and not seen[key] and #queue<16 then
     local record={id=key,fullType=fullType,label=name,source=corpse and "corpse" or "container",container=label,
      x=read(player,"getX"),y=read(player,"getY"),z=read(player,"getZ"),observedAt=read(getGameTime(),"getWorldAgeHours")}
     queue[#queue+1]=record;queued[key]=true
    end
   end
  end
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
 I.startHandler=function() I.reset() end
 Events.OnGameStart.Add(I.startHandler)
end
return I
