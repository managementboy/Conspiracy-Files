local Content = require("ConspiracyFiles.Content")

local ids = Content.ids

-- Static adapter input selected by CF-V01-E01's clean Build 42.20.4 live matrix.
-- Building/room IDs observed from Java are evidence only; bounds, reference squares,
-- object/container indexes, types and sprites are the reproducible binding authority.
local LocationBindings = {
    supportedBuild = "42.20.4",
    supportedRevision = "b0bbce05d5",
    straightLineTiles = 1533.884,
    locations = {
        [ids.relay] = {
            siteId = "R2",
            arrival = {
                kind = "building",
                referenceSquare = { x = 13564, y = 1596, z = 0 },
                expectedRoom = "newsroom",
                bounds = { minX = 13549, minY = 1572, maxX = 13581, maxY = 1604, minZ = 0, maxZ = 3 },
                expectedRoomCount = 26
            },
            placements = {
                [ids.d1] = { x = 13555, y = 1576, z = 1, room = "communications", objectIndex = 2, containerIndex = 0, containerType = "metal_shelves", sprite = "furniture_shelving_01_26" },
                [ids.d3] = { x = 13556, y = 1576, z = 1, room = "communications", objectIndex = 2, containerIndex = 0, containerType = "metal_shelves", sprite = "furniture_shelving_01_27" },
                [ids.d4] = { x = 13562, y = 1579, z = 1, room = "communications", objectIndex = 2, containerIndex = 0, containerType = "desk", sprite = "location_community_medical_01_106" }
            },
            access = {
                exteriorDoor = { x = 13557, y = 1572, z = 0, objectIndex = 3, sprite = "fixtures_doors_01_53" },
                stairs = { x = 13566, y = 1602, z = 0, objectIndex = 2, sprite = "fixtures_stairs_01_50" }
            }
        },
        [ids.police] = {
            siteId = "P2",
            arrival = {
                kind = "building",
                referenceSquare = { x = 13208, y = 3088, z = 0 },
                expectedRoom = "policeoffice",
                bounds = { minX = 13206, minY = 3073, maxX = 13238, maxY = 3101, minZ = 0, maxZ = 1 },
                expectedRoomCount = 24
            },
            placements = {
                [ids.d2] = { x = 13207, y = 3087, z = 0, room = "policeoffice", objectIndex = 2, containerIndex = 0, containerType = "filingcabinet", sprite = "location_business_office_generic_01_32" },
                [ids.d5] = { x = 13208, y = 3087, z = 0, room = "policeoffice", objectIndex = 2, containerIndex = 0, containerType = "filingcabinet", sprite = "location_business_office_generic_01_32" },
                [ids.d6] = { x = 13209, y = 3087, z = 0, room = "policeoffice", objectIndex = 2, containerIndex = 0, containerType = "filingcabinet", sprite = "location_business_office_generic_01_32" }
            },
            access = {
                exteriorDoor = { x = 13206, y = 3087, z = 0, objectIndex = 3, sprite = "fixtures_doors_01_33" }
            }
        }
    }
}

return LocationBindings
