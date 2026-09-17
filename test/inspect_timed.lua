-- Inspect is a timed action (P4-R132, stage 2): "Inspect Investigation
-- Evidence" and "Note in the Investigation" queue an action with the game's
-- progress bar, interrupted by moving. R.inspect runs only when it completes,
-- and only if the thing is still where it was when the option was chosen. The
-- old conditions for offering the options stand.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local queue={}
ISBaseTimedAction={}
ISBaseTimedAction.__index=ISBaseTimedAction
function ISBaseTimedAction:derive(name) local c=setmetatable({},{__index=self}); c.__index=c; c.Type=name; return c end
function ISBaseTimedAction:new(character)
    local o=setmetatable({},self); o.character=character
    o.stopOnWalk=true; o.stopOnRun=true; o.stopOnAim=true; o.maxTime=-1
    return o
end
function ISBaseTimedAction:getJobDelta() return 0 end
function ISBaseTimedAction:setActionAnim(a) self.anim=a end
function ISBaseTimedAction:setAnimVariable() end
function ISBaseTimedAction:setOverrideHandModels(_,s) self.hand=s end
function ISBaseTimedAction:stop() table.remove(queue,1) end
function ISBaseTimedAction:perform() table.remove(queue,1) end
ISTimedActionQueue={add=function(action) queue[#queue+1]=action end}
CharacterActionAnims={Read="Read"}

local inventory,desk={},{}
local player={getInventory=function(self) assert(self,"receiver"); return inventory end}
getSpecificPlayer=function() return player end
local function item(where)
    local it={where=where,md={cfGeneratedId="doc-1"}}
    function it:getOutermostContainer() assert(self==it,"receiver"); return self.where end
    function it:getModData() return self.md end
    function it:setJobType() end
    function it:setJobDelta() end
    function it:getReadType() return nil end
    function it:getType() return "Note" end
    function it:hasTag() return false end
    return it
end
local inspected={}
local R={metrics=function() return {} end,subject=function() return true end,isRecognised=function() return true end}
function R.inspect(it,inPlace) inspected[#inspected+1]={item=it,inPlace=inPlace}; return true end
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
    local byLabel={}
    for _,o in ipairs(out) do byLabel[o.label]=o end
    return byLabel,out
end

-- Carried: Inspect, queued, recorded only on completion.
local note=item(inventory)
local o=options(note)
assert(o["Inspect Investigation Evidence"] and not o["Inspect Investigation Evidence"].notAvailable)
assert(not o["Note in the Investigation"],"carried: no second wording")
o["Inspect Investigation Evidence"].callback()
assert(#queue==1 and #inspected==0,"queued, nothing recorded yet")
local action=queue[1]
assert(action.Type=="CFInspectEvidence" and action.forceProgressBar==true,"the progress bar shows")
assert(action.stopOnWalk and action.stopOnRun,"moving interrupts it")
assert(action.maxTime==Actions.INSPECT_TIME and action.maxTime>=100,"a couple of seconds")
assert(action:isValid())
action:start()
assert(action.anim=="Read" and action.hand==note,"reading it in hand")
action:stop()
assert(#queue==0 and #inspected==0,"interrupted: nothing recorded")
o["Inspect Investigation Evidence"].callback()
queue[1]:perform()
assert(#inspected==1 and inspected[1].item==note and inspected[1].inPlace==false,"completed: recorded, not in place")

-- Moved away while queued: refused, nothing recorded.
o["Inspect Investigation Evidence"].callback()
note.where=desk
assert(not queue[1]:isValid(),"a thing moved since the option was chosen is not inspected")
table.remove(queue,1)

-- In a drawer, organiser closed: Inspect greyed, "Note in the Investigation"
-- queues an in-place action.
local drawer=item(desk)
o=options(drawer)
assert(o["Inspect Investigation Evidence"].notAvailable==true,"Inspect needs it carried or the organiser open")
assert(o["Note in the Investigation"] and o["Note in the Investigation"].notAvailable==false)
o["Note in the Investigation"].callback()
action=queue[1]
assert(action and action.inPlace==true and action.expected==desk)
action:start()
assert(action.hand==nil,"nothing put in the hand for a thing where it lies")
action:perform()
assert(#inspected==2 and inspected[2].inPlace==true,"noted in place on completion")

-- Organiser open: Inspect is available in place, no second wording.
ConspiracyFiles.OrganiserScreen={window={on=true}}
o=options(drawer)
assert(not o["Inspect Investigation Evidence"].notAvailable and not o["Note in the Investigation"])
o["Inspect Investigation Evidence"].callback()
assert(queue[1].inPlace==true,"with the organiser open, Inspect notes it where it lies")
queue[1]:perform()
assert(#inspected==3)

-- Checks: instant, guarded the same way.
Actions.instant=true
assert(Actions.inspect(player,drawer,true,desk)==true and #inspected==4 and #queue==0,"instant for checks")
assert(Actions.inspect(player,drawer,true,inventory)==false and #inspected==4,"instant still refuses a moved thing")
Actions.instant=false

print("PASS inspect timed: Inspect and Note queue a timed action with the progress bar, interrupted by moving, recorded only on completion and only where it was, old offer conditions kept, instant for checks")
