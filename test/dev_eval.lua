-- DevEval: the debug-only live Lua channel. Engine calls are mocked; the
-- reader demands a receiver, as the real Java-backed one does.
local realPrint=print;local output={};print=function(s) output[#output+1]=tostring(s) end
local handlers={}
local function event(name)
 return {Add=function(f) handlers[name]=handlers[name] or {};table.insert(handlers[name],f) end}
end
Events={OnGameStart=event("OnGameStart"),OnTick=event("OnTick")}
local debug_,client,server=false,false,false
isDebugEnabled=function() return debug_ end
isClient=function() return client end
isServer=function() return server end
local clock=0;getTimestampMs=function() return clock end
getFileSeparator=function() return "\\" end
Core={getMyDocumentFolder=function() return "C:\\Users\\p\\Zomboid" end}
local inbox,reads=nil,0
getFileReader=function(name,create)
 reads=reads+1
 assert(name=="cf_inbox.lua" and create==false,"reads the inbox without creating it")
 if not inbox then return nil end
 local r={}
 r.readLine=function(self) assert(self==r,"readLine needs a receiver");return inbox:match("^[^\n]*") end
 r.close=function(self) assert(self==r,"close needs a receiver") end
 return r
end
-- Stands in for executing the inbox: runs the payload registered for its id.
local payloads,runs={},{}
reloadLuaFile=function(path)
 assert(path=="C:\\Users\\p\\Zomboid\\Lua\\cf_inbox.lua","absolute inbox path, got "..tostring(path))
 local id=inbox:match("id=(%S+)");runs[id]=(runs[id] or 0)+1
 payloads[id]()
end
local function send(id,body)
 inbox="-- cf-eval id="..id.."\r\nConspiracyFiles.DevEval.report(...)\n"
 payloads[id]=function() ConspiracyFiles.DevEval.report(id,pcall(body)) end
end
local function lines(id)
 local found={}
 for _,s in ipairs(output) do
  local rest=s:match("^%[CF%-EVAL "..id:gsub("%-","%%-").."%] (.*)$")
  if rest then found[#found+1]=rest end
 end
 return found
end
local function tick(ms) clock=clock+(ms or 1000);for _,f in ipairs(handlers.OnTick or {}) do f() end end
local path="mod/common/media/lua/client/ConspiracyFiles/DevEval.lua"

-- Gate off: no handlers, no file reads, even when an inbox exists.
inbox="-- cf-eval id=x\n"
dofile(path)
assert(handlers.OnGameStart==nil and handlers.OnTick==nil and reads==0,"no -debug: nothing registered or read")
ConspiracyFiles=nil

-- Debug but multiplayer at game start: fails closed, no tick handler.
debug_=true
dofile(path)
client=true
for _,f in ipairs(handlers.OnGameStart) do f() end
assert(handlers.OnTick==nil and reads==0,"multiplayer: no poll, no read")
ConspiracyFiles=nil;handlers={};client=false

-- Debug single-player; a stale command is left over from the last session.
send("stale-1",function() error("stale command must never run") end)
local E=dofile(path)
assert(handlers.OnTick==nil,"nothing polls before the game starts")
for _,f in ipairs(handlers.OnGameStart) do f() end
assert(#handlers.OnTick==1,"one tick handler")
for i=1,5 do tick() end
assert(runs["stale-1"]==nil and #lines("stale-1")==0,"stale id at start is not run")

-- Throttled: a burst of frames reads the inbox at most once per second.
local before=reads;for i=1,60 do tick(16) end
assert(reads-before<=1,"poll throttled to about once a second, got "..(reads-before))

-- Missing inbox: silent.
inbox=nil;local quiet=#output;tick();tick()
assert(#output==quiet,"missing inbox prints nothing")

-- New id runs exactly once; the same id again is not rerun.
send("20260911T120000-1",function() return 10792.5 end)
tick()
local got=lines("20260911T120000-1")
assert(runs["20260911T120000-1"]==1,"new id runs")
assert(got[1]=="start" and got[2]=="ok 10792.5" and got[3]=="end" and #got==3,table.concat(got,"|"))
tick();tick();tick()
assert(runs["20260911T120000-1"]==1 and #lines("20260911T120000-1")==3,"same id not rerun")

-- Payload error: error line then end, nothing raised into the tick.
send("err-2",function() error("boom") end)
tick()
got=lines("err-2")
assert(got[1]=="start" and got[2]:find("^error .*boom") and got[3]=="end",table.concat(got,"|"))

-- A payload that cannot even load (reloadLuaFile throws) is still reported.
inbox="-- cf-eval id=bad-3\n";payloads["bad-3"]=function() error("unexpected symbol near 'end'") end
tick()
got=lines("bad-3")
assert(got[1]=="start" and got[2]:find("^error reloadLuaFile") and got[3]=="end",table.concat(got,"|"))

-- Table result: shallow, capped dump; nested tables are not recursed into.
local big={nested={deep=true}}
for i=1,100 do big[i]=string.rep("x",50) end
send("tbl-4",function() return big end)
tick()
got=lines("tbl-4")
assert(got[1]=="start" and got[#got]=="end","table framed by start/end")
local body=got[2]
assert(body:sub(1,4)=="ok {" and body:find("...",1,true),"dump marks truncation")
assert(#body<=E.MAX_CHARS+120,"dump capped, got "..#body)
assert(not body:find("deep",1,true),"dump is shallow")

-- Multi-line values keep the tag on every line; no-value and multiple returns.
send("ml-5",function() return "a\nb",nil,3 end)
tick()
got=lines("ml-5")
assert(got[2]=="ok a" and got[3]=="b\tnil\t3" and got[4]=="end",table.concat(got,"|"))
send("nv-6",function() end)
tick()
assert(lines("nv-6")[2]=="ok (no value)")

-- Malformed first line is ignored quietly.
inbox="print('no header')\n";quiet=#output;tick()
assert(#output==quiet,"inbox without a cf-eval header is ignored")

-- Reloading the module keeps state: seen ids stay seen, no second handler.
dofile(path);for _,f in ipairs(handlers.OnGameStart) do f() end
send("20260911T120000-1",function() error("must not rerun") end);tick()
assert(runs["20260911T120000-1"]==1 and #handlers.OnTick==1,"reload keeps seen ids and one handler")

realPrint("dev_eval: all checks passed")
