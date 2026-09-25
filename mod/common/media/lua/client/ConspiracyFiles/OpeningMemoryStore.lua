-- THE FILE THAT REMEMBERS ACROSS SAVES.
--
-- A save knows only itself. What this install has played before lives in
-- one small text file in the Zomboid user folder (the same place
-- DiscoveryLog keeps its journal), read when a first case is being built
-- and rewritten once it is committed. Missing, unreadable or corrupt, the
-- file costs a game nothing: an empty memory means every start is equally
-- unplayed, which is what the first game on an install is.
local Memory=require("ConspiracyFiles/Generated/OpeningMemory")
local CFLog=require("ConspiracyFiles/Log")
local S={}
S.FILE="ConspiracyFiles_openings.txt"
local function log(message) CFLog.message("opening","note",message) end

function S.read()
    local lines={}
    pcall(function()
        local r=getFileReader(S.FILE,false)
        if not r then return end
        while true do
            local line=r:readLine()
            if line==nil then break end
            lines[#lines+1]=line
        end
        r:close()
    end)
    return Memory.parse(lines)
end

function S.write(counts)
    local ok,done=pcall(function()
        local w=getFileWriter(S.FILE,true,false)
        if not w then return false end
        for _,line in ipairs(Memory.serialise(counts)) do w:writeln(line) end
        w:close()
        return true
    end)
    return ok and done==true
end

-- The start to play next for this profession: the least-used on this
-- install, the seed deciding between equals. Says why in the log, so a
-- check can hold the choice to the memory it was made from.
function S.choose(profession,variants,seed)
    local counts=S.read()
    local variant,least=Memory.choose(counts,profession,variants,seed)
    if variant then
        log("opening start "..tostring(variant).." of "..tostring(variants).." for "..tostring(profession)
            ..": played "..tostring(least or 0).." time(s) here before, the fewest")
    end
    return variant
end

-- Remember a start once its case is committed - never before, or a game that
-- failed to build would count as played.
function S.record(profession,variant)
    if type(profession)~="string" or type(variant)~="number" then return false end
    local counts=Memory.record(S.read(),profession,variant)
    local ok=S.write(counts)
    if not ok then log("opening memory not written; the next game may repeat this start") end
    return ok
end

return S
