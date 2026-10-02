[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.randomizedWorld.randomizedZoneStory](package-summary.html)
2. [RandomizedZoneStoryBase](RandomizedZoneStoryBase.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [alwaysDo](#alwaysDo)
   2. [baseChance](#baseChance)
   3. [totalChance](#totalChance)
   4. [zoneStory](#zoneStory)
   5. [chance](#chance)
   6. [minZoneWidth](#minZoneWidth)
   7. [minZoneHeight](#minZoneHeight)
   8. [zoneType](#zoneType)
   9. [rzsMap](#rzsMap)
7. [Constructor Details](#constructor-detail)
   1. [RandomizedZoneStoryBase()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [isValidForStory(Zone, boolean)](#isValidForStory(zombie.iso.zones.Zone,boolean))
   2. [initAllRZSMapChance(Zone)](#initAllRZSMapChance(zombie.iso.zones.Zone))
   3. [isValid(Zone, boolean)](#isValid(zombie.iso.zones.Zone,boolean))
   4. [doRandomStory(Zone)](#doRandomStory(zombie.iso.zones.Zone))
   5. [getRandomFreeSquare(RandomizedZoneStoryBase, Zone)](#getRandomFreeSquare(zombie.randomizedWorld.randomizedZoneStory.RandomizedZoneStoryBase,zombie.iso.zones.Zone))
   6. [getRandomFreeSquare(RandomizedZoneStoryBase, Zone, IsoGridSquare)](#getRandomFreeSquare(zombie.randomizedWorld.randomizedZoneStory.RandomizedZoneStoryBase,zombie.iso.zones.Zone,zombie.iso.IsoGridSquare))
   7. [getRandomExtraFreeSquare(RandomizedZoneStoryBase, Zone)](#getRandomExtraFreeSquare(zombie.randomizedWorld.randomizedZoneStory.RandomizedZoneStoryBase,zombie.iso.zones.Zone))
   8. [getRandomFreeUnoccupiedSquare(RandomizedZoneStoryBase, Zone)](#getRandomFreeUnoccupiedSquare(zombie.randomizedWorld.randomizedZoneStory.RandomizedZoneStoryBase,zombie.iso.zones.Zone))
   9. [getRandomExtraFreeUnoccupiedSquare(RandomizedZoneStoryBase, Zone)](#getRandomExtraFreeUnoccupiedSquare(zombie.randomizedWorld.randomizedZoneStory.RandomizedZoneStoryBase,zombie.iso.zones.Zone))
   10. [getRandomFreeSquareFullZone(RandomizedZoneStoryBase, Zone)](#getRandomFreeSquareFullZone(zombie.randomizedWorld.randomizedZoneStory.RandomizedZoneStoryBase,zombie.iso.zones.Zone))
   11. [getRandomStory()](#getRandomStory())
   12. [checkCanSpawnStory(Zone, boolean)](#checkCanSpawnStory(zombie.iso.zones.Zone,boolean))
   13. [randomizeZoneStory(Zone)](#randomizeZoneStory(zombie.iso.zones.Zone))
   14. [isValid()](#isValid())
   15. [cleanAreaForStory(RandomizedZoneStoryBase, Zone)](#cleanAreaForStory(zombie.randomizedWorld.randomizedZoneStory.RandomizedZoneStoryBase,zombie.iso.zones.Zone))
   16. [cleanSquareForStory(IsoGridSquare)](#cleanSquareForStory(zombie.iso.IsoGridSquare))
   17. [getMinimumWidth()](#getMinimumWidth())
   18. [getMinimumHeight()](#getMinimumHeight())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RandomizedZoneStoryBase
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.randomizedWorld.RandomizedWorldBase](../RandomizedWorldBase.html "class in zombie.randomizedWorld")

zombie.randomizedWorld.randomizedZoneStory.RandomizedZoneStoryBase

Direct Known Subclasses:
:   `RZJackieJaye, RZSAttachedAnimal, RZSBaseball, RZSBBQParty, RZSBeachParty, RZSBurntWreck, RZSBuryingCamp, RZSCampsite, RZSCharcoalBurner, RZSDean, RZSDuke, RZSEscapedAnimal, RZSEscapedHerd, RZSFishingTrip, RZSForestCamp, RZSForestCampEaten, RZSFrankHemingway, RZSHermitCamp, RZSHillbillyHoedown, RZSHogWild, RZSHunterCamp, RZSKirstyKormick, RZSMurderScene, RZSMusicFest, RZSMusicFestStage, RZSNastyMattress, RZSOccultActivity, RZSOldFirepit, RZSOldShelter, RZSOrphanedFawn, RZSRangerSmith, RZSRockerParty, RZSSadCamp, RZSSexyTime, RZSSirTwiggy, RZSSurvivalistCamp, RZSTragicPicnic, RZSTrapperCamp, RZSVanCamp, RZSWasteDump, RZSWaterPump`

---

public class RandomizedZoneStoryBase
extends [RandomizedWorldBase](../RandomizedWorldBase.html "class in zombie.randomizedWorld")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `RandomizedZoneStoryBase.ZoneType`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `boolean`

  `alwaysDo`

  `static final int`

  `baseChance`

  `int`

  `chance`

  `protected int`

  `minZoneHeight`

  `protected int`

  `minZoneWidth`

  `private static final HashMap<RandomizedZoneStoryBase, Integer>`

  `rzsMap`

  `static int`

  `totalChance`

  `static final String`

  `zoneStory`

  `final ArrayList<String>`

  `zoneType`

  ### Fields inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#field-summary "class in zombie.randomizedWorld")

  `debugLine, isRat, maximumDays, minimumDays, minimumRooms, name, reallyAlwaysForce, unique`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RandomizedZoneStoryBase()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static boolean`

  `checkCanSpawnStory(Zone zone,
  boolean force)`

  Check if the necessary zone size is fully streamed

  `void`

  `cleanAreaForStory(RandomizedZoneStoryBase rzs,
  Zone zone)`

  `static void`

  `cleanSquareForStory(IsoGridSquare sq)`

  `private static boolean`

  `doRandomStory(Zone zone)`

  `int`

  `getMinimumHeight()`

  `int`

  `getMinimumWidth()`

  `IsoGridSquare`

  `getRandomExtraFreeSquare(RandomizedZoneStoryBase rzs,
  Zone zone)`

  `static IsoGridSquare`

  `getRandomExtraFreeUnoccupiedSquare(RandomizedZoneStoryBase rzs,
  Zone zone)`

  `IsoGridSquare`

  `getRandomFreeSquare(RandomizedZoneStoryBase rzs,
  Zone zone)`

  Get a random free square in our story zone

  `IsoGridSquare`

  `getRandomFreeSquare(RandomizedZoneStoryBase rzs,
  Zone zone,
  IsoGridSquare notSquare)`

  `IsoGridSquare`

  `getRandomFreeSquareFullZone(RandomizedZoneStoryBase rzs,
  Zone zone)`

  `static IsoGridSquare`

  `getRandomFreeUnoccupiedSquare(RandomizedZoneStoryBase rzs,
  Zone zone)`

  `private static RandomizedZoneStoryBase`

  `getRandomStory()`

  `static void`

  `initAllRZSMapChance(Zone zone)`

  `boolean`

  `isValid()`

  `boolean`

  `isValid(Zone zone,
  boolean force)`

  `static boolean`

  `isValidForStory(Zone zone,
  boolean force)`

  `void`

  `randomizeZoneStory(Zone zone)`

  ### Methods inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#method-summary "class in zombie.randomizedWorld")

  `addBloodSplat, addBrazier, addCampfire, addCampfireOrPit, addCharcoalBurner, addCookingPit, addItemOnGround, addItemOnGround, addItemOnGround, addItemOnGroundNoLoot, addItemOnGroundNoLoot, addItemOnGroundStatic, addItemOnGroundStatic, addItemToObjectSurface, addMattressNorthSouth, addMattressWestEast, addRandomFirepit, addRandomItemOnGround, addRandomItemsOnGround, addRandomItemsOnGround, addRandomShelterNorthSouth, addRandomShelterWestEast, addRandomTentNorthSouth, addRandomTentWestEast, addShelterNorthSouth, addShelterWestEast, addSimpleCookingPit, addSimpleFire, addSleepingBagNorthSouth, addSleepingBagOrTentNorthSouth, addSleepingBagOrTentWestEast, addSleepingBagWestEast, addTentNorthSouth, addTentNorthSouthNew, addTentWestEast, addTentWestEastNew, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTrailer, addTrailOfBlood, addTraitOfBlood, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicleFlipped, addVehicleFlipped, addWeapon, addWorkstationEntity, addWorkstationEntity, addZombiesOnSquare, addZombiesOnVehicle, alignCorpseToSquare, checkAreaForCarsSpawn, checkRadiusForCarSpawn, cleanSquareAndNeighbors, createBodyFromZombie, createCorpse, createCorpse, createCorpse, createCorpse, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomZombie, createRandomZombie, createRandomZombieForCorpse, createSkeletonCorpse, createSkeletonCorpse, dirtBomb, getBarnClutter, getBarnClutterItem, getBathroomSinkClutter, getBathroomSinkClutterItem, getBBQClutter, getBBQClutterItem, getBeachPartyClutter, getBeachPartyClutterItem, getBedClutter, getBedClutterItem, getCafeClutter, getCafeClutterItem, getCarpentryToolClutter, getCarpentryToolClutterItem, getClutterCopy, getClutterCopy, getClutterItem, getDeadEndClutter, getDeadEndClutterItem, getDebugLine, getDormClutter, getDormClutterItem, getFarmStorageClutter, getFarmStorageClutterItem, getFootballNightDrinkItem, getFootballNightDrinks, getFootballNightSnackItem, getFootballNightSnacks, getGarageStorageClutter, getGarageStorageClutterItem, getGigamartClutter, getGigamartClutterItem, getGroceryClutter, getGroceryClutterItem, getHairSalonClutter, getHairSalonClutterItem, getHallClutter, getHallClutterItem, getHenDoDrinkItem, getHenDoDrinks, getHenDoSnackItem, getHenDoSnacks, getHoedownClutter, getHoedownClutterItem, getHousePartyClutter, getHousePartyClutterItem, getJudgeClutter, getJudgeClutterItem, getKidClutter, getKidClutterItem, getKitchenCounterClutter, getKitchenCounterClutterItem, getKitchenSinkClutter, getKitchenSinkClutterItem, getKitchenStoveClutter, getKitchenStoveClutterItem, getLaundryRoomClutter, getLaundryRoomClutterItem, getLivingroomClutter, getLivingroomClutterItem, getLivingRoomOrKitchen, getMaximumDays, getMedicalClutter, getMedicallutterItem, getMurderSceneClutter, getMurderSceneClutterItem, getName, getNastyMattressClutter, getNastyMattressClutterItem, getOfficeCarDealerClutter, getOfficeCarDealerClutterItem, getOfficeOtherClutter, getOfficeOtherClutterItem, getOfficePaperworkClutter, getOfficePaperworkClutterItem, getOfficePenClutter, getOfficePenClutterItem, getOfficeTreatClutter, getOfficeTreatClutterItem, getOldShelterClutter, getOldShelterClutterItem, getOvenFoodClutter, getOvenFoodClutterItem, getPillowClutter, getPillowClutterItem, getPokerNightClutter, getPokerNightClutterItem, getRandomRoom, getRandomRoomNoKids, getRandomSpawnSquare, getRandomSquareForCorpse, getRichJerkClutter, getRichJerkClutterItem, getRoom, getRoomNoKids, getSadCampsiteClutter, getSadCampsiteClutterItem, getSidetableClutter, getSidetableClutterItem, getSq, getSurvivalistCampsiteClutter, getSurvivalistCampsiteClutterItem, getTwiggyClutter, getTwiggyClutterItem, getUtilityToolClutter, getUtilityToolClutterItem, getVanCampClutter, getVanCampClutterItem, getWatchClutter, getWatchClutterItem, getWoodcraftClutter, getWoodcraftClutterItem, graffSquare, graffSquare, is1x1AreaClear, is1x2AreaClear, is2x1AreaClear, is2x1or1x2AreaClear, is2x2AreaClear, isRat, isTimeValid, isUnique, isValidGraffSquare, removeAllVehiclesOnZone, setAttachedItem, setDebugLine, setMaximumDays, setUnique, spawnCarOnNearestNav, spawnCarOnNearestNav, trashSquare, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### alwaysDo

    public boolean alwaysDo
  + ### baseChance

    public static final int baseChance

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedZoneStory.RandomizedZoneStoryBase.baseChance)
  + ### totalChance

    public static int totalChance
  + ### zoneStory

    public static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zoneStory

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedZoneStory.RandomizedZoneStoryBase.zoneStory)
  + ### chance

    public int chance
  + ### minZoneWidth

    protected int minZoneWidth
  + ### minZoneHeight

    protected int minZoneHeight
  + ### zoneType

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> zoneType
  + ### rzsMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[RandomizedZoneStoryBase](RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> rzsMap
* Constructor Details
  -------------------

  + ### RandomizedZoneStoryBase

    public RandomizedZoneStoryBase()
* Method Details
  --------------

  + ### isValidForStory

    public static boolean isValidForStory([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    boolean force)
  + ### initAllRZSMapChance

    public static void initAllRZSMapChance([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone)
  + ### isValid

    public boolean isValid([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    boolean force)
  + ### doRandomStory

    private static boolean doRandomStory([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone)
  + ### getRandomFreeSquare

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getRandomFreeSquare([RandomizedZoneStoryBase](RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory") rzs,
    [Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone)

    Get a random free square in our story zone
  + ### getRandomFreeSquare

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getRandomFreeSquare([RandomizedZoneStoryBase](RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory") rzs,
    [Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") notSquare)
  + ### getRandomExtraFreeSquare

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getRandomExtraFreeSquare([RandomizedZoneStoryBase](RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory") rzs,
    [Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone)
  + ### getRandomFreeUnoccupiedSquare

    public static [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getRandomFreeUnoccupiedSquare([RandomizedZoneStoryBase](RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory") rzs,
    [Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone)
  + ### getRandomExtraFreeUnoccupiedSquare

    public static [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getRandomExtraFreeUnoccupiedSquare([RandomizedZoneStoryBase](RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory") rzs,
    [Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone)
  + ### getRandomFreeSquareFullZone

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getRandomFreeSquareFullZone([RandomizedZoneStoryBase](RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory") rzs,
    [Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone)
  + ### getRandomStory

    private static [RandomizedZoneStoryBase](RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory") getRandomStory()
  + ### checkCanSpawnStory

    private static boolean checkCanSpawnStory([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    boolean force)

    Check if the necessary zone size is fully streamed
  + ### randomizeZoneStory

    public void randomizeZoneStory([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone)
  + ### isValid

    public boolean isValid()
  + ### cleanAreaForStory

    public void cleanAreaForStory([RandomizedZoneStoryBase](RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory") rzs,
    [Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone)
  + ### cleanSquareForStory

    public static void cleanSquareForStory([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### getMinimumWidth

    public int getMinimumWidth()
  + ### getMinimumHeight

    public int getMinimumHeight()