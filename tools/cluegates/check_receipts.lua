-- BLIND RE-READ RECEIPTS (content-writer handoff, sections 7 and 9).
-- Plain Lua 5.1, offline.
--
--   lua5.1 tools/cluegates/check_receipts.lua              check every clue in
--                                                         the derived clue list
--   lua5.1 tools/cluegates/check_receipts.lua --render ID  print the text the
--                                                         blind reader is shown,
--                                                         and its sha256
--
-- A receipt, tools/cluegates/receipts/<clue id>.json, records one blind
-- re-read of one clue by a model OTHER than the writer's (prompt:
-- tools/cluegates/blind_reread.md):
--   {"clue": "<id>", "sha256": "<sha256 of M.render(clue)>",
--    "model": "<reader>", "date": "YYYY-MM-DD",
--    "votes": {"A": n, "B": n, "neither": n}}
-- A = Containment Cover-up (lean "containment"), B = Agricultural Program
-- Malfunction (lean "agricultural"). At least M.MIN_RUNS independent runs.
--
-- Reported, one line per clue, ids and codes only (never clue text):
--   NO_RECEIPT        no receipt for the clue
--   BAD_RECEIPT       the receipt is unreadable or badly shaped
--   STALE_RECEIPT     the clue's rendered text changed after its receipt
--   NEVER_RIVAL       no run read it as a conspiracy it cuts against (its
--                     `rival` in any of its places): it is one-sided
--   NEVER_OWN         no run read it as its own lean in any of its places: a
--                     clue read only as the rival supports the wrong side
--   MOSTLY_NEITHER    more than half the runs read it as neither
-- The last two are the handoff's "returned" rules for a blind re-read.
package.path="mod-nohelp/common/media/lua/shared/?.lua;tools/nohelp_content/?.lua;tools/cluegates/?.lua;"..package.path
local J=require("json")
local sha256=require("sha256")
local M={}
M.DIR="tools/cluegates/receipts"
M.MIN_RUNS=5
M.LETTER={containment="A",agricultural="B"}

-- Exactly what the blind reader sees: the clue alone, no lean, no rival, no
-- anchor, no gloss.
function M.render(c)
    local lines={"title: "..tostring(c.title or ""),"body: "..tostring(c.body or ""),
        "pieces: "..table.concat(c.pieces or {},", ")}
    local seen={}
    for _,w in ipairs(c.where or {}) do
        local k=tostring(w.place).." / "..tostring(w.spot)
        if not seen[k] then seen[k]=true; lines[#lines+1]="found: "..k end
    end
    return table.concat(lines,"\n").."\n"
end
function M.sha(c) return sha256(M.render(c)) end

local function readReceipt(dir,id)
    local f=io.open(dir.."/"..id..".json","rb")
    if not f then return nil end
    local text=f:read("*a"); f:close()
    local r=J.decode(text)
    if type(r)~="table" then return false end
    return r
end

-- Problems for a list of clues: {{id=, code=, why=}}, in list order.
function M.check(clues,dir)
    dir=dir or M.DIR
    local out={}
    local function report(id,code,why) out[#out+1]={id=id,code=code,why=why} end
    for _,c in ipairs(clues or {}) do
        local r=readReceipt(dir,c.id)
        if r==nil then report(c.id,"NO_RECEIPT","no blind re-read on record")
        elseif r==false or r.clue~=c.id or type(r.sha256)~="string" or type(r.votes)~="table" or type(r.model)~="string" then
            report(c.id,"BAD_RECEIPT","receipt unreadable or badly shaped")
        elseif r.sha256~=M.sha(c) then
            report(c.id,"STALE_RECEIPT","the text changed after the blind re-read")
        else
            local v=r.votes
            local a,b,n=tonumber(v.A) or 0,tonumber(v.B) or 0,tonumber(v.neither) or 0
            local runs=a+b+n
            if runs<M.MIN_RUNS then report(c.id,"BAD_RECEIPT","fewer than "..M.MIN_RUNS.." runs")
            else
                local byLetter={A=a,B=b}
                local rivalRead=true
                for _,w in ipairs(c.where or {}) do
                    if (byLetter[M.LETTER[w.rival]] or 0)<1 then rivalRead=false end
                end
                local ownRead=false
                for _,w in ipairs(c.where or {}) do
                    if (byLetter[M.LETTER[w.lean]] or 0)>=1 then ownRead=true end
                end
                if not rivalRead then report(c.id,"NEVER_RIVAL","never read as the conspiracy it cuts against")
                elseif not ownRead then report(c.id,"NEVER_OWN","never read as its own conspiracy")
                elseif n*2>runs then report(c.id,"MOSTLY_NEITHER","read as neither most of the time") end
            end
        end
    end
    return out
end

if arg and arg[0] and arg[0]:find("cluegates[/\\]check_receipts%.lua$") then
    local Manifest=require("NHShared/Mystery/Manifest")
    if arg[1]=="--render" then
        for _,c in ipairs(Manifest.clues) do
            if c.id==arg[2] then io.write(M.render(c)); print("sha256: "..M.sha(c)); os.exit(0) end
        end
        io.stderr:write("no clue "..tostring(arg[2]).."\n"); os.exit(1)
    end
    local problems=M.check(Manifest.clues)
    for _,p in ipairs(problems) do print(p.id.." "..p.code) end
    print(#Manifest.clues.." clues, "..#problems.." without a valid blind re-read")
    os.exit(#problems==0 and 0 or 1)
end
return M
