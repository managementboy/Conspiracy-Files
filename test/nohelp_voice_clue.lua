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

-- Pieces: sentences kept whole and joined up to PIECE_CHARS; an overlong
-- sentence is cut between words; nothing is lost.
local s1="Placeholder sentence one is here."
local long=string.rep("word ",60).."end."
local text=s1.." Placeholder two. "..long
local p=V.pieces(text)
local joined=table.concat(p," ")
assert(joined:gsub("%s+"," ")==text:gsub("%s+"," "),"every word is said, in order")
for _,x in ipairs(p) do assert(#x<=V.PIECE_CHARS,"a piece fits: "..#x) end
assert(p[1]==s1.." Placeholder two.","short sentences share a piece")
assert(#V.pieces("")==0 and #V.pieces(nil)==0,"no text, nothing said")

-- Said: the first piece at once, the rest each after the one before has had
-- its time; the halo carries the words, the bubble the title.
local n=V.sayClue("Placeholder Title",text)
assert(n==#p and n>=3,"all pieces queued: "..n)
assert(halos[1]==p[1] and says[1]=="Placeholder Title","first piece: words in the halo, title in the bubble")
tick(100); assert(#halos==1,"the next piece waits while the first is read")
for i=2,n do tick(20000); assert(halos[i]==p[i],"piece "..i.." follows in order") end
assert(#says==n and says[n]=="Placeholder Title")

-- A diary is as long as it is: more pieces than the ordinary four-line bound.
local diary=string.rep("Placeholder diary line that goes on. ",40)
local m=V.sayClue("Diary",diary)
assert(m>4,"a long text is not cut to four lines: "..m)
local before=#halos
for _=1,m do tick(20000) end
assert(#halos-before==m,"every piece of a long text is said")

-- Inspecting another clue drops what is left of the one before.
halos={}; says={}
tick(20000)
V.sayClue("First",string.rep("Placeholder first text. ",30))
V.sayClue("Second","Placeholder second text.")
for _=1,10 do tick(20000) end
local last=halos[#halos]
assert(last=="Placeholder second text.","the newer clue is said")
for i=2,#halos-1 do assert(not halos[i]:find("first",1,true),"the older clue's remaining pieces are dropped") end

-- The runtime says it on every Inspect, with the document's title and body.
local f=assert(io.open("mod-nohelp/common/media/lua/client/NHShared/GeneratedRuntime.lua","rb"))
local src=f:read("*a"); f:close()
local inspect=src:match("function R%.inspect%(.-\nend\n")
assert(inspect and inspect:find("voice.sayClue,doc.title,doc.body",1,true),"R.inspect says the clue's words")
assert(not inspect:find("not already[^\n]*sayClue"),"on every Inspect, not only the first")

print("nohelp voice clue: the survivor says a clue's text on Inspect, piece by piece, title in the bubble")
