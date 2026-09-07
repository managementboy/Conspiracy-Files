-- Subtle discovery assistance: never grants knowledge or calls a zombie-attraction sound API.
local World=require("ConspiracyFiles/WorldAccess")
local Cases=require("ConspiracyFiles/Generated/SuccessiveCases")
ConspiracyFiles=ConspiracyFiles or {}
if ConspiracyFiles.ClueHints then ConspiracyFiles.ClueHints.stop() end
local H={}
ConspiracyFiles.ClueHints=H
local phrases={"Is this a clue?","Something here seems worth a look.","Could this mean something?",
    "Maybe I should check that.","That might be worth reading."}
-- Owner decision 2026-09-06: widen the trigger, tolerate a step or two
-- during the scan, and announce on three channels.  FORGET must exceed
-- HINT so leaving and returning is what re-arms a location.
local HINT_RADIUS,SCAN_RADIUS,FORGET_RADIUS=2,3,4
-- UI channel only.  playUISound never reaches the world sound manager, so
-- it cannot attract zombies.  UIAchievement was rejected: it maps to the
-- FMOD event Game/LevelUp and would read as a skill level-up.
local HINT_SOUND="UIObjectMenuEnter"
-- Owner feedback 2026-09-07: the hint vanished too fast to read.
-- HaloTextHelper.addText has no duration parameter; setHaloNote does, and
-- vanilla uses it that way (ISMoveableSpriteProps.lua:3304 passes 300).
-- Tune this one constant if it still reads too short or too long.
local HINT_HALO_DURATION=900
local visits,nextPoll,lastHint,phrase={},0,-60000,0
-- Hints are a silent speech bubble; without a log line a missed hint and an
-- unfired hint look identical.  Report each outcome once per approach.
local reported={}
local function log(s) print("[CF-G2-HINT] "..tostring(s)) end
local pending
local function near(p,t,d)
    return math.floor(p:getZ())==t.z and math.abs(math.floor(p:getX())-t.x)<=d and math.abs(math.floor(p:getY())-t.y)<=d
end
local function eligible(root,id)
    local a=root and root.assignments and root.assignments[id]
    if not a or a.status~="placed" then return nil end
    for _,known in ipairs(root.known or {}) do if known==id then return nil end end
    return a
end
local function enabled()
    return getDebug and getDebug() and not (isClient and isClient()) and not (isServer and isServer())
        and not ConspiracyFiles.T11Mode and not ConspiracyFiles.T12Mode
end
local function announce(p,text)
    p:Say(text)
    -- Prefer setHaloNote: it is the only one of the two that accepts a
    -- duration. Fall back to HaloTextHelper so a missing method still shows
    -- something rather than silently dropping the visual channel.
    local halo=false
    -- Colon syntax, as vanilla uses it: an extracted method is not the same
    -- call in Kahlua, and pcall hides the difference.
    if p.setHaloNote then
        halo=pcall(function() p:setHaloNote(text,255,255,255,HINT_HALO_DURATION) end)
    end
    if not halo and HaloTextHelper and HaloTextHelper.addText then
        halo=pcall(function() HaloTextHelper.addText(p,text) end)
    end
    local audible=false
    if getSoundManager then
        local ok,manager=pcall(getSoundManager)
        if ok and manager and manager.playUISound then audible=pcall(function() manager:playUISound(HINT_SOUND) end) end
    end
    return halo,audible
end

local function step()
    if not enabled() then pending=nil; return end
    local p=getPlayer(); if not p then pending=nil; return end
    local now=getTimeInMillis()
    if pending then
        local task=pending
        local a=eligible(task.root,task.id)
        if not a or not near(p,a.target,SCAN_RADIUS) or World.resolve(a.target)~=task.container then
            pending=nil
            if not reported[task.key] then reported[task.key]={target=task.target}; log("abandoned "..task.key.." - moved away or container changed") end
            return
        end
        local started=now
        for _=1,24 do
            task.steps=task.steps+1
            if task.steps>512 then
                pending=nil
                if not reported[task.key] then reported[task.key]={target=task.target}; log("gave up at "..task.key.." - container too large to scan") end
                return -- unknown if too large; stay silent
            end
            if task.scan() then
                pending=nil
                if task.count==1 and now-lastHint>=60000 and not visits[task.key] then
                    phrase=phrase%#phrases+1
                    local halo,audible=announce(p,phrases[phrase])
                    visits[task.key]=a.target; lastHint=now
                    log("said \""..phrases[phrase].."\" at "..task.key.." halo="..tostring(halo).." sound="..tostring(audible))
                elseif not reported[task.key] then
                    reported[task.key]={target=task.target}
                    log("suppressed at "..task.key.." matches="..tostring(task.count)..
                        " sinceLastHintMs="..(now-lastHint).." alreadyVisited="..tostring(visits[task.key]~=nil))
                end
                return
            end
            if getTimeInMillis()-started>=1 then return end
        end
        return
    end
    if now<nextPoll then return end
    nextPoll=now+500
    -- Cases.current fully revalidates the canonical case, so it must stay
    -- behind the poll gate rather than running once per rendered frame.
    local wrapper=Cases.current(ModData.get("ConspiracyFiles.Generated.G2"))
    local roots=wrapper and Cases.sessions(wrapper)
    if not roots or #roots==0 then return end
    for key,t in pairs(visits) do if not near(p,t,FORGET_RADIUS) then visits[key]=nil end end
    for key,r in pairs(reported) do if not near(p,r.target,FORGET_RADIUS) then reported[key]=nil end end
    if now-lastHint<60000 then return end
    for _,root in ipairs(roots) do for _,doc in ipairs(root.case.documents) do
        local a=eligible(root,doc.id)
        if a and near(p,a.target,HINT_RADIUS) then
            local t=a.target
            local key=t.x..":"..t.y..":"..t.z..":"..t.objectIndex..":"..t.containerIndex
            local c=not visits[key] and World.resolve(t)
            if c then
                local task={root=root,id=doc.id,key=key,target=t,container=c,steps=0}
                task.scan=World.count(c,a.physicalToken,function(n) task.count=n end)
                pending=task; return
            end
        end
    end end
end
local handler
function H.stop() if handler then Events.OnTick.Remove(handler) end; pending=nil end
function H.state() return {pending=pending~=nil,visits=visits,reported=reported,lastHint=lastHint} end
-- Stale clue relocation moves a target's physical container; forget the old
-- key so a stale halo/sound never fires for a document that is no longer
-- there, and so `visits`/`reported` do not grow across relocations.
function H.invalidate(target)
    if type(target)~="table" then return end
    local key=target.x..":"..target.y..":"..target.z..":"..target.objectIndex..":"..target.containerIndex
    visits[key]=nil; reported[key]=nil
    if pending and pending.key==key then pending=nil end
end
handler=function()
    local ok,why=pcall(step)
    if not ok then H.stop(); print("[CF-G2-HINT] disabled: "..tostring(why)) end
end
Events.OnTick.Add(handler)
return H
