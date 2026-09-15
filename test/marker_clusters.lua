-- Map labels for nearby clues share one stacked list.
--
-- Owner, 2026-09-11, house 104: "two markings unreadable due to overwriting".
-- Markers were grouped only when on the EXACT same tile, so two documents a tile
-- apart in one house were each laid out as if alone and printed over each other.
-- They now cluster by where they land on screen; each keeps its own question
-- mark, and zooming in far enough separates them again.
package.path = "mod/common/media/lua/client/?.lua;mod/common/media/lua/shared/?.lua;" .. package.path
local Layout = require("ConspiracyFiles/MarkerLayout")
assert(type(Layout.CLUSTER_X) == "number" and type(Layout.CLUSTER_Y) == "number",
    "the clustering distance must be named, not buried in a literal")

local src = assert(io.open("mod/common/media/lua/client/ConspiracyFiles/ClueMarkers.lua")):read("*a")
assert(src:find("Layout.CLUSTER_X", 1, true) and src:find("Layout.CLUSTER_Y", 1, true),
    "markers must cluster by screen distance")
assert(src:find("home.points[#home.points+1]", 1, true),
    "each clustered marker must keep its own question mark")
assert(src:find("table.sort(cluster.labels", 1, true), "a cluster's labels must read in discovery order")
-- The layout for ONE cluster stacks its labels one line apart and never lets
-- two share a line - which is the property that makes clustering fix overlap.
local measure = function(t) return #t * 7 end
local out = Layout.layout({ { number = 1, title = "Stores list / FS-289", floor = 0 },
                            { number = 2, title = "Review / FS-289", floor = 0 } },
    200, 200, { left = 16, top = 60, right = 1000, bottom = 800 }, 20, measure)
assert(#out == 2, "both labels must be drawn")
assert(out[1].y ~= out[2].y, "two labels in one cluster must not share a line")
assert(math.abs(out[2].y - out[1].y) >= 20, "and must be at least a line apart")
print("PASS marker clusters: nearby clues share one stacked label list, each keeping its own mark")
