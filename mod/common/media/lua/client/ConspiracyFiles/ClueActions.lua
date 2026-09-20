-- "Look it over" and Inspect as the game's own timed actions (P4-R132, stage 2;
-- docs/design/SEARCH_TO_FIND.md, "Recognise" and "Note").
--
-- Both show the game's progress bar and are interrupted by walking, running or
-- aiming, as reading a book is. Nothing is written over the survivor's head:
-- when the bar completes, the item itself changes (its name and category for
-- Look it over, its record for Inspect).
--
-- The classes stay on ConspiracyFiles.ClueActions rather than as globals (one
-- namespace, AGENTS.md). The queue only ever holds the action objects.
ConspiracyFiles=ConspiracyFiles or {}
local A=ConspiracyFiles.ClueActions or {}
ConspiracyFiles.ClueActions=A
local CFLog=require("ConspiracyFiles/Log")
local function log(message) CFLog.message("case","note",message) end
if not ISBaseTimedAction then pcall(require,"TimedActions/ISBaseTimedAction") end

-- Durations in the game's timed-action units (ISReadABook reads a page in
-- these). Measured on Linux at normal speed: see SEARCH_TO_FIND.md, stage 2.
A.LOOK_TIME=150
A.INSPECT_TIME=100
-- Checks only (stage 3): complete at once instead of queueing, so a check that
-- is not about the progress bar need not wait for it. Debug builds only.
A.instant=false

local function runtime(item)
    local maps=ConspiracyFiles.MapMediaRuntime
    if maps and maps.subject(item) then return maps end
    return ConspiracyFiles.GeneratedRuntime
end
local function instant() return A.instant==true and getDebug and getDebug() end

-- A reading pose that suits the thing: a photograph, a newspaper, or a book
-- for everything else, as ISReadABook chooses.
local function readType(item)
    local ok,kind=pcall(function()
        -- Only Literature has getReadType. Asked of anything else it throws,
        -- and the game logs that as a mod error even inside pcall (a clue that
        -- is a piece of wooden armour, drop_note 20260917T145344).
        if instanceof(item,"Literature") and item:getReadType() then return item:getReadType() end
        if item:getType()=="Newspaper" then return "newspaper" end
        if ItemTag and item:hasTag(ItemTag.PICTURE) then return "photo" end
        return "book"
    end)
    return ok and kind or "book"
end

local function stamp() return getTimestampMs and getTimestampMs() or 0 end
local function begin(self,label,holdItem)
    self.startedAt=stamp()
    pcall(function() self.item:setJobType(label) end)
    pcall(function() self.item:setJobDelta(0.0) end)
    pcall(function()
        self:setAnimVariable("ReadType",readType(self.item))
        self:setActionAnim(CharacterActionAnims.Read)
    end)
    if holdItem then pcall(function() self:setOverrideHandModels(nil,self.item) end) end
end
local function finish(self)
    pcall(function() self.item:setJobDelta(0.0) end)
end

if ISBaseTimedAction then
    -- LOOK IT OVER: a clue already carried, nobody has recognised yet.
    A.Look=A.Look or ISBaseTimedAction:derive("CFLookItOver")
    local Look=A.Look
    function Look:isValid()
        local R=runtime(self.item)
        return self.item~=nil and self.item:getOutermostContainer()==self.character:getInventory()
            and R~=nil and R.subject(self.item)==true
    end
    function Look:waitToStart() return false end
    function Look:update() pcall(function() self.item:setJobDelta(self:getJobDelta()) end) end
    function Look:start() begin(self,"Look it over",true) end
    function Look:stop() finish(self); ISBaseTimedAction.stop(self) end
    function Look:perform()
        finish(self)
        local R=runtime(self.item)
        local ok,done,why=pcall(R.recognise,self.item,"look")
        log("look it over: "..tostring(ok and done)..(why and (" "..tostring(why)) or ""))
        A.lastLook={ok=ok and done==true,ms=stamp()-(self.startedAt or stamp())}
        ISBaseTimedAction.perform(self)
    end
    function Look:complete() return true end
    function Look:getDuration() return A.LOOK_TIME end
    function Look:new(character,item)
        local o=ISBaseTimedAction.new(self,character)
        o.item=item
        o.stopOnWalk=true; o.stopOnRun=true; o.stopOnAim=true
        o.ignoreHandsWounds=true
        o.forceProgressBar=true
        o.maxTime=o:getDuration()
        return o
    end

    -- INSPECT: note a recognised clue, in hand or where it lies. `expected` is
    -- the outermost container it was in when the option was chosen; the action
    -- is refused if it has moved since, as the instant option always was.
    A.Inspect=A.Inspect or ISBaseTimedAction:derive("CFInspectEvidence")
    local Inspect=A.Inspect
    function Inspect:isValid()
        local R=runtime(self.item)
        return self.item~=nil and self.item:getOutermostContainer()==self.expected
            and R~=nil and R.subject(self.item)==true
    end
    function Inspect:waitToStart() return false end
    function Inspect:update() pcall(function() self.item:setJobDelta(self:getJobDelta()) end) end
    function Inspect:start() begin(self,"Inspect",not self.inPlace) end
    function Inspect:stop() finish(self); ISBaseTimedAction.stop(self) end
    function Inspect:perform()
        finish(self)
        local R=runtime(self.item)
        local ok,done=pcall(R.inspect,self.item,self.inPlace)
        log("inspect: "..tostring(ok and done)..(self.inPlace and " in place" or ""))
        A.lastInspect={ok=ok and done==true,ms=stamp()-(self.startedAt or stamp())}
        ISBaseTimedAction.perform(self)
    end
    function Inspect:complete() return true end
    function Inspect:getDuration() return A.INSPECT_TIME end
    function Inspect:new(character,item,inPlace,expected)
        local o=ISBaseTimedAction.new(self,character)
        o.item=item; o.inPlace=inPlace==true; o.expected=expected
        o.stopOnWalk=true; o.stopOnRun=true; o.stopOnAim=true
        o.ignoreHandsWounds=true
        o.forceProgressBar=true
        o.maxTime=o:getDuration()
        return o
    end
end

-- What the menu calls. Returns true when queued (or done, for checks).
function A.lookItOver(character,item)
    if not (character and item) then return false,"nothing to look at" end
    local R=runtime(item)
    if not R then return false,"no runtime" end
    if instant() then return R.recognise(item,"look") end
    if not (A.Look and ISTimedActionQueue) then return false,"no timed actions" end
    ISTimedActionQueue.add(A.Look:new(character,item))
    return true
end
function A.inspect(character,item,inPlace,expected)
    if not (character and item) then return false,"nothing to inspect" end
    local R=runtime(item)
    if not R then return false,"no runtime" end
    if instant() then
        if item:getOutermostContainer()~=expected then return false,"moved" end
        return R.inspect(item,inPlace)
    end
    if not (A.Inspect and ISTimedActionQueue) then return false,"no timed actions" end
    ISTimedActionQueue.add(A.Inspect:new(character,item,inPlace,expected))
    return true
end

return A
