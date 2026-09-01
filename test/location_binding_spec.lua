local CF = require("ConspiracyFiles")
local bindings = CF.LocationBindings
local ids = CF.Content.ids
local bindingSource = arg and arg[0] or "test/run.lua"
local bindingRoot = bindingSource:gsub("[\\/]test[\\/]run%.lua$", "")
if bindingRoot == bindingSource then bindingRoot = "." end

local function assertContainer(assetId, expected)
    local locationId = CF.Content.assets[assetId].placementLocationId
    local actual = bindings.locations[locationId].placements[assetId]
    assertTrue(actual ~= nil, "missing placement for " .. assetId)
    for key, value in pairs(expected) do assertEqual(value, actual[key], assetId .. " binding field " .. key) end
end

test("CF-V01-E01 selected live bindings remain exact and evidence-backed", function()
    assertEqual("42.20.4", bindings.supportedBuild)
    assertEqual("b0bbce05d5", bindings.supportedRevision)
    assertEqual(1533.884, bindings.straightLineTiles)

    local relay = bindings.locations[ids.relay]
    assertEqual("R2", relay.siteId)
    assertEqual("building", relay.arrival.kind)
    assertDeepEqual({ x = 13564, y = 1596, z = 0 }, relay.arrival.referenceSquare)
    assertDeepEqual({ minX = 13549, minY = 1572, maxX = 13581, maxY = 1604, minZ = 0, maxZ = 3 }, relay.arrival.bounds)
    assertEqual(26, relay.arrival.expectedRoomCount)
    assertContainer(ids.d1, { x = 13555, y = 1576, z = 1, room = "communications", objectIndex = 2, containerIndex = 0, containerType = "metal_shelves", sprite = "furniture_shelving_01_26" })
    assertContainer(ids.d3, { x = 13556, y = 1576, z = 1, room = "communications", objectIndex = 2, containerIndex = 0, containerType = "metal_shelves", sprite = "furniture_shelving_01_27" })
    assertContainer(ids.d4, { x = 13562, y = 1579, z = 1, room = "communications", objectIndex = 2, containerIndex = 0, containerType = "desk", sprite = "location_community_medical_01_106" })
    assertDeepEqual({ x = 13557, y = 1572, z = 0, objectIndex = 3, sprite = "fixtures_doors_01_53" }, relay.access.exteriorDoor)
    assertDeepEqual({ x = 13566, y = 1602, z = 0, objectIndex = 2, sprite = "fixtures_stairs_01_50" }, relay.access.stairs)

    local police = bindings.locations[ids.police]
    assertEqual("P2", police.siteId)
    assertEqual("building", police.arrival.kind)
    assertDeepEqual({ x = 13208, y = 3088, z = 0 }, police.arrival.referenceSquare)
    assertDeepEqual({ minX = 13206, minY = 3073, maxX = 13238, maxY = 3101, minZ = 0, maxZ = 1 }, police.arrival.bounds)
    assertEqual(24, police.arrival.expectedRoomCount)
    assertContainer(ids.d2, { x = 13207, y = 3087, z = 0, room = "policeoffice", objectIndex = 2, containerIndex = 0, containerType = "filingcabinet", sprite = "location_business_office_generic_01_32" })
    assertContainer(ids.d5, { x = 13208, y = 3087, z = 0, room = "policeoffice", objectIndex = 2, containerIndex = 0, containerType = "filingcabinet", sprite = "location_business_office_generic_01_32" })
    assertContainer(ids.d6, { x = 13209, y = 3087, z = 0, room = "policeoffice", objectIndex = 2, containerIndex = 0, containerType = "filingcabinet", sprite = "location_business_office_generic_01_32" })
    assertDeepEqual({ x = 13206, y = 3087, z = 0, objectIndex = 3, sprite = "fixtures_doors_01_33" }, police.access.exteriorDoor)

    local evidenceFile = assert(io.open(bindingRoot .. package.config:sub(1, 1) .. "docs" .. package.config:sub(1, 1) .. "research" .. package.config:sub(1, 1) .. "CF_V01_E01_DEAD_AIR_LOCATION_BINDINGS.md", "rb"))
    local evidence = evidenceFile:read("*a")
    evidenceFile:close()
    for _, needle in ipairs({
        "kind=MATRIX_RESULT|failures=0|status=PASS",
        "x=13555|y=1576|z=1|room=communications",
        "x=13556|y=1576|z=1|room=communications",
        "x=13562|y=1579|z=1|room=communications",
        "x=13207|y=3087|z=0|room=policeoffice",
        "x=13208|y=3087|z=0|room=policeoffice",
        "x=13209|y=3087|z=0|room=policeoffice",
        "straightTiles=1533.884"
    }) do assertTrue(string.find(evidence, needle, 1, true) ~= nil, "evidence missing " .. needle) end
end)
