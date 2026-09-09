-- Observation-driven first slice: no corpse scans or hidden inventory reads.
local Model=require("ConspiracyFiles/LocalPerson")
local Runtime=require("ConspiracyFiles/LocalPersonRuntime")
local Keys=require("ConspiracyFiles/HouseKeyAdapter")
local Journal=require("ConspiracyFiles/KeyJournal")
local Budget=require("ConspiracyFiles/SaveBudget")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
local Lead=require("ConspiracyFiles/ObservedKeyLead")
local LeadAdapter=require("ConspiracyFiles/ObservedKeyAdapter")
local Names=require("ConspiracyFiles/PersonNameLog")
local Outfits=require("ConspiracyFiles/BodyOutfitLog")
local P={}
-- Reachable from the debug console. The verboseDoors switch documented below
-- is useless if there is nothing to set it on: this module was require-only,
-- so ConspiracyFiles.LocalPersonIntegration.verboseDoors=true crashed on a nil
-- index. A diagnostic nobody can turn on is not a diagnostic.
ConspiracyFiles=ConspiracyFiles or {}
ConspiracyFiles.LocalPersonIntegration=P
local TAG="ConspiracyFiles.LocalPeople"
local LEAD_TAG="ConspiracyFiles.ObservedKeyLeads"
local queue,queued,ticks={},{},0
local attempts={}
local MAX_ATTEMPTS=3
local cardTypes={['Base.IDcard']=true,['Base.IDcard_Male']=true,['Base.IDcard_Female']=true,
    ['Base.IDcard_Stolen']=true,['Base.CreditCard']=true,['Base.CreditCard_Stolen']=true,
    ['Base.BusinessCard']=true,['Base.BusinessCard_Personal']=true,['Base.Passport']=true,['Base.PressID']=true,['Base.Badge']=true,['Base.Diary1']=true,['Base.Diary2']=true,
    ['Base.ParkingTicket']=true,['Base.SpeedingTicket']=true}
-- The person/key chain had a single print, on its error path, so a silent
-- failure and a chain that simply never triggered were indistinguishable.
-- Journal.observe reports "recorded" only for a genuinely new fact, which
-- keeps these lines off the 30-tick poll.
local function log(message) print("[CF-PERSON] "..tostring(message)) end
local function noteFact(fact,description)
    local accepted,reason=Journal.observe(fact)
    if accepted and reason=="recorded" then log(description) end
    return accepted,reason
end
local function read(object,method,...)
    if not object then return nil end
    local args={...}
    local ok,value=pcall(function() return object[method] and object[method](object,unpack(args)) end)
    if ok then return value end
end
-- Observed occupation only. PZ exposes it through the body descriptor; see
-- IdentityProbe, which verified getCharacterProfession on Build 42.20.4.
local function occupationOf(body)
    local descriptor=read(body,"getDescriptor")
    local profession=read(descriptor,"getCharacterProfession")
    local name=profession and read(profession,"getName")
    if type(name)~="string" then return nil end
    name=name:gsub("[%c]"," "):sub(1,60)
    if not name:find("%S") then return nil end
    return name
end
-- Observed outfit only. IsoDeadBody:getOutfitName() is exactly what vanilla
-- calls on this type -- see SpawnRateChecker.lua:260
-- (container:getParent():getOutfitName()), which is the verified reference
-- for this API. This never reads getPersistentOutfitID: that numeric ID is
-- not a readable outfit name and is not what the notebook can say to the
-- player.
local function outfitOf(body)
    local name=read(body,"getOutfitName")
    if type(name)~="string" then return nil end
    name=name:gsub("[%c]"," "):sub(1,120)
    if not name:find("%S") then return nil end
    return name
end
local function supported()
    local rt=ConspiracyFiles.GeneratedRuntime
    return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
        and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode and rt and rt.metrics and rt.metrics()
end
local function state()
    local wrapper=ModData.get(TAG)
    if not wrapper then return Model.empty() end
    assert(type(wrapper)=="table" and not getmetatable(wrapper),"invalid people store")
    for key in pairs(wrapper) do assert(key=="canonical","unknown people field") end
    assert(Model.validate(wrapper.canonical))
    return wrapper.canonical
end
local function save(staged)
    assert(staged and Model.validate(staged),"invalid people update")
    assert(Budget.check("localPeople",{canonical=staged}))
    ModData.getOrCreate(TAG).canonical=staged
end
local function cases()
    local wrapper=Cases.current(ModData.get("ConspiracyFiles.Generated.G2") or {})
    return wrapper and Cases.sessions(wrapper) or {}
end
-- Observed-vanilla-key leads live in their own store: a body's real key is
-- world content we only ever observe, never our own placed/reconciled fact.
local function leadState()
    local wrapper=ModData.get(LEAD_TAG)
    if not wrapper then return Lead.empty() end
    assert(type(wrapper)=="table" and not getmetatable(wrapper),"invalid observed-key lead store")
    for key in pairs(wrapper) do assert(key=="canonical","unknown observed-key lead field") end
    assert(Lead.validate(wrapper.canonical))
    return wrapper.canonical
end
local function saveLead(staged)
    assert(staged and Lead.validate(staged),"invalid observed-key lead update")
    assert(Budget.check("observedKeyLeads",{canonical=staged}))
    ModData.getOrCreate(LEAD_TAG).canonical=staged
end
-- True once a body's own vanilla key has already produced an observed lead.
-- Constraint: the observed and fabricated key paths must never both run for
-- the same corpse/case, so `place` below refuses to spawn a key here.
-- The notebook reads sources off the shared table, so leads must be
-- published there like IdentityObserver and KeyJournal are. A lead nobody
-- can read is not a lead.
ConspiracyFiles.ObservedKeyLeads=ConspiracyFiles.ObservedKeyLeads or {}
ConspiracyFiles.ObservedKeyLeads.rows=function()
    -- Hand the renderer the address book so a connection can name a place
    -- rather than a building id. Resolved here, at render time, because the
    -- book fills in as the player explores: a door opened before its street
    -- was indexed gains its address on a later look.
    local ok,rows=pcall(function()
        local Address=ConspiracyFiles.AddressMap
        local labelFor=Address and Address.labelForBuilding
        return Lead.rows(leadState(),labelFor)
    end)
    return ok and rows or {}
end
-- Ledger ref must equal the notebook row id, or ordering cannot place it.
local function recordLeadDiscovery(fact)
    local logger=ConspiracyFiles.DiscoveryLog
    if logger and logger.record then logger.record("connection","observedKeyLead:"..fact.id) end
    local ui=ConspiracyFiles.NotebookUI
    if ui and ui.refresh then pcall(ui.refresh) end
end
local function hasLead(sourceToken)
    if type(sourceToken)~="string" then return false end
    for _,fact in pairs(leadState().leads) do
        if fact.sourceToken==sourceToken then return true end
    end
    return false
end
-- Record a real vanilla key found on a body as a lead pointing at the
-- building it opens -- never at who the body was or where they lived. An
-- ambiguous or no-match lookup, or a budget refusal, is silence: this never
-- guesses a building and never asserts a fact it cannot afford to keep.
local function observeKeyLead(entry)
    -- A door match is strictly better evidence than a catalogue guess, so
    -- never add a catalogue lead for a body that already has one.
    if hasLead(entry.token) then return end
    local matched=LeadAdapter.resolve(entry.item,cases())
    if not matched then return end
    local fact={id=entry.token,sourceToken=entry.token,keyId=matched.keyId,buildingId=matched.id}
    local staged,changed=Lead.observe(leadState(),fact)
    if not staged then return doorBail("the lead did not validate") end
    if not changed then return doorBail("this key/door lead was already recorded") end
    if not Budget.check("observedKeyLeads",{canonical=staged}) then
        return doorBail("recording this lead would exceed the save budget") end
    saveLead(staged)
    log("observedKeyLead building="..matched.id.." keyId="..tostring(matched.keyId))
    recordLeadDiscovery(fact)
end
local function buildingFor(root)
    local doc=root.case.documents[1]
    local target=root.assignments[doc.id].target
    local square=read(getCell(),"getGridSquare",target.x,target.y,target.z)
    local building=read(square,"getBuilding")
    local def=read(building,"getDef")
    local id=read(def,"getIDString")
    if type(id)~="string" or doc.locationId~="t3:"..id then return nil end
    return building,id,read(def,"getKeyId")
end
-- Ascend only container ownership, never inspect a bag's contents.
local function origin(item,container)
    local carried={item}
    for _=1,8 do
        local owner=read(container,"getParent")
        if owner and instanceof(owner,"IsoDeadBody") then
            local md=read(owner,"getModData")
            local id=read(item,"getID")
            if type(md)~="table" or type(id)~="number" or id==0 or id~=id or math.abs(id)>=9007199254740992 or id%1~=0 then return nil end
            local token=md.cfObservedSource or ("corpse-item:"..tostring(id))
            if type(token)~="string" or #token>160 then return nil end
            return token,owner,carried
        end
        local bag=read(container,"getContainingItem")
        if not bag then return nil end
        local md=read(bag,"getModData")
        if md and type(md.cfObservedSource)=="string" then return md.cfObservedSource,nil,carried end
        carried[#carried+1]=bag
        container=read(bag,"getContainer")
    end
end
function P.see(item,container)
    if not supported() or #queue>=16 or queued[item] or read(item,"getContainer")~=container then return end
    local id=read(item,"getID")
    if type(id)~="number" or id==0 or id~=id or math.abs(id)>=9007199254740992 or id%1~=0 then return end
    local token,body,carried=origin(item,container)
    if not token then return end
    queue[#queue+1]={item=item,container=container,token=token,body=body,carried=carried,
        label=read(item,"getDisplayName"),fullType=read(item,"getFullType"),id=read(item,"getID"),
        keyId=read(item,"getKeyId")}
    queued[item]=true
end
local function remember(entry)
    if entry.body then
        local md=read(entry.body,"getModData")
        if type(md)~="table" then return false end
        -- A body's provenance token legitimately changes between queueing and
        -- flushing: moving its wallet stamps the corpse, while an item queued
        -- moments earlier still carries the token computed back then. Both
        -- items came off the same body, so adopt the token the body already
        -- carries instead of treating an ordinary sequence of player actions
        -- as a contradiction and throwing.
        if md.cfObservedSource and md.cfObservedSource~=entry.token then
            log("adopted corpse provenance "..tostring(md.cfObservedSource).." for a queued observation")
            entry.token=md.cfObservedSource
        end
        md.cfObservedSource=entry.token
        -- The body's own token is now settled for this observation, so this
        -- is the one place to record its outfit: exactly one call per
        -- corpse-observing entry, keyed on the same token as everything
        -- else about this body. Two adjacent corpses never share a token
        -- (each token is derived from that specific body/item), so they
        -- never share an outfit observation either. A missing or unreadable
        -- outfit degrades silently -- outfitOf returns nil and nothing is
        -- recorded.
        local outfit=outfitOf(entry.body)
        if outfit then Outfits.record(entry.token,outfit) end
    end
    for _,item in ipairs(entry.carried) do
        local md=read(item,"getModData")
        if md and not md.cfObservedSource then md.cfObservedSource=entry.token end
    end
    return true
end
local function place(root,record,body,building)
    -- The observed and fabricated key paths are mutually exclusive per body:
    -- once a real vanilla key on this corpse has already produced a lead,
    -- never also spawn Base.Key1 for the same case.
    if hasLead(record.sourceToken) then return end
    local player=getPlayer()
    local px,py,pz=read(player,"getX"),read(player,"getY"),read(player,"getZ")
    local bx,by,bz=read(body,"getX"),read(body,"getY"),read(body,"getZ")
    if not px or not py or not bx or not by or pz~=bz or (px-bx)^2+(py-by)^2>900 then return end
    local container=read(body,"getContainer") or read(body,"getInventory")
    if not container then return end
    local items=read(container,"getItems")
    local size=read(items,"size")
    if type(size)~="number" or size>Runtime.MAX_ITEMS then return end
    local count=0
    for index=0,size-1 do
        local md=read(read(items,"get",index),"getModData")
        if md and md.cfLocalPersonToken==record.keyToken then count=count+1 end
    end
    if count>1 and record.status~="pending" and record.status~="conflict" then
        save(assert(Runtime.reconcile(state(),record.caseId,count,false)))
        return
    end
    if record.status=="placed" or record.status=="conflict" then return end
    if record.status~="pending" then
        local staged=Runtime.reconcile(state(),record.caseId,count,count==1)
        if staged then save(staged) end
        return
    end
    -- Commit intent before creating or adding an item. An interrupted intent
    -- without a surviving key becomes unknown rather than spawning another.
    save(assert(Runtime.intent(state(),record.caseId)))
    record=state().records[record.caseId]
    if count>0 then save(assert(Runtime.reconcile(state(),record.caseId,count,true)));return end
    local key=assert(Runtime.createKey(building,record))
    assert(container:AddItem(key),"key placement failed")
    log("key placed on body for case="..record.caseId.." keyId="..tostring(record.keyId))
    save(assert(Runtime.reconcile(state(),record.caseId,1,true)))
end
local function observe(entry)
    if not remember(entry) then return end
    local current=state()
    local md=read(entry.item,"getModData") or {}
    -- A real vanilla key on a body is world content, not ours: observe what
    -- building it opens (a lead) instead of the person/name chain below,
    -- which only ever concerns our own fabricated key.
    if entry.body and not md.cfLocalPersonCase and type(entry.keyId)=="number" and entry.keyId>=0 then
        observeKeyLead(entry)
    end
    -- A wallet may have been opened after leaving the body. Its observed
    -- source survives that move; finish pending placement on seeing the body
    -- again, without guessing which nearby corpse it belonged to.
    if entry.body and not cardTypes[entry.fullType] and not md.cfLocalPersonCase then
        for _,root in ipairs(cases()) do
            local record=current.records[root.case.caseId]
            if record and record.sourceToken==entry.token then
                local building,buildingId,keyId=buildingFor(root)
                if building and record.buildingId==buildingId and record.keyId==keyId then
                    place(root,record,entry.body,building)
                end
            end
        end
    end
    if md.cfLocalPersonCase then
        local record=current.records[md.cfLocalPersonCase]
        if record and record.status~="conflict" and record.sourceToken==entry.token and record.keyToken==md.cfLocalPersonToken then
            assert(noteFact({kind="keySource",id=record.keyToken,sourceToken=entry.token,
                keyToken=record.keyToken,keyId=record.keyId},"keySource key="..record.keyToken))
        end
        return
    end
    if not cardTypes[entry.fullType] or type(entry.label)~="string" then return end
    local name=entry.label:match(":%s*(.+)$")
    if not name or #name>120 or name:find("[%c]") then return end
    -- Associate this corpse/wallet provenance token with the observed name
    -- independent of the case/binding system below: PlayerVoice's Set B
    -- needs this for ANY key-door link, not only ones tied to a generated
    -- case. Never invents a name -- this is exactly what was parsed above.
    Names.record(entry.token,name)
    for _,root in ipairs(cases()) do
        local id=root.case.caseId
        local record=current.records[id]
        local building,buildingId,keyId=buildingFor(root)
        if not record and building and type(keyId)=="number" and keyId>=0 then
            local occupation=entry.body and occupationOf(entry.body) or nil
            local staged=Runtime.bindVisible(current,{caseId=id,buildingId=buildingId,sourceToken=entry.token,
                name=name,occupation=occupation,keyToken="person-key:"..id,keyId=keyId})
            if staged then save(staged);current=state();record=current.records[id]
                log("bound case="..id.." name="..name.." building="..buildingId.." keyId="..tostring(keyId)..
                    " occupation="..(occupation or Runtime.UNRECORDED_OCCUPATION)) end
        end
        if record and record.sourceToken==entry.token and record.observedName==name then
            assert(noteFact({kind="nameDocument",id="identity:"..tostring(entry.id),sourceToken=entry.token,name=name},
                "nameDocument name="..name))
            if entry.body and building and record.buildingId==buildingId and record.keyId==keyId then
                place(root,record,entry.body,building)
            end
            return
        end
    end
end
function P.known()
    local roots=cases()
    local known={}
    for _,row in ipairs(ConspiracyFiles.GeneratedRuntime.known()) do known[row.id]=true end
    for _,root in ipairs(roots) do
        local first=root.case.documents[1]
        if known[first.id] then
            assert(noteFact({kind="anonymousClue",id=first.id,buildingId=first.locationId:gsub("^t3:","")},
                "anonymousClue clue="..first.id.." building="..first.locationId))
        end
    end
end
function P.tick()
    if not supported() then return end
    ticks=ticks+1
    if ticks%30~=0 then return end
    local entry=table.remove(queue,1)
    if entry then
        local ok,why=pcall(observe,entry)
        if ok then
            queued[entry.item]=nil; attempts[entry.item]=nil
        else
            -- Clearing the guard before observing let P.see re-queue a failing
            -- entry on the very next render, so one permanent failure retried
            -- forever. Give it a few tries, then leave the guard set so the
            -- item is dropped once instead of spamming every render.
            local n=(attempts[entry.item] or 0)+1
            attempts[entry.item]=n
            if n>=MAX_ATTEMPTS then
                print("[CF-PERSON] Dropped after "..n.." attempts: "..tostring(why))
            else
                queued[entry.item]=nil
                print("[CF-PERSON] Deferred ("..n.."/"..MAX_ATTEMPTS.."): "..tostring(why))
            end
        end
    end
    -- A failed observation must not stop derived clue facts being recorded.
    local ok,why=pcall(P.known)
    if not ok then print("[CF-PERSON] Deferred known: "..tostring(why)) end
end
-- Called after vanilla confirms an inventory transfer. It records only the
-- source of a wallet itself; its contents remain unread until their rows are
-- visibly displayed by the normal inventory observer.
function P.observeTransfer(action, item, source, destination)
    if not supported() or action.character~=getPlayer() or read(item,"getContainer")~=destination then return end
    local wallet=read(item,"getInventory")
    if not wallet then return end
    local sourceBody=read(source,"getParent")
    local destinationBody=read(destination,"getParent")
    local md=read(item,"getModData")
    if type(md)~="table" then return end
    if sourceBody and instanceof(sourceBody,"IsoDeadBody") then
        local id=read(item,"getID")
        if type(id)~="number" or id==0 or id~=id or id%1~=0 or math.abs(id)>=9007199254740992 then return end
        local token="corpse-wallet:"..tostring(id)
        local bodyMD=read(sourceBody,"getModData")
        if type(bodyMD)~="table" or (md.cfObservedSource and md.cfObservedSource~=token)
            or (bodyMD.cfObservedSource and bodyMD.cfObservedSource~=token) then return end
        md.cfObservedSource=token
        bodyMD.cfObservedSource=token
        return
    end
    if not (destinationBody and instanceof(destinationBody,"IsoDeadBody")) then return end
    local token=md.cfObservedSource
    if type(token)~="string" or #token==0 or #token>160 then return end
    for _,root in ipairs(cases()) do
        local record=state().records[root.case.caseId]
        local building,buildingId,keyId=buildingFor(root)
        if record and record.sourceToken==token and building and record.buildingId==buildingId and record.keyId==keyId then
            place(root,record,destinationBody,building)
        end
    end
end
local function heldKey(inventory,keyId)
    local key=read(inventory,"haveThisKeyId",keyId)
    local md=read(key,"getModData")
    if md and md.cfLocalPersonCase then return key end
    -- A vanilla spare key may precede our key. Search only owned containers,
    -- bounded across the complete traversal, without exposing their contents.
    local containers={inventory}
    local index,visited,found=1,0,nil
    while index<=#containers and index<=16 and visited<200 do
        local list=read(containers[index],"getItems")
        local size=read(list,"size") or 0
        for i=0,math.min(size,200-visited)-1 do
            visited=visited+1
            local candidate=read(list,"get",i)
            local data=read(candidate,"getModData")
            if data and data.cfLocalPersonCase and read(candidate,"getKeyId")==keyId then
                if found then return nil end
                found=candidate
            end
            local bag=read(candidate,"getInventory")
            if bag and #containers<16 then containers[#containers+1]=bag end
        end
        index=index+1
    end
    return found
end
-- A key looted from a body carries that body's provenance, stamped by
-- remember(). Bounded traversal, same discipline as heldKey. Two candidate
-- keys for one lock is ambiguous: refuse rather than pick one.
local function observedCorpseKey(inventory,keyId)
    local containers={inventory}
    local index,visited,found=1,0,nil
    while index<=#containers and index<=16 and visited<200 do
        local list=read(containers[index],"getItems")
        local size=read(list,"size") or 0
        for i=0,math.min(size,200-visited)-1 do
            visited=visited+1
            local candidate=read(list,"get",i)
            local md=read(candidate,"getModData")
            if md and not md.cfLocalPersonCase and type(md.cfObservedSource)=="string"
                and read(candidate,"getKeyId")==keyId then
                if found then return nil end
                found=candidate
            end
            local bag=read(candidate,"getInventory")
            if bag and #containers<16 then containers[#containers+1]=bag end
        end
        index=index+1
    end
    return found
end
-- The engine has already decided this key opens this door, so the building
-- comes from the door the player actually used. No catalogue, no keyId
-- lookup, and no requirement that we authored the place.
local function doorBuilding(door,keyId)
    local square=read(door,"getSquare")
    local building=square and read(square,"getBuilding")
    if not building then
        local opposite=read(door,"getOppositeSquare")
        building=opposite and read(opposite,"getBuilding")
    end
    local def=building and read(building,"getDef")
    if not def or read(def,"getKeyId")~=keyId then return nil end
    local id=read(def,"getIDString")
    if type(id)~="string" or id=="" or #id>160 or id:find("[%c]") then return nil end
    return id
end
-- Six ways this can decline, all of them silent until now. observedKeyDoor has
-- never been seen working in play, and a door that produces nothing is
-- indistinguishable from a door nobody tried. Opt in from the debug console:
--   ConspiracyFiles.LocalPersonIntegration.verboseDoors=true
-- Off by default: every ordinary door in Muldraugh reaches this function.
P.verboseDoors=false
local lastDoorLog={}
local function doorBail(reason)
    if not P.verboseDoors then return nil end
    local now=(getTimeInMillis and getTimeInMillis()) or 0
    local key=tostring(reason):gsub("%d+","N")
    if now-(lastDoorLog[key] or -math.huge)>=2000 then
        lastDoorLog[key]=now
        log("door lead skipped: "..tostring(reason))
    end
    return nil
end
local function observeDoorLead(inventory,door,keyId)
    if type(keyId)~="number" or keyId~=math.floor(keyId) or keyId<0 then
        return doorBail("door has no usable keyId ("..tostring(keyId)..")") end
    local key=observedCorpseKey(inventory,keyId)
    if not key then
        return doorBail("no carried key with keyId "..tostring(keyId)..
            " that came off a body; a case key is deliberately excluded here") end
    local md=key and read(key,"getModData")
    local token=md and md.cfObservedSource
    if type(token)~="string" or token=="" or #token>160 then
        return doorBail("the key carries no provenance stamp, so it cannot be tied to a body") end
    local buildingId=doorBuilding(door,keyId)
    if not buildingId then
        return doorBail("this door's building does not declare keyId "..tostring(keyId)) end
    local fact={id="door:"..token,sourceToken=token,keyId=keyId,buildingId=buildingId}
    local staged,changed=Lead.observe(leadState(),fact)
    if not staged then return doorBail("the lead did not validate") end
    if not changed then return doorBail("this key/door lead was already recorded") end
    if not Budget.check("observedKeyLeads",{canonical=staged}) then
        return doorBail("recording this lead would exceed the save budget") end
    saveLead(staged)
    log("observedKeyDoor building="..buildingId.." keyId="..tostring(keyId).." source="..token)
    recordLeadDiscovery(fact)
    -- Set B/C voice line: the more significant event, so it fires here
    -- unconditionally rather than through the Set A cooldown gate that
    -- recordLeadDiscovery's ledger write may just have consumed. Never
    -- suppressed by a Set A line fired moments earlier.
    local voice=ConspiracyFiles.PlayerVoice
    if voice and voice.onKeyDoorLink then pcall(voice.onKeyDoorLink,token) end
end
function P.observeDoor(action)
    if not supported() or action.character~=getPlayer() then return end
    local door=action.item
    local keyId=read(door,"getKeyId")
    local inventory=read(action.character,"getInventory")
    local key=heldKey(inventory,keyId)
    local md=read(key,"getModData")
    if not md then
        -- No key of ours fits. A real key taken from a body does the same
        -- job better: it names a building we never chose.
        local ok,why=pcall(observeDoorLead,inventory,door,keyId)
        if not ok then log("door lead deferred: "..tostring(why)) end
        return
    end
    local record=state().records[md.cfLocalPersonCase]
    if not record or record.status=="conflict" or record.keyToken~=md.cfLocalPersonToken then return end
    local square=read(door,"getSquare")
    local doorId=table.concat({tostring(read(square,"getX")),tostring(read(square,"getY")),
        tostring(read(square,"getZ")),tostring(read(door,"getObjectIndex"))},":")
    local fact=Keys.observeInteractedMatch({interaction="door",interactionToken=doorId,
        player=action.character,interactedDoor=door,heldKey=key,buildingId=record.buildingId,
        doorId=doorId,keyToken=record.keyToken,factId="match:"..record.keyToken..":"..doorId})
    if fact then assert(noteFact(fact,"keyDoorMatch door="..doorId.." building="..record.buildingId));P.known() end
end
function P.reset() queue={};queued={};attempts={};ticks=0 end
Runtime.see=P.see
return P
