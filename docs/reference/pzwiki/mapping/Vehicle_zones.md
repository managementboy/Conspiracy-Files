---
title: "Vehicle zones"
source: "https://pzwiki.net/wiki/Vehicle_zones"
source_revision: "https://pzwiki.net/w/index.php?title=Vehicle_zones&oldid=1446933"
source_last_edited: "Last modified\n\t\t         This page was last edited on 3 August 2026, at 15:53."
retrieved: "2026-09-15T11:39:42.565Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 1
---

# Vehicle zones

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.0).

Help by adding any missing content. [Edit](Vehicle_zones.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

<a id="Vehicle_Zones"></a>

## Vehicle Zones

In order for your map to properly spawn vehicles, you need to add object zones that are multiples of size 5x3 (5x6, 10x3, 3x5, etc.), is of the type **ParkingStall**, and is named one of the following:

| Name | Description |
| --- | --- |
| parkingstall | Parking Stall, common parking stalls with random cars. Commonly found in parking lots and at some houses. Can spawn indoors. |
| trailerpark | Trailer Parks, have a small chance to spawn burnt cars, vehicles face in a random 360 degree direction, usually created as large, rectangular zones, not used regularly for all trailer parks. Has a small chance to spawn cars on top of other cars, but this is not functional. |
| bad | Bad vehicles, mostly used in poor areas, trailer and mobile home driveways, in some mechanic garages, etc. This zone can spawn the camo truck variant. Can spawn indoors. |
| medium | Medium vehicles, used in some of the good looking area or in suburbs. Can spawn indoors. |
| good | Good vehicles, used in very good looking areas, they're meant to spawn only the best of the good cars, so they're only used at good looking houses. Can spawn indoors. |
| luxuryDealership | Unused, contains the exact same vehicles table as "good". Will probably spawn indoors as displays. |
| sport | Sports vehicles, sometimes in good looking area, sometimes around bars, the zone itself is rarely used. Can spawn indoors. |
| junkyard | Junkyard vehicles, spawn damaged & burnt, less chance of finding keys but more cars. Commonly found in junkyards and around the Brandenburg tornado-torn area of the map. Also used for vehicle stories. Can spawn indoors. |
| trafficjamw / trafficjame / trafficjams / trafficjamn | Traffic jams by cardinal direction, spawn slightly more diagonal to completely sideways, mostly burnt car & damaged. Used either for hard coded big traffic jam or smaller random ones. |
| rtrafficjamw / rtrafficjame / rtrafficjams / rtrafficjamn | Pulls vehicles from their normal non-r-prefix counterpart, trafficjam(w/e/s/n). Usually spawn in as rare small groups of vehicles rather than filling the entire zone with traffic jammed vehicles. |
| police | Police department vehicles. Commonly found outside of police stations. Is a special vehicle zone. Can spawn indoors. |
| prison | Prison vehicles, same vehicles table as "police", but with different spawn chances for each vehicle. Commonly found all over the Kentucky State Penitentiary in Rosewood or at the Brandenburg Detention Center. |
| fire | Fire department vehicles. Commonly found outside of fire stations. Is a special vehicle zone. |
| ranger | Ranger vehicles. Commonly found around more woody area parking lots with dirt trails. |
| mccoy | McCoy branded vehicles. Commonly found at some of McCoy's lumber yards / processing plants, such as their main location in Muldraugh or at some construction sites. |
| carpenter | Carpenter vehicles. Rarely used at some construction sites. Can spawn indoors. |
| postal | U.S. Mail Service branded vehicles. Commonly found around U.S. Mail Service locations. |
| spiffo | Spiffo branded vehicle and trailer. Commonly used around Spiffo's restaurants. |
| ambulance | Ambulance vehicles. Commonly found outside medical-based locations. Can spawn indoors. Is a special vehicle zone. |
| radio | LBMW branded vehicles and a LBMW branded trailer. Commonly used as the main radio vehicle zone, despite the fact that is is only contains LBMW. |
| fossoil | Fossoil branded vehicles. Commonly used around Fossoil branded gas stations. |
| scarlet | Scarlet Oak Distillery branded vehicles. Commonly used in front Scarlet Oak Distillery. |
| massgenfac | Mass-Genfac Co. branded vehicles. Commonly used next next to their many warehouse and factory buildings. |
| transit | KY Transit branded vehicles. Commonly used next to the KY Transit building. |
| network3 | News Now Network (Triple-N / NNN) branded vehicles. Commonly used next to the News Now Network studio. |
| kyheralds | Kentucky Herald branded vehicles. Commonly used in front of The Kentucky Herald building. |
| lectromax | Lectromax Manufacturing branded vehicles. Commonly used around the Lectromax Manufacturing factory and at some power stations. |
| knoxdisti | Knox Distillery branded vehicles. Commonly used behind the Knox Distillery. |
| advertising | Advertising trailers. Commonly used in Rosewood. |
| airportshuttle | People transportation vehicles such as an airport shuttle van or a taxi. Commonly found at the Louisville International Airport and its associated hotels. Double the default zone spawn rate. |
| airportservice | Airport service vehicles such as security, shuttles, mechanics, catering, etc. Commonly found around the Louisville International Airport. Double the default zone spawn rate. |
| farm | Farm vehicles, commonly found at farm related locations, mostly at Brott Cattle Farm. It is the only dedicated zone for spawning trailers. This zone can spawn the camo truck variant. Double the default zone spawn rate. Can spawn indoors. |
| business business(1-12) | Business vehicles. Not used as a normal vehicle zone to be placed, instead it relies on its special car tag property and chance to spawn special property of other zones. Each business number is a duplicate of the original, the purpose of this is to increase the odds of a business vehicle spawning over other special vehicles. |
| burnt / normalburnt / specialburnt | When spawning burnt vehicles for any zones, 20% will be pick in special burnt vehicles and 80% in the normal burnt vehicles list. The "burnt" zone itself can be used to spawn a burnt vehicle specifically. |
| trades | Vehicles for bluecollar manual trades workers. For vehicle stories only. |
| delivery | Delivery workers including caterers. For vehicle stories only. |
| professional | Vehicles for well-off white collar workers. For vehicle stories only. |
| middleClass | Vehicles for middle-class workers. For vehicle stories only. |
| struggling | Vehicles for lower income workers and student. For vehicle stories only. |
| evacuee | Evacuating family style vehicles. For vehicle stories only. |
| racecar | For race car vehicles. Commonly found at the Irvington Speedway or at Valley Station's Drag Racing Strip. Each of the race cars are 'unique' and can only spawn once per world, any other spawn attempt will use a burnt script variant instead (which is the only 'vehicle' in the racecar vehicles table to begin with, the process of spawning the race cars is different because they are unique and can only be spawned once). To add your own unique race car that can only spawn once, insert your vehicle script (e.g., "Base.MyCarThatGoesVroooom") into the ProfessionVehicles.UniqueVehicles and ProfessionVehicles.RaceCarBurnt["General"] tables in your server folder. Do keep in mind this does not guarantee the vehicle will spawn in one of the racecar zones, the vehicle could just never spawn in the world because there aren't a lot of these zones, and more vehicles in the list would increase that rarity per vehicle. |

<a id="See_also"></a>

## See also

- [Mapping](Mapping.md)
- [Room definitions and item spawns](Room_definitions_and_item_spawns.md)

Retrieved from "[https://pzwiki.net/w/index.php?title=Vehicle_zones&oldid=1446933](Vehicle_zones.md)"
