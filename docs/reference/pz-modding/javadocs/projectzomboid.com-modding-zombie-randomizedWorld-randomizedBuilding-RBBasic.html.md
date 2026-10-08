[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.randomizedWorld.randomizedBuilding](package-summary.html)
2. [RBBasic](RBBasic.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [specificProfessionDistribution](#specificProfessionDistribution)
   2. [specificProfessionRoomDistribution](#specificProfessionRoomDistribution)
   3. [plankStash](#plankStash)
   4. [deadSurvivorsStory](#deadSurvivorsStory)
   5. [totalChanceRds](#totalChanceRds)
   6. [rdsMap](#rdsMap)
   7. [uniqueRDSSpawned](#uniqueRDSSpawned)
   8. [tablesDone](#tablesDone)
   9. [doneTable](#doneTable)
   10. [s\_clutterCopyPool](#s_clutterCopyPool)
   11. [TABLE\_STORY\_CHANCE](#TABLE_STORY_CHANCE)
7. [Constructor Details](#constructor-detail)
   1. [RBBasic()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [randomizeBuilding(BuildingDef)](#randomizeBuilding(zombie.iso.BuildingDef))
   2. [forceVehicleDistribution(BaseVehicle, String)](#forceVehicleDistribution(zombie.vehicles.BaseVehicle,java.lang.String))
   3. [randomizeContainer(VehiclePart, ItemPickerJava.ItemPickerRoom)](#randomizeContainer(zombie.vehicles.VehiclePart,zombie.inventory.ItemPickerJava.ItemPickerRoom))
   4. [doLivingRoomStuff(IsoGridSquare)](#doLivingRoomStuff(zombie.iso.IsoGridSquare))
   5. [doLivingRoomStuff(IsoGridSquare, ArrayList)](#doLivingRoomStuff(zombie.iso.IsoGridSquare,java.util.ArrayList))
   6. [doBedroomStuff(IsoGridSquare)](#doBedroomStuff(zombie.iso.IsoGridSquare))
   7. [doKidsBedroomStuff(IsoGridSquare)](#doKidsBedroomStuff(zombie.iso.IsoGridSquare))
   8. [doKitchenStuff(IsoGridSquare)](#doKitchenStuff(zombie.iso.IsoGridSquare))
   9. [doKitchenStuff(IsoGridSquare, TIntObjectHashMap, TIntObjectHashMap, TIntObjectHashMap)](#doKitchenStuff(zombie.iso.IsoGridSquare,gnu.trove.map.hash.TIntObjectHashMap,gnu.trove.map.hash.TIntObjectHashMap,gnu.trove.map.hash.TIntObjectHashMap))
   10. [doBathroomStuff(IsoGridSquare)](#doBathroomStuff(zombie.iso.IsoGridSquare))
   11. [doBathroomStuff(IsoGridSquare, TIntObjectHashMap)](#doBathroomStuff(zombie.iso.IsoGridSquare,gnu.trove.map.hash.TIntObjectHashMap))
   12. [generateKitchenStoveClutter(IsoDirections, IsoObject, IsoGridSquare)](#generateKitchenStoveClutter(zombie.iso.IsoDirections,zombie.iso.IsoObject,zombie.iso.IsoGridSquare))
   13. [generateKitchenStoveClutter(IsoDirections, IsoObject, IsoGridSquare, TIntObjectHashMap)](#generateKitchenStoveClutter(zombie.iso.IsoDirections,zombie.iso.IsoObject,zombie.iso.IsoGridSquare,gnu.trove.map.hash.TIntObjectHashMap))
   14. [generateCounterClutter(IsoDirections, IsoObject, IsoGridSquare, TIntObjectHashMap)](#generateCounterClutter(zombie.iso.IsoDirections,zombie.iso.IsoObject,zombie.iso.IsoGridSquare,gnu.trove.map.hash.TIntObjectHashMap))
   15. [generateSinkClutter(IsoDirections, IsoObject, IsoGridSquare, TIntObjectHashMap)](#generateSinkClutter(zombie.iso.IsoDirections,zombie.iso.IsoObject,zombie.iso.IsoGridSquare,gnu.trove.map.hash.TIntObjectHashMap))
   16. [getFacing(IsoSprite)](#getFacing(zombie.iso.sprite.IsoSprite))
   17. [checkForTableSpawn(BuildingDef, IsoObject)](#checkForTableSpawn(zombie.iso.BuildingDef,zombie.iso.IsoObject))
   18. [checkForTable(IsoGridSquare, IsoObject)](#checkForTable(zombie.iso.IsoGridSquare,zombie.iso.IsoObject))
   19. [doProfessionStory(BuildingDef, String)](#doProfessionStory(zombie.iso.BuildingDef,java.lang.String))
   20. [addRandomDeadSurvivorStory(BuildingDef)](#addRandomDeadSurvivorStory(zombie.iso.BuildingDef))
   21. [initRDSMap(BuildingDef)](#initRDSMap(zombie.iso.BuildingDef))
   22. [doRandomDeadSurvivorStory(BuildingDef, RandomizedDeadSurvivorBase)](#doRandomDeadSurvivorStory(zombie.iso.BuildingDef,zombie.randomizedWorld.randomizedDeadSurvivor.RandomizedDeadSurvivorBase))
   23. [getSurvivorStories()](#getSurvivorStories())
   24. [getSurvivorProfession()](#getSurvivorProfession())
   25. [getUniqueRDSSpawned()](#getUniqueRDSSpawned())
   26. [doProfessionBuilding(BuildingDef, String, ItemPickerJava.ItemPickerRoom)](#doProfessionBuilding(zombie.iso.BuildingDef,java.lang.String,zombie.inventory.ItemPickerJava.ItemPickerRoom))
   27. [doOfficeStuff(IsoGridSquare)](#doOfficeStuff(zombie.iso.IsoGridSquare))
   28. [doNolansOfficeStuff(IsoGridSquare)](#doNolansOfficeStuff(zombie.iso.IsoGridSquare))
   29. [doCafeStuff(IsoGridSquare)](#doCafeStuff(zombie.iso.IsoGridSquare))
   30. [doGigamartStuff(IsoGridSquare)](#doGigamartStuff(zombie.iso.IsoGridSquare))
   31. [doGroceryStuff(IsoGridSquare)](#doGroceryStuff(zombie.iso.IsoGridSquare))
   32. [doGeneralRoom(IsoGridSquare, ArrayList)](#doGeneralRoom(zombie.iso.IsoGridSquare,java.util.ArrayList))
   33. [doLaundryStuff(IsoGridSquare)](#doLaundryStuff(zombie.iso.IsoGridSquare))
   34. [doJudgeStuff(IsoGridSquare)](#doJudgeStuff(zombie.iso.IsoGridSquare))
   35. [doTwiggyStuff(IsoGridSquare)](#doTwiggyStuff(zombie.iso.IsoGridSquare))
   36. [doWoodcraftStuff(IsoGridSquare)](#doWoodcraftStuff(zombie.iso.IsoGridSquare))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RBBasic
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.randomizedWorld.RandomizedWorldBase](../RandomizedWorldBase.html "class in zombie.randomizedWorld")

[zombie.randomizedWorld.randomizedBuilding.RandomizedBuildingBase](RandomizedBuildingBase.html "class in zombie.randomizedWorld.randomizedBuilding")

zombie.randomizedWorld.randomizedBuilding.RBBasic

---

public final class RBBasic
extends [RandomizedBuildingBase](RandomizedBuildingBase.html "class in zombie.randomizedWorld.randomizedBuilding")

This is a basic randomized building, some inside door will be opened, can
have profession specific loots and cold cooked food in stove Also this type
of house can have specific dead survivor/zombies/story inside them

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [RandomizedBuildingBase](RandomizedBuildingBase.html#nested-class-summary "class in zombie.randomizedWorld.randomizedBuilding")

  `RandomizedBuildingBase.HumanCorpse`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<RandomizedDeadSurvivorBase>`

  `deadSurvivorsStory`

  `private boolean`

  `doneTable`

  `private final Map<String,String>`

  `plankStash`

  `private static final HashMap<RandomizedDeadSurvivorBase, Integer>`

  `rdsMap`

  `private static final zombie.popman.ObjectPool<gnu.trove.map.hash.TIntObjectHashMap<String>>`

  `s_clutterCopyPool`

  `private final ArrayList<String>`

  `specificProfessionDistribution`

  `private final Map<String,String>`

  `specificProfessionRoomDistribution`

  `private static final int`

  `TABLE_STORY_CHANCE`

  `private ArrayList<IsoObject>`

  `tablesDone`

  `private int`

  `totalChanceRds`

  `private static final ArrayList<String>`

  `uniqueRDSSpawned`

  ### Fields inherited from class [RandomizedBuildingBase](RandomizedBuildingBase.html#field-summary "class in zombie.randomizedWorld.randomizedBuilding")

  `KBBuildingX, KBBuildingY, maximumRoomCount`

  ### Fields inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#field-summary "class in zombie.randomizedWorld")

  `debugLine, isRat, maximumDays, minimumDays, minimumRooms, name, reallyAlwaysForce, unique`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RBBasic()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addRandomDeadSurvivorStory(BuildingDef def)`

  `private IsoObject`

  `checkForTable(IsoGridSquare sq,
  IsoObject table1)`

  `private void`

  `checkForTableSpawn(BuildingDef def,
  IsoObject table1)`

  Add random objects on the dinner/kitchen table to create a story in basic homes

  `private void`

  `doBathroomStuff(IsoGridSquare sq)`

  `private void`

  `doBathroomStuff(IsoGridSquare sq,
  gnu.trove.map.hash.TIntObjectHashMap<String> sinkClutter)`

  `private void`

  `doBedroomStuff(IsoGridSquare sq)`

  `static void`

  `doCafeStuff(IsoGridSquare sq)`

  `static void`

  `doGeneralRoom(IsoGridSquare sq,
  ArrayList<String> clutter)`

  `static void`

  `doGigamartStuff(IsoGridSquare sq)`

  `static void`

  `doGroceryStuff(IsoGridSquare sq)`

  `static void`

  `doJudgeStuff(IsoGridSquare sq)`

  `private void`

  `doKidsBedroomStuff(IsoGridSquare sq)`

  `private void`

  `doKitchenStuff(IsoGridSquare sq)`

  `private void`

  `doKitchenStuff(IsoGridSquare sq,
  gnu.trove.map.hash.TIntObjectHashMap<String> counterClutter,
  gnu.trove.map.hash.TIntObjectHashMap<String> sinkClutter,
  gnu.trove.map.hash.TIntObjectHashMap<String> stoveClutter)`

  `private void`

  `doLaundryStuff(IsoGridSquare sq)`

  `private void`

  `doLivingRoomStuff(IsoGridSquare sq)`

  `private void`

  `doLivingRoomStuff(IsoGridSquare sq,
  ArrayList<String> clutterArray)`

  `static void`

  `doNolansOfficeStuff(IsoGridSquare sq)`

  `static void`

  `doOfficeStuff(IsoGridSquare sq)`

  `void`

  `doProfessionBuilding(BuildingDef def,
  String professionChoosed,
  ItemPickerJava.ItemPickerRoom prof)`

  `void`

  `doProfessionStory(BuildingDef def,
  String professionChoosed)`

  `void`

  `doRandomDeadSurvivorStory(BuildingDef buildingDef,
  RandomizedDeadSurvivorBase dsDef)`

  `static void`

  `doTwiggyStuff(IsoGridSquare sq)`

  `static void`

  `doWoodcraftStuff(IsoGridSquare sq)`

  `void`

  `forceVehicleDistribution(BaseVehicle vehicle,
  String distribution)`

  `private void`

  `generateCounterClutter(IsoDirections facing,
  IsoObject obj,
  IsoGridSquare sq,
  gnu.trove.map.hash.TIntObjectHashMap<String> itemMap)`

  `private void`

  `generateKitchenStoveClutter(IsoDirections facing,
  IsoObject obj,
  IsoGridSquare sq)`

  `private void`

  `generateKitchenStoveClutter(IsoDirections facing,
  IsoObject obj,
  IsoGridSquare sq,
  gnu.trove.map.hash.TIntObjectHashMap<String> stoveClutter)`

  `private void`

  `generateSinkClutter(IsoDirections facing,
  IsoObject obj,
  IsoGridSquare sq,
  gnu.trove.map.hash.TIntObjectHashMap<String> itemMap)`

  `private IsoDirections`

  `getFacing(IsoSprite sprite)`

  `ArrayList<String>`

  `getSurvivorProfession()`

  `ArrayList<RandomizedDeadSurvivorBase>`

  `getSurvivorStories()`

  `static ArrayList<String>`

  `getUniqueRDSSpawned()`

  `private void`

  `initRDSMap(BuildingDef def)`

  `void`

  `randomizeBuilding(BuildingDef def)`

  `private void`

  `randomizeContainer(VehiclePart part,
  ItemPickerJava.ItemPickerRoom distro2)`

  ### Methods inherited from class [RandomizedBuildingBase](RandomizedBuildingBase.html#method-summary "class in zombie.randomizedWorld.randomizedBuilding")

  `addBarricade, addClip, addRandomRangedWeapon, addWorldItem, addWorldItem, addWorldItem, addWorldItem, addWorldItem, addZombies, addZombiesOnSquare, ChunkLoaded, doAmmoCans, doBodyArmor, doCornerAmmoCans, doCounterAmmoDisplay, doGunShelfHandguns, doGunShelfRifles, doHandgunCounterDisplay, doRifleCounterDisplay, getBuildingObjects, getBuildingObjectsSimple, getBuildingSquares, getChance, getChance, getDoor, getMinimumDays, getMinimumRooms, getRectSquares, getWindow, init, initAllRBMapChance, isAlwaysDo, isTableFor3DItems, isValid, removeAllZombies, setAlwaysDo, setChance, setMinimumDays, setMinimumRooms, setWorldRotation, spawnBodyArmor, spawnItemsInContainers, spawnPistol, spawnRifle, trySpawnStoryItem`

  ### Methods inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#method-summary "class in zombie.randomizedWorld")

  `addBloodSplat, addBrazier, addCampfire, addCampfireOrPit, addCharcoalBurner, addCookingPit, addItemOnGround, addItemOnGround, addItemOnGround, addItemOnGroundNoLoot, addItemOnGroundNoLoot, addItemOnGroundStatic, addItemOnGroundStatic, addItemToObjectSurface, addMattressNorthSouth, addMattressWestEast, addRandomFirepit, addRandomItemOnGround, addRandomItemsOnGround, addRandomItemsOnGround, addRandomShelterNorthSouth, addRandomShelterWestEast, addRandomTentNorthSouth, addRandomTentWestEast, addShelterNorthSouth, addShelterWestEast, addSimpleCookingPit, addSimpleFire, addSleepingBagNorthSouth, addSleepingBagOrTentNorthSouth, addSleepingBagOrTentWestEast, addSleepingBagWestEast, addTentNorthSouth, addTentNorthSouthNew, addTentWestEast, addTentWestEastNew, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTrailer, addTrailOfBlood, addTraitOfBlood, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicleFlipped, addVehicleFlipped, addWeapon, addWorkstationEntity, addWorkstationEntity, addZombiesOnVehicle, alignCorpseToSquare, checkAreaForCarsSpawn, checkRadiusForCarSpawn, cleanSquareAndNeighbors, createBodyFromZombie, createCorpse, createCorpse, createCorpse, createCorpse, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomZombie, createRandomZombie, createRandomZombieForCorpse, createSkeletonCorpse, createSkeletonCorpse, dirtBomb, getBarnClutter, getBarnClutterItem, getBathroomSinkClutter, getBathroomSinkClutterItem, getBBQClutter, getBBQClutterItem, getBeachPartyClutter, getBeachPartyClutterItem, getBedClutter, getBedClutterItem, getCafeClutter, getCafeClutterItem, getCarpentryToolClutter, getCarpentryToolClutterItem, getClutterCopy, getClutterCopy, getClutterItem, getDeadEndClutter, getDeadEndClutterItem, getDebugLine, getDormClutter, getDormClutterItem, getFarmStorageClutter, getFarmStorageClutterItem, getFootballNightDrinkItem, getFootballNightDrinks, getFootballNightSnackItem, getFootballNightSnacks, getGarageStorageClutter, getGarageStorageClutterItem, getGigamartClutter, getGigamartClutterItem, getGroceryClutter, getGroceryClutterItem, getHairSalonClutter, getHairSalonClutterItem, getHallClutter, getHallClutterItem, getHenDoDrinkItem, getHenDoDrinks, getHenDoSnackItem, getHenDoSnacks, getHoedownClutter, getHoedownClutterItem, getHousePartyClutter, getHousePartyClutterItem, getJudgeClutter, getJudgeClutterItem, getKidClutter, getKidClutterItem, getKitchenCounterClutter, getKitchenCounterClutterItem, getKitchenSinkClutter, getKitchenSinkClutterItem, getKitchenStoveClutter, getKitchenStoveClutterItem, getLaundryRoomClutter, getLaundryRoomClutterItem, getLivingroomClutter, getLivingroomClutterItem, getLivingRoomOrKitchen, getMaximumDays, getMedicalClutter, getMedicallutterItem, getMurderSceneClutter, getMurderSceneClutterItem, getName, getNastyMattressClutter, getNastyMattressClutterItem, getOfficeCarDealerClutter, getOfficeCarDealerClutterItem, getOfficeOtherClutter, getOfficeOtherClutterItem, getOfficePaperworkClutter, getOfficePaperworkClutterItem, getOfficePenClutter, getOfficePenClutterItem, getOfficeTreatClutter, getOfficeTreatClutterItem, getOldShelterClutter, getOldShelterClutterItem, getOvenFoodClutter, getOvenFoodClutterItem, getPillowClutter, getPillowClutterItem, getPokerNightClutter, getPokerNightClutterItem, getRandomRoom, getRandomRoomNoKids, getRandomSpawnSquare, getRandomSquareForCorpse, getRichJerkClutter, getRichJerkClutterItem, getRoom, getRoomNoKids, getSadCampsiteClutter, getSadCampsiteClutterItem, getSidetableClutter, getSidetableClutterItem, getSq, getSurvivalistCampsiteClutter, getSurvivalistCampsiteClutterItem, getTwiggyClutter, getTwiggyClutterItem, getUtilityToolClutter, getUtilityToolClutterItem, getVanCampClutter, getVanCampClutterItem, getWatchClutter, getWatchClutterItem, getWoodcraftClutter, getWoodcraftClutterItem, graffSquare, graffSquare, is1x1AreaClear, is1x2AreaClear, is2x1AreaClear, is2x1or1x2AreaClear, is2x2AreaClear, isRat, isTimeValid, isUnique, isValidGraffSquare, removeAllVehiclesOnZone, setAttachedItem, setDebugLine, setMaximumDays, setUnique, spawnCarOnNearestNav, spawnCarOnNearestNav, trashSquare, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### specificProfessionDistribution

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> specificProfessionDistribution
  + ### specificProfessionRoomDistribution

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> specificProfessionRoomDistribution
  + ### plankStash

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> plankStash
  + ### deadSurvivorsStory

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RandomizedDeadSurvivorBase](../randomizedDeadSurvivor/RandomizedDeadSurvivorBase.html "class in zombie.randomizedWorld.randomizedDeadSurvivor")> deadSurvivorsStory
  + ### totalChanceRds

    private int totalChanceRds
  + ### rdsMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[RandomizedDeadSurvivorBase](../randomizedDeadSurvivor/RandomizedDeadSurvivorBase.html "class in zombie.randomizedWorld.randomizedDeadSurvivor"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> rdsMap
  + ### uniqueRDSSpawned

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> uniqueRDSSpawned
  + ### tablesDone

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../../iso/IsoObject.html "class in zombie.iso")> tablesDone
  + ### doneTable

    private boolean doneTable
  + ### s\_clutterCopyPool

    private static final zombie.popman.ObjectPool<gnu.trove.map.hash.TIntObjectHashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> s\_clutterCopyPool
  + ### TABLE\_STORY\_CHANCE

    private static final int TABLE\_STORY\_CHANCE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedBuilding.RBBasic.TABLE_STORY_CHANCE)
* Constructor Details
  -------------------

  + ### RBBasic

    public RBBasic()
* Method Details
  --------------

  + ### randomizeBuilding

    public void randomizeBuilding([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)

    Overrides:
    :   `randomizeBuilding` in class `RandomizedBuildingBase`
  + ### forceVehicleDistribution

    public void forceVehicleDistribution([BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles") vehicle,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") distribution)
  + ### randomizeContainer

    private void randomizeContainer([VehiclePart](../../vehicles/VehiclePart.html "class in zombie.vehicles") part,
    [ItemPickerJava.ItemPickerRoom](../../inventory/ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") distro2)
  + ### doLivingRoomStuff

    private void doLivingRoomStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doLivingRoomStuff

    private void doLivingRoomStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> clutterArray)
  + ### doBedroomStuff

    private void doBedroomStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doKidsBedroomStuff

    private void doKidsBedroomStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doKitchenStuff

    private void doKitchenStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doKitchenStuff

    private void doKitchenStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    gnu.trove.map.hash.TIntObjectHashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> counterClutter,
    gnu.trove.map.hash.TIntObjectHashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> sinkClutter,
    gnu.trove.map.hash.TIntObjectHashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> stoveClutter)
  + ### doBathroomStuff

    private void doBathroomStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doBathroomStuff

    private void doBathroomStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    gnu.trove.map.hash.TIntObjectHashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> sinkClutter)
  + ### generateKitchenStoveClutter

    private void generateKitchenStoveClutter([IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") facing,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") obj,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### generateKitchenStoveClutter

    private void generateKitchenStoveClutter([IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") facing,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") obj,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    gnu.trove.map.hash.TIntObjectHashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> stoveClutter)
  + ### generateCounterClutter

    private void generateCounterClutter([IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") facing,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") obj,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    gnu.trove.map.hash.TIntObjectHashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> itemMap)
  + ### generateSinkClutter

    private void generateSinkClutter([IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") facing,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") obj,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    gnu.trove.map.hash.TIntObjectHashMap<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> itemMap)
  + ### getFacing

    private [IsoDirections](../../iso/IsoDirections.html "enum class in zombie.iso") getFacing([IsoSprite](../../iso/sprite/IsoSprite.html "class in zombie.iso.sprite") sprite)
  + ### checkForTableSpawn

    private void checkForTableSpawn([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") table1)

    Add random objects on the dinner/kitchen table to create a story in basic homes
  + ### checkForTable

    private [IsoObject](../../iso/IsoObject.html "class in zombie.iso") checkForTable([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") table1)
  + ### doProfessionStory

    public void doProfessionStory([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") professionChoosed)
  + ### addRandomDeadSurvivorStory

    private void addRandomDeadSurvivorStory([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)
  + ### initRDSMap

    private void initRDSMap([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)
  + ### doRandomDeadSurvivorStory

    public void doRandomDeadSurvivorStory([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") buildingDef,
    [RandomizedDeadSurvivorBase](../randomizedDeadSurvivor/RandomizedDeadSurvivorBase.html "class in zombie.randomizedWorld.randomizedDeadSurvivor") dsDef)
  + ### getSurvivorStories

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RandomizedDeadSurvivorBase](../randomizedDeadSurvivor/RandomizedDeadSurvivorBase.html "class in zombie.randomizedWorld.randomizedDeadSurvivor")> getSurvivorStories()
  + ### getSurvivorProfession

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getSurvivorProfession()
  + ### getUniqueRDSSpawned

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getUniqueRDSSpawned()
  + ### doProfessionBuilding

    public void doProfessionBuilding([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") professionChoosed,
    [ItemPickerJava.ItemPickerRoom](../../inventory/ItemPickerJava.ItemPickerRoom.html "class in zombie.inventory") prof)
  + ### doOfficeStuff

    public static void doOfficeStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doNolansOfficeStuff

    public static void doNolansOfficeStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doCafeStuff

    public static void doCafeStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doGigamartStuff

    public static void doGigamartStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doGroceryStuff

    public static void doGroceryStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doGeneralRoom

    public static void doGeneralRoom([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> clutter)
  + ### doLaundryStuff

    private void doLaundryStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doJudgeStuff

    public static void doJudgeStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doTwiggyStuff

    public static void doTwiggyStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### doWoodcraftStuff

    public static void doWoodcraftStuff([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)