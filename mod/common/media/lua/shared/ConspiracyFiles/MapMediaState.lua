-- Fresh-save map trails. Engine-free, copy-on-write, no case-slot dependency.
local V=require("ConspiracyFiles/Validator")
local Choices=require("ConspiracyFiles/Generated/StorageChoices")
local M={SCHEMA=2}
local function integer(n,lo,hi)
    return type(n)=="number" and n==n and n%1==0 and n>=lo and n<=hi
end
local function fields(t,allowed)
    if type(t)~="table" or getmetatable(t) then return false end
    for k in pairs(t) do if not allowed[k] then return false end end
    return true
end
local function text(s,n) return type(s)=="string" and #s>0 and #s<=n end
local function time(n) return type(n)=="number" and n==n and n>=0 and n<1e12 end
local function clone(t)
    if type(t)~="table" then return t end
    local out={}; for k,v in pairs(t) do out[k]=clone(v) end; return out
end
M.copy=clone
function M.empty() return {schema=M.SCHEMA,trails={},entries={},prints={},cursor=0} end
local targetFields={x=true,y=true,z=true,objectIndex=true,containerIndex=true,sprite=true,containerType=true}
local placementFields={target=true,state=true,attempt=true,at=true,recognised=true,noted=true,observation=true}
local states={intent=true,placed=true,unknown=true,refused=true,noted=true}
function M.validTarget(t)
    return fields(t,targetFields) and integer(t.x,0,100000) and integer(t.y,0,100000)
        and integer(t.z,-32,32) and integer(t.objectIndex,0,255) and integer(t.containerIndex,0,31)
        and text(t.sprite,160) and Choices.fixedKind(t.containerType)
end
local function placement(p)
    return fields(p,placementFields) and (M.validTarget(p.target) or (p.state=="noted" and p.target==nil)) and states[p.state]
        and integer(p.attempt,1,1000000) and time(p.at)
        and (p.recognised==nil or p.recognised==true)
        and (p.noted==nil or p.noted==true) and (not p.noted or p.recognised)
        and (p.state~="noted" or p.noted==true)
        and (p.observation==nil or text(p.observation,40))
end
function M.validate(root,catalogue)
    if not fields(root,{schema=true,trails=true,entries=true,prints=true,cursor=true})
        or root.schema~=M.SCHEMA or not integer(root.cursor,0,1000000)
        or type(root.trails)~="table" or type(root.entries)~="table" or type(root.prints)~="table" then
        return false,"invalid map-media header"
    end
    local count=0
    for id,t in pairs(root.trails) do
        count=count+1
        if not catalogue.get(id) or count>125
            or not fields(t,{seed=true,at=true,fragments=true,payoff=true})
            or not integer(t.seed,1,2147483646) or not time(t.at) or type(t.fragments)~="table" then
            return false,"invalid map trail"
        end
        for part,p in pairs(t.fragments) do
            if not integer(part,1,3) or not placement(p) then return false,"invalid fragment" end
        end
        if t.payoff~=nil and not placement(t.payoff) then return false,"invalid payoff" end
    end
    for id,at in pairs(root.entries) do
        if not catalogue.get(id) or not time(at) then return false,"invalid entry" end
    end
    for id,at in pairs(root.prints) do
        if not catalogue.print(id) or not time(at) then return false,"invalid printed-place reading" end
    end
    return V.validateStructure(root)
end
function M.activate(root,id,seed,at,catalogue)
    if not catalogue.get(id) or not integer(seed,1,2147483646) or not time(at) then return nil,"invalid read" end
    if root.trails[id] then return root,false end
    local next=clone(root); next.trails[id]={seed=seed,at=at,fragments={}}
    return next,true
end
function M.enter(root,id,at)
    if root.entries[id] then return root,false end
    local next=clone(root); next.entries[id]=at; return next,true
end
function M.printRead(root,id,at)
    if root.prints[id] then return root,false end
    local next=clone(root); next.prints[id]=at; return next,true
end
function M.get(root,id,part)
    local t=root.trails[id]; return t and (part==4 and t.payoff or t.fragments[part])
end
function M.set(root,id,part,value)
    local next=clone(root); local t=next.trails[id]
    if not t or not integer(part,1,4) then return nil,"unknown contribution" end
    if part==4 then t.payoff=clone(value) else t.fragments[part]=clone(value) end
    return next
end
-- The identity belongs to the design, never to its destination or a physical copy.
function M.reference(id,part) return "map:"..id..":"..part end
function M.token(id,part,attempt) return M.reference(id,part)..":"..attempt end
-- Re-offer a missed fragment on a later journey, without moving or deleting its
-- earlier physical copy. Three *logical* fragments do not mean three chances.
-- An uncertain insertion blocks re-offering; absence is not evidence of failure.
function M.nextFragment(root,id,x,y,at)
    local t=root.trails[id]; if not t then return nil end
    -- A read starts a trail, not an immediate stack of three clues. This is a
    -- spacing interval for local offers; destination evidence never expires.
    if at<t.at+2+t.seed%5 then return nil end
    for part=1,3 do
        local p=t.fragments[part]
        if p and (p.state=="intent" or p.state=="unknown") then return nil end
        if p and p.state~="refused" and at-p.at<6 then return nil end
    end
    for part=1,3 do
        local p=t.fragments[part]
        if not p then return part end
        if not p.noted and not p.recognised and p.state=="placed" then
            local dx,dy=x-p.target.x,y-p.target.y
            if dx*dx+dy*dy<14400 or at-p.at<6 then return nil end
        end
    end
    for part=1,3 do
        local p=t.fragments[part]
        if not p.noted and not p.recognised and (p.state=="placed" or p.state=="refused") then return part end
    end
end
return M
