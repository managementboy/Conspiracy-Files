-- A SEPARATE, PARALLEL RUNTIME FOR HAND-AUTHORED VOCABULARY MYSTERIES.
--
-- Owner, 2026-09-25, on the rebuild: "build the new engine and content."
-- Three ADHD frames (3am on-call, game designer, one-hour) converged on
-- keeping this structurally independent of the live case generator, so it
-- can never alter its behaviour, be broken by it, or be blamed for a fault
-- in it:
--   * NO require of GeneratedRuntime, Session, Story or Generator - this
--     module knows nothing about the live scheduler and the live scheduler
--     never calls into this one;
--   * its own ModData root ("ConspiracyFiles.Mystery"), its own tag on
--     items ("cfMysteryId"), so nothing it writes can collide with the
--     legacy case's own "cfGeneratedId";
--   * its own Events hooks (OnGameStart, EveryTenMinutes), not a job on the
--     legacy scheduler - a bug here cannot stall the legacy tick;
--   * deletable as a file: nothing else in the mod requires this one.
--
-- What it does: places one hand-authored mystery's findings into real
-- containers near the survivor, detects its GATE (here: a skill threshold
-- read directly from the engine, itself a real, provable game state), and
-- reports what the Interpreter says is now visible and what CLOSE reports.
-- Placement, discovery and GATE detection are new, minimal and honest -
-- not reused pretending to be the legacy engine's own, and not yet the
-- general MysteryPlacement adapter the build plan names for later content;
-- this is the first mystery's own working proof, native-verified, that the
-- pure engine core (Vocabulary/Ledger/Interpreter/Linter/Spoilage) is real.
local Vocab=require("ConspiracyFiles/Mystery/Vocabulary")
local Ledger=require("ConspiracyFiles/Mystery/Ledger")
local Interpreter=require("ConspiracyFiles/Mystery/Interpreter")
local Linter=require("ConspiracyFiles/Mystery/Linter")
local Kinds=require("ConspiracyFiles/Generated/EvidenceKinds")
local Searched=require("ConspiracyFiles/SearchedContainers")
local CFLog=require("ConspiracyFiles/Log")

-- The real PZ item type an object/prose/short finding's `kind` spawns. An
-- object-capacity kind (a rule-eligible catalogue item name like
-- "ElectronicsScrap") IS the real item type, exactly as ObjectRules
-- already lists it; a prose/short-capacity kind is EvidenceKinds' own
-- SYMBOLIC key (the same one the legacy engine authors write, "ticket",
-- "notepad") and the real item lives at its `.fullType`. Confusing the two
-- placed nothing near the survivor - found live, 2026-09-25: AddItem
-- returned nil for "ticket" and "Base.Ticket" alike, silently, because
-- neither is a real item; only "Base.ParkingTicket" (EvidenceKinds' own
-- fullType for that key) is.
local function itemType(finding)
    if finding.capacity=="object" then return finding.kind end
    local carrier=finding.kind and Kinds.get(finding.kind)
    return (carrier and carrier.fullType) or finding.kind
end

ConspiracyFiles=ConspiracyFiles or {}
local M=ConspiracyFiles.MysteryRuntime or {}
ConspiracyFiles.MysteryRuntime=M

local TAG="ConspiracyFiles.Mystery"
local ITEM_MARK="cfMysteryId"
local function log(message) CFLog.message("mystery","note",message) end

local function root()
    local store=ModData and ModData.getOrCreate(TAG)
    if not store then return nil end
    store.schemaVersion=store.schemaVersion or 1
    store.placedAt=store.placedAt or {}       -- findingId -> in-game hour
    store.ledger=store.ledger or Ledger.new()
    store.mysteryId=store.mysteryId
    return store
end

local function worldHours()
    local ok,h=pcall(function() return getGameTime():getWorldAgeHours() end)
    if ok and type(h)=="number" and h==h then return h end
    return 0
end

-- Load one mystery (a Vocabulary table, already linted offline) and
-- attach its ledger. Refuses to attach a mystery the linter would refuse -
-- named and refused here too, not only in the offline test suite, so a
-- corrupt save can never carry an invalid one.
function M.attach(mystery)
    local ok,why=Linter.lint(mystery)
    if not ok then return false,"mystery failed the honesty check: "..tostring(why) end
    local store=root(); if not store then return false,"no save to attach to" end
    if store.mysteryId and store.mysteryId~=mystery.id then
        return false,"a different mystery is already attached this save"
    end
    store.mysteryId=mystery.id
    M.current=mystery
    return true
end

-- Place every "site" finding into a real container near (x,y,z), one
-- finding per container - honestly minimal: this picks the first eligible
-- container it finds via a bounded local scan, the same discipline the
-- legacy Storage.scan uses (a container that can hold an item, that is not
-- already searched). It does not touch Session's placement machinery.
function M.place(mystery,x,y,z)
    local store=root(); if not store then return false,"no save" end
    local cell=getCell and getCell(); if not cell then return false,"no world" end
    local placed=0
    for id,finding in pairs(mystery.findings) do
        if finding.where=="site" and not store.placedAt[id] then
            local found=false
            for dx=-1,1 do for dy=-1,1 do
                if found then break end
                local sq=cell:getGridSquare(x+dx,y+dy,z)
                local objects=sq and sq:getObjects()
                for i=0,(objects and objects:size() or 0)-1 do
                    local obj=objects:get(i)
                    if obj and obj.getContainerCount and obj:getContainerCount()>0 then
                        local container=obj:getContainerByIndex(0)
                        -- NOT isExplored(): the engine sets that for a whole
                        -- building's containers as its chunk loads, before
                        -- the survivor can reach any of them - the exact
                        -- fault DR-20260925-SEARCHED-MEANS-LOOKED found and
                        -- fixed in the legacy engine, reproduced here until
                        -- caught live (a fresh world placed zero findings
                        -- near the survivor, every time, 2026-09-25). The
                        -- same module answers it the same way: the player
                        -- having looked, not loot having generated.
                        if container and Searched.searched(container)~=true then
                            local item=container:AddItem(itemType(finding) or "Base.Notepad")
                            if item then
                                item:getModData()[ITEM_MARK]=id
                                store.placedAt[id]=worldHours()
                                placed=placed+1; found=true
                                log("placed "..id.." at "..tostring(x+dx)..","..tostring(y+dy))
                                break
                            end
                        end
                    end
                end
            end end
        end
    end
    return true,placed
end

-- A finding is known the moment its marked item is picked up by the
-- survivor - a minimal, honest discovery signal for this first mystery,
-- distinct from the legacy engine's Search Mode recognition.
function M.pollInventory()
    local store=root(); if not store or not M.current then return end
    local p=getPlayer and getPlayer(); if not p then return end
    local inv=p:getInventory(); if not inv then return end
    local items=inv:getItems()
    for i=0,items:size()-1 do
        local it=items:get(i)
        local md=it and it.getModData and it:getModData()
        local id=type(md)=="table" and md[ITEM_MARK]
        if id and M.current.findings[id] and not Ledger.isKnown(store.ledger,id) then
            local ledger,why=Ledger.markKnown(store.ledger,id,worldHours(),"picked-up")
            if ledger then store.ledger=ledger; log("recognised "..id) end
        end
    end
end

-- Whether a GATE's own mechanic is satisfied, checked against real game
-- state - for this mystery, a skill threshold - and if so, marks its
-- produced finding known. The mechanic check lives here, in the runtime,
-- never in the pure Interpreter: the interpreter only reads a ledger.
M.SKILL_THRESHOLD=2
function M.pollGates()
    local store=root(); if not store or not M.current then return end
    local p=getPlayer and getPlayer(); if not p then return end
    for i,gate in ipairs(M.current.gates or {}) do
        if not Ledger.isKnown(store.ledger,gate.produces) then
            local satisfied=false
            if gate.kind=="skill" then
                local ok,level=pcall(function() return p:getPerkLevel(Perks.Electricity) end)
                satisfied=ok and type(level)=="number" and level>=M.SKILL_THRESHOLD
            end
            if satisfied then
                local ledger=Ledger.markKnown(store.ledger,gate.produces,worldHours(),"gate:"..gate.kind)
                if ledger then
                    store.ledger=ledger
                    log("gate "..i.." satisfied: "..gate.produces.." now known")
                end
            end
        end
    end
end

-- What the survivor's record currently shows, and what the mystery reports.
function M.record()
    local store=root(); if not store or not M.current then return {} end
    return Interpreter.visibleReveals(M.current,store.ledger,worldHours(),store.placedAt)
end
function M.status()
    local store=root(); if not store or not M.current then return "no-mystery" end
    return Interpreter.close(M.current,store.ledger)
end

Events.OnGameStart.Add(function() pcall(root) end)
Events.EveryTenMinutes.Add(function()
    pcall(M.pollInventory)
    pcall(M.pollGates)
end)

return M
