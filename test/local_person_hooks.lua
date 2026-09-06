package.path="mod/common/media/lua/client/?.lua;"..package.path
local calls,observed,mode,failObserver=0,0,"success",false
package.preload["ConspiracyFiles/LocalPersonIntegration"]=function()
    return {observeDoor=function(action)
        observed=observed+1
        assert(action.item=="door")
        if failObserver then error("observation failed") end
    end,tick=function() end,reset=function() end}
end
Events={OnTick={Add=function() end},OnGameStart={Add=function() end}}
local function original()
    calls=calls+1
    if mode=="error" then error("original failure") end
    return mode=="success"
end
ISOpenCloseDoor={complete=original}
ISLockDoor={complete=original}
package.preload["TimedActions/ISOpenCloseDoor"]=function() return ISOpenCloseDoor end
package.preload["TimedActions/ISLockDoor"]=function() return ISLockDoor end
local H=require("ConspiracyFiles/LocalPersonHooks")
assert(calls==0 and observed==0)
H.installDoor();H.installDoor()
assert(ISOpenCloseDoor.complete({item="door"})==true)
assert(calls==1 and observed==1)
mode="failure"
assert(ISOpenCloseDoor.complete({item="door"})==false)
assert(calls==2 and observed==1)
mode="error"
assert(not pcall(ISOpenCloseDoor.complete,{item="door"}))
assert(calls==3 and observed==1)
mode="success";failObserver=true
assert(ISOpenCloseDoor.complete({item="door"})==true)
assert(calls==4 and observed==2)
failObserver=false
assert(ISLockDoor.complete({door="door"})==true)
assert(calls==5 and observed==3)
print("PASS local person hooks: original once, result/error preserved, failed observations isolated, lock/open completion")
