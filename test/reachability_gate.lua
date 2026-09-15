-- Reachability gate: a candidate container below ground level is only ever
-- accepted once ConspiracyFiles/Connectivity, fed by
-- ConspiracyFiles/ReachabilityRequest, proves the exact square reachable.
-- Exercises the same Generated/Storage.scan gate GeneratedRuntime wires to
-- the real engine, but entirely with plain Lua fakes -- no PZ globals.
package.path="mod/common/media/lua/shared/?.lua;"..package.path
local Connectivity=require("ConspiracyFiles/Connectivity")
local Req=require("ConspiracyFiles/ReachabilityRequest")
local Storage=require("ConspiracyFiles/Generated/Storage")

-- A minimal fake IsoGridSquare: open floor unless explicitly solid/blocked.
local function fakeWorld()
    local squares,walls,stairs={},{},{}
    local function key(x,y,z) return x..":"..y..":"..z end
    local W={}
    function W.addFloor(x,y,z) squares[key(x,y,z)]={solid=false,stairs=false} end
    function W.addStairs(x,y,z) squares[key(x,y,z)]={solid=false,stairs=true} end
    function W.addWall(x1,y1,z,x2,y2) walls[key(x1,y1,z)..">"..key(x2,y2,z)]=true; walls[key(x2,y2,z)..">"..key(x1,y1,z)]=true end
    function W.getSquare(x,y,z)
        local s=squares[key(x,y,z)]
        if not s then return nil end
        local square={}
        -- PZ squares are Java-backed and Kahlua REFUSES a method invoked
        -- without a receiver: "Expected a method call but got a function
        -- call". A permissive plain-table mock accepts both forms, which is
        -- how a module whose every engine call was receiver-less passed this
        -- suite and then threw on the first real square in game. These mocks
        -- therefore demand the receiver, exactly like the engine.
        local function receiver(self,name)
            assert(self==square,name..": engine methods need a receiver; use square:"..name.."(), not square."..name.."()")
        end
        function square.isSolid(self) receiver(self,"isSolid") return s.solid end
        function square.isSolidTrans(self) receiver(self,"isSolidTrans") return false end
        function square.TreatAsSolidFloor(self) receiver(self,"TreatAsSolidFloor") return true end
        function square.HasStairs(self) receiver(self,"HasStairs") return s.stairs end
        function square.isBlockedTo(self,other)
            receiver(self,"isBlockedTo")
            -- other is another such fake square; identify it by re-deriving
            -- its key isn't possible generically, so tests inject a probe.
            return other and other.__blockedFrom and other.__blockedFrom[square] or false
        end
        function square.isWindowTo(self) receiver(self,"isWindowTo") return false end
        square.__x,square.__y,square.__z=x,y,z
        return square
    end
    return W
end

-- 1. A reachable ground-level candidate is accepted: an open 3x3 room, the
-- anchor and the candidate both inside it.
do
    local W=fakeWorld()
    for x=0,2 do for y=0,2 do W.addFloor(x,y,0) end end
    local box=Req.box({x1=0,y1=0,x2=3,y2=3},0)
    local request=assert(Req.build(W.getSquare,{x=0,y=0,z=0},box,{},{}))
    local result=assert(Connectivity.searchAll(request))
    assert(result.completed==true)
    assert(Connectivity.reachable(result,2,2,0)==true,"open room candidate must be proven reachable")
    print("test 1 ok: reachable candidate proven")
end

-- 2. An unreachable candidate (walled off from the anchor, no other route)
-- is proven NOT reachable, not merely "not yet visited".
do
    local W=fakeWorld()
    W.addFloor(0,0,0); W.addFloor(1,0,0)
    local box=Req.box({x1=0,y1=0,x2=2,y2=1},0)
    local edges={{x1=0,y1=0,z1=0,x2=1,y2=0,z2=0}}
    local request=Req.build(W.getSquare,{x=0,y=0,z=0},box,{},edges)
    local result=assert(Connectivity.searchAll(request))
    assert(result.completed==true,"a fully explored tiny graph must complete")
    assert(Connectivity.reachable(result,1,0,0)==false,"a walled-off candidate must be proven unreachable, not merely unvisited")
    print("test 2 ok: unreachable candidate proven unreachable")
end

-- 3. An incomplete search must never be read as "reachable" -- the gate must
-- skip the candidate, not accept it on missing information.
do
    local W=fakeWorld()
    for x=0,50 do for y=0,50 do W.addFloor(x,y,0) end end
    local box=Req.box({x1=0,y1=0,x2=51,y2=51},0)
    local request=Req.build(W.getSquare,{x=25,y=25,z=0},box,{},{})
    request.maxVisited=10 -- force the cap so the search cannot finish
    local result=assert(Connectivity.searchAll(request))
    assert(result.completed==false,"cap must be reported as incomplete")
    local proven=Connectivity.reachable(result,0,0,0)
    assert(proven==false,"an unvisited square reads false from reachable()...")
    assert(result.completed==false,"...but the gate MUST also consult completed and treat this as unproven, not as a rejection")
    -- The gate's own contract: false answer is only a rejection when completed==true.
    local function gateAccepts(searchResult,x,y,z)
        if not searchResult.completed then return false end -- incomplete: never accept
        return Connectivity.reachable(searchResult,x,y,z)==true
    end
    assert(gateAccepts(result,0,0,0)==false,"incomplete search must cause a skip, exactly like an unreachable one -- never an accept")
    print("test 3 ok: incomplete search causes a skip, not an acceptance")
end

-- 4. A basement candidate is accepted ONLY when a stair link makes it
-- reachable; the identical layout without the stair link proves the
-- opposite -- being adjacent in z is never enough on its own.
do
    local W=fakeWorld()
    W.addFloor(5,5,0); W.addStairs(5,5,0); W.addFloor(5,5,-1)
    local zLevels={0,-1}
    local box=Req.box({x1=4,y1=4,x2=7,y2=7},2)
    local stairs=Req.stairLinks(W.getSquare,box,zLevels)
    assert(#stairs>=1,"a HasStairs square above an independently-walkable square below must yield a stair link")
    local request=Req.build(W.getSquare,{x=5,y=5,z=0},box,stairs,{})
    local result=assert(Connectivity.searchAll(request))
    assert(result.completed==true)
    assert(Connectivity.reachable(result,5,5,-1)==true,"basement candidate must be accepted once the stair link proves it reachable")

    -- Same layout, but the basement floor is now isolated (no stairs square
    -- reports HasStairs==true) -- no link may be invented, so the basement
    -- candidate must be rejected even though the square is independently
    -- walkable.
    local W2=fakeWorld()
    W2.addFloor(5,5,0); W2.addFloor(5,5,-1) -- no addStairs this time
    local stairs2=Req.stairLinks(W2.getSquare,box,zLevels)
    assert(#stairs2==0,"no HasStairs square means no discovered link")
    local request2=Req.build(W2.getSquare,{x=5,y=5,z=0},box,stairs2,{})
    local result2=assert(Connectivity.searchAll(request2))
    assert(result2.completed==true)
    assert(Connectivity.reachable(result2,5,5,-1)==false,"without a stair link the basement candidate must stay rejected, even though the square itself is walkable")
    print("test 4 ok: basement candidate accepted only with a proven stair link")
end

-- 5. End-to-end through Generated/Storage.scan itself: the `reachable`
-- parameter gates a non-ground candidate exactly like the standalone
-- Connectivity checks above, and the default (no `reachable` argument)
-- still behaves exactly as before -- ground only.
do
    local function list(t) return {size=function() return #t end,get=function(_,i) return t[i+1] end} end
    local containers={}
    for x=0,5 do containers[x]={getType=function() return "desk" end} end
    package.loaded["ConspiracyFiles/WorldAccess"]=nil
    package.preload["ConspiracyFiles/WorldAccess"]=function()
        return {resolve=function(t) return containers[t.x] end}
    end
    package.loaded["ConspiracyFiles/Generated/Storage"]=nil
    local ScanStorage=require("ConspiracyFiles/Generated/Storage")
    getCell=function() return {getGridSquare=function(_,x,y,z)
        local object={getContainerCount=function() return 1 end,getContainerByIndex=function() return containers[x] end,getSprite=function() return {getName=function() return "furniture" end} end}
        return {getObjects=function() return list{object} end}
    end} end
    local result={version="T3-nearby-2",map="mock",gameVersion="42.20",buildings=1,rows={
        {kind="building",id="home",x=0,y=0,x2=3,y2=1,minLevel=-1},
        {kind="rect",building="home",x=0,y=0,z=-1,w=3,h=1},
    }}
    -- 5a. reachable(2,0,-1)==false -> the whole site gets no candidates.
    local catalogA,targetsA,candidatesA
    local stepA=assert(ScanStorage.scan(result,function(a,b,c) catalogA,targetsA,candidatesA=a,b,c end,function() return false end))
    for i=1,1000 do if stepA() then break end end
    assert(candidatesA["t3:home"]==nil,"an unproven basement candidate must never be accepted")

    -- 5b. reachable(x,0,-1)==true for every tile -> the site gets its candidates.
    local catalogB,targetsB,candidatesB
    local stepB=assert(ScanStorage.scan(result,function(a,b,c) catalogB,targetsB,candidatesB=a,b,c end,function() return true end))
    for i=1,1000 do if stepB() then break end end
    assert(candidatesB["t3:home"] and #candidatesB["t3:home"]==3,"a proven-reachable basement candidate must be accepted")

    -- 5c. Omitting `reachable` entirely keeps the old, safe default: ground only.
    local catalogC,targetsC,candidatesC
    local stepC=assert(ScanStorage.scan(result,function(a,b,c) catalogC,targetsC,candidatesC=a,b,c end))
    for i=1,1000 do if stepC() then break end end
    assert(candidatesC["t3:home"]==nil,"the default gate (no `reachable` supplied) must still reject non-ground candidates")
    print("test 5 ok: Generated/Storage.scan wires the reachability gate correctly, default stays ground-only")
end

print("reachability gate: ok")
