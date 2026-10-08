[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.randomizedWorld.randomizedVehicleStory](package-summary.html)
2. [RandomizedVehicleStoryBase](RandomizedVehicleStoryBase.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [chance](#chance)
   2. [totalChance](#totalChance)
   3. [rvsMap](#rvsMap)
   4. [horizontalZone](#horizontalZone)
   5. [zoneWidth](#zoneWidth)
   6. [baseChance](#baseChance)
   7. [minX](#minX)
   8. [minY](#minY)
   9. [maxX](#maxX)
   10. [maxY](#maxY)
   11. [minZoneWidth](#minZoneWidth)
   12. [minZoneHeight](#minZoneHeight)
   13. [needsPavement](#needsPavement)
   14. [needsDirt](#needsDirt)
   15. [needsRegion](#needsRegion)
   16. [needsFarmland](#needsFarmland)
   17. [needsRuralVegetation](#needsRuralVegetation)
   18. [notTown](#notTown)
6. [Constructor Details](#constructor-detail)
   1. [RandomizedVehicleStoryBase()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [initAllRVSMapChance(Zone, IsoChunk)](#initAllRVSMapChance(zombie.iso.zones.Zone,zombie.iso.IsoChunk))
   2. [doRandomStory(Zone, IsoChunk, boolean)](#doRandomStory(zombie.iso.zones.Zone,zombie.iso.IsoChunk,boolean))
   3. [getRandomStory()](#getRandomStory())
   4. [getMinZoneWidth()](#getMinZoneWidth())
   5. [getMinZoneHeight()](#getMinZoneHeight())
   6. [randomizeVehicleStory(Zone, IsoChunk)](#randomizeVehicleStory(zombie.iso.zones.Zone,zombie.iso.IsoChunk))
   7. [getCenterOfChunk(Zone, IsoChunk)](#getCenterOfChunk(zombie.iso.zones.Zone,zombie.iso.IsoChunk))
   8. [isValid(Zone, IsoChunk, boolean)](#isValid(zombie.iso.zones.Zone,zombie.iso.IsoChunk,boolean))
   9. [initSpawnDataForChunk(Zone, IsoChunk)](#initSpawnDataForChunk(zombie.iso.zones.Zone,zombie.iso.IsoChunk))
   10. [getSpawnPoint(Zone, IsoChunk, float[])](#getSpawnPoint(zombie.iso.zones.Zone,zombie.iso.IsoChunk,float%5B%5D))
   11. [getRectangleSpawnPoint(Zone, IsoChunk, float[])](#getRectangleSpawnPoint(zombie.iso.zones.Zone,zombie.iso.IsoChunk,float%5B%5D))
   12. [getPolylineSpawnPoint(Zone, IsoChunk, float[])](#getPolylineSpawnPoint(zombie.iso.zones.Zone,zombie.iso.IsoChunk,float%5B%5D))
   13. [isFullyStreamedIn(int, int, int, int)](#isFullyStreamedIn(int,int,int,int))
   14. [isChunkLoaded(int, int)](#isChunkLoaded(int,int))
   15. [initVehicleStorySpawner(Zone, IsoChunk, boolean)](#initVehicleStorySpawner(zombie.iso.zones.Zone,zombie.iso.IsoChunk,boolean))
   16. [callVehicleStorySpawner(Zone, IsoChunk, float)](#callVehicleStorySpawner(zombie.iso.zones.Zone,zombie.iso.IsoChunk,float))
   17. [spawnElement(VehicleStorySpawner, VehicleStorySpawner.Element)](#spawnElement(zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawner,zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawner.Element))
   18. [addSmashedOverlay(BaseVehicle, BaseVehicle, int, int, boolean, boolean)](#addSmashedOverlay(zombie.vehicles.BaseVehicle,zombie.vehicles.BaseVehicle,int,int,boolean,boolean))
   19. [getChance()](#getChance())
   20. [setChance(int)](#setChance(int))
   21. [getMinimumDays()](#getMinimumDays())
   22. [setMinimumDays(int)](#setMinimumDays(int))
   23. [registerCustomOutfits()](#registerCustomOutfits())
   24. [getRandomFreeUnoccupiedSquare(RandomizedVehicleStoryBase, Zone, IsoGridSquare)](#getRandomFreeUnoccupiedSquare(zombie.randomizedWorld.randomizedVehicleStory.RandomizedVehicleStoryBase,zombie.iso.zones.Zone,zombie.iso.IsoGridSquare))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RandomizedVehicleStoryBase
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.randomizedWorld.RandomizedWorldBase](../RandomizedWorldBase.html "class in zombie.randomizedWorld")

zombie.randomizedWorld.randomizedVehicleStory.RandomizedVehicleStoryBase

Direct Known Subclasses:
:   `RVSAmbulanceCrash, RVSAnimalOnRoad, RVSAnimalTrailerOnRoad, RVSBanditRoad, RVSBurntCar, RVSCarCrash, RVSCarCrashCorpse, RVSCarCrashDeer, RVSChangingTire, RVSConstructionSite, RVSCrashHorde, RVSDeadEnd, RVSFlippedCrash, RVSHerdOnRoad, RVSPlonkies, RVSPoliceBlockade, RVSPoliceBlockadeShooting, RVSRegionalProfessionVehicle, RVSRichJerk, RVSRoadKill, RVSRoadKillSmall, RVSTrailerCrash, RVSUtilityVehicle`

---

public class RandomizedVehicleStoryBase
extends [RandomizedWorldBase](../RandomizedWorldBase.html "class in zombie.randomizedWorld")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static int`

  `baseChance`

  `private int`

  `chance`

  `protected boolean`

  `horizontalZone`

  `protected int`

  `maxX`

  `protected int`

  `maxY`

  `protected int`

  `minX`

  `protected int`

  `minY`

  `protected int`

  `minZoneHeight`

  `protected int`

  `minZoneWidth`

  `protected boolean`

  `needsDirt`

  `protected boolean`

  `needsFarmland`

  `protected boolean`

  `needsPavement`

  `protected boolean`

  `needsRegion`

  `protected boolean`

  `needsRuralVegetation`

  `protected boolean`

  `notTown`

  `private static final HashMap<RandomizedVehicleStoryBase, Integer>`

  `rvsMap`

  `private static int`

  `totalChance`

  `protected int`

  `zoneWidth`

  ### Fields inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#field-summary "class in zombie.randomizedWorld")

  `debugLine, isRat, maximumDays, minimumDays, minimumRooms, name, reallyAlwaysForce, unique`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RandomizedVehicleStoryBase()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `BaseVehicle[]`

  `addSmashedOverlay(BaseVehicle v1,
  BaseVehicle v2,
  int xOffset,
  int yOffset,
  boolean horizontalZone,
  boolean addBlood)`

  `boolean`

  `callVehicleStorySpawner(Zone zone,
  IsoChunk chunk,
  float additionalRotationRadians)`

  `static boolean`

  `doRandomStory(Zone zone,
  IsoChunk chunk,
  boolean force)`

  `IsoGridSquare`

  `getCenterOfChunk(Zone zone,
  IsoChunk chunk)`

  Get the center of the chunk according to the zone (so center of the 10x10
  chunk AND the zone)

  `int`

  `getChance()`

  `int`

  `getMinimumDays()`

  `int`

  `getMinZoneHeight()`

  `int`

  `getMinZoneWidth()`

  `boolean`

  `getPolylineSpawnPoint(Zone zone,
  IsoChunk chunk,
  float[] result)`

  `static IsoGridSquare`

  `getRandomFreeUnoccupiedSquare(RandomizedVehicleStoryBase rvs,
  Zone zone,
  IsoGridSquare sq1)`

  `private static RandomizedVehicleStoryBase`

  `getRandomStory()`

  `boolean`

  `getRectangleSpawnPoint(Zone zone,
  IsoChunk chunk,
  float[] result)`

  `boolean`

  `getSpawnPoint(Zone zone,
  IsoChunk chunk,
  float[] result)`

  `static void`

  `initAllRVSMapChance(Zone zone,
  IsoChunk chunk)`

  We init a map with every possible stories for this zone

  `zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawnData`

  `initSpawnDataForChunk(Zone zone,
  IsoChunk chunk)`

  `boolean`

  `initVehicleStorySpawner(Zone zone,
  IsoChunk chunk,
  boolean debug)`

  `boolean`

  `isChunkLoaded(int wx,
  int wy)`

  `boolean`

  `isFullyStreamedIn(int x1,
  int y1,
  int x2,
  int y2)`

  `boolean`

  `isValid(Zone zone,
  IsoChunk chunk,
  boolean force)`

  `void`

  `randomizeVehicleStory(Zone zone,
  IsoChunk chunk)`

  `void`

  `registerCustomOutfits()`

  `void`

  `setChance(int chance)`

  `void`

  `setMinimumDays(int minimumDays)`

  `void`

  `spawnElement(zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawner spawner,
  zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawner.Element element)`

  ### Methods inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#method-summary "class in zombie.randomizedWorld")

  `addBloodSplat, addBrazier, addCampfire, addCampfireOrPit, addCharcoalBurner, addCookingPit, addItemOnGround, addItemOnGround, addItemOnGround, addItemOnGroundNoLoot, addItemOnGroundNoLoot, addItemOnGroundStatic, addItemOnGroundStatic, addItemToObjectSurface, addMattressNorthSouth, addMattressWestEast, addRandomFirepit, addRandomItemOnGround, addRandomItemsOnGround, addRandomItemsOnGround, addRandomShelterNorthSouth, addRandomShelterWestEast, addRandomTentNorthSouth, addRandomTentWestEast, addShelterNorthSouth, addShelterWestEast, addSimpleCookingPit, addSimpleFire, addSleepingBagNorthSouth, addSleepingBagOrTentNorthSouth, addSleepingBagOrTentWestEast, addSleepingBagWestEast, addTentNorthSouth, addTentNorthSouthNew, addTentWestEast, addTentWestEastNew, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTrailer, addTrailOfBlood, addTraitOfBlood, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicleFlipped, addVehicleFlipped, addWeapon, addWorkstationEntity, addWorkstationEntity, addZombiesOnSquare, addZombiesOnVehicle, alignCorpseToSquare, checkAreaForCarsSpawn, checkRadiusForCarSpawn, cleanSquareAndNeighbors, createBodyFromZombie, createCorpse, createCorpse, createCorpse, createCorpse, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomZombie, createRandomZombie, createRandomZombieForCorpse, createSkeletonCorpse, createSkeletonCorpse, dirtBomb, getBarnClutter, getBarnClutterItem, getBathroomSinkClutter, getBathroomSinkClutterItem, getBBQClutter, getBBQClutterItem, getBeachPartyClutter, getBeachPartyClutterItem, getBedClutter, getBedClutterItem, getCafeClutter, getCafeClutterItem, getCarpentryToolClutter, getCarpentryToolClutterItem, getClutterCopy, getClutterCopy, getClutterItem, getDeadEndClutter, getDeadEndClutterItem, getDebugLine, getDormClutter, getDormClutterItem, getFarmStorageClutter, getFarmStorageClutterItem, getFootballNightDrinkItem, getFootballNightDrinks, getFootballNightSnackItem, getFootballNightSnacks, getGarageStorageClutter, getGarageStorageClutterItem, getGigamartClutter, getGigamartClutterItem, getGroceryClutter, getGroceryClutterItem, getHairSalonClutter, getHairSalonClutterItem, getHallClutter, getHallClutterItem, getHenDoDrinkItem, getHenDoDrinks, getHenDoSnackItem, getHenDoSnacks, getHoedownClutter, getHoedownClutterItem, getHousePartyClutter, getHousePartyClutterItem, getJudgeClutter, getJudgeClutterItem, getKidClutter, getKidClutterItem, getKitchenCounterClutter, getKitchenCounterClutterItem, getKitchenSinkClutter, getKitchenSinkClutterItem, getKitchenStoveClutter, getKitchenStoveClutterItem, getLaundryRoomClutter, getLaundryRoomClutterItem, getLivingroomClutter, getLivingroomClutterItem, getLivingRoomOrKitchen, getMaximumDays, getMedicalClutter, getMedicallutterItem, getMurderSceneClutter, getMurderSceneClutterItem, getName, getNastyMattressClutter, getNastyMattressClutterItem, getOfficeCarDealerClutter, getOfficeCarDealerClutterItem, getOfficeOtherClutter, getOfficeOtherClutterItem, getOfficePaperworkClutter, getOfficePaperworkClutterItem, getOfficePenClutter, getOfficePenClutterItem, getOfficeTreatClutter, getOfficeTreatClutterItem, getOldShelterClutter, getOldShelterClutterItem, getOvenFoodClutter, getOvenFoodClutterItem, getPillowClutter, getPillowClutterItem, getPokerNightClutter, getPokerNightClutterItem, getRandomRoom, getRandomRoomNoKids, getRandomSpawnSquare, getRandomSquareForCorpse, getRichJerkClutter, getRichJerkClutterItem, getRoom, getRoomNoKids, getSadCampsiteClutter, getSadCampsiteClutterItem, getSidetableClutter, getSidetableClutterItem, getSq, getSurvivalistCampsiteClutter, getSurvivalistCampsiteClutterItem, getTwiggyClutter, getTwiggyClutterItem, getUtilityToolClutter, getUtilityToolClutterItem, getVanCampClutter, getVanCampClutterItem, getWatchClutter, getWatchClutterItem, getWoodcraftClutter, getWoodcraftClutterItem, graffSquare, graffSquare, is1x1AreaClear, is1x2AreaClear, is2x1AreaClear, is2x1or1x2AreaClear, is2x2AreaClear, isRat, isTimeValid, isUnique, isValidGraffSquare, removeAllVehiclesOnZone, setAttachedItem, setDebugLine, setMaximumDays, setUnique, spawnCarOnNearestNav, spawnCarOnNearestNav, trashSquare, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### chance

    private int chance
  + ### totalChance

    private static int totalChance
  + ### rvsMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[RandomizedVehicleStoryBase](RandomizedVehicleStoryBase.html "class in zombie.randomizedWorld.randomizedVehicleStory"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> rvsMap
  + ### horizontalZone

    protected boolean horizontalZone
  + ### zoneWidth

    protected int zoneWidth
  + ### baseChance

    public static int baseChance
  + ### minX

    protected int minX
  + ### minY

    protected int minY
  + ### maxX

    protected int maxX
  + ### maxY

    protected int maxY
  + ### minZoneWidth

    protected int minZoneWidth
  + ### minZoneHeight

    protected int minZoneHeight
  + ### needsPavement

    protected boolean needsPavement
  + ### needsDirt

    protected boolean needsDirt
  + ### needsRegion

    protected boolean needsRegion
  + ### needsFarmland

    protected boolean needsFarmland
  + ### needsRuralVegetation

    protected boolean needsRuralVegetation
  + ### notTown

    protected boolean notTown
* Constructor Details
  -------------------

  + ### RandomizedVehicleStoryBase

    public RandomizedVehicleStoryBase()
* Method Details
  --------------

  + ### initAllRVSMapChance

    public static void initAllRVSMapChance([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk)

    We init a map with every possible stories for this zone
  + ### doRandomStory

    public static boolean doRandomStory([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk,
    boolean force)
  + ### getRandomStory

    private static [RandomizedVehicleStoryBase](RandomizedVehicleStoryBase.html "class in zombie.randomizedWorld.randomizedVehicleStory") getRandomStory()
  + ### getMinZoneWidth

    public int getMinZoneWidth()
  + ### getMinZoneHeight

    public int getMinZoneHeight()
  + ### randomizeVehicleStory

    public void randomizeVehicleStory([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk)
  + ### getCenterOfChunk

    public [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getCenterOfChunk([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk)

    Get the center of the chunk according to the zone (so center of the 10x10
    chunk AND the zone)
  + ### isValid

    public boolean isValid([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk,
    boolean force)
  + ### initSpawnDataForChunk

    public zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawnData initSpawnDataForChunk([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk)
  + ### getSpawnPoint

    public boolean getSpawnPoint([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk,
    float[] result)
  + ### getRectangleSpawnPoint

    public boolean getRectangleSpawnPoint([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk,
    float[] result)
  + ### getPolylineSpawnPoint

    public boolean getPolylineSpawnPoint([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk,
    float[] result)
  + ### isFullyStreamedIn

    public boolean isFullyStreamedIn(int x1,
    int y1,
    int x2,
    int y2)
  + ### isChunkLoaded

    public boolean isChunkLoaded(int wx,
    int wy)
  + ### initVehicleStorySpawner

    public boolean initVehicleStorySpawner([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk,
    boolean debug)
  + ### callVehicleStorySpawner

    public boolean callVehicleStorySpawner([Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoChunk](../../iso/IsoChunk.html "class in zombie.iso") chunk,
    float additionalRotationRadians)
  + ### spawnElement

    public void spawnElement(zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawner spawner,
    zombie.randomizedWorld.randomizedVehicleStory.VehicleStorySpawner.Element element)
  + ### addSmashedOverlay

    public [BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles")[] addSmashedOverlay([BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles") v1,
    [BaseVehicle](../../vehicles/BaseVehicle.html "class in zombie.vehicles") v2,
    int xOffset,
    int yOffset,
    boolean horizontalZone,
    boolean addBlood)
  + ### getChance

    public int getChance()
  + ### setChance

    public void setChance(int chance)
  + ### getMinimumDays

    public int getMinimumDays()
  + ### setMinimumDays

    public void setMinimumDays(int minimumDays)
  + ### registerCustomOutfits

    public void registerCustomOutfits()
  + ### getRandomFreeUnoccupiedSquare

    public static [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") getRandomFreeUnoccupiedSquare([RandomizedVehicleStoryBase](RandomizedVehicleStoryBase.html "class in zombie.randomizedWorld.randomizedVehicleStory") rvs,
    [Zone](../../iso/zones/Zone.html "class in zombie.iso.zones") zone,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq1)