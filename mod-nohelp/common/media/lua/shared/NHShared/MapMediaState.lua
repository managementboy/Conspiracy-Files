-- Fresh-save map trails. Engine-free, copy-on-write, no case-slot dependency.
--
-- Schema 4 (No Help, task 3 plan step 4): the map system no longer places
-- documents of its own, so a trail is only its world seed and the hour it was
-- read; the clues its marks hold live in the No Help world record. The read
-- hour is a world event (owner: "A read hour is saved as a world event, not
-- as belief"). No migration before 1.0 (P4-R63): an older save's map state is
-- refused, never guessed at.
local V=require("NHShared/Validator")
local M={SCHEMA=4}
local function integer(n,lo,hi)
    return type(n)=="number" and n==n and n%1==0 and n>=lo and n<=hi
end
local function fields(t,allowed)
    if type(t)~="table" or getmetatable(t) then return false end
    for k in pairs(t) do if not allowed[k] then return false end end
    return true
end
local function time(n) return type(n)=="number" and n==n and n>=0 and n<1e12 end
local function clone(t)
    if type(t)~="table" then return t end
    local out={}; for k,v in pairs(t) do out[k]=clone(v) end; return out
end
M.copy=clone
-- `printVisits` is the flyer half of `entries`: a place a read flyer named and
-- the survivor has since stood in.
function M.empty() return {schema=M.SCHEMA,trails={},entries={},prints={},printVisits={}} end
function M.validate(root,catalogue)
    if not fields(root,{schema=true,trails=true,entries=true,prints=true,printVisits=true})
        or root.schema~=M.SCHEMA
        or type(root.trails)~="table" or type(root.entries)~="table" or type(root.prints)~="table"
        or type(root.printVisits)~="table" then
        return false,"invalid map-media header"
    end
    local count=0
    for id,t in pairs(root.trails) do
        count=count+1
        if not catalogue.get(id) or count>125 or not fields(t,{seed=true,at=true})
            or not integer(t.seed,1,2147483646) or not time(t.at) then
            return false,"invalid map trail"
        end
    end
    for id,at in pairs(root.entries) do
        if not catalogue.get(id) or not time(at) then return false,"invalid entry" end
    end
    for id,at in pairs(root.prints) do
        if not catalogue.print(id) or not time(at) then return false,"invalid printed-place reading" end
    end
    for id,at in pairs(root.printVisits) do
        if not catalogue.print(id) or not time(at) then return false,"invalid printed-place visit" end
        if not root.prints[id] then return false,"visited a place whose flyer was never read" end
    end
    return V.validateStructure(root)
end
function M.activate(root,id,seed,at,catalogue)
    if not catalogue.get(id) or not integer(seed,1,2147483646) or not time(at) then return nil,"invalid read" end
    if root.trails[id] then return root,false end
    local next=clone(root); next.trails[id]={seed=seed,at=at}
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
-- The survivor reached the place a flyer named. Recorded once.
function M.printVisit(root,id,at)
    if root.printVisits[id] then return root,false end
    local next=clone(root); next.printVisits[id]=at; return next,true
end
return M
