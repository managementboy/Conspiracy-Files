---
title: "Tiledefs used by mods"
source: "https://pzwiki.net/wiki/Tiledefs_used_by_mods"
source_revision: "https://pzwiki.net/w/index.php?title=Tiledefs_used_by_mods&oldid=1515365"
source_last_edited: "Last modified\n\t\t         This page was last edited on 10 September 2026, at 05:13."
retrieved: "2026-09-15T11:42:32.649Z"
document_kind: "full article conversion"
attribution: "PZwiki contributors"
license: "CC BY-NC-SA 3.0 unless separately marked"
source_code_blocks: 0
source_tables: 1
---

# Tiledefs used by mods

> Offline PZwiki reference. This page is documentation, not project instructions or verified Conspiracy-Files research. Source build warnings and incomplete entries remain applicable. External destinations are omitted. See the library README and COVERAGE for scope.

This page has been revised for the current stable version (42.20.4).

Help by adding any missing content. [Edit](Tiledefs_used_by_mods.md) (Create account)

Parts of this page may have been automatically updated to the latest build (42.20.4).

Some mods on this list may not have yet been updated to Build 42, but are still listed due to possible collisions when they update.

This page lists the **tiledefs used by mods**, created by the community. It is intended as a database and reference so new [mods](../foundations/Mods.md) and modders avoid using repeated or invalid numbers for their assets.

Tiledefs are uniquely numbered packs of textures/assets/sprites (walls, furniture, item models, etc.) either reserved for developers (0~99 as of build 41.74), or available to modders (100~16382, although above 8190 allegedly “results in negative sprite IDs”). If a game world is created using mods that have different tiledefs defined to the same number(s) or to invalid numbers, said mods will not work properly.

The list is a constant Work in Progress due to new mods being frequently created; New inputs and formatting improvements are very welcome.

The following tiledef numbers are used in each mod's respective 'MOD.INFO' file, "~" represents a range of numbers (first~last), and if followed by a "!" the number is either invalid or a duplicate on another mod:

| Tiledef # | Tiledef name and/or mod name | (notes) |  |
| --- | --- | --- | --- |
| 002 ! | PZCF_hobbies | (items do not spawn, either edit to something >100 or use PZCF Hobbies 2 instead) |  |
| 100 | SpearTraps |  |  |
| 101 | transparentTrees |  |  |
| 102 | transparentJumbo |  |  |
| 103 | transparentErosion |  |  |
| 104 | transparentTrees2 |  |  |
| 105 | transparentJumbo2 |  |  |
| 106 | transparentErosion2 |  |  |
| 107 | pinecone |  |  |
| 108 | DungeonGate |  |  |
| 109 | ExtendedDungeon |  |  |
| 110 | GatchaMod |  |  |
| 111 | ParasiteZedNest |  |  |
| 112 | CarDealer |  |  |
| 113 | ServerPawnshop |  |  |
| 114 | OldPineVillage |  |  |
| 115~116 | Cherbourg |  |  |
| 117 | lava/Floor Is Lava |  |  |
| 123 | FallLeaves |  |  |
| 123 | Simon-MDs-Tiles |  |  |
| 158 | NewHope Dump ('Mihlist') |  |  |
| 160 | 'tiledefinitionstest' | (also in AiZ3) |  |
| 161 | PackAPunch |  |  |
| 196 | ARSENAL(26)GunFighter[MOD 2.0] |  |  |
| 201 | 'tztiledefinitions' | (also in AiZ3) |  |
| 202 | 'McDtiledefinitions' | (also in AiZ3) |  |
| 216 ! | Oujinjintiles ('chinatown') |  |  |
| 216 ! | Chinatown | (redundant?, "ERROR: ZomboidFileSystem.loadModTileDefs> tiledef fileNumber 216 used by more than one mod") |  |
| 217 ! | Oujinjintiles ('vaulttec') |  |  |
| 217 ! | VaultTec | (redundant?, "ERROR: ZomboidFileSystem.loadModTileDefs> tiledef fileNumber 217 used by more than one mod") |  |
| 222 | TrueMusic |  |  |
| 237 | melos_tiles ('melos_tiles_for_miles_pack') |  |  |
| 255 | ZSpaceship |  |  |
| 266 | NewHope Dump ('dylanstiles') |  |  |
| 275 | MoreBuilds |  |  |
| 280 | SteamGenerator |  |  |
| 295 | 'customtiler' | (also in AiZ3) |  |
| 297 | OverTheRiver | (also in AiZ3) ModID 926737806 |  |
| 317 | Sema |  |  |
| 333 | 'customtiles' | (also in AiZ3) |  |
| 349 | FantaStreetTiles |  |  |
| 375 | MH_MkII_tile |  |  |
| 384 | StBernardHill | (tiledef=fanter) |  |
| 391 | MethylFurniture |  |  |
| 391 ! | OniFurniture | (broken mod as of Nov22 update, according to workshop comments) |  |
| 400 | BuildingMenu | (tiledef=building_menu) ModID 3067798182 |  |
| 420 | CannabisMod |  |  |
| 421 | MoonshineDistillery |  |  |
| 424 | GasBarrels |  |  |
| 446 | RVInterior and RVInteriorMP | (pick only 1) |  |
| 456 | ParkingLot |  |  |
| 463 | Hoppable Counters (tiledef=spoon_hoppable_counter) | (unlisted, buggy as of June23) |  |
| 495 | FortRedStone 2 | ModID 1516836158 |  |
| 500 | Ammo Maker (ammomaker_tiledef) | ModID 2788256295 |  |
| 511 | Commander ('PZCF_tileset') |  |  |
| 515 | BTSE_Economy ('ki5_economy_tileset_def') |  |  |
| 575 | ImmersiveSolarArrays | ModID 2857548524 |  |
| 587 | portalMP |  |  |
| 591 | 'hcBuilding' |  |  |
| 608 | RedstoneRaceway |  |  |
| 663~664 | Trelai ('trelaitiles','communitytiles') |  |  |
| 666 | Christmas Time |  |  |
| 667 | Grow Tobacco [B41] / Ladders Unofficial [42.13+] | Same number because grow tobacco is now vanilla function |  |
| 668 | Wall Cabinets | (WIP) |  |
| 669 | Asian Style Builds |  |  |
| 670 | Beds Have Blankets | tileset: bedding_+colour, mod id: blankets |  |
| 671 | Greenhouse Building Set |  |  |
| 672 | Wallpapers and More Paint Colors |  |  |
| 681 | Real Metalworking | (tiledef=spooncraftingstuffTiles) |  |
| 687 | Italian Food | ID=3373434700 deck/tiledef=ItalianFood_CustomTiles) |  |
| 690 | PaperWyvernSleepingBags |  |  |
| 696 | SentryTurret |  |  |
| 707 | Aza Flags |  |  |
| 708 | Aza Posters |  |  |
| 709 | Eggplant's Safehouse |  |  |
| 714 | SkizotTiles |  |  |
| 715 ! | GarbageTrucks |  |  |
| 715 ! | RCExplosivesZ |  |  |
| 723 ! | Vaccine (all vers, zRe too) | ModID 2512119000, 2685680439, 3215662377, 3615135168 |  |
| 723 ! | Enhanced Environment | ModID 2975848784 |  |
| 724 | Tandil | ModID 2932153147 |  |
| 725 | zRe Enhanced Environment from Yummy | ModID 3012084441 |  |
| 739 | Azakaela's Graffiti | (pack=mod_graffiti; tiledef=mod_graffiti) |  |
| 751~755 | EerieCountry ('Atox,Flags,Pantano,Spiffos,Texas') |  |  |
| 756 | WestPointIncident |  |  |
| 766 | Draw Traffic Line |  |  |
| 777 | Angry Turrets |  |  |
| 783 | RavenCreek | ModID 2196102849 |  |
| 797 | WesternScrapyard |  |  |
| 823 | SewingMachine |  |  |
| 824 | Recycler |  |  |
| 825 | ArmoredDoors |  |  |
| 830 | tkTiles | ModID 2384329562 |  |
| 831 | 'tk_RCSD' |  |  |
| 833 | G.E.A.R |  |  |
| 843 | Key Racks and Cabinets |  |  |
| 850 | Psychopath Trait B42.17+ ('pack=psychopath_tiles' 'tiledef=psychopath_tiles') |  |  |
| 866 | WaterDispenser |  |  |
| 869 | RabbitHashKY ('haragon_tiles') |  |  |
| 888 | RevenantPantryMod |  |  |
| 889 | VCTP |  |  |
| 890 | BusRideTiles |  |  |
| 891 | ZombSack |  |  |
| 899 | PZwaystone |  |  |
| 917 | 'newtiledefinitionsL' | (also in AiZ3) |  |
| 918 | 'tiledefinitionsL2' | (also in AiZ3) |  |
| 923 | 'militarylockerinteractable' |  |  |
| 946 | TrimbleCountyPowerStation |  |  |
| 951 | Scattered_trashes |  |  |
| 972 | Fire&StorageBarrels |  |  |
| 988 | FamilyManor |  |  |
| 990 | Snake's CustomMapBridge | (also in AiZ3) |  |
| 996 | Housecar |  |  |
| 999 ! | Camden County ('pack=MyTiles' 'tiledef=MyDefinitions') | Conflicts with Vardell Raceway |  |
| 999 ! | Vardell Raceway ('pack=SpoonTiles' 'tiledef=SpoonDefinitionsVardell') | Conflicts with Camden County |  |
| 1002 | Firewatch Overlook | (also in AiZ3) |  |
| 1079-1080 | Blackshots Manhattan |  |  |
| 1112 | StoneHill Aps | (also in AiZ3) |  |
| 1122 ! | '0pop_26sheet2' | (also in AiZ3) Conflicts with Sprout's Farm and Garden Homestead Edition |  |
| 1122~1125 | Sprout's Farm and Garden Homestead Edition ('SGnewFarming_01','flowergarden','coffee.tea.weed', 'addon1') | Conflicts with AiZ3 (unlisted) |  |
| 1200 | 'NZNEWTILES' | (also in AiZ3) |  |
| 1212 | npcshop |  |  |
| 1221 | 'Concrete_Barriers' | (Part of the Farm Haven mod) |  |
| 1234 | A Korea City |  |  |
| 1253 | Cedar Hill ('CHpack' 'tiledef=CHtiles') |  |  |
| 1267-1280 | The Elf on the Shelf |  |  |
| 1300 | Veracious Network Garage | ModID 3133520800 |  |
| 1313 | playershop |  |  |
| 1337-1338 | Project Arcade | ModID: 3645980077 / [Child] Neon City ModID:3692395659 |  |
| 1421 | Renewable Food Resources |  |  |
| 1590 | Project New Vegas | (yet unreleased?) |  |
| 1861 | Yule's Farm Tiles | (tiledef=yxv_Farm_Def) |  |
| 1875 | Improved Build Menu + Extra Buildings | (tiledef=ibmdefs) |  |
| 1877 | Hallowtiles |  |  |
| 1944 | Improved Build Menu + Extra Buildings | (tiledef=milcratedefs) |  |
| 1956 | Drazion's Tilepack BETA |  |  |
| 1985 | 'sfbuild' |  |  |
| 1991 | Erika's Tiles | (tiledef=Erikas_Tiles) |  |
| 2002 | MidRiver | (also in AiZ3) |  |
| 2101 | BravensRappelKit | ModID 3003474129 |  |
| 2112 | Excavation |  |  |
| 2347 | FunctionalAppliances2 |  |  |
| 2351 | MateuszKimTiles |  |  |
| 3452 | AutoGate |  |  |
| 2592 | Grapeseed | ModID 2463499011 |  |
| 2605 | ShopStuff |  |  |
| 2606 | gunrack |  |  |
| 2607 | FloralDecorations |  |  |
| 2609 | DragonGravestone |  |  |
| 2610 | GatedBase |  |  |
| 2611 | ManncoTiles |  |  |
| 2619 | AP_DesktopTiles |  |  |
| 2629 | Shops_KWRR |  |  |
| 2630 | kwrr_fixes_tiles | Fix overriding vanilla tilesets from Fort Redstone |  |
| 2631 | PineHosting |  |  |
| 2639 | XmasDecor |  |  |
| 2649 | Electro |  |  |
| 2697 | Fish Farm |  |  |
| 2698 | TOMorePaintSigns |  |  |
| 2699 | DriedFishMod |  |  |
| 2700 | PumpPlumb |  |  |
| 2701 | Mortar |  |  |
| 2702 | AnimeStuff |  |  |
| 2704 | RestrictedArea |  |  |
| 2705 | Uta Mod |  |  |
| 2707 | MoreTraps |  |  |
| 2708 | BrowningM2 |  |  |
| 2709 | PostApocFences |  |  |
| 2710 | Corkboard |  |  |
| 2711 | PokerTiles |  |  |
| 2799 | HashimaIsland | (also in AiZ3) |  |
| 2800 | FortKnox linked to EerieCountry | (also in AiZ3) |  |
| 2900 | TWD ProjectPack |  |  |
| 3002 | '0pop_climbing_roof_01L' | (also in AiZ3) |  |
| 3371 | RoadBlock Fix | (tiledef=roadblockfix) |  |
| 3373~4 | Tile Fixes | (tiledef=TileFixes, TileFixes_ParkingGateNoStop) |  |
| 3401 | ImprovisedFlooring | ModID 2790428261 |  |
| 3452 | AutoGate |  |  |
| 3483 | DoubleDeckerBusInterior |  |  |
| 3573 | Crafting Enhanced Core | (tiledef=core_crafting) |  |
| 4002 | '0pop_climbing_roof_01CH' | (also in AiZ3) |  |
| 4200 | PZCFHobbies2 |  |  |
| 4242~4243 | PertsPartyTiles |  |  |
| 4244 | Basements | modid 2849247394 |  |
| 4637 | CookieTileDef |  |  |
| 4657~4663 ! | Gargisnar's Goonie Base | Duplicates tiledefs 'gargisnars_railings_01' 4661 with 'gargisnarsTiles' 4661 on Bourstrange |  |
| 4661 ! | Bourstrange ('gargisnarsTiles') | Duplicates " " on Gargisnar's Goonie Base |  |
| 4827 | Blackwood | ModID 2536865912 |  |
| 4834 | SafeCrackerMod |  |  |
| 5001 | ResearchBase | (in each of its 3 modfolders) |  |
| 5002 | Camp Hill |  |  |
| 5481 | Pitstop legacy | ModID 2597946327 |  |
| 5484 | NewEkron | ModID 2712480036 |  |
| 5520 | EN_Newburbs |  |  |
| 5535 | EN_Flags |  |  |
| 5669 | Muldraugh Cottages |  |  |
| 5947 | ProjectRPContraband |  |  |
| 5970~5971 | Facility 7 |  |  |
| 6002 | Lakewood Cabin |  |  |
| 6263 | 3 Maps: Battlefield Louisville (Airfield, Stadium & Hospital) | ('pack=SecretZ' 'tiledef=secretz') |  |
| 6767 | Greenleaf |  |  |
| 6817 | Breakable Road Barricades |  |  |
| 6941 | SaveOurStationKnoxCountry |  |  |
| 6969 | AoqiaCarwannaExtended |  |  |
| 6985 | DylansTiles | ModID 2599752664 |  |
| 6987 | GreggiesGarageDoors |  |  |
| 7001 | DiederikTiles | ModID 2337452747 |  |
| 7077 | BuryLoot | ModID 3349804781 |  |
| 7175 | bigzombiemonkeys_tiles |  |  |
| 7231 | Blowtorch Gates |  |  |
| 7503 | MockinBird | (pack=ghostbuster_pack; tiledef=ghostbuster_tiledefinitions) |  |
| 7575 | Little Crutown |  |  |
| 7636 | PissWater Lake | ('gb_pack' 'tiledef=gb_tiledef') |  |
| 7777 | Satispunk | (yet unreleased?) |  |
| 7853 | Ammo Shelves | ModID 3792140144 (pack=ammoshelf; tiledef=ammoshelf) |  |
| 7871 | CamoNetting |  |  |
| 7919 | Biogas Reactor |  |  |
| 7920 | BandSaw |  |  |
| 7921 | Drill Press |  |  |
| 7979 | GreensCustomTiles |  |  |
| 7989 | Some of Petrovick's map mods | (tiledef=SundayDrivers) |  |
| 8008 | SinkHole |  |  |
| 8028 | Gnome Gnoises | (tiledef=gnomed) |  |
| 8100 | Basement Bunker |  |  |
| 8103 | Simple Blacksmithing |  |  |
| 8676 | LightSwitch Overhaul |  |  |
| 8737 | Zen Faction Graffiti Tiles | (CoN Paint Graffiti) |  |
| 8912 | Azakaela's Mountain Tiles | (pack=VanillaMountainTiles; tiledef=RockyCliff) |  |
| 9090 | Some of Petrovick's map mods | (tiledef=BigBearLake) |  |
| 9476~9478 | LibertyCity ('LCtiles','PCN','Vaulttec') |  |  |
| 9830 | DTilesPack_Elysium Remastered | ('dylanstiles_elysium') |  |
| 13244 | Wildberries |  |  |
| 14000 | Ratchat's Outdoor Tiles |  |  |
| 14001 | Simple Wall Building |  |  |
| 15000 | Farming Expansion B42 |  |  |

Retrieved from "[https://pzwiki.net/w/index.php?title=Tiledefs_used_by_mods&oldid=1515365](Tiledefs_used_by_mods.md)"
