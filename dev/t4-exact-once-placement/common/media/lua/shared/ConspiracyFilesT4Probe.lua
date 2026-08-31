-- Conspiracy-Files Spike T4: exact-once deferred placement probe.
-- Disposable development code. This is NOT production Conspiracy-Files code.

ConspiracyFiles = ConspiracyFiles or {}
ConspiracyFiles.T4Probe = ConspiracyFiles.T4Probe or {}

local T4 = ConspiracyFiles.T4Probe
local PREFIX = "[CF-T4]"
local CONTROL_TAG = "ConspiracyFiles.T4.Control"
local LEDGER_TAG = "ConspiracyFiles.T4.Ledger"
local ITEM_TYPE = "Base.Note"
local MAX_DEPTH = 64
local MAX_BYTES = 500 * 1024
local active = false
local failed = false
local completed = false
local tickCount = 0
local quitTicks = 0
local autoContinuePending = true
local autoContinueTicks = 0
local loadGridCount = 0
local targetLoadGridCount = 0
local loadedSquares = {}
local streamState = nil

local SCENARIOS = {
    { id="normal", injected="none", target="primary" },
    { id="fail_before_intent", injected="before-intent", target="primary" },
    { id="fail_after_intent", injected="after-intent", target="primary" },
    { id="fail_after_stamp", injected="after-stamp-before-add", target="primary" },
    { id="fail_after_add", injected="after-add-before-verify", target="primary" },
    { id="fail_after_verify", injected="after-verify-before-ledger-commit", target="primary" },
    { id="fail_after_ledger_commit", injected="after-ledger-commit-before-save", target="primary" },
    { id="committed_missing", injected="remove-after-ledger-commit-before-save", target="primary" },
    { id="unavailable_target", injected="target-never-available", target="missing" },
    { id="destroyed_before", injected="remove-container-before-placement", target="destroy_before" },
    { id="destroyed_after", injected="remove-container-after-ledger-commit", target="destroy_after" },
    { id="burned_target", injected="burned-classification-no-live-fire", target="burned" },
    { id="duplicate_conflict", injected="two-preexisting-stamped-items", target="primary" },
}

local function safeString(value)
    if value == nil then return "<nil>" end
    return tostring(value):gsub("|", "/"):gsub("\r", " "):gsub("\n", " ")
end

local function boolText(value) return value and "true" or "false" end

local function logEvent(kind, fields)
    local parts = { PREFIX, "EVENT", "kind=" .. safeString(kind) }
    if fields then for i=1,#fields do parts[#parts+1] = fields[i] end end
    print(table.concat(parts, "|"))
end

local function currentSaveFolder()
    local currentSave = getCurrentSaveName and getCurrentSaveName() or ""
    return tostring(currentSave):match("([^\\/]+)$") or ""
end

local function isT4Save() return currentSaveFolder():match("^T4_") ~= nil end

local function gameVersion()
    if not getGameVersion then return "unavailable" end
    local ok, value = pcall(getGameVersion)
    return ok and safeString(value) or "error"
end

local function activeModStatus()
    local ok, mods = pcall(getActivatedMods)
    if not ok or mods == nil then return -1, false end
    local countOk, count = pcall(function() return mods:size() end)
    local containsOk, contains = pcall(function() return mods:contains("ConspiracyFiles_T4_Probe") end)
    return countOk and count or -1, containsOk and contains == true
end

local function deepCopy(value, seen)
    if type(value) ~= "table" then return value end
    seen = seen or {}
    if seen[value] then error("alias-or-cycle") end
    seen[value] = true
    local copy = {}
    for key, child in pairs(value) do copy[deepCopy(key, seen)] = deepCopy(child, seen) end
    seen[value] = nil
    return copy
end

local function validatePlain(value, depth, seen)
    local valueType = type(value)
    if valueType == "string" then return true, #value * 4 + 8 end
    if valueType == "number" then return true, 32 end
    if valueType == "boolean" then return true, 8 end
    if valueType ~= "table" then return false, "forbidden-value-type:" .. valueType end
    if depth > MAX_DEPTH then return false, "depth-limit" end
    if getmetatable(value) ~= nil then return false, "metatable" end
    if seen[value] then return false, "alias-or-cycle" end
    seen[value] = true
    local bytes = 8
    for key, child in pairs(value) do
        local keyType = type(key)
        if keyType ~= "string" and keyType ~= "number" then return false, "forbidden-key-type:" .. keyType end
        local keyOk, keyBytes = validatePlain(key, depth + 1, seen)
        if not keyOk then return false, keyBytes end
        local childOk, childBytes = validatePlain(child, depth + 1, seen)
        if not childOk then return false, childBytes end
        bytes = bytes + keyBytes + childBytes + 12
        if bytes > MAX_BYTES then return false, "size-limit" end
    end
    seen[value] = nil
    return true, bytes
end

local function getWrapper() return ModData.getOrCreate(LEDGER_TAG) end

local function getRoot()
    local wrapper = getWrapper()
    if type(wrapper.canonical) ~= "table" then
        wrapper.canonical = { schemaVersion=1, run=0, targets={}, records={} }
    end
    return wrapper.canonical
end

local function commitRoot(candidate, reason)
    local staged = deepCopy(candidate)
    local valid, detail = validatePlain(staged, 1, {})
    if not valid then error("P4-R32-reject:" .. safeString(detail)) end
    getWrapper().canonical = staged
    logEvent("CANONICAL_SWAP", { "reason="..reason, "estimatedBytes="..tostring(detail), "budget="..tostring(MAX_BYTES) })
    return staged
end

local function mutateRoot(reason, fn)
    local staged = deepCopy(getRoot())
    fn(staged)
    return commitRoot(staged, reason)
end

local function spriteName(object)
    local sprite = object and object:getSprite() or nil
    return sprite and safeString(sprite:getName()) or "<nil>"
end

local function bindingKey(binding)
    return tostring(binding.x)..","..tostring(binding.y)..","..tostring(binding.z)..":"..binding.sprite..":"..binding.containerType..":"..tostring(binding.matchOrdinal)
end

local function bindContainers()
    local player = getPlayer()
    if player == nil then error("player-unavailable") end
    local found, usedSquares = {}, {}
    local px, py, pz = math.floor(player:getX()), math.floor(player:getY()), math.floor(player:getZ())
    for radius=0,60 do
        for x=px-radius,px+radius do
            for _,y in ipairs({py-radius,py+radius}) do
                local square = getCell():getGridSquare(x,y,pz)
                if square then
                    local objects = square:getObjects()
                    for oi=0,objects:size()-1 do
                        local object = objects:get(oi)
                        for ci=0,object:getContainerCount()-1 do
                            local container = object:getContainerByIndex(ci)
                            local raw = tostring(x)..","..tostring(y)..","..tostring(pz)
                            if container and not usedSquares[raw] then
                                usedSquares[raw] = true
                                found[#found+1] = { x=x,y=y,z=pz,sprite=spriteName(object),containerType=safeString(container:getType()),
                                    objectIndex=oi,containerIndex=ci,matchOrdinal=1 }
                                break
                            end
                        end
                    end
                end
            end
        end
        for y=py-radius+1,py+radius-1 do
            for _,x in ipairs({px-radius,px+radius}) do
                local square = getCell():getGridSquare(x,y,pz)
                if square then
                    local objects = square:getObjects()
                    for oi=0,objects:size()-1 do
                        local object = objects:get(oi)
                        for ci=0,object:getContainerCount()-1 do
                            local container = object:getContainerByIndex(ci)
                            local raw = tostring(x)..","..tostring(y)..","..tostring(pz)
                            if container and not usedSquares[raw] then
                                usedSquares[raw] = true
                                found[#found+1] = { x=x,y=y,z=pz,sprite=spriteName(object),containerType=safeString(container:getType()),
                                    objectIndex=oi,containerIndex=ci,matchOrdinal=1 }
                                break
                            end
                        end
                    end
                end
            end
        end
        if #found >= 4 then break end
    end
    if #found < 3 then error("need-at-least-three-world-containers-found="..tostring(#found)) end
    found[4] = found[4] or deepCopy(found[3])
    found[4].classification = "burned"
    return { primary=found[1], destroy_before=found[2], destroy_after=found[3], burned=found[4],
        missing={x=-999999,y=-999999,z=0,sprite="missing",containerType="missing",objectIndex=0,containerIndex=0,matchOrdinal=1} }
end

local function resolve(binding)
    if not binding then return nil,nil,"binding-missing" end
    if binding.classification == "burned" then return nil,nil,"target-classified-burned" end
    local square = getCell():getGridSquare(binding.x,binding.y,binding.z)
    if not square then return nil,nil,"square-unloaded" end
    local objects = square:getObjects()
    if binding.objectIndex and binding.objectIndex >= 0 and binding.objectIndex < objects:size() then
        local object = objects:get(binding.objectIndex)
        if spriteName(object) == binding.sprite and binding.containerIndex >= 0 and binding.containerIndex < object:getContainerCount() then
            local container = object:getContainerByIndex(binding.containerIndex)
            if container and safeString(container:getType()) == binding.containerType then return object,container,"available-by-index" end
        end
    end
    local matches = 0
    for oi=0,objects:size()-1 do
        local object = objects:get(oi)
        if spriteName(object) == binding.sprite then
            for ci=0,object:getContainerCount()-1 do
                local container = object:getContainerByIndex(ci)
                if container and safeString(container:getType()) == binding.containerType then
                    matches = matches + 1
                    if matches == binding.matchOrdinal then return object,container,"available" end
                end
            end
        end
    end
    return nil,nil,"container-missing"
end

local function tokenFor(id) return "cf-t4:" .. id end

local function scanToken(container, token)
    if not container then return 0 end
    local count = 0
    local items = container:getItems()
    for i=0,items:size()-1 do
        local item = items:get(i)
        local md = item:getModData()
        if md and md.cfT4PlacementToken == token then count = count + 1 end
    end
    return count
end

local function createStamped(token, scenarioId)
    local item = instanceItem(ITEM_TYPE)
    if item == nil then error("instanceItem-returned-nil") end
    local md = item:getModData()
    md.cfT4PlacementToken = token
    md.cfT4AssetId = "dead-air:probe:" .. scenarioId
    md.cfT4PlacementId = "placement:" .. scenarioId
    return item
end

local function addStamped(container, token, scenarioId)
    local item = createStamped(token, scenarioId)
    local added = container:AddItem(item)
    if added == nil then error("AddItem-returned-nil") end
    container:setDrawDirty(true)
    return added
end

local function updateRecord(id, reason, fn)
    return mutateRoot(reason, function(root)
        local record = root.records[id]
        if record == nil then error("missing-record:"..id) end
        fn(record, root)
    end)
end

local function setState(id, state, reason, detail)
    updateRecord(id, reason, function(record)
        record.state = state
        record.lastReason = reason
        record.detail = detail
        record.transitions = record.transitions + 1
    end)
end

local function removeTokenItems(container, token)
    local removed = 0
    local items = container:getItems()
    for i=items:size()-1,0,-1 do
        local item = items:get(i)
        if item:getModData().cfT4PlacementToken == token then container:Remove(item); removed=removed+1 end
    end
    return removed
end

local function injectFirstRun(root)
    for i=1,#SCENARIOS do
        local s = SCENARIOS[i]
        root.records[s.id] = { id=s.id, token=tokenFor(s.id), target=s.target, state="pending", injected=s.injected,
            transitions=0, reconcileCount=0, lastCount=0, detail="seeded" }
    end
    root.run = 1
    return commitRoot(root, "seed-matrix")
end

local function placementSteps(id, stopAfter)
    local root = getRoot()
    local record = root.records[id]
    local binding = root.targets[record.target]
    local _, container, availability = resolve(binding)
    if not container then setState(id,"blocked","target-unavailable",availability); return end
    if stopAfter == "before-intent" then return end
    setState(id,"placing","intent-staged",availability)
    if stopAfter == "after-intent" then return end
    local item = createStamped(record.token,id)
    if stopAfter == "after-stamp-before-add" then return end
    local added = container:AddItem(item)
    if added == nil then error("AddItem-returned-nil") end
    container:setDrawDirty(true)
    if stopAfter == "after-add-before-verify" then return end
    local count = scanToken(container,record.token)
    if count ~= 1 then error("post-add-count="..tostring(count)) end
    updateRecord(id,"world-verified",function(r) r.lastCount=count; r.detail="one-stamped-item-observed" end)
    if stopAfter == "after-verify-before-ledger-commit" then return end
    setState(id,"placed","ledger-commit","one-stamped-item-observed")
end

local function removeBoundObject(binding)
    local object, _, availability = resolve(binding)
    if not object then return false,availability end
    local square = object:getSquare()
    triggerEvent("OnObjectAboutToBeRemoved", object)
    square:RemoveTileObject(object)
    return true,"removed"
end

local function prepareFirstRun()
    local targets = bindContainers()
    local root = { schemaVersion=1, run=0, targets=targets, records={} }
    injectFirstRun(root)
    for name,binding in pairs(targets) do logEvent("TARGET_BOUND", {"name="..name,"binding="..bindingKey(binding)}) end

    placementSteps("normal", nil)
    placementSteps("fail_before_intent", "before-intent")
    placementSteps("fail_after_intent", "after-intent")
    placementSteps("fail_after_stamp", "after-stamp-before-add")
    placementSteps("fail_after_add", "after-add-before-verify")
    placementSteps("fail_after_verify", "after-verify-before-ledger-commit")
    placementSteps("fail_after_ledger_commit", nil)
    placementSteps("committed_missing", nil)
    do
        local r=getRoot().records.committed_missing
        local _,c=resolve(getRoot().targets.primary)
        local removed=removeTokenItems(c,r.token)
        logEvent("FAULT_INJECTED", {"scenario=committed_missing","removed="..tostring(removed)})
    end
    setState("unavailable_target","pending","intent-waits-for-target","never-loaded-binding")
    local removedBefore, beforeDetail = removeBoundObject(getRoot().targets.destroy_before)
    logEvent("FAULT_INJECTED", {"scenario=destroyed_before","removed="..boolText(removedBefore),"detail="..beforeDetail})
    placementSteps("destroyed_before", nil)
    placementSteps("destroyed_after", nil)
    local removedAfter, afterDetail = removeBoundObject(getRoot().targets.destroy_after)
    logEvent("FAULT_INJECTED", {"scenario=destroyed_after","removed="..boolText(removedAfter),"detail="..afterDetail})
    setState("burned_target","blocked","burned-target-classification","live-fire-not-injected")
    do
        local r=getRoot().records.duplicate_conflict
        local _,c=resolve(getRoot().targets.primary)
        addStamped(c,r.token,r.id); addStamped(c,r.token,r.id)
        setState(r.id,"placing","duplicate-precondition-injected","two-stamped-items")
    end
end

local function reconcileOne(id)
    local root = getRoot()
    local record = root.records[id]
    local binding = root.targets[record.target]
    local _, container, availability = resolve(binding)
    if not container then
        if record.state == "placed" then setState(id,"lost","committed-world-item-unavailable",availability)
        elseif record.state ~= "blocked" and record.state ~= "lost" then setState(id,"blocked","target-unavailable",availability) end
        updateRecord(id,"reconcile-unavailable",function(r) r.reconcileCount=r.reconcileCount+1; r.lastCount=0 end)
        return
    end
    local count = scanToken(container,record.token)
    if count > 1 then
        setState(id,"conflict","duplicate-detected","count="..tostring(count))
    elseif count == 1 then
        if record.state ~= "placed" then setState(id,"placed","reconciled-from-world-stamp","count=1") end
    elseif record.state == "placed" then
        setState(id,"lost","committed-item-missing-no-respawn","count=0")
    elseif record.state == "pending" or record.state == "placing" or record.state == "blocked" then
        setState(id,"placing","reconcile-intent","count=0")
        addStamped(container,record.token,id)
        local after = scanToken(container,record.token)
        if after ~= 1 then error("reconcile-post-add-count="..tostring(after)) end
        setState(id,"placed","reconcile-world-verified","count=1")
        count = after
    end
    updateRecord(id,"reconcile-count",function(r) r.reconcileCount=r.reconcileCount+1; r.lastCount=count end)
end

local function reconcileAll()
    for i=1,#SCENARIOS do reconcileOne(SCENARIOS[i].id) end
end

local function emitMatrix(stage)
    local root=getRoot()
    local failures=0
    local expected={normal={"placed",1},fail_before_intent={"placed",1},fail_after_intent={"placed",1},fail_after_stamp={"placed",1},
        fail_after_add={"placed",1},fail_after_verify={"placed",1},fail_after_ledger_commit={"placed",1},committed_missing={"lost",0},
        unavailable_target={"blocked",0},destroyed_before={"blocked",0},destroyed_after={"lost",0},burned_target={"blocked",0},duplicate_conflict={"conflict",2}}
    for i=1,#SCENARIOS do
        local id=SCENARIOS[i].id
        local r=root.records[id]
        local _,c=resolve(root.targets[r.target])
        local count=scanToken(c,r.token)
        local e=expected[id]
        local injectedStage=stage=="pre-reload-injected"
        local pass=injectedStage or (r.state==e[1] and count==e[2])
        if not pass then failures=failures+1 end
        logEvent("SCENARIO_RESULT", {"stage="..stage,"scenario="..id,"preState="..r.injected,"state="..r.state,
            "worldCount="..tostring(count),"ledgerCount="..tostring(r.lastCount),"reconciles="..tostring(r.reconcileCount),"pass="..boolText(pass)})
    end
    local status=stage=="pre-reload-injected" and "PRESTATE_RECORDED" or (failures==0 and "PASS" or "FAIL")
    logEvent("MATRIX_RESULT", {"stage="..stage,"failures="..tostring(failures),"status="..status})
    if stage~="pre-reload-injected" and failures>0 then failed=true end
end

local function beginStreamingCycle()
    local root=getRoot()
    local b=root.targets.primary
    local player=getPlayer()
    streamState={phase="away",ticks=0,originalX=player:getX(),originalY=player:getY(),originalZ=player:getZ(),target=b,
        beforeLoadGrid=loadGridCount,beforeTargetLoadGrid=targetLoadGridCount,sawUnloaded=false}
    player:teleportTo(b.x+700.5,b.y+700.5,b.z)
    logEvent("STREAM_TELEPORT", {"phase=away","x="..tostring(b.x+700),"y="..tostring(b.y+700)})
end

local function advanceStreaming()
    if not streamState then return false end
    local s=streamState
    s.ticks=s.ticks+1
    local targetSquare=getCell():getGridSquare(s.target.x,s.target.y,s.target.z)
    if targetSquare==nil then s.sawUnloaded=true end
    if s.phase=="away" and s.ticks>=600 then
        s.phase="return"; s.ticks=0
        getPlayer():teleportTo(s.originalX,s.originalY,s.originalZ)
        logEvent("STREAM_TELEPORT", {"phase=return","targetWasUnloaded="..boolText(s.sawUnloaded)})
    elseif s.phase=="return" and s.ticks>=600 then
        local available=resolve(s.target)~=nil
        logEvent("STREAM_RESULT", {"targetWasUnloaded="..boolText(s.sawUnloaded),"targetAvailableAfterReturn="..boolText(available),
            "loadGridDelta="..tostring(loadGridCount-s.beforeLoadGrid),"targetLoadGridDelta="..tostring(targetLoadGridCount-s.beforeTargetLoadGrid)})
        streamState=nil
        return true
    end
    return false
end

local function saveAndScheduleQuit(nextPass)
    local control=ModData.getOrCreate(CONTROL_TAG)
    control.pass=nextPass
    control.lastSaveRequested=true
    local started=getTimeInMillis()
    local ok,err=pcall(saveGame)
    logEvent("SAVE_RETURNED", {"nextPass="..tostring(nextPass),"ok="..boolText(ok),"elapsedMs="..tostring(getTimeInMillis()-started),"error="..safeString(err)})
    completed=true
end

local function beginRun()
    local modCount,probeActive=activeModStatus()
    if modCount~=1 or not probeActive then error("probe-must-be-only-active-mod count="..tostring(modCount)) end
    local control=ModData.getOrCreate(CONTROL_TAG)
    local pass=tonumber(control.pass) or 0
    logEvent("ENVIRONMENT", {"gameVersion="..gameVersion(),"save="..currentSaveFolder(),"pass="..tostring(pass),"activeModCount="..tostring(modCount),
        "loadGridCallbacksBeforeGameStart="..tostring(loadGridCount)})
    if pass==0 then
        prepareFirstRun()
        emitMatrix("pre-reload-injected")
        saveAndScheduleQuit(1)
    elseif pass==1 then
        reconcileAll()
        emitMatrix("first-reload-reconciled")
        beginStreamingCycle()
    elseif pass==2 then
        reconcileAll()
        emitMatrix("second-reload-stable")
        saveAndScheduleQuit(3)
    else
        reconcileAll()
        emitMatrix("third-reload-final")
        logEvent("COMPLETE", {"status="..(failed and "FAIL" or "PASS"),"loadGridCallbacks="..tostring(loadGridCount),
            "targetLoadGridCallbacks="..tostring(targetLoadGridCount)})
        completed=true
    end
end

local function onLoadGridSquare(square)
    loadGridCount=loadGridCount+1
    local key=tostring(square:getX())..","..tostring(square:getY())..","..tostring(square:getZ())
    loadedSquares[key]=(loadedSquares[key] or 0)+1
    if active then
        local root=getRoot()
        local b=root.targets and root.targets.primary or nil
        if b and square:getX()==b.x and square:getY()==b.y and square:getZ()==b.z then
            targetLoadGridCount=targetLoadGridCount+1
            logEvent("LOAD_GRID_TARGET", {"count="..tostring(targetLoadGridCount),"square="..key})
        end
    end
end

local function onGameStart()
    if not isT4Save() then logEvent("SKIPPED", {"reason=current-save-is-not-T4"}); return end
    active=true
    local ok,err=pcall(beginRun)
    if not ok then failed=true; completed=true; logEvent("PROBE_ERROR", {"phase=begin","error="..safeString(err)}) end
end

local function onTick()
    if not active then return end
    tickCount=tickCount+1
    if streamState then
        local ok,done=pcall(advanceStreaming)
        if not ok then failed=true; streamState=nil; logEvent("PROBE_ERROR", {"phase=stream","error="..safeString(done)})
        elseif done then reconcileAll(); emitMatrix("post-stream-reconciled"); saveAndScheduleQuit(2) end
    end
    if completed then
        quitTicks=quitTicks+1
        if quitTicks>=180 then
            active=false
            logEvent("AUTO_QUIT", {"status=normal-quit-to-desktop-requested","probeFailed="..boolText(failed)})
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
    if type(saveName)~="string" or not saveName:match("^T4_") then
        autoContinuePending=false
        logEvent("AUTO_CONTINUE_SKIPPED", {"reason=latest-save-is-not-T4"})
        return
    end
    if not MainScreen or not MainScreen.instance or not MainScreen.instance.setDefaultSandboxVars or not MainScreen.continueLatestSave then return end
    autoContinuePending=false
    logEvent("AUTO_CONTINUE", {"save="..saveName,"gameMode="..safeString(gameMode)})
    MainScreen.continueLatestSave(gameMode,saveName)
end

local function onMainMenuEnter()
    autoContinuePending=true
    autoContinueTicks=0
    logEvent("AUTO_MENU_READY", {"status=waiting-for-main-screen-instance"})
end

T4.reconcileAll=reconcileAll
T4.emitMatrix=emitMatrix
Events.LoadGridsquare.Add(onLoadGridSquare)
Events.OnGameStart.Add(onGameStart)
Events.OnTick.Add(onAutoContinueTick)
Events.OnTick.Add(onTick)
Events.OnRenderTick.Add(onAutoContinueTick)
Events.OnMainMenuEnter.Add(onMainMenuEnter)
logEvent("SCRIPT_LOADED", {"gameVersion="..gameVersion()})
