[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.randomizedWorld.randomizedDeadSurvivor](package-summary.html)
2. [RDSTinFoilHat](RDSTinFoilHat.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Constructor Details](#constructor-detail)
   1. [RDSTinFoilHat()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [randomizeDeadSurvivor(BuildingDef)](#randomizeDeadSurvivor(zombie.iso.BuildingDef))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RDSTinFoilHat
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.randomizedWorld.RandomizedWorldBase](../RandomizedWorldBase.html "class in zombie.randomizedWorld")

[zombie.randomizedWorld.randomizedBuilding.RandomizedBuildingBase](../randomizedBuilding/RandomizedBuildingBase.html "class in zombie.randomizedWorld.randomizedBuilding")

[zombie.randomizedWorld.randomizedDeadSurvivor.RandomizedDeadSurvivorBase](RandomizedDeadSurvivorBase.html "class in zombie.randomizedWorld.randomizedDeadSurvivor")

zombie.randomizedWorld.randomizedDeadSurvivor.RDSTinFoilHat

---

public final class RDSTinFoilHat
extends [RandomizedDeadSurvivorBase](RandomizedDeadSurvivorBase.html "class in zombie.randomizedWorld.randomizedDeadSurvivor")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [RandomizedBuildingBase](../randomizedBuilding/RandomizedBuildingBase.html#nested-class-summary "class in zombie.randomizedWorld.randomizedBuilding")

  `RandomizedBuildingBase.HumanCorpse`
* Field Summary
  -------------

  ### Fields inherited from class [RandomizedBuildingBase](../randomizedBuilding/RandomizedBuildingBase.html#field-summary "class in zombie.randomizedWorld.randomizedBuilding")

  `KBBuildingX, KBBuildingY, maximumRoomCount`

  ### Fields inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#field-summary "class in zombie.randomizedWorld")

  `debugLine, isRat, maximumDays, minimumDays, minimumRooms, name, reallyAlwaysForce, unique`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RDSTinFoilHat()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `randomizeDeadSurvivor(BuildingDef def)`

  ### Methods inherited from class [RandomizedDeadSurvivorBase](RandomizedDeadSurvivorBase.html#method-summary "class in zombie.randomizedWorld.randomizedDeadSurvivor")

  `isValid`

  ### Methods inherited from class [RandomizedBuildingBase](../randomizedBuilding/RandomizedBuildingBase.html#method-summary "class in zombie.randomizedWorld.randomizedBuilding")

  `addBarricade, addClip, addRandomRangedWeapon, addWorldItem, addWorldItem, addWorldItem, addWorldItem, addWorldItem, addZombies, addZombiesOnSquare, ChunkLoaded, doAmmoCans, doBodyArmor, doCornerAmmoCans, doCounterAmmoDisplay, doGunShelfHandguns, doGunShelfRifles, doHandgunCounterDisplay, doRifleCounterDisplay, getBuildingObjects, getBuildingObjectsSimple, getBuildingSquares, getChance, getChance, getDoor, getMinimumDays, getMinimumRooms, getRectSquares, getWindow, init, initAllRBMapChance, isAlwaysDo, isTableFor3DItems, randomizeBuilding, removeAllZombies, setAlwaysDo, setChance, setMinimumDays, setMinimumRooms, setWorldRotation, spawnBodyArmor, spawnItemsInContainers, spawnPistol, spawnRifle, trySpawnStoryItem`

  ### Methods inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#method-summary "class in zombie.randomizedWorld")

  `addBloodSplat, addBrazier, addCampfire, addCampfireOrPit, addCharcoalBurner, addCookingPit, addItemOnGround, addItemOnGround, addItemOnGround, addItemOnGroundNoLoot, addItemOnGroundNoLoot, addItemOnGroundStatic, addItemOnGroundStatic, addItemToObjectSurface, addMattressNorthSouth, addMattressWestEast, addRandomFirepit, addRandomItemOnGround, addRandomItemsOnGround, addRandomItemsOnGround, addRandomShelterNorthSouth, addRandomShelterWestEast, addRandomTentNorthSouth, addRandomTentWestEast, addShelterNorthSouth, addShelterWestEast, addSimpleCookingPit, addSimpleFire, addSleepingBagNorthSouth, addSleepingBagOrTentNorthSouth, addSleepingBagOrTentWestEast, addSleepingBagWestEast, addTentNorthSouth, addTentNorthSouthNew, addTentWestEast, addTentWestEastNew, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTrailer, addTrailOfBlood, addTraitOfBlood, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicleFlipped, addVehicleFlipped, addWeapon, addWorkstationEntity, addWorkstationEntity, addZombiesOnVehicle, alignCorpseToSquare, checkAreaForCarsSpawn, checkRadiusForCarSpawn, cleanSquareAndNeighbors, createBodyFromZombie, createCorpse, createCorpse, createCorpse, createCorpse, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomZombie, createRandomZombie, createRandomZombieForCorpse, createSkeletonCorpse, createSkeletonCorpse, dirtBomb, getBarnClutter, getBarnClutterItem, getBathroomSinkClutter, getBathroomSinkClutterItem, getBBQClutter, getBBQClutterItem, getBeachPartyClutter, getBeachPartyClutterItem, getBedClutter, getBedClutterItem, getCafeClutter, getCafeClutterItem, getCarpentryToolClutter, getCarpentryToolClutterItem, getClutterCopy, getClutterCopy, getClutterItem, getDeadEndClutter, getDeadEndClutterItem, getDebugLine, getDormClutter, getDormClutterItem, getFarmStorageClutter, getFarmStorageClutterItem, getFootballNightDrinkItem, getFootballNightDrinks, getFootballNightSnackItem, getFootballNightSnacks, getGarageStorageClutter, getGarageStorageClutterItem, getGigamartClutter, getGigamartClutterItem, getGroceryClutter, getGroceryClutterItem, getHairSalonClutter, getHairSalonClutterItem, getHallClutter, getHallClutterItem, getHenDoDrinkItem, getHenDoDrinks, getHenDoSnackItem, getHenDoSnacks, getHoedownClutter, getHoedownClutterItem, getHousePartyClutter, getHousePartyClutterItem, getJudgeClutter, getJudgeClutterItem, getKidClutter, getKidClutterItem, getKitchenCounterClutter, getKitchenCounterClutterItem, getKitchenSinkClutter, getKitchenSinkClutterItem, getKitchenStoveClutter, getKitchenStoveClutterItem, getLaundryRoomClutter, getLaundryRoomClutterItem, getLivingroomClutter, getLivingroomClutterItem, getLivingRoomOrKitchen, getMaximumDays, getMedicalClutter, getMedicallutterItem, getMurderSceneClutter, getMurderSceneClutterItem, getName, getNastyMattressClutter, getNastyMattressClutterItem, getOfficeCarDealerClutter, getOfficeCarDealerClutterItem, getOfficeOtherClutter, getOfficeOtherClutterItem, getOfficePaperworkClutter, getOfficePaperworkClutterItem, getOfficePenClutter, getOfficePenClutterItem, getOfficeTreatClutter, getOfficeTreatClutterItem, getOldShelterClutter, getOldShelterClutterItem, getOvenFoodClutter, getOvenFoodClutterItem, getPillowClutter, getPillowClutterItem, getPokerNightClutter, getPokerNightClutterItem, getRandomRoom, getRandomRoomNoKids, getRandomSpawnSquare, getRandomSquareForCorpse, getRichJerkClutter, getRichJerkClutterItem, getRoom, getRoomNoKids, getSadCampsiteClutter, getSadCampsiteClutterItem, getSidetableClutter, getSidetableClutterItem, getSq, getSurvivalistCampsiteClutter, getSurvivalistCampsiteClutterItem, getTwiggyClutter, getTwiggyClutterItem, getUtilityToolClutter, getUtilityToolClutterItem, getVanCampClutter, getVanCampClutterItem, getWatchClutter, getWatchClutterItem, getWoodcraftClutter, getWoodcraftClutterItem, graffSquare, graffSquare, is1x1AreaClear, is1x2AreaClear, is2x1AreaClear, is2x1or1x2AreaClear, is2x2AreaClear, isRat, isTimeValid, isUnique, isValidGraffSquare, removeAllVehiclesOnZone, setAttachedItem, setDebugLine, setMaximumDays, setUnique, spawnCarOnNearestNav, spawnCarOnNearestNav, trashSquare, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### RDSTinFoilHat

    public RDSTinFoilHat()
* Method Details
  --------------

  + ### randomizeDeadSurvivor

    public void randomizeDeadSurvivor([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)

    Overrides:
    :   `randomizeDeadSurvivor` in class `RandomizedDeadSurvivorBase`