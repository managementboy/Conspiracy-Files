-- Conspiracy-Files Spike T5: physical item identity probe.
-- Disposable development code. This is NOT production Conspiracy-Files code.

require "TimedActions/ISTransferAction"

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.T5Probe = ConspiracyFiles.T5Probe or {}

local T5 = ConspiracyFiles.T5Probe
local PREFIX = "[CF-T5]"
local CONTROL_TAG = "ConspiracyFiles.T5.Control"
local ITEM_TYPE = "Base.Note"
local MOD_ID = "ConspiracyFiles_T5_Probe"
local MAIN_TOKEN = "cf-t5:physical:main"
local active = false
local completed = false
local failed = false
local tickCount = 0
local quitTicks = 0
local autoContinuePending = true
local autoContinueTicks = 0
local scheduled = nil

local function safe(value)
    if value == nil then return "<nil>" end
    return tostring(value):gsub("|", "/"):gsub("\r", " "):gsub("\n", " ")
end

local function bool(value) return value and "true" or "false" end

local function logEvent(kind, fields)
    local parts = { PREFIX, "EVENT", "kind=" .. safe(kind) }
    if fields then for i=1,#fields do parts[#parts+1] = fields[i] end end
    print(table.concat(parts, "|"))
end

local function saveFolder()
    local current = getCurrentSaveName and getCurrentSaveName() or ""
    return tostring(current):match("([^\\/]+)$") or ""
end

local function mode()
    local folder = saveFolder()
    if folder:match("^T5_identity") then return "identity" end
    if folder:match("^T5_death") then return "death" end
    return nil
end

local function gameVersion()
    local ok, value = pcall(getGameVersion)
    return ok and safe(value) or "unavailable"
end

local function activeModStatus()
    local ok, mods = pcall(getActivatedMods)
    if not ok or mods == nil then return -1, false end
    local countOk, count = pcall(function() return mods:size() end)
    local containsOk, contains = pcall(function() return mods:contains(MOD_ID) end)
    return countOk and count or -1, containsOk and contains == true
end

local function control()
    local value = ModData.getOrCreate(CONTROL_TAG)
    if value.schemaVersion == nil then
        value.schemaVersion = 1
        value.identityPass = 0
        value.deathPass = 0
    end
    return value
end

local function stamp(item, token, scenario)
    local md = item:getModData()
    md.cfPhysicalItemId = token
    md.cfAssetId = "dead-air:t5-probe"
    md.cfIdentitySchema = 1
    md.cfProbeScenario = scenario
    return item
end

local function tokenOf(item)
    if item == nil then return nil end
    local md = item:getModData()
    return md and md.cfPhysicalItemId or nil
end

local function engineId(item)
    if item == nil then return "<nil>" end
    local ok, value = pcall(function() return item:getID() end)
    return ok and safe(value) or "error"
end

local function spriteName(object)
    local sprite = object and object:getSprite() or nil
    return sprite and safe(sprite:getName()) or "<nil>"
end

local function bindWorldContainer()
    local player = getPlayer()
    local px, py, pz = math.floor(player:getX()), math.floor(player:getY()), math.floor(player:getZ())
    for radius=0,60 do
        for x=px-radius,px+radius do
            for y=py-radius,py+radius do
                if radius == 0 or x == px-radius or x == px+radius or y == py-radius or y == py+radius then
                    local square = getCell():getGridSquare(x,y,pz)
                    if square then
                        local objects = square:getObjects()
                        for oi=0,objects:size()-1 do
                            local object = objects:get(oi)
                            for ci=0,object:getContainerCount()-1 do
                                local container = object:getContainerByIndex(ci)
                                if container then
                                    return { x=x,y=y,z=pz,sprite=spriteName(object),containerType=safe(container:getType()),
                                        objectIndex=oi,containerIndex=ci,matchOrdinal=1 }
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return nil
end

local function resolveWorldContainer(binding)
    if not binding then return nil,nil,"binding-missing" end
    local square = getCell():getGridSquare(binding.x,binding.y,binding.z)
    if not square then return nil,nil,"square-unloaded" end
    local objects = square:getObjects()
    if binding.objectIndex >= 0 and binding.objectIndex < objects:size() then
        local object = objects:get(binding.objectIndex)
        if spriteName(object) == binding.sprite and binding.containerIndex >= 0 and binding.containerIndex < object:getContainerCount() then
            local container = object:getContainerByIndex(binding.containerIndex)
            if container and safe(container:getType()) == binding.containerType then return object,container,"available-by-index" end
        end
    end
    local matches = 0
    for oi=0,objects:size()-1 do
        local object = objects:get(oi)
        if spriteName(object) == binding.sprite then
            for ci=0,object:getContainerCount()-1 do
                local container = object:getContainerByIndex(ci)
                if container and safe(container:getType()) == binding.containerType then
                    matches = matches + 1
                    if matches == binding.matchOrdinal then return object,container,"available" end
                end
            end
        end
    end
    return nil,nil,"container-missing"
end

local function findVehicleById(id)
    if id == nil then return nil end
    if not getVehicleById then return nil end
    local ok,vehicle=pcall(getVehicleById,tonumber(id))
    return ok and vehicle or nil
end

local function usableVehicleContainer(vehicle)
    if not vehicle then return nil,nil end
    local preferred = { "TruckBed", "Trunk", "GloveBox", "SeatRearLeft", "SeatRearRight" }
    for i=1,#preferred do
        local part = vehicle:getPartById(preferred[i])
        if part and part:getItemContainer() then return part:getItemContainer(), preferred[i] end
    end
    for i=0,vehicle:getPartCount()-1 do
        local part = vehicle:getPartByIndex(i)
        if part and part:getItemContainer() then return part:getItemContainer(), safe(part:getId()) end
    end
    return nil,nil
end

local function resolveVehicle(c)
    local vehicle = findVehicleById(c.vehicleId)
    if not vehicle then return nil,nil,"vehicle-missing" end
    local part = vehicle:getPartById(c.vehiclePartId)
    if part and part:getItemContainer() then return vehicle,part:getItemContainer(),"available" end
    return vehicle,nil,"vehicle-container-missing"
end

local function ensureVehicle(c)
    local player = getPlayer()
    local best = nil
    if addVehicle then
        local px,py,pz=math.floor(player:getX()),math.floor(player:getY()),math.floor(player:getZ())
        local scripts={"Base.SUV","Base.CarNormal","Base.PickUpVan"}
        for radius=4,40,4 do
            if not best then
                local candidates={{px+radius,py},{px-radius,py},{px,py+radius},{px,py-radius}}
                for ci=1,#candidates do
                    if not best then
                        local x,y=candidates[ci][1],candidates[ci][2]
                        local square=getCell():getGridSquare(x,y,pz)
                        if square and square:getRoom()==nil and square:TreatAsSolidFloor() and not square:isSolid() then
                            for si=1,#scripts do
                                if not best then
                                    local ok,spawned=pcall(function() return addVehicle(scripts[si],x+0.5,y+0.5,pz) end)
                                    if ok and spawned then best=spawned end
                                    if not ok then logEvent("VEHICLE_SPAWN_ERROR", {"script="..scripts[si],"error="..safe(spawned)}) end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    local container, partId = usableVehicleContainer(best)
    if best and container then
        c.vehicleId = safe(best:getId())
        c.vehiclePartId = partId
        logEvent("VEHICLE_BOUND", {"vehicleId="..c.vehicleId,"part="..partId,"spawnOrExisting=true"})
        return best,container
    end
    c.vehicleLimitation = "no-usable-vehicle-container"
    logEvent("LIMITATION", {"case=vehicle","detail=no-usable-vehicle-container"})
    return nil,nil
end

local function eachContainerItem(container, fn)
    if not container then return end
    local items = container:getItems()
    for i=0,items:size()-1 do fn(items:get(i)) end
end

local function eachWorldItem(square, fn)
    if not square then return end
    local objects = square:getWorldObjects()
    for i=0,objects:size()-1 do
        local world = objects:get(i)
        local ok,item = pcall(function() return world:getItem() end)
        if ok and item then fn(item,world) end
    end
end

local function locateToken(token)
    local c = control()
    local found = {}
    local seen = {}
    local function add(item, location, holder)
        if tokenOf(item) ~= token then return end
        local key = safe(item)
        if not seen[key] then
            seen[key] = true
            found[#found+1] = {item=item,location=location,holder=holder}
        end
    end
    local player = getPlayer()
    if player then eachContainerItem(player:getInventory(), function(item) add(item,"inventory",player:getInventory()) end) end
    local _,worldContainer = resolveWorldContainer(c.worldBinding)
    eachContainerItem(worldContainer, function(item) add(item,"world-container",worldContainer) end)
    if c.floorX then
        local square = getCell():getGridSquare(c.floorX,c.floorY,c.floorZ)
        eachWorldItem(square, function(item,world) add(item,"floor",world) end)
    end
    local _,vehicleContainer = resolveVehicle(c)
    eachContainerItem(vehicleContainer, function(item) add(item,"vehicle",vehicleContainer) end)
    if c.deathX then
        for dx=-5,5 do
            for dy=-5,5 do
                local square = getCell():getGridSquare(c.deathX+dx,c.deathY+dy,c.deathZ)
                if square then
                    local bodies = square:getStaticMovingObjects()
                    for i=0,bodies:size()-1 do
                        local body = bodies:get(i)
                        if instanceof(body,"IsoDeadBody") then
                            eachContainerItem(body:getContainer(), function(item) add(item,"corpse",body:getContainer()) end)
                        end
                    end
                end
            end
        end
    end
    return found
end

local function emitObservation(stage, action, token, expectedLocation, reloadProof)
    local found = locateToken(token)
    local locations, ids = {}, {}
    for i=1,#found do
        locations[#locations+1] = found[i].location
        ids[#ids+1] = engineId(found[i].item)
    end
    local location = #locations == 0 and "absent" or table.concat(locations, ",")
    local pass = (expectedLocation == "absent" and #found == 0) or
        (#found == 1 and (expectedLocation == nil or location == expectedLocation))
    local status = pass and "PASS" or "FAIL"
    logEvent("MATRIX_ROW", {"stage="..stage,"action="..action,"identity="..token,"engineIds="..table.concat(ids,","),
        "location="..location,"expected="..safe(expectedLocation),"reloadProof="..reloadProof,"duplicateCount="..tostring(#found),"status="..status})
    return found,status
end

local function createStamped(token, scenario)
    local item = instanceItem(ITEM_TYPE)
    if not item then error("instanceItem-returned-nil") end
    return stamp(item,token,scenario)
end

local function saveAndQuit(nextPassField, nextPass)
    local c=control()
    c[nextPassField]=nextPass
    c.lastSaveRequestedAtStage=safe(nextPassField)..":"..tostring(nextPass)
    local started=getTimeInMillis()
    local ok,err=pcall(saveGame)
    logEvent("SAVE_RETURNED", {"field="..nextPassField,"nextPass="..tostring(nextPass),"ok="..bool(ok),
        "elapsedMs="..tostring(getTimeInMillis()-started),"error="..safe(err)})
    completed=true
end

local function schedule(fn)
    scheduled=fn
    tickCount=0
end

local function copyMechanismMatrix(container)
    local scenarios = {}
    local freshSource=createStamped("cf-t5:fresh-source","fresh-instance-control")
    container:AddItem(freshSource)
    local fresh=instanceItem(ITEM_TYPE)
    container:AddItem(fresh)
    scenarios[#scenarios+1]={name="fresh-instance",source=freshSource,copy=fresh,expected=1}

    local cloneSource=createStamped("cf-t5:create-clone","createCloneItem")
    container:AddItem(cloneSource)
    local clone=cloneSource:createCloneItem()
    container:AddItem(clone)
    scenarios[#scenarios+1]={name="createCloneItem",source=cloneSource,copy=clone,expected=2}

    local copySource=createStamped("cf-t5:copy-moddata","copyModData")
    container:AddItem(copySource)
    local copied=instanceItem(ITEM_TYPE)
    copied:copyModData(copySource:getModData())
    container:AddItem(copied)
    scenarios[#scenarios+1]={name="copyModData",source=copySource,copy=copied,expected=2}

    local upperSource=createStamped("cf-t5:copy-moddata-upper","CopyModData")
    container:AddItem(upperSource)
    local upper=instanceItem(ITEM_TYPE)
    upper:CopyModData(upperSource:getModData())
    container:AddItem(upper)
    scenarios[#scenarios+1]={name="CopyModData",source=upperSource,copy=upper,expected=2}

    logEvent("LIMITATION", {"case=count-split","detail=no-normal-split-mechanism-for-Base.Note",
        "closest-valid-evidence=createCloneItem-and-copyModData-cases"})

    for i=1,#scenarios do
        local s=scenarios[i]
        local token=tokenOf(s.source)
        local found=locateToken(token)
        local inherited=tokenOf(s.copy)==token
        logEvent("COPY_CASE", {"mechanism="..s.name,"identity="..safe(token),"sourceEngineId="..engineId(s.source),
            "copyEngineId="..engineId(s.copy),"copyInherited="..bool(inherited),"duplicateCount="..tostring(#found),
            "expectedDuplicateCount="..tostring(s.expected),"policy="..(#found>1 and "conflict" or "unique")})
    end
end

local function identityPass0()
    local c=control()
    c.worldBinding=bindWorldContainer()
    if not c.worldBinding then error("no-world-container-found") end
    ensureVehicle(c)
    local player=getPlayer()
    local main=createStamped(MAIN_TOKEN,"normal-transition")
    player:getInventory():AddItem(main)
    c.initialEngineId=engineId(main)
    c.floorX=math.floor(player:getX())
    c.floorY=math.floor(player:getY())
    c.floorZ=math.floor(player:getZ())
    local _,container=resolveWorldContainer(c.worldBinding)
    copyMechanismMatrix(container)
    emitObservation("inventory-pre-save","stamp-detached-then-add",MAIN_TOKEN,"inventory","not-yet")
    saveAndQuit("identityPass",1)
end

local function identityPass1()
    local c=control()
    local found,status=emitObservation("inventory-post-reload","reload",MAIN_TOKEN,"inventory","true")
    if status=="FAIL" then failed=true; completed=true; return end
    local _,dest=resolveWorldContainer(c.worldBinding)
    if not dest then error("world-container-unavailable") end
    local item=found[1].item
    local result=ISTransferAction:transferItem(getPlayer(),item,getPlayer():getInventory(),dest,nil)
    logEvent("TRANSFER_RETURN", {"action=inventory-to-world-container","sameLuaObject="..bool(result==item),"beforeEngineId="..engineId(item),"afterEngineId="..engineId(result)})
    emitObservation("world-container-pre-save","normal-transfer",MAIN_TOKEN,"world-container","not-yet")
    saveAndQuit("identityPass",2)
end

local function identityPass2()
    local c=control()
    local found,status=emitObservation("world-container-post-reload","reload",MAIN_TOKEN,"world-container","true")
    if status=="FAIL" then failed=true; completed=true; return end
    local _,src=resolveWorldContainer(c.worldBinding)
    local square=getCell():getGridSquare(c.floorX,c.floorY,c.floorZ)
    local floor=ItemContainer.new("floor",square,nil)
    local item=found[1].item
    local result=ISTransferAction:transferItem(getPlayer(),item,src,floor,square)
    logEvent("TRANSFER_RETURN", {"action=world-container-to-floor","sameLuaObject="..bool(result==item),"beforeEngineId="..engineId(item),"afterEngineId="..engineId(result)})
    emitObservation("floor-pre-save","normal-transfer",MAIN_TOKEN,"floor","not-yet")
    saveAndQuit("identityPass",3)
end

local function identityPass3()
    local c=control()
    local found,status=emitObservation("floor-post-reload","reload",MAIN_TOKEN,"floor","true")
    if status=="FAIL" then failed=true; completed=true; return end
    local _,vehicleContainer,vehicleState=resolveVehicle(c)
    if not vehicleContainer then
        logEvent("LIMITATION", {"case=floor-to-vehicle","detail="..vehicleState})
        c.vehicleLimitation=vehicleState
        local floorItem=found[1].item
        local square=getCell():getGridSquare(c.floorX,c.floorY,c.floorZ)
        local floor=ItemContainer.new("floor",square,nil)
        floor:DoAddItemBlind(floorItem)
        ISTransferAction:transferItem(getPlayer(),floorItem,floor,getPlayer():getInventory(),nil)
        emitObservation("inventory-after-vehicle-skip-pre-save","floor-to-inventory-fallback",MAIN_TOKEN,"inventory","not-yet")
        saveAndQuit("identityPass",5)
        return
    end
    local item=found[1].item
    local square=getCell():getGridSquare(c.floorX,c.floorY,c.floorZ)
    local floor=ItemContainer.new("floor",square,nil)
    floor:DoAddItemBlind(item)
    local result=ISTransferAction:transferItem(getPlayer(),item,floor,vehicleContainer,nil)
    logEvent("TRANSFER_RETURN", {"action=floor-to-vehicle","sameLuaObject="..bool(result==item),"beforeEngineId="..engineId(item),"afterEngineId="..engineId(result)})
    emitObservation("vehicle-pre-save","normal-transfer",MAIN_TOKEN,"vehicle","not-yet")
    saveAndQuit("identityPass",4)
end

local function identityPass4()
    local c=control()
    local found,status=emitObservation("vehicle-post-reload","reload",MAIN_TOKEN,"vehicle","true")
    if status=="FAIL" then failed=true; completed=true; return end
    local _,src=resolveVehicle(c)
    local item=found[1].item
    local result=ISTransferAction:transferItem(getPlayer(),item,src,getPlayer():getInventory(),nil)
    logEvent("TRANSFER_RETURN", {"action=vehicle-to-inventory","sameLuaObject="..bool(result==item),"beforeEngineId="..engineId(item),"afterEngineId="..engineId(result)})
    emitObservation("inventory-return-pre-save","normal-transfer",MAIN_TOKEN,"inventory","not-yet")
    saveAndQuit("identityPass",5)
end

local function identityPass5()
    local found,status=emitObservation("inventory-return-post-reload","reload",MAIN_TOKEN,"inventory","true")
    if status=="FAIL" then failed=true; completed=true; return end
    local item=found[1].item
    local before=engineId(item)
    getPlayer():getInventory():Remove(item)
    emitObservation("destroyed-pre-save","permanent-remove",MAIN_TOKEN,"absent","not-yet")
    logEvent("DESTRUCTION", {"identity="..MAIN_TOKEN,"engineId="..before,"policy=lost-no-respawn"})
    saveAndQuit("identityPass",6)
end

local function identityPass6()
    local _,status=emitObservation("destroyed-post-reload","reload",MAIN_TOKEN,"absent","true")
    if status=="FAIL" then failed=true end
    for _,token in ipairs({"cf-t5:fresh-source","cf-t5:create-clone","cf-t5:copy-moddata","cf-t5:copy-moddata-upper"}) do
        local found=locateToken(token)
        logEvent("COPY_RELOAD_RESULT", {"identity="..token,"duplicateCount="..tostring(#found),"policy="..(#found>1 and "conflict" or "unique")})
    end
    logEvent("COMPLETE", {"mode=identity","status="..(failed and "FAIL" or "PASS"),"initialEngineId="..safe(control().initialEngineId),
        "vehicleLimitation="..safe(control().vehicleLimitation)})
    completed=true
end

local function findCorpseItem(token)
    local found=locateToken(token)
    for i=1,#found do if found[i].location=="corpse" then return found[i] end end
    return nil
end

local function deathPass0()
    local c=control()
    local player=getPlayer()
    c.deathX=math.floor(player:getX())
    c.deathY=math.floor(player:getY())
    c.deathZ=math.floor(player:getZ())
    local item=createStamped("cf-t5:death-transfer","player-death")
    player:getInventory():AddItem(item)
    c.deathInitialEngineId=engineId(item)
    emitObservation("death-inventory-pre-save","stamp-detached-then-add","cf-t5:death-transfer","inventory","not-yet")
    saveAndQuit("deathPass",1)
end

local function deathPass1()
    local found,status=emitObservation("death-inventory-post-reload","reload","cf-t5:death-transfer","inventory","true")
    if status=="FAIL" then failed=true; completed=true; return end
    logEvent("DEATH_TRIGGER", {"identity=cf-t5:death-transfer","engineId="..engineId(found[1].item),"characterScope=disposable-copy-only"})
    local player=getPlayer()
    player:getBodyDamage():setOverallBodyHealth(0)
    control().deathTriggered=true
    tickCount=0
end

local function afterDeathTick()
    if not control().deathTriggered or completed then return end
    local corpse=findCorpseItem("cf-t5:death-transfer")
    if corpse then
        emitObservation("corpse-pre-save","engine-player-death-transfer","cf-t5:death-transfer","corpse","not-yet")
        control().deathTriggered=false
        saveAndQuit("deathPass",2)
    elseif tickCount > 1800 then
        logEvent("LIMITATION", {"case=player-death-corpse-transfer","detail=corpse-not-observable-within-1800-ticks"})
        failed=true
        completed=true
    end
end

local function deathPass2()
    local _,status=emitObservation("corpse-post-reload","reload","cf-t5:death-transfer","corpse","true")
    if status=="FAIL" then
        logEvent("LIMITATION", {"case=corpse-save-reload","detail=corpse-or-square-not-observable-after-dead-save-load"})
    end
    logEvent("COMPLETE", {"mode=death","status="..(status=="PASS" and "PASS" or "LIMITED"),
        "initialEngineId="..safe(control().deathInitialEngineId)})
    completed=true
end

local function beginRun()
    local modCount,probeActive=activeModStatus()
    if modCount~=1 or not probeActive then error("probe-must-be-only-active-mod count="..tostring(modCount)) end
    local currentMode=mode()
    local c=control()
    logEvent("ENVIRONMENT", {"gameVersion="..gameVersion(),"save="..saveFolder(),"mode="..safe(currentMode),
        "identityPass="..tostring(c.identityPass or 0),"deathPass="..tostring(c.deathPass or 0),"activeModCount="..tostring(modCount)})
    if currentMode=="identity" then
        local pass=tonumber(c.identityPass) or 0
        local fn=({identityPass0,identityPass1,identityPass2,identityPass3,identityPass4,identityPass5,identityPass6})[pass+1]
        if not fn then error("unknown-identity-pass="..tostring(pass)) end
        schedule(fn)
    elseif currentMode=="death" then
        local pass=tonumber(c.deathPass) or 0
        local fn=({deathPass0,deathPass1,deathPass2})[pass+1]
        if not fn then error("unknown-death-pass="..tostring(pass)) end
        schedule(fn)
    else
        error("unsupported-save-name="..saveFolder())
    end
end

local function onPlayerDeath(player)
    if not active or mode()~="death" then return end
    logEvent("ON_PLAYER_DEATH", {"player="..safe(player),"x="..tostring(math.floor(player:getX())),"y="..tostring(math.floor(player:getY()))})
end

local function onGameStart()
    if not mode() then logEvent("SKIPPED", {"reason=current-save-is-not-T5"}); return end
    active=true
    local ok,err=pcall(beginRun)
    if not ok then failed=true; completed=true; logEvent("PROBE_ERROR", {"phase=begin","error="..safe(err)}) end
end

local function onTick()
    if not active then return end
    tickCount=tickCount+1
    if scheduled and tickCount>=180 then
        local fn=scheduled
        scheduled=nil
        local ok,err=pcall(fn)
        if not ok then failed=true; completed=true; logEvent("PROBE_ERROR", {"phase=scheduled","error="..safe(err)}) end
    end
    if mode()=="death" then
        local ok,err=pcall(afterDeathTick)
        if not ok then failed=true; completed=true; logEvent("PROBE_ERROR", {"phase=death-observe","error="..safe(err)}) end
    end
    if completed then
        quitTicks=quitTicks+1
        if quitTicks>=240 then
            active=false
            logEvent("AUTO_QUIT", {"status=normal-quit-to-desktop-requested","probeFailed="..bool(failed)})
            getCore():quitToDesktop()
        end
    end
end

local function onAutoContinueTick()
    if not autoContinuePending then return end
    autoContinueTicks=autoContinueTicks+1
    if autoContinueTicks<30 then return end
    local latest=getLatestSave and getLatestSave() or nil
    local saveName=latest and latest[1] or nil
    local gameMode=latest and latest[2] or nil
    if type(saveName)~="string" or not saveName:match("^T5_") then
        autoContinuePending=false
        logEvent("AUTO_CONTINUE_SKIPPED", {"reason=latest-save-is-not-T5"})
        return
    end
    if not MainScreen or not MainScreen.instance or not MainScreen.instance.setDefaultSandboxVars or not MainScreen.continueLatestSave then return end
    autoContinuePending=false
    logEvent("AUTO_CONTINUE", {"save="..saveName,"gameMode="..safe(gameMode)})
    MainScreen.continueLatestSave(gameMode,saveName)
end

local function onMainMenuEnter()
    autoContinuePending=true
    autoContinueTicks=0
    logEvent("AUTO_MENU_READY", {"status=waiting-for-main-screen-instance"})
end

T5.locateToken=locateToken
Events.OnGameStart.Add(onGameStart)
Events.OnPlayerDeath.Add(onPlayerDeath)
Events.OnTick.Add(onAutoContinueTick)
Events.OnTick.Add(onTick)
Events.OnRenderTick.Add(onAutoContinueTick)
Events.OnMainMenuEnter.Add(onMainMenuEnter)
logEvent("SCRIPT_LOADED", {"gameVersion="..gameVersion()})
