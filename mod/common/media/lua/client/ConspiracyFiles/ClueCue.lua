-- The wordless cue (P4-R132, stage 2; docs/design/SEARCH_TO_FIND.md, "Sense").
-- Replaces ClueHints' spoken hints.
--
-- Walking close by a clue nobody has recognised, where the survivor could see
-- it, they may say "Hm?" in the speech bubble. Nothing else: no halo, no name,
-- no direction, no distance. Searching is what finds it. The rules (once per
-- place, the first-cue teaching line, "...again?", cooldown, chance in the dark
-- and rain) are in ClueCueRules; this file asks the game.
--
-- Never a world sound: the soft UI tick only, which cannot attract zombies.
local Rules=require("ConspiracyFiles/ClueCueRules")
local World=require("ConspiracyFiles/WorldAccess")
local CFLog=require("ConspiracyFiles/Log")
ConspiracyFiles=ConspiracyFiles or {}
if ConspiracyFiles.ClueCue and ConspiracyFiles.ClueCue.stop then ConspiracyFiles.ClueCue.stop() end
local Q={}
ConspiracyFiles.ClueCue=Q
Q.Rules=Rules
Q.TAG="ConspiracyFiles.ClueCue"
Q.POLL_MS=500
local SOUND="UIObjectMenuEnter"

local function log(s) CFLog.message("hint","hint",s) end
local function now() return getTimeInMillis and getTimeInMillis() or 0 end

-- This session only: the last cue's time, and the clues weighed on this
-- approach (id -> {x,y,z}), so each approach rolls and logs once.
local lastAt
local weighed={}
local unseen={}
local nextPoll=0
Q.counters={said=0,suppressed=0}

local function enabled()
    return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
        and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
end

-- The saved state, in the world's ModData: small and bounded (ClueCueRules).
function Q.store()
    if not (ModData and ModData.getOrCreate) then return nil end
    return Rules.state(ModData.getOrCreate(Q.TAG))
end

-- Is the clue really still in its container? A clue already taken keeps its
-- "placed" status, and a cue at an empty drawer would be a lie.
local function present(clue,player)
    local t=clue.target
    if type(t)~="table" then return false end
    local container
    if clue.vehicle then
        local here={vehiclePart=clue.part,x=math.floor(player:getX()),y=math.floor(player:getY()),z=math.floor(player:getZ())}
        container=World.resolveVehicle(here,clue.token,Rules.FORGET_RADIUS+8)
    else
        container=World.resolve(t)
    end
    if not container then return false end
    local found
    local scan=World.count(container,clue.token,function(n) found=n end,1)
    for _=1,512 do if scan() then break end end
    return type(found)=="number" and found>=1
end

-- The game's own foraging factors for this spot (1 = bright, clear).
local function conditions(player,square)
    local light,weather=1,1
    if forageSystem then
        pcall(function() light=forageSystem.getLightLevelPenalty(player,square,true) end)
        pcall(function() weather=forageSystem.getWeatherPenalty(player,square) end)
    end
    return light,weather
end

local function say(player,line)
    local spoke=pcall(function() player:Say(line) end)
    local audible=false
    if getSoundManager then
        local ok,manager=pcall(getSoundManager)
        if ok and manager then audible=pcall(function() manager:playUISound(SOUND) end) end
    end
    return spoke,audible
end

function Q.step()
    if not enabled() then return end
    local t=now()
    if t<nextPoll then return end
    nextPoll=t+Q.POLL_MS
    local player=getPlayer and getPlayer()
    local search=ConspiracyFiles.ClueSearch
    local R=ConspiracyFiles.GeneratedRuntime
    if not (player and search and search.liveClues and search.seesSpot and R) then return end
    local clues=search.liveClues(player)
    local px,py,pz=player:getX(),player:getY(),player:getZ()
    -- Leaving re-arms a spot for the next approach.
    for id,at in pairs(weighed) do
        if not Rules.near(px,py,pz,at.x,at.y,at.z,Rules.FORGET_RADIUS) then weighed[id]=nil end
    end
    for id,at in pairs(unseen) do
        if not Rules.near(px,py,pz,at.x,at.y,at.z,Rules.FORGET_RADIUS) then unseen[id]=nil end
    end
    local store
    for _,clue in ipairs(clues) do
        if not clue.recognised and clue.status=="placed" and not weighed[clue.id]
            and (Q.debugOnly==nil or Q.debugOnly==clue.id)
            and Rules.near(px,py,pz,clue.x,clue.y,clue.z,Rules.RADIUS) then
            local square=getCell():getGridSquare(clue.x,clue.y,clue.z)
            local seen,why=false,"not loaded"
            if square then seen,why=search.seesSpot(player,square) end
            local here=seen and present(clue,player)
            if seen and not here then why="not there" end
            if not here and not unseen[clue.id] then
                -- Once per approach, so a cue that never comes can be told
                -- from one that was never possible.
                unseen[clue.id]={x=clue.x,y=clue.y,z=clue.z}
                log("cue not possible at "..tostring(clue.place).." doc="..tostring(clue.id)..": "..tostring(why))
            end
            if here then
                weighed[clue.id]={x=clue.x,y=clue.y,z=clue.z}
                store=store or Q.store()
                if not store then return end
                local light,weather=conditions(player,square)
                local roll=ZombRandFloat and ZombRandFloat(0.0,1.0) or math.random()
                local line,why=Rules.decide(store,clue,t,lastAt,roll,light,weather)
                if line then
                    Rules.record(store,clue)
                    lastAt=t
                    local spoke,audible=say(player,line)
                    Q.counters.said=Q.counters.said+1
                    Q.last={id=clue.id,line=line,place=clue.place}
                    log(string.format("cue said \"%s\" at %s doc=%s light=%.2f weather=%.2f bubble=%s sound=%s",
                        line,tostring(clue.place),tostring(clue.id),light,weather,tostring(spoke),tostring(audible)))
                    return
                end
                Q.counters.suppressed=Q.counters.suppressed+1
                log(string.format("cue suppressed at %s doc=%s: %s (light=%.2f weather=%.2f)",
                    tostring(clue.place),tostring(clue.id),tostring(why),light,weather))
            end
        end
    end
    if store then
        local live={}
        for _,clue in ipairs(clues) do live[tostring(clue.case)]=true end
        Rules.prune(store,live)
    end
end

-- A relocated clue is a new spot; weigh it afresh.
function Q.invalidate(id) if id then weighed[id]=nil end end
-- For checks: what the cue has done and remembers.
function Q.state()
    local store=Q.store()
    local places=0
    for _ in pairs(store and store.places or {}) do places=places+1 end
    return {said=Q.counters.said,suppressed=Q.counters.suppressed,first=store and store.first==true,
        places=places,last=Q.last,lastAt=lastAt}
end
-- For checks: weigh only this clue (a document id), so a walk past other clues
-- of the case cannot use up the cue or its cooldown. Never set by the mod.
Q.debugOnly=nil
-- For checks: forget this session's approach memory and cooldown (never the save).
function Q.debugReset() weighed={}; unseen={}; lastAt=nil; nextPoll=0 end

local handler=function()
    local ok,why=pcall(Q.step)
    if not ok then
        Q.failures=(Q.failures or 0)+1
        if Q.failures<=3 then log("cue failed: "..tostring(why)) end
    end
end
function Q.stop() if Events and Events.OnTick then Events.OnTick.Remove(handler) end end
if Events and Events.OnTick then Events.OnTick.Add(handler) end
return Q
