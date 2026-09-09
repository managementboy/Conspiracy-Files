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
-- {id, script, drivers, parts, trailer}
M.vehicles={
 {id="CarLightsPolice",script="vehicle_car_lights_police.txt",trailer=false,drivers={"Police"},parts={"GloveBox"}},
 {id="CarLightsRanger",script="vehicle_car_lights_ranger.txt",trailer=false,drivers={"Ranger"},parts={}},
 {id="CarLuxury",script="vehicle_car_luxury.txt",trailer=false,drivers={},parts={}},
 {id="CarNormal",script="vehicle_car_normal.txt",trailer=false,drivers={},parts={}},
 {id="CarStationWagon",script="vehicle_car_stationwagon.txt",trailer=false,drivers={},parts={}},
 {id="CarStationWagon2",script="vehicle_car_stationwagon2.txt",trailer=false,drivers={},parts={"GloveBox","TruckBed"}},
 {id="CarTaxi",script="vehicle_taxi.txt",trailer=false,drivers={"Generic01","Generic02","Generic03","Generic04","Generic05"},parts={"GloveBox"}},
 {id="CarTaxi2",script="vehicle_taxi2.txt",trailer=false,drivers={"Generic01","Generic02","Generic03","Generic04","Generic05"},parts={"GloveBox"}},
 {id="ModernCar",script="vehicle_car_modern.txt",trailer=false,drivers={},parts={}},
 {id="ModernCar02",script="vehicle_car_modern02.txt",trailer=false,drivers={},parts={}},
 {id="ModernCar_Martin",script="vehicle_car_modern_martin.txt",trailer=false,drivers={},parts={"GloveBox","TrunkDoor"}},
 {id="OffRoad",script="vehicle_offroad.txt",trailer=false,drivers={},parts={}},
 {id="PickUpTruck",script="vehicle_pickuptruck.txt",trailer=false,drivers={},parts={}},
 {id="PickUpTruckLightsFire",script="vehicle_pickuptruck_lights_fire.txt",trailer=false,drivers={"FiremanFullSuit","Fireman"},parts={}},
 {id="PickUpTruckLightsRanger",script="vehicle_pickuptruck_lights_ranger.txt",trailer=false,drivers={"Ranger"},parts={}},
 {id="PickUpTruck_Camo",script="vehicle_pickuptruck_camo.txt",trailer=false,drivers={},parts={}},
 {id="PickUpVan",script="vehicle_pickupvan.txt",trailer=false,drivers={},parts={}},
 {id="PickUpVanLightsFire",script="vehicle_pickupvan_lights_fire.txt",trailer=false,drivers={"FiremanFullSuit","Fireman"},parts={"TruckBed"}},
 {id="PickUpVanLightsPolice",script="vehicle_pickupvan_lights_police.txt",trailer=false,drivers={"Police"},parts={"TruckBed"}},
 {id="PickUpVanLightsRanger",script="vehicle_pickupvan_lights_ranger.txt",trailer=false,drivers={"Ranger"},parts={}},
 {id="PickUpVan_Camo",script="vehicle_pickupvan_camo.txt",trailer=false,drivers={},parts={}},
 {id="RaceCar12",script="vehicle_car_racecar12.txt",trailer=false,drivers={},parts={}},
 {id="RaceCar34",script="vehicle_car_racecar34.txt",trailer=false,drivers={},parts={}},
 {id="RaceCar58",script="vehicle_car_racecar58.txt",trailer=false,drivers={},parts={}},
 {id="SUV",script="vehicle_suv.txt",trailer=false,drivers={},parts={}},
 {id="SmallCar",script="vehicle_car_small.txt",trailer=false,drivers={},parts={}},
 {id="SmallCar02",script="vehicle_car_small02.txt",trailer=false,drivers={},parts={}},
 {id="SportsCar",script="vehicle_car_sports.txt",trailer=false,drivers={},parts={"TruckBed","TrunkDoor"}},
 {id="SportsCar_ez",script="vehicle_car_sports_ez.txt",trailer=false,drivers={},parts={"GloveBox","TruckBed","TrunkDoor"}},
 {id="StepVan",script="vehicle_stepvan.txt",trailer=false,drivers={},parts={}},
 {id="StepVanMail",script="vehicle_stepvan_mail.txt",trailer=false,drivers={"Postal"},parts={}},
 {id="Trailer",script="vehicle_trailer.txt",trailer=true,drivers={},parts={}},
 {id="TrailerAdvert",script="vehicle_trailer_advert.txt",trailer=true,drivers={},parts={}},
 {id="TrailerCover",script="vehicle_trailer_cover.txt",trailer=true,drivers={},parts={}},
 {id="Trailer_Horsebox",script="vehicle_trailer_horsebox.txt",trailer=true,drivers={"Farmer"},parts={}},
 {id="Trailer_Livestock",script="vehicle_trailer_livestock.txt",trailer=true,drivers={"Farmer"},parts={}},
 {id="Van",script="vehicle_van.txt",trailer=false,drivers={},parts={"TruckBed"}},
 {id="VanAmbulance",script="vehicle_van_ambulance.txt",trailer=false,drivers={"AmbulanceDriver"},parts={"TruckBed"}},
 {id="VanMail",script="vehicle_van_mail.txt",trailer=false,drivers={"Postal"},parts={"TruckBed"}},
 {id="VanSeats",script="vehicle_van_seats.txt",trailer=false,drivers={},parts={"TruckBed"}},
 {id="VanSeats_Creature",script="vehicle_van_seats_creature.txt",trailer=false,drivers={"Goth","Rocker","Punk"},parts={"TruckBed"}},
 {id="VanSeats_LadyDelighter",script="vehicle_van_seats_ladydelighter.txt",trailer=false,drivers={"Gaudy"},parts={"TruckBed"}},
 {id="VanSeats_Mural",script="vehicle_van_seats_mural.txt",trailer=false,drivers={},parts={"TruckBed"}},
 {id="VanSeats_Prison",script="vehicle_van_seats_prison.txt",trailer=false,drivers={"PrisonGuard"},parts={"TruckBed"}},
 {id="VanSeats_Space",script="vehicle_van_seats_space.txt",trailer=false,drivers={"Backpacker","Hobbyist","IT"},parts={"TruckBed"}},
 {id="VanSeats_Trippy",script="vehicle_van_seats_trippy.txt",trailer=false,drivers={"Backpacker","Grunge"},parts={"TruckBed"}},
 {id="VanSeats_Valkyrie",script="vehicle_van_seats_valkyrie.txt",trailer=false,drivers={"Redneck","Rocker","Veteran"},parts={"TruckBed"}},
}
local byId={}
for _,v in ipairs(M.vehicles) do byId[v.id]=v end
function M.count() return #M.vehicles end
function M.get(id)
    local v=type(id)=="string" and byId[id]
    if not v then return nil,"unknown vehicle" end
    return {id=v.id,script=v.script,trailer=v.trailer,drivers=v.drivers,parts=v.parts}
end
-- The kinds of person the game names across every vehicle, ordered.
function M.driverKinds()
    local seen,out={},{}
    for _,v in ipairs(M.vehicles) do
        for _,d in ipairs(v.drivers) do
            if not seen[d] then seen[d]=true; out[#out+1]=d end
        end
    end
    table.sort(out)
    return out
end
return M
