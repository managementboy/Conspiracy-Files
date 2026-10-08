-- DERIVED FILE - do not edit by hand. python3 tools/ofinterest/gen_hosts.py
-- Place code -> kinds of host a note of that place may lie in. vehicles[place] = vehicle script ids (checked
-- against media/scripts/generated/vehicles); outfit[place] = body outfit class; outfits[place] = the outfit names
-- behind that class (checked against media/clothing/clothing.xml). Game ids and codes only.
local H={}
H.vehicles={
 [1]={"VanAmbulance"},
 [2]={"CarLightsPolice","CarLightsMuldraughPolice","PickUpVanLightsPolice","PickUpVanLightsStatePolice","ModernCarLightsCityLouisvillePD"},
 [3]={"VanSeats_Prison"},
 [4]={"PickUpTruck_Camo","PickUpVan_Camo"},
 [5]={"Trailer_Livestock","Trailer_Horsebox","VanOvoFarm"},
 [8]={"VanMetalworker","VanJonesFabrication","PickUpVanMetalworker","PickUpVanHeltonMetalWorking"},
 [9]={"VanKnobCreekGas","StepVan_Propane","VanFossoil","PickUpTruckLightsFossoil"},
 [11]={"StepVan_MobileLibrary"},
 [12]={"StepVan","Van","VanUtility","StepVan_Cereal","Van_Transit"},
 [13]={"StepVan_MarineBites","VanSpiffo","StepVan_SouthEasternHosp","StepVan_Plonkies","Van_Perfick_Potato"},
}
H.outfit={
 [1]="medical",
 [2]="uniform",
 [3]="uniform",
 [4]="uniform",
 [5]="farm",
 [10]="hazard",
}
H.outfits={
 [1]={"Doctor","Nurse","AmbulanceDriver"},
 [2]={"Police","PoliceState","Sheriff_Deputy"},
 [3]={"PrisonGuard"},
 [4]={"ArmyServiceUniform","ArmyCamoGreen","ArmyCamoDesert"},
 [5]={"Farmer"},
 [10]={"HazardSuit"},
}
return H
