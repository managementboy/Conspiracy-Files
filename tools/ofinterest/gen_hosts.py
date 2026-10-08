#!/usr/bin/env python3
"""Generate mod-ofinterest/.../OIShared/Generated/HostTypes.lua: which kind of VEHICLE or BODY may carry a note
of each place code (OF_INTEREST_CODES.md). Every vehicle script id is checked to exist in the installed game's
media/scripts/generated/vehicles/**.txt, every outfit name in media/clothing/clothing.xml; a missing one stops
the script. NUMBERS AND GAME IDS ONLY.
Usage: python3 tools/ofinterest/gen_hosts.py [--check]"""
import glob, os, re, sys
REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
PZ = os.environ.get("PZ_HOME") or os.path.expanduser("~/.steam/debian-installation/steamapps/common/ProjectZomboid/projectzomboid")
OUT = os.path.join(REPO, "mod-ofinterest/common/media/lua/shared/OIShared/Generated/HostTypes.lua")
# place code -> vehicle script ids (the vehicle's own purpose: ambulance, police car, prison van, camo truck ...)
VEHICLES = {
    1: ["VanAmbulance"],
    2: ["CarLightsPolice", "CarLightsMuldraughPolice", "PickUpVanLightsPolice", "PickUpVanLightsStatePolice", "ModernCarLightsCityLouisvillePD"],
    3: ["VanSeats_Prison"],
    4: ["PickUpTruck_Camo", "PickUpVan_Camo"],
    5: ["Trailer_Livestock", "Trailer_Horsebox", "VanOvoFarm"],
    8: ["VanMetalworker", "VanJonesFabrication", "PickUpVanMetalworker", "PickUpVanHeltonMetalWorking"],
    9: ["VanKnobCreekGas", "StepVan_Propane", "VanFossoil", "PickUpTruckLightsFossoil"],
    11: ["StepVan_MobileLibrary"],
    12: ["StepVan", "Van", "VanUtility", "StepVan_Cereal", "Van_Transit"],
    13: ["StepVan_MarineBites", "VanSpiffo", "StepVan_SouthEasternHosp", "StepVan_Plonkies", "Van_Perfick_Potato"],
}
# place code -> outfit class (the mod's BodyOutfitObservations classes) and the outfit names behind it
OUTFITS = {
    1: ("medical", ["Doctor", "Nurse", "AmbulanceDriver"]),
    2: ("uniform", ["Police", "PoliceState", "Sheriff_Deputy"]),
    3: ("uniform", ["PrisonGuard"]),
    4: ("uniform", ["ArmyServiceUniform", "ArmyCamoGreen", "ArmyCamoDesert"]),
    5: ("farm", ["Farmer"]),
    10: ("hazard", ["HazardSuit"]),
}
def main():
    text = ""
    for f in glob.glob(PZ + "/media/scripts/generated/vehicles/**/*.txt", recursive=True):
        text += open(f, encoding="utf-8", errors="replace").read()
    have = set(re.findall(r"^\s*vehicle\s+([A-Za-z0-9_]+)", text, re.M))
    clothing = open(PZ + "/media/clothing/clothing.xml", encoding="utf-8", errors="replace").read()
    outfits = set(re.findall(r"<m_Name>([A-Za-z0-9_]+)</m_Name>", clothing))
    for p, l in VEHICLES.items():
        for v in l:
            if v not in have: sys.exit("vehicle script not in the installed game: %s (place %d)" % (v, p))
    for p, (c, l) in OUTFITS.items():
        for o in l:
            if o not in outfits: sys.exit("outfit not in the installed game: %s (place %d)" % (o, p))
    out = ["-- DERIVED FILE - do not edit by hand. python3 tools/ofinterest/gen_hosts.py",
           "-- Place code -> kinds of host a note of that place may lie in. vehicles[place] = vehicle script ids (checked",
           "-- against media/scripts/generated/vehicles); outfit[place] = body outfit class; outfits[place] = the outfit names",
           "-- behind that class (checked against media/clothing/clothing.xml). Game ids and codes only.",
           "local H={}", "H.vehicles={"]
    for p in sorted(VEHICLES): out.append(" [%d]={%s}," % (p, ",".join('"%s"' % v for v in VEHICLES[p])))
    out.append("}\nH.outfit={")
    for p in sorted(OUTFITS): out.append(' [%d]="%s",' % (p, OUTFITS[p][0]))
    out.append("}\nH.outfits={")
    for p in sorted(OUTFITS): out.append(" [%d]={%s}," % (p, ",".join('"%s"' % v for v in OUTFITS[p][1])))
    out.append("}\nreturn H\n")
    s = "\n".join(out)
    if "--check" in sys.argv: sys.exit(0 if open(OUT).read() == s else 1)
    open(OUT, "w").write(s)
    print("wrote HostTypes: %d vehicle places, %d outfit places" % (len(VEHICLES), len(OUTFITS)))
main()
