-- ClueMarkers draws on the world map through a chain of engine calls on a live map window that
-- cannot exist headless:  mapAPI:getSymbolsAPIv2():getDefaultTextLayerID()  and
-- mapAPI:getStyleAPI():getLayerByName(id):getFont().  Each step is checked against the real
-- class, following the real return types, so a renamed or removed step fails here.
local function step(class, name, argc)
    local ret = RE.method(class, name, argc)
    assert(ret, class .. " has no " .. name .. "/" .. argc .. " in this game build")
    return ret
end
local MAP = "zombie.worldMap.UIWorldMapV3"        -- what ISWorldMap's mapAPI is
local symbols = step(MAP, "getSymbolsAPIv2", 0)
step(symbols, "getDefaultTextLayerID", 0)
local style = step(MAP, "getStyleAPI", 0)
local layer = step(style, "getLayerByName", 1)
-- getLayerByName is DECLARED to return the base layer type; the layer ClueMarkers asks is the text
-- layer, which carries getFont (vanilla ISWorldMapSymbols makes the same call). Check that the
-- text layer is a kind of the declared type and has the method.
local TEXT = "zombie.worldMap.styles.WorldMapStyleV2$WorldMapTextStyleLayerV1"
assert(RE.isa(TEXT, layer), TEXT .. " is no longer a kind of " .. layer)
step(TEXT, "getFont", 0)
step(MAP, "getZoomF", 0)
step(MAP, "worldToUIX", 2)
step(MAP, "worldToUIY", 2)
