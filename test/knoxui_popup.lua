-- Two things KnoxUI gained for P4-R99 (owner, 2026-09-14): a second cut of the
-- face for the text size between Small and Medium, and the Palm popup list
-- SETUP opens. Asserted on what is drawn and what a tap would hit.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local K=require("ConspiracyFiles/KnoxUI")
local Base=require("ConspiracyFiles/Generated/OrganiserFont")
local Big=require("ConspiracyFiles/Generated/OrganiserFont24")

local textures,rects
local panel={drawTextureScaled=function(self,tex,x,y,w,h) textures[#textures+1]={path=tex.path,h=h} end,
             drawRect=function(self,x,y,w,h) rects[#rects+1]={x=x,y=y,w=w,h=h} end,
             drawRectBorder=function() end}
getTexture=function(path) return {path=path} end

-- The in-between face really is in between: taller than Small, shorter than Medium.
assert(Base.line==11,"Small is 11 px: "..Base.line)
assert(Big.line>Base.line and Big.line<Base.line*2,"the new size must sit between Small and Medium: "..Big.line)

-- A pass drawn in the 24 pt face uses its own pictures at its own height.
textures,rects={},{}
local c=K.begin(panel,1,0,0,160,211,Big)
assert(K.current==Big,"the pass's face is the one it began with")
K.text(c,"A",0,0,K.INK)
assert(textures[1].path:find("CFOrg/b1x/65.png",1,true),"the 24 pt face reads its own folder: "..textures[1].path)
assert(textures[1].h==Big.line,"at its own line height: "..textures[1].h)
-- And the next pass, with no face named, is back on the 16 pt face.
textures={}
c=K.begin(panel,2,0,0,160,211)
assert(K.current==Base,"no face named means the 16 pt face")
K.text(c,"A",0,0,K.INK)
assert(textures[1].path:find("CFOrg/2x/65.png",1,true),textures[1].path)
assert(textures[1].h==Base.line*2)
assert(K.width("WWW")==Base.width("WWW",1),"widths follow the pass's face")

-- The popup list: over the screen, the choice inverted, a tap on a line hits
-- that line, and a tap anywhere else is the catcher that leaves it as it was.
textures,rects={},{}
c=K.begin(panel,1,0,0,160,211)
K.row(c,"a row underneath",20,false,"ROW",1)
local x,y,w,h=K.popup(c,"Text size",{"Small","Normal","Medium","Large"},3)
assert(x>=0 and y>=0 and x+w<=160 and y+h<=211,"the list stays on the glass")
local third
for _,hit in ipairs(c.hits) do if hit.id=="POPUP" and hit.payload==3 then third=hit end end
assert(third,"every line is tappable")
local tapped=K.at(c,third.x+1,third.y+1)
assert(tapped and tapped.id=="POPUP" and tapped.payload==3,"a tap on a line chooses that line")
local under=K.at(c,5,21)
assert(under and under.id=="POPUP_CLOSE","a tap beside the list closes it rather than reaching the row underneath")
local inverted=false
for _,r in ipairs(rects) do if r.y==third.y and r.h==Base.line then inverted=true end end
assert(inverted,"the current choice is drawn inverted")

-- A long choice wraps onto more lines instead of being cut off (P4-R122, owner
-- 2026-09-15: "the wording can be as long as necessary"), stays on the glass,
-- and a tap on any of its lines chooses it.
textures,rects={},{}
-- A narrow glass, so the option cannot fit on one line (it is 142 px at Small).
c=K.begin(panel,1,0,0,100,211)
local long="Check the place against its records."
assert(K.width(long)>96,"fixture: the option must be wider than the list can be")
x,y,w,h=K.popup(c,"What would I check next?",{"Follow the person.",long,"Listen for it."},2)
assert(x>=0 and y>=0 and x+w<=100 and y+h<=211,"a wrapped list stays on the glass")
local second
for _,hit in ipairs(c.hits) do if hit.id=="POPUP" and hit.payload==2 then second=hit end end
assert(second and second.h>=Base.line*2,"the long option takes more than one line")
local low=K.at(c,second.x+1,second.y+second.h-1)
assert(low and low.id=="POPUP" and low.payload==2,"a tap on its second line still chooses it")
local lines=K.wrap(long,w-6)
assert(#lines>=2 and table.concat(lines," ")==long,"wrapping keeps every word, in order")

-- Closing readings can be longer than the Palm glass. The popup stays inside
-- it, exposes a bounded line window, and reaches a later option after scroll.
textures,rects={},{ }
c=K.begin(panel,1,0,0,100,70)
local choices={}
for i=1,8 do choices[i]="Reading "..i.." keeps every part of this longer local explanation." end
local layout
x,y,w,h,layout=K.popup(c,"Choose a reading",choices,1)
assert(y>=0 and y+h<=70 and layout.total>layout.room,"a long popup is bounded to the glass")
local _,_,_,bottom,after=K.popup(c,"Choose a reading",choices,8,layout.total,true)
assert(bottom<=70 and after.top>1,"the final wording can be scrolled into the bounded popup")
local last
for _,hit in ipairs(c.hits) do
    if hit.id=="POPUP" then
        assert(hit.x+hit.w<=x+w-6,"choice text never overlaps the popup scroll gutter")
        if hit.payload==8 then last=hit end
    end
end
assert(last and K.at(c,last.x+1,last.y+1).payload==8,"a visible late option remains tappable")

print("PASS knoxui faces and popup: the 24 pt cut draws from its own folder between Small and Medium, the popup list chooses on a tap and closes on a tap elsewhere")
