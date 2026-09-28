-- Blind re-read receipts (tools/cluegates/check_receipts.lua; content-writer
-- handoff sections 7 and 9). PLACEHOLDERS ONLY.
package.path="mod-nohelp/common/media/lua/shared/?.lua;tools/nohelp_content/?.lua;tools/cluegates/?.lua;"..package.path
local J=require("json")
local R=dofile("tools/cluegates/check_receipts.lua")
local sha256=require("sha256")
local Manifest=require("NHShared/Mystery/Manifest")

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
local good=clue("r-good","containment")
receipt(good,{A=1,B=0,neither=0})
local changed=clue("r-changed","containment")
receipt(changed,{A=1,B=0,neither=0})
changed.body="Placeholder body, edited after its receipt."
local missing=clue("r-missing","agricultural")
local retry=clue("r-retry","containment")
receipt(retry,{A=0,B=1,neither=0}) -- first read disagrees: request one more
local disagrees=clue("r-disagrees","containment")
receipt(disagrees,{A=1,B=1,neither=0}) -- two reads disagree
local stillWrong=clue("r-still-wrong","containment")
receipt(stillWrong,{A=0,B=2,neither=0}) -- both reads miss the declared lean
local mixed=clue("r-mixed","containment")
mixed.where[2]={place="office",spot="furniture",lean="agricultural",rival="containment"}
receipt(mixed,{A=1,B=0,neither=0})
local tooMany=clue("r-too-many","agricultural")
receipt(tooMany,{A=3,B=1,neither=1})
local broken=clue("r-broken","agricultural")
local f=io.open(dir.."/r-broken.json","wb"); f:write("{not json"); f:close()

local problems=R.check({good,changed,missing,retry,disagrees,stillWrong,mixed,tooMany,broken},dir)
local byId={}
for _,p in ipairs(problems) do byId[p.id]=p.code end
assert(byId["r-good"]==nil,"one current independent read matching the declared lean passes")
assert(byId["r-changed"]=="STALE_RECEIPT","a clue whose text changed after its receipt is reported")
assert(byId["r-missing"]=="NO_RECEIPT","a clue with no receipt is reported")
assert(byId["r-retry"]=="NEEDS_SECOND_READ","a first vote against the declared lean requests one targeted read")
assert(byId["r-disagrees"]=="DISAGREEMENT","two different votes are returned for human review")
assert(byId["r-still-wrong"]=="LEAN_MISMATCH","two votes against the declared lean are returned")
assert(byId["r-mixed"]=="MIXED_LEAN","inconsistent placement leans are returned")
assert(byId["r-too-many"]=="BAD_RECEIPT","more than two votes are invalid")
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
