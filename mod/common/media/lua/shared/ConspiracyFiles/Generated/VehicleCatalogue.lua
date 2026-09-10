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
-- {id, drivers}
--
-- Container parts are deliberately NOT recorded. WorldAccess asks the live
-- vehicle which parts it has, because a car in the world can have a seat or a
-- trunk door missing, and a table written from the scripts would confidently
-- disagree with the car standing in front of the player.
M.vehicles={
 {id="CarLightsPolice",drivers={"Police"}},
 {id="CarLightsRanger",drivers={"Ranger"}},
 {id="CarLuxury",drivers={}},
 {id="CarNormal",drivers={}},
 {id="CarStationWagon",drivers={}},
 {id="CarStationWagon2",drivers={}},
 {id="CarTaxi",drivers={"Generic01","Generic02","Generic03","Generic04","Generic05"}},
 {id="CarTaxi2",drivers={"Generic01","Generic02","Generic03","Generic04","Generic05"}},
 {id="ModernCar",drivers={}},
 {id="ModernCar02",drivers={}},
 {id="ModernCar_Martin",drivers={}},
 {id="OffRoad",drivers={}},
 {id="PickUpTruck",drivers={}},
 {id="PickUpTruckLightsFire",drivers={"FiremanFullSuit","Fireman"}},
 {id="PickUpTruckLightsRanger",drivers={"Ranger"}},
 {id="PickUpTruck_Camo",drivers={}},
 {id="PickUpVan",drivers={}},
 {id="PickUpVanLightsFire",drivers={"FiremanFullSuit","Fireman"}},
 {id="PickUpVanLightsPolice",drivers={"Police"}},
 {id="PickUpVanLightsRanger",drivers={"Ranger"}},
 {id="PickUpVan_Camo",drivers={}},
 {id="RaceCar12",drivers={}},
 {id="RaceCar34",drivers={}},
 {id="RaceCar58",drivers={}},
 {id="SUV",drivers={}},
 {id="SmallCar",drivers={}},
 {id="SmallCar02",drivers={}},
 {id="SportsCar",drivers={}},
 {id="SportsCar_ez",drivers={}},
 {id="StepVan",drivers={}},
 {id="StepVanMail",drivers={"Postal"}},
 {id="Trailer",drivers={}},
 {id="TrailerAdvert",drivers={}},
 {id="TrailerCover",drivers={}},
 {id="Trailer_Horsebox",drivers={"Farmer"}},
 {id="Trailer_Livestock",drivers={"Farmer"}},
 {id="Van",drivers={}},
 {id="VanAmbulance",drivers={"AmbulanceDriver"}},
 {id="VanMail",drivers={"Postal"}},
 {id="VanSeats",drivers={}},
 {id="VanSeats_Creature",drivers={"Goth","Rocker","Punk"}},
 {id="VanSeats_LadyDelighter",drivers={"Gaudy"}},
 {id="VanSeats_Mural",drivers={}},
 {id="VanSeats_Prison",drivers={"PrisonGuard"}},
 {id="VanSeats_Space",drivers={"Backpacker","Hobbyist","IT"}},
 {id="VanSeats_Trippy",drivers={"Backpacker","Grunge"}},
 {id="VanSeats_Valkyrie",drivers={"Redneck","Rocker","Veteran"}},
}
local byId={}
for _,v in ipairs(M.vehicles) do byId[v.id]=v end
function M.count() return #M.vehicles end
function M.get(id)
    local v=type(id)=="string" and byId[id]
    if not v then return nil,"unknown vehicle" end
    return {id=v.id,drivers=v.drivers}
end
return M
