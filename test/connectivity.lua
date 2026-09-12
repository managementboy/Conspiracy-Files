package.path="mod/common/media/lua/shared/?.lua;"..package.path
local C=require("ConspiracyFiles/Connectivity")

local function driveInSteps(request, chunk)
    local result
    local step=assert(C.search(request,function(r) result=r end))
    local guard=0
    repeat
        local finished=step()
        guard=guard+1
        assert(guard<100000,"step loop did not terminate")
    until finished
    return result
end

local function grid(open)
    -- open: set of "x:y:z" keys that are walkable floor.
    return function(x,y,z) return open[x..":"..y..":"..z]==true end
end

-- 1. Simple open room: a 3x3 floor, anchor in the middle, everything reachable.
do
    local open={}
    for x=0,2 do for y=0,2 do open[x..":"..y..":"..0]=true end end
    local result=assert(C.searchAll({anchors={{x=1,y=1,z=0}},passable=grid(open)}))
    assert(result.completed==true)
    assert(result.visitedCount==9,"expected all 9 squares, got "..result.visitedCount)
    for x=0,2 do for y=0,2 do
        assert(C.reachable(result,x,y,0)==true,"expected "..x..","..y.." reachable")
    end end
    assert(C.reachable(result,5,5,0)==false)
    print("test 1 ok: simple open room")
end

-- 2. Walled-off room: two open squares separated by a blocked edge between
-- them, with no other connecting square -- proven unreachable, not just
-- "not visited".
do
    local open={["0:0:0"]=true,["1:0:0"]=true}
    local request={
        anchors={{x=0,y=0,z=0}},
        passable=grid(open),
        blockedEdges={{x1=0,y1=0,z1=0,x2=1,y2=0,z2=0}},
    }
    local result=assert(C.searchAll(request))
    assert(result.completed==true,"a fully explored small graph must be marked completed")
    assert(C.reachable(result,0,0,0)==true)
    assert(C.reachable(result,1,0,0)==false,"wall must block an otherwise-open neighbour")
    assert(result.visitedCount==1)
    print("test 2 ok: walled-off room proven unreachable")
end

-- 3. Basement reachable ONLY via a declared stair link -- being adjacent in
-- z is NOT enough (the exact bug this module exists to prevent).
do
    local open={["5:5:0"]=true,["5:5:-1"]=true,["6:5:-1"]=true}
    local request={
        anchors={{x=5,y=5,z=0}},
        passable=grid(open),
        stairs={{x1=5,y1=5,z1=0,x2=5,y2=5,z2=-1}},
    }
    local result=assert(C.searchAll(request))
    assert(result.completed==true)
    assert(C.reachable(result,5,5,0)==true)
    assert(C.reachable(result,5,5,-1)==true,"basement square must be reached through the declared stair")
    assert(C.reachable(result,6,5,-1)==true,"basement floor is walkable once the stair is taken")
    print("test 3 ok: basement reachable via stair link")
end

-- 4. Same layout, but WITHOUT the stair link: the basement square exists and
-- is individually "passable", yet must be proven unreachable because plain
-- z-adjacency grants no movement.
do
    local open={["5:5:0"]=true,["5:5:-1"]=true,["6:5:-1"]=true}
    local request={
        anchors={{x=5,y=5,z=0}},
        passable=grid(open),
    }
    local result=assert(C.searchAll(request))
    assert(result.completed==true)
    assert(C.reachable(result,5,5,0)==true)
    assert(C.reachable(result,5,5,-1)==false,"no stair link means no vertical movement, even though the square is passable")
    assert(C.reachable(result,6,5,-1)==false)
    assert(result.visitedCount==1)
    print("test 4 ok: basement unreachable without stair link")
end

-- 5. Hitting the visited cap is reported as incomplete, never as a false
-- "unreachable".
do
    local open={}
    for x=0,50 do for y=0,50 do open[x..":"..y..":"..0]=true end end
    local request={anchors={{x=25,y=25,z=0}},passable=grid(open),maxVisited=10}
    local result=assert(C.searchAll(request))
    assert(result.completed==false,"cap must be reported as incomplete")
    assert(result.visitedCount==10,"visited count must stop exactly at the cap")
    -- A far square that was never explored must NOT be reported as reachable,
    -- but the caller must be able to tell this apart from a proof.
    local farReachable=C.reachable(result,0,0,0)
    assert(farReachable==false)
    assert(result.completed==false,"caller must consult completed before trusting a false result as a proof")
    print("test 5 ok: cap hit reported as incomplete")
end

-- 5b. Step cap also reports incomplete (distinct knob from visited cap).
do
    local open={}
    for x=0,50 do for y=0,50 do open[x..":"..y..":"..0]=true end end
    local request={anchors={{x=25,y=25,z=0}},passable=grid(open),maxSteps=3,maxVisited=4000}
    local result=assert(C.searchAll(request))
    assert(result.completed==false)
    print("test 5b ok: step cap hit reported as incomplete")
end

-- 6. Resumability: driving the search across many tiny steps must produce
-- exactly the same result as one large synchronous run.
do
    local open={}
    for x=0,9 do for y=0,9 do
        if not (x==5 and y>=2 and y<=7) then open[x..":"..y..":"..0]=true end -- a wall with a gap
    end end
    open["5:0:0"]=true; open["5:9:0"]=true
    local request={anchors={{x=0,y=0,z=0}},passable=grid(open),stepBudget=32}
    local oneShot=assert(C.searchAll(request))

    local requestTiny={anchors={{x=0,y=0,z=0}},passable=grid(open),stepBudget=1}
    local resumed=assert(driveInSteps(requestTiny,1))

    assert(oneShot.completed==resumed.completed)
    assert(oneShot.visitedCount==resumed.visitedCount)
    for k in pairs(oneShot.squares) do assert(resumed.squares[k],"resumed run missing square "..k) end
    for k in pairs(resumed.squares) do assert(oneShot.squares[k],"resumed run has extra square "..k) end
    print("test 6 ok: resumable search matches one-shot search")
end

-- 6b. The step function genuinely returns false (not-yet-done) across at
-- least one intermediate call for a non-trivial search -- i.e. it really is
-- incremental, not a single call that happens to also work when polled.
do
    local open={}
    for x=0,20 do for y=0,20 do open[x..":"..y..":"..0]=true end end
    local request={anchors={{x=10,y=10,z=0}},passable=grid(open),stepBudget=4}
    local sawUnfinished=false
    local result
    local step=assert(C.search(request,function(r) result=r end))
    local guard=0
    repeat
        local finished=step()
        if not finished then sawUnfinished=true end
        guard=guard+1
        assert(guard<100000)
    until finished
    assert(sawUnfinished,"a bounded step budget must require more than one call")
    assert(result.completed==true)
    print("test 6b ok: search is genuinely incremental")
end

-- 7. One-directional stairs only connect in the declared direction.
do
    local open={["0:0:0"]=true,["0:0:1"]=true}
    local request={
        anchors={{x=0,y=0,z=1}},
        passable=grid(open),
        stairs={{x1=0,y1=0,z1=0,x2=0,y2=0,z2=1,twoWay=false}},
    }
    local result=assert(C.searchAll(request))
    assert(C.reachable(result,0,0,1)==true)
    assert(C.reachable(result,0,0,0)==false,"a one-way stair declared 0->1 must not also grant 1->0")
    print("test 7 ok: one-directional stair link respected")
end

-- 8. Rejection of malformed input.
do
    local okPassable=function() return true end
    local bad={
        "not a table",
        {},                                                     -- missing passable/anchors
        {anchors={{x=1,y=1,z=0}}},                               -- missing passable
        {anchors={{x=1,y=1,z=0}},passable="not a function"},
        {anchors={},passable=okPassable},                        -- empty anchors
        {anchors={{x=1,y=1,z=0}},passable=okPassable,extraField=true},
        {anchors={{x=1.5,y=1,z=0}},passable=okPassable},         -- non-integer coordinate
        {anchors={{x=1,y=1,z=0},[3]={x=2,y=2,z=0}},passable=okPassable}, -- sparse array
        {anchors={{x=1,y=1,z=0}},passable=okPassable,stairs={{x1=0,y1=0,z1=0,x2=0,y2=0,z2=0}}}, -- stair with same z
        {anchors={{x=1,y=1,z=0}},passable=okPassable,blockedEdges={{x1=0,y1=0,z1=0,x2=2,y2=0,z2=0}}}, -- non-adjacent edge
        {anchors={{x=1,y=1,z=0}},passable=okPassable,maxVisited=-1},
        {anchors={{x=1,y=1,z=0}},passable=okPassable,maxVisited=0/0},
    }
    for i,request in ipairs(bad) do
        local step,why=C.search(request,function() end)
        assert(step==nil and type(why)=="string","bad request #"..i.." should have been rejected")
    end
    -- done must also be validated.
    assert(C.search({anchors={{x=0,y=0,z=0}},passable=okPassable},nil)==nil)
    -- reachable()/summary() reject malformed results instead of guessing.
    assert(C.reachable("not a result",0,0,0)==nil)
    assert(C.reachable({schema=1,completed=true,visitedCount=0,stepsTaken=0,squares={}},1.5,0,0)==nil)
    assert(C.summary({schema=1,completed=true,visitedCount=0,stepsTaken=0,squares={},extra=1})==nil)
    print("test 8 ok: malformed input rejected")
end

-- 9. Anchors are seeded even when the oracle would call them impassable --
-- they are the caller's declared starting squares, not a claim to re-check.
do
    local result=assert(C.searchAll({anchors={{x=0,y=0,z=0}},passable=function() return false end}))
    assert(C.reachable(result,0,0,0)==true)
    assert(result.completed==true)
    print("test 9 ok: anchors seeded unconditionally")
end

-- 10. Never mutates the request table it was given.
do
    local open={["0:0:0"]=true,["1:0:0"]=true}
    local request={anchors={{x=0,y=0,z=0}},passable=grid(open)}
    local before={anchors={{x=0,y=0,z=0}}}
    C.searchAll(request)
    assert(#request.anchors==1 and request.anchors[1].x==0 and request.anchors[1].y==0 and request.anchors[1].z==0)
    print("test 10 ok: request left untouched")
end

print("connectivity: ok")
