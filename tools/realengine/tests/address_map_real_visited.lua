-- AddressMap.draw asks the player's real map knowledge  visited:isKnown(floor(x), floor(y))  (and a
-- five-point version of it) before drawing a house number. Here the same calls run on a REAL
-- WorldMapVisited, with the real map-API contract for what draw() asks the map window.
local v = RE.visited()
assert(v:isKnown(math.floor(10.7), math.floor(20.2)) == false, "unseen ground is not known")
-- The five points a label checks use the same call; the four-number form is also real.
for _, p in ipairs({{5, 5}, {39, 39}, {0, 39}, {39, 0}, {100, 100}}) do
    assert(type(v:isKnown(p[1], p[2])) == "boolean", "isKnown answers true or false")
end
assert(v:isKnown(0, 0, 10, 10) == false, "four-number form")
-- NOT checked here: that marking ground known makes isKnown answer true. A fresh headless
-- WorldMapVisited has no map extent to record into; that needs a loaded map (in-game checks).
-- the calls draw() makes on the map window, checked against the real class
local API = "zombie.worldMap.UIWorldMapV3"
for _, c in ipairs({{"getZoomF", 0}, {"uiToWorldX", 2}, {"uiToWorldY", 2}, {"worldToUIX", 2}, {"worldToUIY", 2}}) do
    assert(RE.method(API, c[1], c[2]), "the map window has no " .. c[1] .. "/" .. c[2])
end
