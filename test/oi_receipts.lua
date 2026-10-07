-- Blind re-read receipts (tools/cluegates/check_receipts.lua; content-writer
-- handoff sections 7 and 9). PLACEHOLDERS ONLY.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;tools/nohelp_content/?.lua;tools/cluegates/?.lua;"..package.path
local J=require("json")
local R=dofile("tools/cluegates/check_receipts.lua")
local sha256=require("sha256")
local Manifest=require("OIShared/Mystery/Manifest")

assert(sha256("abc")=="ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad","sha256 is SHA-256")
assert(sha256("")=="e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855","sha256 of nothing")

local function clue(id,lean,body)
    return {id=id,kind="set",pieces={"Twine","Tarp"},title="Placeholder title",body=body or "Placeholder body.",
        where={{place="farm",spot="ground",lean=lean,rival=lean=="containment" and "agricultural" or "containment"}}}
end
-- What the reader sees: no lean, no rival.
local shown=R.render(clue("r-1","containment"))
assert(shown:find("Placeholder body.",1,true) and shown:find("farm / ground",1,true),"the clue, its pieces and its place")
assert(not shown:find("containment",1,true) and not shown:find("agricultural",1,true),"never its lean or rival")

local dir=os.tmpname(); os.remove(dir)
assert(os.execute('mkdir -p "'..dir..'"')==0)
local function receipt(c,votes,sha)
    local f=assert(io.open(dir.."/"..c.id..".json","wb"))
    f:write(J.encode({clue=c.id,sha256=sha or R.sha(c),model="placeholder-reader",date="2026-09-27",votes=votes}))
    f:close()
end
-- DR-20260928-NOHELP-CLUE-CHECK: one read, A, B, both or none. A, B or
-- both stay in the game (whatever the declared lean); none is dropped.
local fitsA=clue("r-fits-a","containment")
receipt(fitsA,{A=1,B=0,both=0,none=0})
local fitsB=clue("r-fits-b","containment")
receipt(fitsB,{A=0,B=1,both=0,none=0}) -- the "other" side: no return for that
local fitsBoth=clue("r-fits-both","agricultural")
receipt(fitsBoth,{A=0,B=0,both=1,none=0})
local fitsNone=clue("r-fits-none","agricultural")
receipt(fitsNone,{A=0,B=0,both=0,none=1})
local changed=clue("r-changed","containment")
receipt(changed,{A=1,B=0,both=0,none=0})
changed.body="Placeholder body, edited after its receipt."
local missing=clue("r-missing","agricultural")
local twoReads=clue("r-two-reads","containment")
receipt(twoReads,{A=1,B=1,both=0,none=0})
local oldVote=clue("r-old-vote","containment")
receipt(oldVote,{A=1,B=0,neither=0})
local broken=clue("r-broken","agricultural")
local f=io.open(dir.."/r-broken.json","wb"); f:write("{not json"); f:close()

local problems=R.check({fitsA,fitsB,fitsBoth,fitsNone,changed,missing,twoReads,oldVote,broken},dir)
local byId={}
for _,p in ipairs(problems) do byId[p.id]=p.code end
assert(byId["r-fits-a"]==nil and byId["r-fits-b"]==nil and byId["r-fits-both"]==nil,"A, B or both: into the game")
assert(byId["r-fits-none"]=="FITS_NEITHER","none: dropped, a new one is written")
assert(byId["r-changed"]=="STALE_RECEIPT","a clue whose text changed after its receipt is reported")
assert(byId["r-missing"]=="NO_RECEIPT","a clue with no receipt is reported")
assert(byId["r-two-reads"]=="BAD_RECEIPT","exactly one read: no second reads")
assert(byId["r-old-vote"]=="BAD_RECEIPT","a receipt from the old question is not valid")
assert(byId["r-broken"]=="BAD_RECEIPT","an unreadable receipt")
os.execute('rm -rf "'..dir..'"')

-- THE SHIPPED CLUE LIST: every clue needs a valid receipt. Nothing to check
-- while the list is empty, so this does not fail before content exists.
local shipped=R.check(Manifest.clues)
if #shipped>0 then
    local lines={}
    for _,p in ipairs(shipped) do lines[#lines+1]=p.id.." "..p.code end
    error("clues without a valid blind re-read (tools/cluegates/blind_reread.md):\n"..table.concat(lines,"\n"))
end

print("nohelp_receipts: ok ("..#Manifest.clues.." shipped clues)")
