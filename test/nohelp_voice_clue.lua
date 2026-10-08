-- DR-20260929-NOHELP-GAP-PLAN, E1: on every Inspect the survivor says the
-- clue's own text out loud - the white halo carries the words, the bubble the
-- title - a long text a piece at a time, each held long enough to read.
-- PLACEHOLDER TEXT ONLY.
package.path="mod-nohelp/common/media/lua/shared/?.lua;mod-nohelp/common/media/lua/client/?.lua;test/fixtures/?.lua;"..package.path
local clock=0
getTimeInMillis=function() return clock end
local says,halos={},{}
local player={}
function player:Say(t) assert(self==player,"Say needs a receiver"); says[#says+1]=t end
function player:setHaloNote(t) assert(self==player,"setHaloNote needs a receiver"); halos[#halos+1]=t end
getPlayer=function() return player end
local ticks={}
Events=setmetatable({},{__index=function(t,k) local e={Add=function(f) ticks[#ticks+1]=f end,Remove=function() end}; rawset(t,k,e); return e end})
local V=require("NHShared/PlayerVoice")
local function tick(ms) clock=clock+ms; V.drain() end

-- Lines: ONE sentence each, never joined (the halo never wraps, so a long line
-- is one wide strip across the screen); an overlong sentence is cut between words.
local s1="Placeholder sentence one is here."
local s2="Placeholder two."
local long=string.rep("word ",40).."end."
local two=V.pieces(s1.." "..s2)
assert(#two==2 and two[1]==s1 and two[2]==s2,"two sentences are two lines, in order")
local text=s1.." "..s2.." "..long
local p=V.pieces(text)
assert(V.LINE_CHARS==75,"cap is the bubble's own 75 characters")
assert(table.concat(p," "):gsub("%s+"," ")==text:gsub("%s+"," "),"every word is said, in order")
for _,x in ipairs(p) do
    assert(#x<=V.LINE_CHARS,"a line fits the cap: "..#x)
    assert(not x:find("^%s") and not x:find("%s$"),"no stray space at the ends")
end
assert(#p>=4 and p[1]==s1 and p[2]==s2,"short sentences stay whole and apart")
for i=3,#p-1 do assert(p[i]:match("word$"),"a long sentence breaks at a word boundary, not inside one: "..p[i]) end
assert(#V.pieces(string.rep("x",200))>=3,"an unbroken run is still cut to the cap")
for _,x in ipairs(V.pieces(string.rep("x",200))) do assert(#x<=V.LINE_CHARS) end
assert(#V.pieces("")==0 and #V.pieces(nil)==0,"no text, nothing said")

-- Hold grows with length: 60 ms a character, never under 2.5 s.
assert(V.readHold("Hi")==2500,"short lines hold the minimum")
assert(V.readHold(string.rep("a",64))>V.readHold(string.rep("a",50)) and V.readHold(string.rep("a",64))==64*60,"hold scales with length")

-- Said one at a time: never two lines before the first has had its hold.
local n=V.sayClue("Placeholder Title",text)
assert(n==#p and n>=4,"all lines queued: "..n)
assert(#halos==0 and says[1]==p[1],"first line: the words in the bubble, no halo, no title")
for i=2,n do
    local hold=V.readHold(p[i-1])
    tick(hold-100); assert(#says==i-1,"line "..i.." waits while line "..(i-1).." is read")
    tick(100); assert(says[i]==p[i] and #says==i,"line "..i.." follows in order, alone")
end
assert(#says==n and #halos==0,"no halo call for a caption")
for _,t in ipairs(says) do assert(t~="Placeholder Title","the title is never spoken") end

-- A cue goes through the same queue: it waits for the caption line showing.
tick(20000); halos={}; says={}
V.sayClue("T","Placeholder first line. Placeholder second line.")
local ok1=V.sayCue("Placeholder cue words","Hm?")
assert(#says==1 and says[1]=="Placeholder first line." and #halos==0,"the cue does not land on the line being read")
tick(20000); assert(says[2]=="Placeholder second line." and #says==2)
tick(20000); assert(halos[1]=="Placeholder cue words" and says[3]=="Hm?" and #says==3,"the cue is said in turn, its own look unchanged")
tick(20000); assert(#says==3 and #halos==1)
-- On its own a cue is said at once.
tick(20000); V.sayCue("Alone","Hm?"); assert(halos[2]=="Alone")

-- A diary is as long as it is: more lines than the ordinary four-line bound.
local diary=string.rep("Placeholder diary line that goes on. ",40)
local m=V.sayClue("Diary",diary)
assert(m>4,"a long text is not cut to four lines: "..m)
local before=#says
for _=1,m do tick(20000) end
assert(#says-before==m,"every piece of a long text is said")
assert(#says>=m)

-- Inspecting another clue drops what is left of the one before.
halos={}; says={}
tick(20000)
V.sayClue("First",string.rep("Placeholder first text. ",30))
V.sayClue("Second","Placeholder second text.")
for _=1,10 do tick(20000) end
local last=says[#says]
assert(last=="Placeholder second text.","the newer clue is said")
for i=2,#says-1 do assert(not says[i]:find("first",1,true),"the older clue's remaining pieces are dropped") end

-- The runtime says it on every Inspect, with the document's title and body.
local f=assert(io.open("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua","rb"))
local src=f:read("*a"); f:close()
local inspect=src:match("function R%.inspect%(.-\nend\n")
assert(inspect and inspect:find("voice.sayClue,doc.title,doc.body",1,true),"R.inspect says the clue's words")
assert(not inspect:find("not already[^\n]*sayClue"),"on every Inspect, not only the first")

print("nohelp voice clue: the survivor says a clue's text on Inspect, piece by piece, bubble only")
