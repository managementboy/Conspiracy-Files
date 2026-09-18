-- The stylus drags the page, and the wheel turns it (owner, Windows,
-- 2026-09-18: "hold and drag works too?"). A press on the glass only becomes a
-- drag after a few pixels, so a tap still picks a record; then a line of
-- movement is a line of text, and the paper follows the hand.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
package.preload["ConspiracyFiles/KnoxUI"]=function() return {LINE=8,rows=function() return 10 end} end
package.preload["ConspiracyFiles/KnoxApps"]=function() return {} end
package.preload["ConspiracyFiles/Generated/OrganiserFont"]=function() return {glyphs={}} end
package.preload["ConspiracyFiles/Generated/OrganiserFont24"]=function() return {glyphs={}} end
package.preload["Fieldnote/Geometry"]=function()
    return {device={w=100,h=200},lcd={x=0,y=0,w=80,h=120},controls={},components={}}
end
package.preload["Fieldnote/Panel"]=function() return {} end
package.preload["ISUI/ISPanel"]=function() return {} end
ISPanel={derive=function() return {onMouseMove=function() return false end,onMouseDown=function() return false end,
    onMouseUpOutside=function() return false end} end}
ConspiracyFiles={}
Events={OnTick={Add=function() end},OnGameStart={Add=function() end},OnKeyPressed={Add=function() end},
        OnPostUIDraw={Add=function() end},OnRenderTick={Add=function() end}}
getCore=function() return {getScreenWidth=function() return 1280 end,getScreenHeight=function() return 800 end,
    getOptionFontSize=function() return 1 end} end
getTextManager=function() return {getFontHeight=function() return 12 end,MeasureStringX=function() return 10 end} end
getPlayer=function() return nil end
getTimeInMillis=function() return 0 end
local ok,err=pcall(dofile,"mod/common/media/lua/client/ConspiracyFiles/OrganiserScreen.lua")
assert(ok,"OrganiserScreen loads under fakes: "..tostring(err))
local S=ConspiracyFiles.OrganiserScreen
local Screen=S.Screen

-- A record open, the machine on, a drag armed on the glass.
local view=setmetatable({on=true,record={detail="x"},card=5,scale=1,touch=function() end},{__index=Screen})
view.dragging={dy=0,moved=false}
view.down="GLASS"

-- A nudge under the threshold is not a drag: a tap must still select.
view:onMouseMove(0,2)
assert(view.card==5 and view.dragging.moved==false,"a nudge is not a drag")

-- Dragging UP reads further down the page, a line per line height.
view:onMouseMove(0,-24)
assert(view.card>5,"dragging up moves down the record: "..view.card)
local afterUp=view.card
view:onMouseMove(0,64)
assert(view.card<afterUp,"dragging down moves back up: "..view.card)
assert(view.card>=1,"never above the first line")

-- The wheel turns a line at a time, and never below the first.
local wheeled=setmetatable({on=true,record={detail="x"},card=3,scale=1,touch=function() end},{__index=Screen})
-- The game's own convention: a positive notch reads further down the page
-- (ISScrollingListBox scrolls by -delta).
wheeled:onMouseWheel(1); assert(wheeled.card==4,"a notch down is a line down: "..wheeled.card)
for _=1,4 do wheeled:onMouseWheel(-1) end
assert(wheeled.card==1,"and it stops at the top")

-- In a list the wheel moves the selected entry, not a record's lines.
local list=setmetatable({on=true,entry=2,scale=1,touch=function() end},{__index=Screen})
list:onMouseWheel(1); assert(list.entry==3,"a list moves an entry: "..list.entry)

-- A machine that is off ignores both.
local off=setmetatable({on=false,record={detail="x"},card=2,scale=1,touch=function() end},{__index=Screen})
assert(off:onMouseWheel(1)==false and off.card==2,"a dark screen scrolls nothing")
print("PASS organiser drag scroll: the stylus drags the page after a few pixels, and the wheel turns it a line at a time")

-- Letting go after a drag must not also open whatever is under the stylus.
local tapped=0
local dragged=setmetatable({on=true,record={detail="x"},card=1,scale=1,touch=function() end,
    tap=function() tapped=tapped+1 end},{__index=Screen})
dragged.down="GLASS"; dragged.dragging={dy=0,moved=false}
dragged:onMouseMove(0,-40)
dragged:onMouseUp(10,10)
assert(tapped==0,"a drag is not a tap")
local plain=setmetatable({on=true,record={detail="x"},card=1,scale=1,touch=function() end,
    tap=function() tapped=tapped+1 end},{__index=Screen})
plain.down="GLASS"; plain.dragging={dy=0,moved=false}
plain:onMouseUp(10,10)
assert(tapped==1,"a press with no movement still taps")
print("PASS organiser drag scroll: a drag scrolls and does not open a record")
