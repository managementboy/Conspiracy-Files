-- Development-only live Lua channel ("cf-eval").
--
-- B42 mod Lua has no loadstring, so code from the development machine arrives
-- as a file: tools/cf_eval.sh writes it, tools/stream_log.ps1 -Eval copies it
-- to <Zomboid>/Lua/cf_inbox.lua, and this module runs it with reloadLuaFile.
-- The payload reports back through DevEval.report, whose [CF-EVAL <id>] lines
-- reach the development machine in the streamed console.txt.
--
-- Active only in debug single-player; otherwise it registers nothing and reads
-- no file. Each id runs at most once per session, and whatever id is already in
-- the inbox at game start is treated as seen, so a leftover command never runs.
ConspiracyFiles=ConspiracyFiles or {}
local E=ConspiracyFiles.DevEval or {}
ConspiracyFiles.DevEval=E

E.INBOX="cf_inbox.lua"
E.POLL_MS=1000
E.MAX_ENTRIES=20
E.MAX_CHARS=2000

function E.allowed()
    return isDebugEnabled and isDebugEnabled() and not (isClient and isClient()) and not (isServer and isServer()) and true or false
end

local function say(id,text)
    for line in (tostring(text).."\n"):gmatch("([^\n]*)\n") do
        print("[CF-EVAL "..tostring(id).."] "..line:gsub("\r",""))
    end
end

local function str(value)
    local ok,text=pcall(tostring,value)
    return ok and text or "<unprintable>"
end

-- One level deep: nested tables print as their address, never recursed into.
local function dump(value)
    if type(value)=="string" then return value end
    if type(value)~="table" then return str(value) end
    local parts,count,size={},0,0
    for k,v in pairs(value) do
        count=count+1
        if count>E.MAX_ENTRIES then parts[#parts+1]="...";break end
        local item=str(k).."="..(type(v)=="string" and string.format("%q",v) or str(v))
        size=size+#item
        if size>E.MAX_CHARS then parts[#parts+1]="...";break end
        parts[#parts+1]=item
    end
    return "{"..table.concat(parts,", ").."}"
end

local function cap(text)
    if #text>E.MAX_CHARS then return text:sub(1,E.MAX_CHARS).."...(truncated)" end
    return text
end

-- Called by the payload as report(id, pcall(function() <code> end)).
function E.report(id,ok,...)
    pcall(function(...)
        local n=select("#",...)
        if ok then
            local values={}
            for i=1,n do values[i]=dump((select(i,...))) end
            say(id,"ok "..cap(n==0 and "(no value)" or table.concat(values,"\t")))
        else
            say(id,"error "..cap(str((...))))
        end
        say(id,"end")
    end,...)
end

function E.path()
    local sep=getFileSeparator()
    return Core.getMyDocumentFolder()..sep.."Lua"..sep..E.INBOX
end

-- The id from the inbox's first line, or nil when there is no usable inbox.
function E.readId()
    local reader=getFileReader(E.INBOX,false)
    if not reader then return nil end
    local ok,line=pcall(function() return reader:readLine() end)
    pcall(function() reader:close() end)
    if not ok or not line then return nil end
    return tostring(line):match("^%-%- cf%-eval id=([%w%-_%.]+)")
end

function E.poll()
    local id=E.readId()
    if not id or E.seen[id] then return end
    E.seen[id]=true
    say(id,"start")
    local ok,why=pcall(function() reloadLuaFile(E.path()) end)
    if not ok then say(id,"error reloadLuaFile: "..str(why)); say(id,"end") end
end

function E.tick()
    if not E.active then return end
    local now=getTimestampMs()
    if E.nextPoll and now<E.nextPoll then return end
    E.nextPoll=now+E.POLL_MS
    local ok,why=pcall(E.poll)
    if not ok then print("[CF-EVAL] poll failed: "..str(why)) end
end

function E.start()
    if not E.allowed() then return end
    E.seen=E.seen or {}
    local ok,id=pcall(E.readId)
    if ok and id then E.seen[id]=true end
    E.nextPoll=nil
    E.active=true
    -- OnTickEvenPaused where the engine has it: OnTick stops while the game is
    -- paused, and the world map pauses it, so a command sent while the map was
    -- open (or to close it) never ran (Linux core-loop check, 2026-09-11).
    local event=Events and (Events.OnTickEvenPaused or Events.OnTick)
    if event and not E.tickHandler then
        E.tickHandler=function() E.tick() end
        event.Add(E.tickHandler)
    end
    print("[CF-EVAL] ready; inbox "..E.INBOX..(ok and id and (" (ignoring stale id="..id..")") or ""))
end

-- Fail closed: without debug nothing is registered at all. The start handler
-- rechecks the full gate, because multiplayer is only known once a game starts.
if E.allowed() and Events and Events.OnGameStart and not E.startHandler then
    E.startHandler=function() E.start() end
    Events.OnGameStart.Add(E.startHandler)
end

return E
