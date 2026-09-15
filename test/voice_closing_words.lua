-- A case's closing words are never dropped from a full voice queue (campaign
-- check, 2026-09-15): after a case whose last papers brought connections and a
-- pile, "What do I make of it?" was never said. The queue holds four waiting
-- lines; the closing pair pushes out the oldest ordinary lines instead.
package.path="mod/common/media/lua/shared/?.lua;mod/common/media/lua/client/?.lua;"..package.path

local says,halos={},{}
local clock=0
getTimeInMillis=function() return clock end
local p={Say=function(_,t) says[#says+1]=t end,setHaloNote=function(_,t) halos[#halos+1]=t end}
getPlayer=function() return p end
Events={OnTick={Add=function() end}}
ConspiracyFiles={}
local Voice=dofile("mod/common/media/lua/client/ConspiracyFiles/PlayerVoice.lua")
local function tick(ms) clock=clock+ms; Voice.drain() end

clock=60000
-- One line showing and the queue full behind it, then one more that is dropped.
Voice.onConnection("disputes-delivery","d1")
Voice.onConnection("corroborates","d2")
Voice.onPile("d3")
Voice.onNamedPlace("t3:1")
Voice.onBody("b1")
Voice.onConnection("disputes-delivery","d4")
-- The case ends in that busy moment.
Voice.onCaseComplete("case-9")
for _=1,40 do tick(6000) end

local thought,closing=0,0
for _,h in ipairs(halos) do if h=="What do I make of it?" then thought=thought+1 end end
for _,s in ipairs(says) do if s=="Nothing left to find here" then closing=closing+1 end end
assert(closing==1,"the case's closing line must be said even when the queue is full, got "..closing)
assert(thought==1,"and the second thought after it, got "..thought)
-- The closing line comes before the second thought.
local at,thoughtAt
for i,s in ipairs(says) do
    if s=="Nothing left to find here" then at=i end
    if s=="A question for the organiser" then thoughtAt=i end
end
assert(at and thoughtAt and at<thoughtAt,"the second thought follows the closing line")
print("PASS a case's closing words are never dropped from a full voice queue")
