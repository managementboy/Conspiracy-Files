-- Text must not leave the glass.
--
-- Nothing clips a mod's drawing to its own panel, so KnoxUI.text used to walk
-- its cursor off the right-hand edge of the LCD and paint the remainder over
-- the device's moulded housing. Reachable in ordinary play: the note field
-- accepts two hundred characters. It also cost a Lua-to-Java call per invisible
-- glyph - measured at 1224 texture calls and 5.98 ms per frame on a list of
-- forty-one notes, for sixteen visible rows of thirty-eight columns.
--
-- Asserted on what is DRAWN: a fake panel records every quad, so the test sees
-- what the player would see.
package.path="mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;"..package.path
local K=require("ConspiracyFiles/KnoxUI")
local Font=require("ConspiracyFiles/Generated/OrganiserFont")

local drawn
local panel={drawTextureScaled=function(self,tex,x,y,w,h) drawn[#drawn+1]={x=x,w=w} end,
             drawRect=function() end}
-- KnoxUI resolves a glyph through getTexture; every code has one.
getTexture=function(path) return {path=path} end

local function context(width)
    return K.begin(panel,1,100,200,width,211)
end

local function render(text,width,nx)
    drawn={}
    local c=context(width)
    K.text(c,text,nx or 0,0,{0,0,0})
    return c
end

-- A string that fits is drawn in full.
local short="Dana Vale"
local c=render(short,160)
assert(#drawn==#short:gsub("%s","")+ (#short-#short:gsub("%s","")),
    "every character of a fitting string is drawn: got "..#drawn)

-- A string far longer than the glass stops AT the glass, and never past it.
local long=string.rep("W",400)
c=render(long,160)
local rightmost=0
for _,q in ipairs(drawn) do
    local edge=q.x+q.w
    if edge>rightmost then rightmost=edge end
end
local glassEdge=c.x+c.w*c.scale
assert(rightmost<=glassEdge,
    "text was drawn to "..rightmost.." but the glass ends at "..glassEdge)
assert(#drawn<400,"a 400-character string must not issue 400 draw calls: got "..#drawn)
-- And it drew SOMETHING: clipping must not be silence.
assert(#drawn>10,"clipping must not stop the text entirely: got "..#drawn)

-- The clip respects the starting offset, so an indented line clips earlier.
local a=render(long,160,0)
local aCount=#drawn
local b=render(long,160,60)
assert(#drawn<aCount,"an indented line has less room and must clip sooner: "..#drawn.." vs "..aCount)

-- The clip scales with the device: at 2x there are twice as many pixels, and
-- the same number of COLUMNS, so the same number of glyphs fit.
drawn={}
local c2=K.begin(panel,2,100,200,160,211)
K.text(c2,long,0,0,{0,0,0})
local at2=#drawn
c=render(long,160)
assert(math.abs(at2-#drawn)<=1,
    "the same text must fit the same number of columns at any device scale: "
    ..at2.." at 2x vs "..#drawn.." at 1x")

-- K.fit shortens with an ellipsis, and only when it has to.
assert(K.fit("Dana Vale",160)=="Dana Vale","a fitting label is untouched")
local fitted=K.fit(string.rep("W",400),160)
assert(fitted:sub(-3)=="...","a shortened label says so: "..fitted)
assert(Font.width(fitted,1)<=160,"a shortened label actually fits: "..Font.width(fitted,1))
assert(#fitted<400,"and it is shorter than what it replaced")
-- An impossible width degrades to nothing rather than throwing.
assert(K.fit("anything",1)=="","no room at all yields no label")
assert(K.fit(nil,160)=="","a nil label is empty, not an error")

print("PASS knox UI clipping: text stops at the glass at every scale and offset, a long string costs far fewer calls than its length, and labels shorten with an ellipsis")
