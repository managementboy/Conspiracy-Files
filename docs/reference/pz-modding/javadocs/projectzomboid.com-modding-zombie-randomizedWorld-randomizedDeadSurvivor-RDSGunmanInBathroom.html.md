[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.randomizedWorld.randomizedDeadSurvivor](package-summary.html)
2. [RDSGunmanInBathroom](RDSGunmanInBathroom.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [PROBABILITY\_RIFLE\_HUNTING](#PROBABILITY_RIFLE_HUNTING)
   2. [PROBABILITY\_RIFLE\_M14](#PROBABILITY_RIFLE_M14)
   3. [PROBABILITY\_SHOTGUN](#PROBABILITY_SHOTGUN)
   4. [PROBABILITY\_PISTOL1](#PROBABILITY_PISTOL1)
   5. [PROBABILITY\_PISTOL2](#PROBABILITY_PISTOL2)
   6. [PROBABILITY\_PISTOL3](#PROBABILITY_PISTOL3)
   7. [PROBABILITY\_REVOLVER](#PROBABILITY_REVOLVER)
   8. [PROBABILITY\_REVOLVER\_LONG](#PROBABILITY_REVOLVER_LONG)
   9. [PROBABILITY\_SPAWN\_RIFLE](#PROBABILITY_SPAWN_RIFLE)
   10. [PROBABILITY\_SPAWN\_AMMO](#PROBABILITY_SPAWN_AMMO)
   11. [PROBABILITY\_SPAWN\_CLIP](#PROBABILITY_SPAWN_CLIP)
7. [Constructor Details](#constructor-detail)
   1. [RDSGunmanInBathroom()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [randomizeDeadSurvivor(BuildingDef)](#randomizeDeadSurvivor(zombie.iso.BuildingDef))
   2. [gunPicker(boolean)](#gunPicker(boolean))
   3. [riflePicker(int)](#riflePicker(int))
   4. [pistolPicker(int)](#pistolPicker(int))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RDSGunmanInBathroom
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.randomizedWorld.RandomizedWorldBase](../RandomizedWorldBase.html "class in zombie.randomizedWorld")

[zombie.randomizedWorld.randomizedBuilding.RandomizedBuildingBase](../randomizedBuilding/RandomizedBuildingBase.html "class in zombie.randomizedWorld.randomizedBuilding")

[zombie.randomizedWorld.randomizedDeadSurvivor.RandomizedDeadSurvivorBase](RandomizedDeadSurvivorBase.html "class in zombie.randomizedWorld.randomizedDeadSurvivor")

zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom

---

public final class RDSGunmanInBathroom
extends [RandomizedDeadSurvivorBase](RandomizedDeadSurvivorBase.html "class in zombie.randomizedWorld.randomizedDeadSurvivor")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [RandomizedBuildingBase](../randomizedBuilding/RandomizedBuildingBase.html#nested-class-summary "class in zombie.randomizedWorld.randomizedBuilding")

  `RandomizedBuildingBase.HumanCorpse`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final int`

  `PROBABILITY_PISTOL1`

  `private static final int`

  `PROBABILITY_PISTOL2`

  `private static final int`

  `PROBABILITY_PISTOL3`

  `private static final int`

  `PROBABILITY_REVOLVER`

  `private static final int`

  `PROBABILITY_REVOLVER_LONG`

  `private static final int`

  `PROBABILITY_RIFLE_HUNTING`

  `private static final int`

  `PROBABILITY_RIFLE_M14`

  `private static final int`

  `PROBABILITY_SHOTGUN`

  `private static final int`

  `PROBABILITY_SPAWN_AMMO`

  `private static final int`

  `PROBABILITY_SPAWN_CLIP`

  `private static final int`

  `PROBABILITY_SPAWN_RIFLE`

  ### Fields inherited from class [RandomizedBuildingBase](../randomizedBuilding/RandomizedBuildingBase.html#field-summary "class in zombie.randomizedWorld.randomizedBuilding")

  `KBBuildingX, KBBuildingY, maximumRoomCount`

  ### Fields inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#field-summary "class in zombie.randomizedWorld")

  `debugLine, isRat, maximumDays, minimumDays, minimumRooms, name, reallyAlwaysForce, unique`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RDSGunmanInBathroom()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static HandWeapon`

  `gunPicker(boolean isRifle)`

  `private static ItemKey`

  `pistolPicker(int roll)`

  `void`

  `randomizeDeadSurvivor(BuildingDef def)`

  `private static ItemKey`

  `riflePicker(int roll)`

  ### Methods inherited from class [RandomizedDeadSurvivorBase](RandomizedDeadSurvivorBase.html#method-summary "class in zombie.randomizedWorld.randomizedDeadSurvivor")

  `isValid`

  ### Methods inherited from class [RandomizedBuildingBase](../randomizedBuilding/RandomizedBuildingBase.html#method-summary "class in zombie.randomizedWorld.randomizedBuilding")

  `addBarricade, addClip, addRandomRangedWeapon, addWorldItem, addWorldItem, addWorldItem, addWorldItem, addWorldItem, addZombies, addZombiesOnSquare, ChunkLoaded, doAmmoCans, doBodyArmor, doCornerAmmoCans, doCounterAmmoDisplay, doGunShelfHandguns, doGunShelfRifles, doHandgunCounterDisplay, doRifleCounterDisplay, getBuildingObjects, getBuildingObjectsSimple, getBuildingSquares, getChance, getChance, getDoor, getMinimumDays, getMinimumRooms, getRectSquares, getWindow, init, initAllRBMapChance, isAlwaysDo, isTableFor3DItems, randomizeBuilding, removeAllZombies, setAlwaysDo, setChance, setMinimumDays, setMinimumRooms, setWorldRotation, spawnBodyArmor, spawnItemsInContainers, spawnPistol, spawnRifle, trySpawnStoryItem`

  ### Methods inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#method-summary "class in zombie.randomizedWorld")

  `addBloodSplat, addBrazier, addCampfire, addCampfireOrPit, addCharcoalBurner, addCookingPit, addItemOnGround, addItemOnGround, addItemOnGround, addItemOnGroundNoLoot, addItemOnGroundNoLoot, addItemOnGroundStatic, addItemOnGroundStatic, addItemToObjectSurface, addMattressNorthSouth, addMattressWestEast, addRandomFirepit, addRandomItemOnGround, addRandomItemsOnGround, addRandomItemsOnGround, addRandomShelterNorthSouth, addRandomShelterWestEast, addRandomTentNorthSouth, addRandomTentWestEast, addShelterNorthSouth, addShelterWestEast, addSimpleCookingPit, addSimpleFire, addSleepingBagNorthSouth, addSleepingBagOrTentNorthSouth, addSleepingBagOrTentWestEast, addSleepingBagWestEast, addTentNorthSouth, addTentNorthSouthNew, addTentWestEast, addTentWestEastNew, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTrailer, addTrailOfBlood, addTraitOfBlood, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicleFlipped, addVehicleFlipped, addWeapon, addWorkstationEntity, addWorkstationEntity, addZombiesOnVehicle, alignCorpseToSquare, checkAreaForCarsSpawn, checkRadiusForCarSpawn, cleanSquareAndNeighbors, createBodyFromZombie, createCorpse, createCorpse, createCorpse, createCorpse, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomZombie, createRandomZombie, createRandomZombieForCorpse, createSkeletonCorpse, createSkeletonCorpse, dirtBomb, getBarnClutter, getBarnClutterItem, getBathroomSinkClutter, getBathroomSinkClutterItem, getBBQClutter, getBBQClutterItem, getBeachPartyClutter, getBeachPartyClutterItem, getBedClutter, getBedClutterItem, getCafeClutter, getCafeClutterItem, getCarpentryToolClutter, getCarpentryToolClutterItem, getClutterCopy, getClutterCopy, getClutterItem, getDeadEndClutter, getDeadEndClutterItem, getDebugLine, getDormClutter, getDormClutterItem, getFarmStorageClutter, getFarmStorageClutterItem, getFootballNightDrinkItem, getFootballNightDrinks, getFootballNightSnackItem, getFootballNightSnacks, getGarageStorageClutter, getGarageStorageClutterItem, getGigamartClutter, getGigamartClutterItem, getGroceryClutter, getGroceryClutterItem, getHairSalonClutter, getHairSalonClutterItem, getHallClutter, getHallClutterItem, getHenDoDrinkItem, getHenDoDrinks, getHenDoSnackItem, getHenDoSnacks, getHoedownClutter, getHoedownClutterItem, getHousePartyClutter, getHousePartyClutterItem, getJudgeClutter, getJudgeClutterItem, getKidClutter, getKidClutterItem, getKitchenCounterClutter, getKitchenCounterClutterItem, getKitchenSinkClutter, getKitchenSinkClutterItem, getKitchenStoveClutter, getKitchenStoveClutterItem, getLaundryRoomClutter, getLaundryRoomClutterItem, getLivingroomClutter, getLivingroomClutterItem, getLivingRoomOrKitchen, getMaximumDays, getMedicalClutter, getMedicallutterItem, getMurderSceneClutter, getMurderSceneClutterItem, getName, getNastyMattressClutter, getNastyMattressClutterItem, getOfficeCarDealerClutter, getOfficeCarDealerClutterItem, getOfficeOtherClutter, getOfficeOtherClutterItem, getOfficePaperworkClutter, getOfficePaperworkClutterItem, getOfficePenClutter, getOfficePenClutterItem, getOfficeTreatClutter, getOfficeTreatClutterItem, getOldShelterClutter, getOldShelterClutterItem, getOvenFoodClutter, getOvenFoodClutterItem, getPillowClutter, getPillowClutterItem, getPokerNightClutter, getPokerNightClutterItem, getRandomRoom, getRandomRoomNoKids, getRandomSpawnSquare, getRandomSquareForCorpse, getRichJerkClutter, getRichJerkClutterItem, getRoom, getRoomNoKids, getSadCampsiteClutter, getSadCampsiteClutterItem, getSidetableClutter, getSidetableClutterItem, getSq, getSurvivalistCampsiteClutter, getSurvivalistCampsiteClutterItem, getTwiggyClutter, getTwiggyClutterItem, getUtilityToolClutter, getUtilityToolClutterItem, getVanCampClutter, getVanCampClutterItem, getWatchClutter, getWatchClutterItem, getWoodcraftClutter, getWoodcraftClutterItem, graffSquare, graffSquare, is1x1AreaClear, is1x2AreaClear, is2x1AreaClear, is2x1or1x2AreaClear, is2x2AreaClear, isRat, isTimeValid, isUnique, isValidGraffSquare, removeAllVehiclesOnZone, setAttachedItem, setDebugLine, setMaximumDays, setUnique, spawnCarOnNearestNav, spawnCarOnNearestNav, trashSquare, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### PROBABILITY\_RIFLE\_HUNTING

    private static final int PROBABILITY\_RIFLE\_HUNTING

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom.PROBABILITY_RIFLE_HUNTING)
  + ### PROBABILITY\_RIFLE\_M14

    private static final int PROBABILITY\_RIFLE\_M14

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom.PROBABILITY_RIFLE_M14)
  + ### PROBABILITY\_SHOTGUN

    private static final int PROBABILITY\_SHOTGUN

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom.PROBABILITY_SHOTGUN)
  + ### PROBABILITY\_PISTOL1

    private static final int PROBABILITY\_PISTOL1

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom.PROBABILITY_PISTOL1)
  + ### PROBABILITY\_PISTOL2

    private static final int PROBABILITY\_PISTOL2

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom.PROBABILITY_PISTOL2)
  + ### PROBABILITY\_PISTOL3

    private static final int PROBABILITY\_PISTOL3

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom.PROBABILITY_PISTOL3)
  + ### PROBABILITY\_REVOLVER

    private static final int PROBABILITY\_REVOLVER

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom.PROBABILITY_REVOLVER)
  + ### PROBABILITY\_REVOLVER\_LONG

    private static final int PROBABILITY\_REVOLVER\_LONG

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom.PROBABILITY_REVOLVER_LONG)
  + ### PROBABILITY\_SPAWN\_RIFLE

    private static final int PROBABILITY\_SPAWN\_RIFLE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom.PROBABILITY_SPAWN_RIFLE)
  + ### PROBABILITY\_SPAWN\_AMMO

    private static final int PROBABILITY\_SPAWN\_AMMO

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom.PROBABILITY_SPAWN_AMMO)
  + ### PROBABILITY\_SPAWN\_CLIP

    private static final int PROBABILITY\_SPAWN\_CLIP

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedDeadSurvivor.RDSGunmanInBathroom.PROBABILITY_SPAWN_CLIP)
* Constructor Details
  -------------------

  + ### RDSGunmanInBathroom

    public RDSGunmanInBathroom()
* Method Details
  --------------

  + ### randomizeDeadSurvivor

    public void randomizeDeadSurvivor([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)

    Overrides:
    :   `randomizeDeadSurvivor` in class `RandomizedDeadSurvivorBase`
  + ### gunPicker

    private static [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") gunPicker(boolean isRifle)
  + ### riflePicker

    private static [ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects") riflePicker(int roll)
  + ### pistolPicker

    private static [ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects") pistolPicker(int roll)