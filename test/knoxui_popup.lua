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

print("PASS knoxui faces and popup: the 24 pt cut draws from its own folder between Small and Medium, the popup list chooses on a tap and closes on a tap elsewhere")
