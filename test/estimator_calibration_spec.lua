local Validator = require("ConspiracyFiles/Validator")

test("T1 representative 1000-record estimate is calibrated to observed Global ModData bytes", function()
    local records = {}
    for index = 1, 1000 do
        local entityType = "location"
        if index % 3 == 0 then entityType = "evidence" elseif index % 3 == 1 then entityType = "identity" end
        records[index] = {
            id = string.format("cf:t1:%06d", index),
            entityType = entityType,
            displayName = "CF T1 Record " .. index,
            discoveredAt = 1688169600 + index,
            location = { x = 10000 + (index % 1000), y = 9000 + math.floor(index / 1000), z = index % 3 },
            metadata = {
                source = "T1", category = "document", confidence = (index % 100) / 100,
                author = "Bureau-" .. (index % 17), code = "KX-" .. (index % 1000)
            },
            relatedIds = {
                string.format("identity:%05d", index % 317),
                string.format("organisation:%04d", index % 83),
                string.format("location:%04d", index % 211)
            },
            flags = {
                interesting = index % 2 == 0,
                archived = index % 5 == 0,
                physicalAvailable = index % 7 ~= 0
            }
        }
    end

    local observedDelta = 442499
    local estimate = Validator.estimateEncodedBytes(records)
    assertEqual(444196, estimate)
    assertTrue(estimate >= observedDelta)
    assertTrue((estimate - observedDelta) / observedDelta < 0.01)
end)
