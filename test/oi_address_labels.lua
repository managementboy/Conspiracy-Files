-- House numbers on the WORLD MAP in a normal (non-debug) No Help game.
-- Owner playtest 2026-10-03: no numbers anywhere. Cause: the label code was
-- gated on the debug flag, and also on map zoom >= 18. This loads the real
-- shipped book and the real render hook against doubles of the map UI.
package.path="mod-ofinterest/common/media/lua/shared/?.lua;mod-ofinterest/common/media/lua/client/?.lua;"..package.path
Events=setmetatable({},{__index=function(t,n) local e={Add=function() end,Remove=function() end}; rawset(t,n,e); return e end})
getDebug=function() return false end
isClient=function() return false end; isServer=function() return false end
getGameVersion=function() return "42.20.4" end
getTimeInMillis=function() return 0 end
ModData={get=function() return nil end,getOrCreate=function() return {} end}
getWorld=function() return {getMap=function() return "Muldraugh, KY" end} end
package.preload["ISUI/Maps/ISWorldMap"]=function() return true end
local original=0
ISWorldMap={render=function() original=original+1 end}
UIFont={Small=1}
getTextManager=function() return {MeasureStringX=function(_,_,t) return #t*6 end,getFontHeight=function() return 12 end} end
local known=true
WorldMapVisited={getInstance=function() return {isKnown=function() return known end} end}
local M=require("OIShared/AddressMap")
assert(M.start({noScan=true}),"shipped book must load in a non-debug game")
assert(M.ready())
-- a real shipped Muldraugh building to centre the view on
local B=require("OIShared/Generated/AddressBook")
local x,y=B.rows[1]:match("^[^|]+|(%-?%d+)|(%-?%d+)|")
x,y=tonumber(x),tonumber(y)
local function ui(span)
    local drawn={}
    local scale=1000/span
    return {width=1000,height=1000,drawText=function(_,t) drawn[#drawn+1]=t end,drawn=drawn,
        mapAPI={uiToWorldX=function(_,px) return x-span/2+px/scale end,uiToWorldY=function(_,_,py) return y-span/2+py/scale end,
            worldToUIX=function(_,wx) return (wx-(x-span/2))*scale end,worldToUIY=function(_,_,wy) return (wy-(y-span/2))*scale end,
            getZoomF=function() return 15 end}}
end
local u=ui(150); ISWorldMap.render(u)
assert(original==1,"vanilla render still runs")
assert(#u.drawn>0,"numbers drawn at town zoom in a non-debug game")
for _,t in ipairs(u.drawn) do assert(t:match("^%d+$")) end
known=false; u=ui(150); ISWorldMap.render(u)
assert(#u.drawn==0,"nothing drawn where the map is not known")
known=true; u=ui(5000); ISWorldMap.render(u)
assert(#u.drawn==0,"nothing drawn zoomed far out")
print("nohelp_address_labels ok")
