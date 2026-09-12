-- Observe only rows already displayed by the selected native inventory pane.
local CFLog=require("ConspiracyFiles/Log")
require "ISUI/ISInventoryPane"
local Model=require("ConspiracyFiles/IdentityObservations")
local Budget=require("ConspiracyFiles/SaveBudget")
local Log=require("ConspiracyFiles/DiscoveryLog")
local Outfits=require("ConspiracyFiles/BodyOutfitLog")
ConspiracyFiles=ConspiracyFiles or {}
local I=ConspiracyFiles.IdentityObserver or {}
ConspiracyFiles.IdentityObserver=I
local TAG="ConspiracyFiles.IdentityObservations"
local types={['Base.IDcard']=true,['Base.IDcard_Stolen']=true,['Base.IDcard_Female']=true,
 ['Base.IDcard_Male']=true,['Base.CreditCard']=true,['Base.CreditCard_Stolen']=true,['Base.ParkingTicket']=true,['Base.SpeedingTicket']=true,['Base.BusinessCard']=true,['Base.BusinessCard_Personal']=true,['Base.BusinessCard_Nolans']=true,['Base.Passport']=true,['Base.PressID']=true,['Base.Badge']=true,['Base.Diary1']=true,['Base.Diary2']=true}
local queue,queued,seen={},{},{}
-- Ids stored without a body token. They are the only records worth looking at
-- twice: everything else is retired after one sighting.
local tokenless={}
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
 -- Where an observation happened, as an address rather than a grid reference.
 -- The lookup is here because the address book is a client module and
 -- IdentityObservations has no engine contact; a building the book cannot name
 -- falls back to coordinates rather than losing the row.
 local function placeFor(x,y,z)
  local map=ConspiracyFiles.AddressMap
  if not map then return nil end
  local cell=getCell and getCell()
  local square=cell and cell.getGridSquare and cell:getGridSquare(x,y,z)
  local building=square and square.getBuilding and square:getBuilding()
  local def=building and building.getDef and building:getDef()
  local id=def and def.getIDString and def:getIDString()
  -- Inside a building: its own address.
  if id and map.labelForBuilding then
   local ok,label=pcall(map.labelForBuilding,tostring(id))
   if ok and type(label)=="string" and label~="" then return label end
  end
  -- Outdoors, or in a building the book cannot name: the nearest one it can.
  -- "Outside 109 Walker Road" is what a survivor writes; six digits is not.
  if map.nearest then
   local ok,label,distance=pcall(map.nearest,x,y)
   if ok and type(label)=="string" then
    if not id and distance==0 then return "right outside "..label end
    if not id then return "outdoors, near "..label end
    return "a building near "..label
   end
  end
  return nil
 end
 local ok,result=pcall(function() local r=root();if Model.validate(r) then return Model.rows(r,Outfits.readableOutfitFor,placeFor) end;return {} end)
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
local lastGateLog={}
-- Throttle PER REASON, not globally. One shared timer meant the commonest
-- reason ate every slot: on 2026-09-08 the player's own inventory pane bailed
-- 51 times and hid the corpse pane's reason completely, which is the one
-- anybody actually wanted. A reason nobody has seen for two seconds is worth
-- a line even while another repeats constantly.
local function gate(reason)
 local now=(getTimeInMillis and getTimeInMillis()) or 0
 local key=tostring(reason):gsub("%d+","N")
 if now-(lastGateLog[key] or -math.huge)>=2000 then
  lastGateLog[key]=now
  CFLog.message("identity","person","pane skipped: "..tostring(reason))
 end
 return nil
end
-- Build 42's default loot view is a merged proximity container (type
-- "proxInv") that is neither a corpse nor a bag. Judging the whole pane by
-- its container therefore switched the observer off in the view players
-- actually use. Resolve each ROW's own container instead: that fixes the
-- merged view and keeps provenance honest when two corpses appear in one
-- list, since each item still reports the body it really came from.
-- Third return is the CARRIER: the object that may hold a provenance token.
-- For a bag that is the bag itself, not the corpse, because a wallet moved off
-- a body carries the body's stamp (LocalPersonIntegration stamps it on the
-- move). Returning only the corpse here lost that: an ID inside a wallet was
-- classified "container" and its outfit lead was discarded even though the mod
-- knew which body the wallet came from. Observed 2026-09-08 with Jarvis
-- Harding; see docs/management/PLAYTEST_2026-09-08.md.
-- Container types that are somebody's furniture: a person chose to put a
-- document in one. Deliberately excludes "floor" and the merged pane's own
-- "proxInv" aggregate, where an item is merely lying about.
local FURNITURE={desk=true,counter=true,shelves=true,filingcabinet=true,locker=true,
 dresser=true,wardrobe=true,sidetable=true,crate=true,freezer=true,fridge=true,
 clothingrack=true,bin=true,medicine=true,toolbox=true,militarycrate=true,
 metal_shelves=true,officedrawers=true,filecabinet=true}
local function describeContainer(c,player)
 if not c or c==read(player,"getInventory") then return nil end
 local owner=read(c,"getParent")
 if owner and instanceof(owner,"IsoDeadBody") then return "corpse","corpse",owner end
 local bag=read(c,"getContainingItem")
 if bag then
  local name=clean(read(bag,"getDisplayName"),120)
  if name then return name,"container",bag end
 end
 -- Furniture. Owner, 2026-09-10: "let named items found in furniture become
 -- identity leads, not just ones off bodies."
 --
 -- A named diary in a stranger's dresser was skipped until now, because
 -- identity was only ever read off a corpse or a bag taken from one. That rule
 -- exists for a good reason - a name on a body is evidence that person was
 -- THERE - and a drawer is weaker. It is not nothing, though: somebody named
 -- on a diary kept it in this house.
 --
 -- So a furniture container yields a place rather than a person: the source is
 -- "furniture", never "corpse", and IdentityObservations keeps the claim at the
 -- strength the source supports.
 --
 -- A CLOSED list, and that is the point. The merged proximity pane is itself a
 -- container (type "proxInv"), and so is the floor; an item loose in either has
 -- no provenance at all and must still be refused, exactly as before. Only a
 -- real piece of furniture - something a person put a document INTO - counts.
 local kind=read(c,"getType")
 if type(kind)=="string" and FURNITURE[kind] then return kind,"furniture",nil end
 return nil
end
-- The provenance token a carrier already holds, if LocalPersonIntegration has
-- stamped it (see LocalPersonIntegration.remember). Never fabricated here: an
-- unstamped carrier yields nil, and the record is re-observed later once the
-- stamp exists. A carrier is a corpse or a bag taken off one; both are stamped
-- the same way, so both are read the same way.
local function provenanceToken(carrier)
 local md=read(carrier,"getModData")
 if type(md)=="table" and type(md.cfObservedSource)=="string" then return md.cfObservedSource end
 return nil
end
-- Ten checks below return silently. That is right in normal play - the
-- player's own pane, a dragging pane, a collapsed parent and a hidden pane are
-- all ordinary - and logging them all "cried wolf" once already. But when a
-- pane the player is plainly looking at records nothing, the reason is then
-- unobtainable: on 2026-09-08 an open wallet was skipped with no line at all,
-- and AUDIT_2026-09-07 wrongly believed a diagnostic already named it.
--
-- So it is opt-in. From the debug console:
--   ConspiracyFiles.IdentityObserver.verbose=true
-- Costs nothing while off, and names the failing check in one session.
I.verbose=false
local function bail(reason)
 if I.verbose then gate("bailed: "..tostring(reason)) end
 return nil
end
I.sawRender=false
function I.afterRender(pane)
 if not I.sawRender then I.sawRender=true; CFLog.message("identity","person","afterRender reached for the first time") end
 if not supported() then return gate("observer unsupported (debug/MP/runtime gate)") end
 if #queue>=16 then return gate("queue full") end
 if pane.mode~="details" then return gate("pane mode is "..tostring(pane.mode)..", expected details") end
 -- dragStarted does NOT mean "a drag is happening". ISInventoryPane sets it
 -- when a drag exceeds four pixels and clears it in exactly one place,
 -- onMouseDown; it is never initialised. So after any drag it stays true until
 -- the player next clicks that pane, and testing it alone made the observer
 -- abandon a pane permanently. That is the wallet defect: on 2026-09-08 an
 -- open wallet recorded nothing until a row was selected, because selecting is
 -- a mouse-down and a mouse-down is what cleared the flag.
 --
 -- dragging is the live state - set on mouse-down, cleared on mouse-up - so a
 -- real drag is both together.
 if pane.dragging and pane.dragStarted then return bail("a drag is in progress") end
 if read(pane,"isReallyVisible")~=true then return bail("pane not really visible") end
 if not pane.parent or pane.parent.isCollapsed then return bail("no parent, or parent collapsed") end
 if read(pane.parent,"isReallyVisible")~=true then return bail("parent not really visible") end
 local player=getSpecificPlayer(pane.player)
 if not player or player~=getPlayer() then return bail("pane belongs to another player") end
 local container=pane.inventory
 if not container then return bail("pane has no inventory") end
 if container==read(player,"getInventory") then return bail("pane is the player own inventory") end
 -- Each row is judged on its own container below, so a mixed or merged pane
 -- contributes exactly the rows that really sit in a corpse or a bag.
 local h,header,scroll,height=pane.itemHgt,pane.headerHgt,read(pane,"getYScroll"),read(pane,"getHeight")
 if type(h)~="number" or h<=0 or type(header)~="number" or type(scroll)~="number" or type(height)~="number" then return bail("geometry unreadable: h="..tostring(h)..", header="..tostring(header)..", scroll="..tostring(scroll)..", height="..tostring(height)) end
 local rows=pane.items
 if type(rows)~="table" then return bail("pane.items is "..type(rows)) end
 local first=math.max(1,math.ceil(-scroll/h)+1)
 -- At most sixteen fully visible rows per pane/frame; rotate across tall panes.
 local last=math.min(#rows,math.floor((height-header-scroll)/h))
 if last<first then return bail("no fully visible rows: first="..tostring(first)..", last="..tostring(last)) end
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
  local label,source,carrier=describeContainer(itemContainer,player)
  if people and people.see and fullType and read(item,"isHidden")~=true and itemContainer then
   pcall(people.see,item,itemContainer)
  end
  -- Keys on a body or in a bag off one go to the journal before any door is
  -- tried (owner, 2026-09-11). Only where there is a carrier: a key lying in a
  -- kitchen drawer says nothing about a person, and the journal would fill with
  -- every house key in Knox.
  local keys=ConspiracyFiles.KeyObserver
  if keys and keys.see and label and (source=="corpse" or source=="container") then
   local token=carrier and provenanceToken(carrier)
   pcall(keys.see,item,label,token)
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
   -- A document with no name on it is not an identity document. The game
   -- names its own "Diary: Kirk Key", "ID Card: Paris Stover"; a plain "Diary"
   -- was recorded as an identity lead with nobody in it (2026-09-11: "we found
   -- a diary. But it is empty and not relevant for our evidence?").
   if name and not string.find(name,": ",1,true) then name=nil end
   if not (type(id)=="number" and id~=0 and name) then
    missed=missed or (tostring(fullType).." rejected: id="..tostring(id).." name="..tostring(name))
   end
   if type(id)=="number" and id==id and math.abs(id)<9007199254740992 and id~=0 and name then
    local key=fullType..":"..tostring(id)
    local token=carrier and provenanceToken(carrier) or nil
    -- Re-observe only a record that is still missing its token AND now has one
    -- to take. Retrying unconditionally would re-queue every unstamped bag on
    -- every render for nothing.
    local unfinished=tokenless[key] and token~=nil
    if not queued[key] and (not seen[key] or unfinished) and #queue<16 then
     local record={id=key,fullType=fullType,label=name,source=source,container=label,
      x=read(player,"getX"),y=read(player,"getY"),z=read(player,"getZ"),observedAt=read(getGameTime(),"getWorldAgeHours"),
      token=token}
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
 if not changed then
  seen[record.id]=true
  if record.token==nil then tokenless[record.id]=true end
  return
 end
 if not Budget.check("identities",{canonical=staged}) then return end
 -- Sole replacement only after full domain and aggregate validation.
 local store=ModData.getOrCreate(TAG)
 store.canonical=staged
 seen[record.id]=true
 if record.token==nil then tokenless[record.id]=true else tokenless[record.id]=nil end
 -- Chronological order lives in one shared ledger, not per-source lists.
 Log.record("identity","identity:"..record.id)
 local ui=ConspiracyFiles.NotebookUI
 if ui and ui.refresh then ui.refresh() end
end
function I.tick()
 elapsed=elapsed+1
 if elapsed%10~=0 then return end
 local ok,err=pcall(I.flush)
 if not ok then CFLog.message("identity","person","Observation deferred: "..tostring(err)) end
end
CFLog.message("identity","person","load: renderHookInstalled="..tostring(I.originalRender~=nil)..
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
function I.reset() queue={};queued={};seen={};tokenless={};elapsed=0 end
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
   "ClueMarkers","IdentityObserver","NotebookUI","ObservedKeyLeads","EvidencePickupHint",
   "CaseFile","CasePerson","KeyObserver","VehicleProbe","Organiser"}
  local missing={}
  for _,name in ipairs(expected) do
   if ConspiracyFiles[name]==nil then missing[#missing+1]=name end
  end
  if #missing==0 then CFLog.message("identity","person","all "..#expected.." expected modules loaded")
  else CFLog.message("identity","person","NOT LOADED: "..table.concat(missing,", ")) end
 end
 I.startHandler=function() I.reset(); pcall(reportModules) end
 Events.OnGameStart.Add(I.startHandler)
end
return I
