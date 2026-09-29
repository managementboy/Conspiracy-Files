-- The No Help content progress line (tools/nohelp_content/progress.lua) on a
-- scratch content root. PLACEHOLDERS ONLY; the design covered is picked from
-- the targets at run time, so this file names none.
package.path="mod-nohelp/common/media/lua/shared/?.lua;tools/nohelp_content/?.lua;tools/cluegates/?.lua;"..package.path
local J=require("json")
local Progress=dofile("tools/nohelp_content/progress.lua")
local T=dofile("content/nohelp/targets.lua")
local Sites=require("NHShared/Generated/MapSites")

assert(#T.designOrder==125 and #T.prints==133,"targets are computed from MapSites")
for _,d in ipairs(T.designOrder) do assert(#T.designs[d]>=1,"every design has a mark") end

local root=os.tmpname(); os.remove(root)
assert(os.execute('mkdir -p "'..root..'/incoming" "'..root..'/accepted/sidecar" "'..root..'/rejected" "'..root..'/approved"')==0)
local function write(path,text) local f=assert(io.open(root.."/"..path,"wb")); f:write(text); f:close() end
local STATE=root.."/STATE.md"
write("STATE.md","## BATON\nCHATGPT since 2026-09-27 because WRITING\n\n## OPEN RETURNS\nnone\n\n## QUARANTINE\nnone\n\n## LAST ADHD\nnone\n\n## PROGRESS\nx\n")
local REG={T0000={serial="T0000",type="STAGE0",status="open",opened="2026-09-27",closed=""},
    T0001={serial="T0001",type="MAP",status="open",opened="2026-09-27",closed=""}}
local function measure(extra)
    local o={root=root,targets=T,registry=REG,statePath=STATE,today="2026-09-27",sha=false}
    for k,v in pairs(extra or {}) do o[k]=v end
    return Progress.measure(o)
end
local function noNames(line)
    for _,d in ipairs(Sites.designs) do assert(not line:find(d,1,true),"the line names no design") end
    for _,p in ipairs(Sites.prints) do assert(not line:find(p,1,true),"the line names no print") end
end

-- The empty tree.
local line,detail=measure()
assert(line:find("^NOT DONE: "),line)
assert(line:find("stage0",1,true) and line:find("maps 0/125",1,true) and line:find("flyers 0/133",1,true),line)
assert(not line:find("\n"),"one line")
assert(detail:find("^detail: "),detail)
noNames(line); noNames(detail)

-- One design's every mark and note covered by placeholder accepted rows.
local design
for _,d in ipairs(T.designOrder) do if not design or #T.designs[d]<#T.designs[design] then design=d end end
local rows={}
for i,k in ipairs(T.designs[design]) do
    local d,what,n=k:match("^map:(.+):(%a+):(%d+)$")
    local anchor={map=d}; anchor[what]=tonumber(n)
    for j,lean in ipairs({"containment","agricultural"}) do
        rows[#rows+1]={id="t0001-"..i..j,kind="set",pieces={"Twine","Tarp"},anchor=anchor,
            where={{place="mapNamed",spot="furniture",lean=lean,rival=j==1 and "agricultural" or "containment"}}}
    end
end
write("accepted/T0001.json",J.encode(J.array(rows)))
line,detail=measure()
assert(line:find("maps 1/125",1,true),line)
assert(not line:find("sets ",1,true) and not line:find("balance",1,true),"all sets, balanced: those gates pass")
assert(detail:find("mapNamed c:s"..#T.designs[design].."w0",1,true),detail)
-- Balance by the blind read: A only against B only, "both" not counted.
do
    local rdir=root.."/receipts"; os.execute('mkdir -p "'..rdir..'"')
    local function vote(id,k) local v={A=0,B=0,both=0,none=0}; v[k]=1; write("receipts/"..id..".json",J.encode({votes=v})) end
    vote(rows[1].id,"A"); vote(rows[2].id,"both")
    local l=measure({receiptsDir=rdir})
    assert(l:find("balance 100%",1,true),"one A, no B: "..l)
    vote(rows[2].id,"B")
    l=measure({receiptsDir=rdir})
    assert(not l:find("balance",1,true),"one and one: balanced "..l)
end
noNames(line); noNames(detail)

-- Stage 0 sign-off: the sha256 of approved/axioms.json.
write("approved/axioms.json",'{"containment":["a1"],"agricultural":["b1"]}')
write("approved/SIGNOFF","wrong\n")
assert(measure():find("stage0",1,true),"a wrong sign-off does not count")
write("approved/SIGNOFF",require("sha256")('{"containment":["a1"],"agricultural":["b1"]}').."\n")
assert(not measure():find("stage0",1,true),"a matching sign-off counts")

-- Orphans, returns and their acknowledgement, stale quarantine, the sha.
write("incoming/T0099.json","[]")
assert(measure():find("orphans 1",1,true),"an unregistered serial is an orphan")
os.remove(root.."/incoming/T0099.json")
write("rejected/T0001.json",'[{"row":{"id":"t0001-9"},"reasons":[{"code":"SCHEMA"}]}]')
assert(measure():find("returns 1",1,true),"an open return")
write("STATE.md","## OPEN RETURNS\nT0001 ACK 2026-09-27\n\n## QUARANTINE\nT0001 since 2026-09-01\n")
line=measure()
assert(not line:find("returns",1,true),"an acknowledged return is not open")
assert(line:find("stale 1",1,true),"an old quarantine is stale")
assert(measure{sha="abc1234"}:find(" @abc1234$"),"the sha suffix")

-- The state writer keeps every section above PROGRESS.
write("STATE.md","## BATON\nCLAUDE\n\n## PROGRESS\nold\n")
Progress.writeState(STATE,"NOT DONE: x")
local f=assert(io.open(STATE,"rb")); local s=f:read("*a"); f:close()
assert(s=="## BATON\nCLAUDE\n\n## PROGRESS\nNOT DONE: x\n",s)

-- The converter's --check: serial types from the registry, stage 0 left for
-- sign-off, nothing written.
local Convert=dofile("tools/nohelp_content/convert.lua")
local reg=Convert.loadRegistry("docs/writer-only/nohelp-tickets.tsv")
assert(reg.T0000 and reg.T0000.type=="STAGE0","the registry opens with stage 0")
os.execute('rm -f "'..root..'"/rejected/*.json "'..root..'"/accepted/*.json')
write("incoming/T0000.json",'{"containment":[],"agricultural":[]}')
write("incoming/T0001.json",J.encode(J.array({{id="t0001-1",kind="set",pieces={"Twine","Tarp"},
    where={{place="farm",spot="furniture",lean="containment",rival="agricultural"}},
    rival_reading="r",gloss="g",axioms={containment={"a"},agricultural={"b"}},prov={writer="w",handoff="h",batch="T0001"}}})))
local out=root.."/Clues.lua"
write("Clues.lua",Convert.renderClues({}))
local report,ok=Convert.run{root=root,out=out,check=true,registry=REG,retired={salt="t",hashes={}},reserved={names={}},axioms=false,
    sceneKinds={},sceneDraft={},leftAlone={}}
assert(not ok,"a MAP serial's row without an anchor is returned")
assert(report[#report]:find("^check: 1 tickets, 0 rows pass, 1 returned, 1 stage 0"),report[#report])
assert(io.open(root.."/incoming/T0001.json") and io.open(root.."/incoming/T0000.json"),"check removes nothing")
assert(not io.open(root.."/rejected/T0001.json"),"check writes nothing")

os.execute('rm -rf "'..root..'"')
print("nohelp_progress: ok")
