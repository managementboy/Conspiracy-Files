-- "Look it over" (P4-R132, stage 2): a clue already carried that nobody has
-- recognised can be looked over - a timed action with the game's progress bar,
-- interrupted by moving like reading. Only when the bar completes is the clue
-- recognised. Nothing for a clue lying in a container, nothing once
-- recognised, nothing for ordinary loot.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path

-- The game's timed-action base, shaped like media/lua/shared/TimedActions/
-- ISBaseTimedAction.lua: derive, new with the stop flags, stop/perform telling
-- the queue.
local queue={}
local stopped,performed=0,0
ISBaseTimedAction={}
ISBaseTimedAction.__index=ISBaseTimedAction
function ISBaseTimedAction:derive(name) local c=setmetatable({},{__index=self}); c.__index=c; c.Type=name; return c end
function ISBaseTimedAction:new(character)
    local o=setmetatable({},self); o.character=character
    o.stopOnWalk=true; o.stopOnRun=true; o.stopOnAim=true; o.maxTime=-1
    return o
end
function ISBaseTimedAction:getJobDelta() return self.delta or 0 end
function ISBaseTimedAction:setActionAnim(a) self.anim=a end
function ISBaseTimedAction:setAnimVariable(k,v) self.vars=self.vars or {}; self.vars[k]=v end
function ISBaseTimedAction:setOverrideHandModels(_,s) self.hand=s end
function ISBaseTimedAction:stop() stopped=stopped+1; table.remove(queue,1) end
function ISBaseTimedAction:perform() performed=performed+1; table.remove(queue,1) end
ISTimedActionQueue={add=function(action) queue[#queue+1]=action; return queue end}
CharacterActionAnims={Read="Read"}

-- One survivor, a bag, a desk, and the runtime's answers.
local inventory,bag,desk={},{},{}
local says={}
local player={getInventory=function(self) assert(self,"receiver"); return inventory end,
    Say=function(_,t) says[#says+1]=t end}
getSpecificPlayer=function() return player end
getPlayer=function() return player end
local function item(where,id)
    local it={where=where,md={cfGeneratedId=id},jobType=nil,jobDelta=nil}
    function it:getOutermostContainer() assert(self==it,"receiver"); return self.where end
    function it:getModData() return self.md end
    function it:setJobType(t) self.jobType=t end
    function it:setJobDelta(d) self.jobDelta=d end
    function it:getReadType() return nil end
    function it:getType() return "Photo" end
    function it:hasTag() return false end
    return it
end
local recognised,recognisedHow={},{}
local R={metrics=function() return {} end}
function R.subject(it) return it.md.cfGeneratedId~=nil end
function R.isRecognised(it) return recognised[it.md.cfGeneratedId]==true end
function R.recognise(it,how) recognised[it.md.cfGeneratedId]=true; recognisedHow[#recognisedHow+1]=how; return true,true end
function R.inspect() return true end
package.loaded["ConspiracyFiles/GeneratedRuntime"]=R
package.loaded["ConspiracyFiles/ContextMenu"]={normalize=function(items) return items,false end}
Events={OnFillInventoryObjectContextMenu={Add=function() end}}
getDebug=function() return true end;isClient=function() return false end;isServer=function() return false end
ConspiracyFiles={GeneratedRuntime=R}
local Menu=require("ConspiracyFiles/GeneratedMenu")
local Actions=ConspiracyFiles.ClueActions

local function options(it)
    local out={}
    local context={addOption=function(_,label,_,callback) local o={label=label,callback=callback}; out[#out+1]=o; return o end}
    Menu.fill(0,context,{it})
    return out
end

-- Carried (top level) and unrecognised: only "Look it over".
local photo=item(inventory,"doc-1")
local shown=options(photo)
assert(#shown==1 and shown[1].label=="Look it over","a carried unrecognised clue offers only Look it over")
-- In a bag the outermost container is still the survivor.
local inBag=item(inventory,"doc-2"); inBag.bag=bag
assert(options(inBag)[1].label=="Look it over","a clue in a carried bag counts as carried")
-- In a desk: nothing. Searching is the way for things in the world.
assert(#options(item(desk,"doc-3"))==0,"a clue lying in a container offers nothing")
-- Ordinary loot: nothing.
local loot=item(inventory,nil)
assert(#options(loot)==0,"ordinary loot offers nothing")

-- Choosing it queues a timed action; nothing is recognised yet.
shown[1].callback()
assert(#queue==1,"one timed action queued")
local action=queue[1]
assert(action.Type=="CFLookItOver" and action.item==photo)
assert(action.forceProgressBar==true,"the game's progress bar shows")
assert(action.stopOnWalk and action.stopOnRun,"moving interrupts it, as reading does")
assert(action.maxTime==Actions.LOOK_TIME and action.maxTime>=100,"a few seconds, not instant")
assert(not R.isRecognised(photo),"not recognised when merely queued")
assert(action:isValid(),"valid while carried")
action:start()
assert(action.anim=="Read" and photo.jobType=="Look it over","a reading pose and the item's job label")
action.delta=0.5; action:update(); assert(photo.jobDelta==0.5,"the inventory bar follows the action")

-- Interrupted: nothing recognised, the queue is told.
action:stop()
assert(stopped==1 and #queue==0 and not R.isRecognised(photo),"an interrupted look recognises nothing")
assert(#says==0,"nothing said")

-- Dropped before it starts: no longer valid.
options(photo)[1].callback()
action=queue[1]
photo.where=desk
assert(not action:isValid(),"a clue put down is no longer being looked over")
photo.where=inventory
table.remove(queue,1)

-- Completed: recognised "look", and the queue is told.
options(photo)[1].callback()
action=queue[1]
action:start(); action:perform()
assert(performed==1 and #queue==0,"perform tells the queue")
assert(R.isRecognised(photo) and recognisedHow[#recognisedHow]=="look","recognised by looking it over")
assert(photo.jobDelta==0.0,"the bar is cleared")
assert(#says==0,"nothing is written over the head")
-- Recognised: Look it over is gone, Inspect is there.
local after=options(photo)
assert(after[1].label=="Inspect Investigation Evidence","once recognised, Inspect")
for _,o in ipairs(after) do assert(o.label~="Look it over","no Look it over once recognised") end

-- Checks: instant completes at once, without the queue, debug only.
Actions.instant=true
local key=item(inventory,"doc-9")
options(key)[1].callback()
assert(#queue==0 and R.isRecognised(key),"instant mode recognises at once for checks")
getDebug=function() return false end
Actions.instant=true
local late=item(inventory,"doc-10")
assert(Actions.lookItOver(player,late)==true and #queue==1,"instant is ignored outside debug")
Actions.instant=false

print("PASS look it over: only on a carried unrecognised clue (bags too), a timed action with the progress bar, interrupted by moving, recognises only on completion, nothing said, instant for checks")
