[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.randomizedWorld.randomizedVehicleStory](package-summary.html)
2. [RVSHerdOnRoad](RVSHerdOnRoad.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [RVSHerdOnRoad()](#%3Cinit%3E())
6. [Method Details](#method-detail)
   1. [getBreeds()](#getBreeds())
   2. [randomizeVehicleStory(Zone, IsoChunk)](#randomizeVehicleStory(zombie.iso.zones.Zone,zombie.iso.IsoChunk))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RVSHerdOnRoad
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.randomizedWorld.RandomizedWorldBase](../RandomizedWorldBase.html "class in zombie.randomizedWorld")

[zombie.randomizedWorld.randomizedVehicleStory.RandomizedVehicleStoryBase](RandomizedVehicleStoryBase.html "class in zombie.randomizedWorld.randomizedVehicleStory")

zombie.randomizedWorld.randomizedVehicleStory.RVSHerdOnRoad

---

public final class RVSHerdOnRoad
extends [RandomizedVehicleStoryBase](RandomizedVehicleStoryBase.html "class in zombie.randomizedWorld.randomizedVehicleStory")

* Field Summary
  -------------

  ### Fields inherited from class [RandomizedVehicleStoryBase](RandomizedVehicleStoryBase.html#field-summary "class in zombie.randomizedWorld.randomizedVehicleStory")

  `baseChance, horizontalZone, maxX, maxY, minX, minY, minZoneHeight, minZoneWidth, needsDirt, needsFarmland, needsPavement, needsRegion, needsRuralVegetation, notTown, zoneWidth`

  ### Fields inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#field-summary "class in zombie.randomizedWorld")

  `debugLine, isRat, maximumDays, minimumDays, minimumRooms, name, reallyAlwaysForce, unique`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RVSHerdOnRoad()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ArrayList<String>`

  `getBreeds()`

  `void`

  `randomizeVehicleStory(Zone zone,
  IsoChunk chunk)`

  ### Methods inherited from class [RandomizedVehicleStoryBase](RandomizedVehicleStoryBase.html#method-summary "class in zombie.randomizedWorld.randomizedVehicleStory")

  `addSmashedOverlay, callVehicleStorySpawner, doRandomStory, getCenterOfChunk, getChance, getMinimumDays, getMinZoneHeight, getMinZoneWidth, getPolylineSpawnPoint, getRandomFreeUnoccupiedSquare, getRectangleSpawnPoint, getSpawnPoint, initAllRVSMapChance, initSpawnDataForChunk, initVehicleStorySpawner, isChunkLoaded, isFullyStreamedIn, isValid, registerCustomOutfits, setChance, setMinimumDays, spawnElement`

  ### Methods inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#method-summary "class in zombie.randomizedWorld")

  `addBloodSplat, addBrazier, addCampfire, addCampfireOrPit, addCharcoalBurner, addCookingPit, addItemOnGround, addItemOnGround, addItemOnGround, addItemOnGroundNoLoot, addItemOnGroundNoLoot, addItemOnGroundStatic, addItemOnGroundStatic, addItemToObjectSurface, addMattressNorthSouth, addMattressWestEast, addRandomFirepit, addRandomItemOnGround, addRandomItemsOnGround, addRandomItemsOnGround, addRandomShelterNorthSouth, addRandomShelterWestEast, addRandomTentNorthSouth, addRandomTentWestEast, addShelterNorthSouth, addShelterWestEast, addSimpleCookingPit, addSimpleFire, addSleepingBagNorthSouth, addSleepingBagOrTentNorthSouth, addSleepingBagOrTentWestEast, addSleepingBagWestEast, addTentNorthSouth, addTentNorthSouthNew, addTentWestEast, addTentWestEastNew, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTrailer, addTrailOfBlood, addTraitOfBlood, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicleFlipped, addVehicleFlipped, addWeapon, addWorkstationEntity, addWorkstationEntity, addZombiesOnSquare, addZombiesOnVehicle, alignCorpseToSquare, checkAreaForCarsSpawn, checkRadiusForCarSpawn, cleanSquareAndNeighbors, createBodyFromZombie, createCorpse, createCorpse, createCorpse, createCorpse, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomZombie, createRandomZombie, createRandomZombieForCorpse, createSkeletonCorpse, createSkeletonCorpse, dirtBomb, getBarnClutter, getBarnClutterItem, getBathroomSinkClutter, getBathroomSinkClutterItem, getBBQClutter, getBBQClutterItem, getBeachPartyClutter, getBeachPartyClutterItem, getBedClutter, getBedClutterItem, getCafeClutter, getCafeClutterItem, getCarpentryToolClutter, getCarpentryToolClutterItem, getClutterCopy, getClutterCopy, getClutterItem, getDeadEndClutter, getDeadEndClutterItem, getDebugLine, getDormClutter, getDormClutterItem, getFarmStorageClutter, getFarmStorageClutterItem, getFootballNightDrinkItem, getFootballNightDrinks, getFootballNightSnackItem, getFootballNightSnacks, getGarageStorageClutter, getGarageStorageClutterItem, getGigamartClutter, getGigamartClutterItem, getGroceryClutter, getGroceryClutterItem, getHairSalonClutter, getHairSalonClutterItem, getHallClutter, getHallClutterItem, getHenDoDrinkItem, getHenDoDrinks, getHenDoSnackItem, getHenDoSnacks, getHoedownClutter, getHoedownClutterItem, getHousePartyClutter, getHousePartyClutterItem, getJudgeClutter, getJudgeClutterItem, getKidClutter, getKidClutterItem, getKitchenCounterClutter, getKitchenCounterClutterItem, getKitchenSinkClutter, getKitchenSinkClutterItem, getKitchenStoveClutter, getKitchenStoveClutterItem, getLaundryRoomClutter, getLaundryRoomClutterItem, getLivingroomClutter, getLivingroomClutterItem, getLivingRoomOrKitchen, getMaximumDays, getMedicalClutter, getMedicallutterItem, getMurderSceneClutter, getMurderSceneClutterItem, getName, getNastyMattressClutter, getNastyMattressClutterItem, getOfficeCarDealerClutter, getOfficeCarDealerClutterItem, getOfficeOtherClutter, getOfficeOtherClutterItem, getOfficePaperworkClutter, getOfficePaperworkClutterItem, getOfficePenClutter, getOfficePenClutterItem, getOfficeTreatClutter, getOfficeTreatClutterItem, getOldShelterClutter, getOldShelterClutterItem, getOvenFoodClutter, getOvenFoodClutterItem, getPillowClutter, getPillowClutterItem, getPokerNightClutter, getPokerNightClutterItem, getRandomRoom, getRandomRoomNoKids, getRandomSpawnSquare, getRandomSquareForCorpse, getRichJerkClutter, getRichJerkClutterItem, getRoom, getRoomNoKids, getSadCampsiteClutter, getSadCampsiteClutterItem, getSidetableClutter, getSidetableClutterItem, getSq, getSurvivalistCampsiteClutter, getSurvivalistCampsiteClutterItem, getTwiggyClutter, getTwiggyClutterItem, getUtilityToolClutter, getUtilityToolClutterItem, getVanCampClutter, getVanCampClutterItem, getWatchClutter, getWatchClutterItem, getWoodcraftClutter, getWoodcraftClutterItem, graffSquare, graffSquare, is1x1AreaClear, is1x2AreaClear, is2x1AreaClear, is2x1or1x2AreaClear, is2x2AreaClear, isRat, isTimeValid, isUnique, isValidGraffSquare, removeAllVehiclesOnZone, setAttachedItem, setDebugLine, setMaximumDays, setUnique, spawnCarOnNearestNav, spawnCarOnNearestNav, trashSquare, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### RVSHerdOnRoad

    public RVSHerdOnRoad()
* Method Details
  --------------

  + ### getBreeds

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getBreeds()
  + ### randomizeVehicleStory

    public void randomizeVehicleStory([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk)

    Overrides:
    :   `randomizeVehicleStory` in class `RandomizedVehicleStoryBase`