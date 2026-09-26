-- WHICH STARTS THIS INSTALL HAS ALREADY PLAYED, AND WHICH TO PLAY NEXT.
--
-- Owner, 2026-09-25: "we need to implement the randomizer that also
-- remembers per game install what initiation clues we have used in the past.
-- Those should not be prioritised." A new game used to take
-- (seed-1) % starts + 1 - uniform over a family's authored starts, blind to
-- the games before it, so a three-start family repeated one game in three
-- (profession_openings 20260925T191517: nurse 1,1,2). The save cannot
-- remember other saves; a file beside the saves can (OpeningMemoryStore).
--
-- This is the pure half: a count per family and start, a chooser that takes
-- the LEAST-USED start and lets the seed decide only between equals, and a
-- line format the store writes and reads. No engine access.
local M={}

-- counts: { [profession]={ [variant]=n } }
function M.choose(counts,profession,variants,seed)
    if type(variants)~="number" or variants<1 then return nil,"no starts" end
    local used=type(counts)=="table" and type(counts[profession])=="table" and counts[profession] or {}
    local least,candidates=nil,{}
    for v=1,variants do
        local n=tonumber(used[v]) or 0
        if least==nil or n<least then least=n; candidates={v}
        elseif n==least then candidates[#candidates+1]=v end
    end
    -- The seed decides among equals, as it decided everything before: the
    -- same seed on the same memory picks the same start, so a check can say
    -- why a start was chosen rather than only that one was.
    local s=type(seed)=="number" and seed or 1
    return candidates[((s-1)%#candidates)+1],least
end

function M.record(counts,profession,variant)
    if type(counts)~="table" or type(profession)~="string" or type(variant)~="number" then return counts end
    counts[profession]=counts[profession] or {}
    counts[profession][variant]=(tonumber(counts[profession][variant]) or 0)+1
    return counts
end

-- One line per family: "profession<TAB>v:n,v:n". Anything the parser does
-- not understand is skipped, never a reason to refuse a game its opening.
function M.serialise(counts)
    local lines,professions={},{}
    for profession in pairs(counts or {}) do professions[#professions+1]=profession end
    table.sort(professions)
    for _,profession in ipairs(professions) do
        local parts,variants={},{}
        for v in pairs(counts[profession]) do variants[#variants+1]=v end
        table.sort(variants)
        for _,v in ipairs(variants) do
            local n=tonumber(counts[profession][v]) or 0
            if n>0 then parts[#parts+1]=tostring(v)..":"..tostring(math.floor(n)) end
        end
        if #parts>0 then lines[#lines+1]=profession.."\t"..table.concat(parts,",") end
    end
    return lines
end

function M.parse(lines)
    local counts={}
    for _,line in ipairs(lines or {}) do
        local profession,rest=tostring(line):match("^([%l%d_]+)\t([%d:,]+)%s*$")
        if profession then
            for v,n in rest:gmatch("(%d+):(%d+)") do
                counts[profession]=counts[profession] or {}
                counts[profession][tonumber(v)]=tonumber(n)
            end
        end
    end
    return counts
end

return M
