-- What belongs in a vehicle, derived from what the game says the vehicle was
-- for.
--
-- Owner, 2026-09-09: "there are also different types of cars. again misplaced
-- objects are a mystery. what are 50 mannequin doing in a truck."
--
-- The point this test defends is the same one RoomAffinity defends: "in the
-- wrong place" is only meaningful where there is a right place. A pile of
-- mannequins in an ambulance is a question. The same pile in an unmarked
-- saloon is furniture in a car, and calling it evidence would be the mod
-- manufacturing suspicion out of nothing.
package.path = "mod/common/media/lua/shared/?.lua;" .. package.path
local Vehicles = require("ConspiracyFiles/Generated/VehicleCatalogue")
local Affinity = require("ConspiracyFiles/Generated/VehicleAffinity")

-- The catalogue is derived. If it ever shrinks to something a person typed,
-- it stopped being derived.
assert(Vehicles.count() >= 40, "only " .. Vehicles.count() .. " vehicles; that is list-sized")
local named = 0
for _, v in ipairs(Vehicles.vehicles) do if #v.drivers > 0 then named = named + 1 end end
assert(named >= 15, "only " .. named .. " vehicles name their driver; the derivation is the whole basis here")

-- The game's own statements, spot-checked. These are facts from
-- media/scripts/generated/vehicles, not opinions.
assert(Vehicles.get("VanAmbulance").drivers[1] == "AmbulanceDriver")
assert(Vehicles.get("VanMail").drivers[1] == "Postal")
assert(Vehicles.get("VanSeats_Prison").drivers[1] == "PrisonGuard")
assert(Vehicles.get("Trailer_Livestock").drivers[1] == "Farmer", "a livestock trailer is a farmer's")

-- A trade's own supplies belong in its vehicle.
assert(Affinity.fits("VanAmbulance", "FirstAid"), "medical supplies belong in an ambulance")
assert(Affinity.fits("CarLightsPolice", "Security"), "a police car is where security equipment belongs")
assert(Affinity.fits("Trailer_Livestock", "AnimalPart"), "a livestock trailer is a farmer's")

-- And what does not. This is the owner's example: the mannequins are a
-- question because the vehicle has a stated purpose they have nothing to do
-- with.
assert(Affinity.avoids("VanMail", "Furniture"), "mannequins in a mail van are a question")
assert(Affinity.avoids("VanAmbulance", "Furniture"), "so are mannequins in an ambulance")
assert(not Affinity.fits("VanAmbulance", "Furniture"))

-- Silence is the load-bearing part. An unmarked van has no declared driver, so
-- nothing in it is in the wrong place, and `avoids` must say so rather than
-- treating "not listed" as "wrong".
assert(not Affinity.fits("Van", "Furniture"), "a plain van suits nothing in particular")
assert(not Affinity.avoids("Van", "Furniture"), "a plain van cannot be the wrong place for anything")
assert(not Affinity.avoids("NoSuchVehicle", "Furniture"), "an unknown vehicle yields no opinion")
assert(Affinity.categoriesFor("Van") == nil, "no driver means no opinion, not an empty opinion")

-- A generic driver is the game saying "this one has no identity", exactly as
-- Generic03 on a corpse is. Nothing may be concluded from what is in their van.
local generic
for _, v in ipairs(Vehicles.vehicles) do
    if #v.drivers > 0 and string.sub(v.drivers[1], 1, 7) == "Generic" then generic = v.id end
end
if generic then
    assert(Affinity.categoriesFor(generic) == nil,
        generic .. " has an anonymous driver and must yield no opinion")
end

-- The opinion set stays small and deliberate.
assert(#Affinity.withTrade() >= 10, "too few vehicles carry an opinion to be useful")

print(string.format("PASS vehicle affinity: %d vehicles, %d naming their driver, %d with an "
    .. "opinion - and an unmarked van is never the wrong place for anything",
    Vehicles.count(), named, #Affinity.withTrade()))
