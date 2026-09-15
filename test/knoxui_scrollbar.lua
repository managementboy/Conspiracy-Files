-- The scroll bar. Owner, Windows, 2026-09-14: "scrollbars not visible?" - a
-- record that ran past the glass said so with a single "v" in the corner.
-- Asserted on what is DRAWN and what a tap would hit, through a fake panel.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local K=require("ConspiracyFiles/KnoxUI")

local rects
local panel={drawTextureScaled=function() end,
             drawRect=function(self,x,y,w,h) rects[#rects+1]={x=x,y=y,w=w,h=h} end,
             drawRectBorder=function() end}
getTexture=function(path) return {path=path} end

local W,H=160,211
local function bar(top,room,total)
    rects={}
    local c=K.begin(panel,1,0,0,W,H)
    K.scrollbar(c,20,100,top,room,total)
    return c
end
local function hitsOf(c,id)
    local out={}
    for _,h in ipairs(c.hits) do if h.id==id then out[#out+1]=h end end
    return out
end
-- The thumb is the one 3-wide rectangle taller than an arrow row.
local function thumb()
    for _,r in ipairs(rects) do if r.w==3 and r.h>1 then return r end end
end

-- Nothing to scroll: nothing drawn, nothing to tap.
local c=bar(1,10,10)
assert(#rects==0 and #c.hits==0,"a list that fits draws no scroll bar")

-- More than fits: the bar sits at the right edge, inside the glass.
c=bar(1,10,40)
assert(#rects>0,"a list longer than the glass draws a scroll bar")
for _,r in ipairs(rects) do
    assert(r.x>=W-8 and r.x+r.w<=W,"the scroll bar keeps to the right edge: x="..r.x.." w="..r.w)
end

-- The thumb says how much is on screen and where: a quarter of the track, at the top.
local t=assert(thumb(),"a thumb is drawn")
local trackH=100-8
assert(math.abs(t.h-math.floor(trackH*10/40))<=1,"the thumb is as long as the share on screen: "..t.h)
assert(t.y==24,"at the top of the text the thumb is at the top of the track: "..t.y)
c=bar(31,10,40)
t=thumb()
assert(t.y+t.h==24+trackH,"at the end of the text the thumb reaches the bottom of the track: "..(t.y+t.h))
-- A last page shorter than the screen does not push the thumb off the track.
c=bar(37,10,40)
t=thumb()
assert(t.y+t.h<=24+trackH,"the thumb never leaves the track")

-- Tapping above the thumb steps up, below it steps down.
c=bar(11,10,40)
t=thumb()
local up,down=hitsOf(c,"UP"),hitsOf(c,"DOWN")
assert(#up==1 and #down==1,"one tap area each way")
assert(up[1].y+up[1].h<=t.y and down[1].y>=t.y+t.h,"the tap areas lie above and below the thumb")
local tapped=K.at(c,down[1].x+1,down[1].y+1)
assert(tapped and tapped.id=="DOWN","a tap below the thumb is a DOWN")

print("PASS knoxui scroll bar: drawn only when needed, at the right edge, thumb sized and placed by position, taps step up and down")
