-- DERIVED FILE - do not edit by hand.
--
--     python3 tools/extract_vehicle_types.py --lua \\
--         mod/common/media/lua/shared/ConspiracyFiles/Generated/VehicleCatalogue.lua
--
-- Parsed from media/scripts/generated/vehicles/*.txt, so every vehicle name,
-- driver and container part here is true by construction.
--
-- `drivers` is the game's own `zombieType` - the kind of person found dead at
-- that wheel. It is the game stating what a vehicle is FOR, which is what makes
-- "this cargo has nothing to do with this vehicle" a derivable fact instead of
-- a mapping somebody invented.
local M={}
M.REVISION="vehicles-5537d36cc57d"
-- {id, drivers, parts}
M.vehicles={
 {id="CarLightsPolice",drivers={"Police"},parts={"GloveBox"}},
 {id="CarLightsRanger",drivers={"Ranger"},parts={}},
 {id="CarLuxury",drivers={},parts={}},
 {id="CarNormal",drivers={},parts={}},
 {id="CarStationWagon",drivers={},parts={}},
 {id="CarStationWagon2",drivers={},parts={"GloveBox","TruckBed"}},
 {id="CarTaxi",drivers={"Generic01","Generic02","Generic03","Generic04","Generic05"},parts={"GloveBox"}},
 {id="CarTaxi2",drivers={"Generic01","Generic02","Generic03","Generic04","Generic05"},parts={"GloveBox"}},
 {id="ModernCar",drivers={},parts={}},
 {id="ModernCar02",drivers={},parts={}},
 {id="ModernCar_Martin",drivers={},parts={"GloveBox","TrunkDoor"}},
 {id="OffRoad",drivers={},parts={}},
 {id="PickUpTruck",drivers={},parts={}},
 {id="PickUpTruckLightsFire",drivers={"FiremanFullSuit","Fireman"},parts={}},
 {id="PickUpTruckLightsRanger",drivers={"Ranger"},parts={}},
 {id="PickUpTruck_Camo",drivers={},parts={}},
 {id="PickUpVan",drivers={},parts={}},
 {id="PickUpVanLightsFire",drivers={"FiremanFullSuit","Fireman"},parts={"TruckBed"}},
 {id="PickUpVanLightsPolice",drivers={"Police"},parts={"TruckBed"}},
 {id="PickUpVanLightsRanger",drivers={"Ranger"},parts={}},
 {id="PickUpVan_Camo",drivers={},parts={}},
 {id="RaceCar12",drivers={},parts={}},
 {id="RaceCar34",drivers={},parts={}},
 {id="RaceCar58",drivers={},parts={}},
 {id="SUV",drivers={},parts={}},
 {id="SmallCar",drivers={},parts={}},
 {id="SmallCar02",drivers={},parts={}},
 {id="SportsCar",drivers={},parts={"TruckBed","TrunkDoor"}},
 {id="SportsCar_ez",drivers={},parts={"GloveBox","TruckBed","TrunkDoor"}},
 {id="StepVan",drivers={},parts={}},
 {id="StepVanMail",drivers={"Postal"},parts={}},
 {id="Trailer",drivers={},parts={}},
 {id="TrailerAdvert",drivers={},parts={}},
 {id="TrailerCover",drivers={},parts={}},
 {id="Trailer_Horsebox",drivers={"Farmer"},parts={}},
 {id="Trailer_Livestock",drivers={"Farmer"},parts={}},
 {id="Van",drivers={},parts={"TruckBed"}},
 {id="VanAmbulance",drivers={"AmbulanceDriver"},parts={"TruckBed"}},
 {id="VanMail",drivers={"Postal"},parts={"TruckBed"}},
 {id="VanSeats",drivers={},parts={"TruckBed"}},
 {id="VanSeats_Creature",drivers={"Goth","Rocker","Punk"},parts={"TruckBed"}},
 {id="VanSeats_LadyDelighter",drivers={"Gaudy"},parts={"TruckBed"}},
 {id="VanSeats_Mural",drivers={},parts={"TruckBed"}},
 {id="VanSeats_Prison",drivers={"PrisonGuard"},parts={"TruckBed"}},
 {id="VanSeats_Space",drivers={"Backpacker","Hobbyist","IT"},parts={"TruckBed"}},
 {id="VanSeats_Trippy",drivers={"Backpacker","Grunge"},parts={"TruckBed"}},
 {id="VanSeats_Valkyrie",drivers={"Redneck","Rocker","Veteran"},parts={"TruckBed"}},
}
local byId={}
for _,v in ipairs(M.vehicles) do byId[v.id]=v end
function M.count() return #M.vehicles end
function M.get(id)
    local v=type(id)=="string" and byId[id]
    if not v then return nil,"unknown vehicle" end
    return {id=v.id,drivers=v.drivers,parts=v.parts}
end
return M
