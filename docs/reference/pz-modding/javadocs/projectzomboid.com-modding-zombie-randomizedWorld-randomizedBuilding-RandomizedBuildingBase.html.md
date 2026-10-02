[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.randomizedWorld.randomizedBuilding](package-summary.html)
2. [RandomizedBuildingBase](RandomizedBuildingBase.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [chance](#chance)
   2. [totalChance](#totalChance)
   3. [rbMap](#rbMap)
   4. [KBBuildingX](#KBBuildingX)
   5. [KBBuildingY](#KBBuildingY)
   6. [alwaysDo](#alwaysDo)
   7. [maximumRoomCount](#maximumRoomCount)
   8. [weaponsList](#weaponsList)
7. [Constructor Details](#constructor-detail)
   1. [RandomizedBuildingBase()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [randomizeBuilding(BuildingDef)](#randomizeBuilding(zombie.iso.BuildingDef))
   2. [init()](#init())
   3. [initAllRBMapChance()](#initAllRBMapChance())
   4. [isValid(BuildingDef, boolean)](#isValid(zombie.iso.BuildingDef,boolean))
   5. [customizeStartingHouse(BuildingDef)](#customizeStartingHouse(zombie.iso.BuildingDef))
   6. [getMinimumDays()](#getMinimumDays())
   7. [setMinimumDays(int)](#setMinimumDays(int))
   8. [getMinimumRooms()](#getMinimumRooms())
   9. [setMinimumRooms(int)](#setMinimumRooms(int))
   10. [ChunkLoaded(IsoBuilding)](#ChunkLoaded(zombie.iso.areas.IsoBuilding))
   11. [getChance()](#getChance())
   12. [getChance(IsoGridSquare)](#getChance(zombie.iso.IsoGridSquare))
   13. [setChance(int)](#setChance(int))
   14. [isAlwaysDo()](#isAlwaysDo())
   15. [setAlwaysDo(boolean)](#setAlwaysDo(boolean))
   16. [getRandomStory()](#getRandomStory())
   17. [addZombiesOnSquare(int, String, Integer, IsoGridSquare)](#addZombiesOnSquare(int,java.lang.String,java.lang.Integer,zombie.iso.IsoGridSquare))
   18. [addZombies(BuildingDef, int, String, Integer, RoomDef)](#addZombies(zombie.iso.BuildingDef,int,java.lang.String,java.lang.Integer,zombie.iso.RoomDef))
   19. [addRandomRangedWeapon(ItemContainer, boolean, boolean, boolean)](#addRandomRangedWeapon(zombie.inventory.ItemContainer,boolean,boolean,boolean))
   20. [spawnItemsInContainers(BuildingDef, String, int)](#spawnItemsInContainers(zombie.iso.BuildingDef,java.lang.String,int))
   21. [removeAllZombies(BuildingDef)](#removeAllZombies(zombie.iso.BuildingDef))
   22. [getWindow(IsoGridSquare)](#getWindow(zombie.iso.IsoGridSquare))
   23. [getDoor(IsoGridSquare)](#getDoor(zombie.iso.IsoGridSquare))
   24. [addBarricade(IsoGridSquare, int)](#addBarricade(zombie.iso.IsoGridSquare,int))
   25. [addWorldItem(String, IsoGridSquare, float, float, float)](#addWorldItem(java.lang.String,zombie.iso.IsoGridSquare,float,float,float))
   26. [addWorldItem(String, IsoGridSquare, float, float, float, boolean)](#addWorldItem(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,boolean))
   27. [addWorldItem(String, IsoGridSquare, float, float, float, int)](#addWorldItem(java.lang.String,zombie.iso.IsoGridSquare,float,float,float,int))
   28. [addWorldItem(String, IsoGridSquare, IsoObject)](#addWorldItem(java.lang.String,zombie.iso.IsoGridSquare,zombie.iso.IsoObject))
   29. [addWorldItem(String, IsoGridSquare, IsoObject, boolean)](#addWorldItem(java.lang.String,zombie.iso.IsoGridSquare,zombie.iso.IsoObject,boolean))
   30. [isTableFor3DItems(IsoObject, IsoGridSquare)](#isTableFor3DItems(zombie.iso.IsoObject,zombie.iso.IsoGridSquare))
   31. [trySpawnStoryItem(String, IsoGridSquare, IsoObject)](#trySpawnStoryItem(java.lang.String,zombie.iso.IsoGridSquare,zombie.iso.IsoObject))
   32. [getBuildingObjectsSimple(BuildingDef)](#getBuildingObjectsSimple(zombie.iso.BuildingDef))
   33. [getBuildingObjects(BuildingDef)](#getBuildingObjects(zombie.iso.BuildingDef))
   34. [getBuildingSquares(BuildingDef)](#getBuildingSquares(zombie.iso.BuildingDef))
   35. [getRectSquares(RoomDef.RoomRect, RoomDef)](#getRectSquares(zombie.iso.RoomDef.RoomRect,zombie.iso.RoomDef))
   36. [setWorldRotation(InventoryItem, float, float, float)](#setWorldRotation(zombie.inventory.InventoryItem,float,float,float))
   37. [addClip(HandWeapon)](#addClip(zombie.inventory.types.HandWeapon))
   38. [spawnPistol(ItemKey)](#spawnPistol(zombie.scripting.objects.ItemKey))
   39. [spawnRifle(ItemKey)](#spawnRifle(zombie.scripting.objects.ItemKey))
   40. [doGunShelfRifles(boolean, IsoGridSquare, WeightedList, int)](#doGunShelfRifles(boolean,zombie.iso.IsoGridSquare,zombie.util.list.WeightedList,int))
   41. [doGunShelfHandguns(boolean, IsoGridSquare, WeightedList, WeightedList, int, int)](#doGunShelfHandguns(boolean,zombie.iso.IsoGridSquare,zombie.util.list.WeightedList,zombie.util.list.WeightedList,int,int))
   42. [doAmmoCans(PropertyContainer, boolean, boolean, boolean, IsoGridSquare, WeightedList)](#doAmmoCans(zombie.core.properties.PropertyContainer,boolean,boolean,boolean,zombie.iso.IsoGridSquare,zombie.util.list.WeightedList))
   43. [doHandgunCounterDisplay(boolean, boolean, boolean, IsoGridSquare, WeightedList)](#doHandgunCounterDisplay(boolean,boolean,boolean,zombie.iso.IsoGridSquare,zombie.util.list.WeightedList))
   44. [doRifleCounterDisplay(boolean, boolean, boolean, IsoGridSquare, WeightedList)](#doRifleCounterDisplay(boolean,boolean,boolean,zombie.iso.IsoGridSquare,zombie.util.list.WeightedList))
   45. [doCounterAmmoDisplay(boolean, boolean, boolean, IsoGridSquare, WeightedList)](#doCounterAmmoDisplay(boolean,boolean,boolean,zombie.iso.IsoGridSquare,zombie.util.list.WeightedList))
   46. [doCornerAmmoCans(boolean, boolean, boolean, IsoGridSquare, WeightedList, WeightedList)](#doCornerAmmoCans(boolean,boolean,boolean,zombie.iso.IsoGridSquare,zombie.util.list.WeightedList,zombie.util.list.WeightedList))
   47. [doBodyArmor(boolean, IsoGridSquare, ItemKey, int)](#doBodyArmor(boolean,zombie.iso.IsoGridSquare,zombie.scripting.objects.ItemKey,int))
   48. [spawnBodyArmor(InventoryItem, IsoGridSquare, float, float, float, int)](#spawnBodyArmor(zombie.inventory.InventoryItem,zombie.iso.IsoGridSquare,float,float,float,int))
   49. [rollWeaponUpgrades(HandWeapon)](#rollWeaponUpgrades(zombie.inventory.types.HandWeapon))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class RandomizedBuildingBase
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.randomizedWorld.RandomizedWorldBase](../RandomizedWorldBase.html "class in zombie.randomizedWorld")

zombie.randomizedWorld.randomizedBuilding.RandomizedBuildingBase

Direct Known Subclasses:
:   `RandomizedDeadSurvivorBase, RBBar, RBBarn, RBBasic, RBBurnt, RBBurntCorpse, RBBurntFireman, RBCafe, RBClinic, RBDorm, RBGunstoreSiege, RBHairSalon, RBHeatBreakAfternoon, RBJackieJaye, RBJoanHartford, RBJudge, RBKateAndBaldspot, RBLooted, RBMayorWestPoint, RBNolans, RBOffice, RBOther, RBPileOCrepe, RBPizzaWhirled, RBPoliceSiege, RBReverend, RBSafehouse, RBSchool, RBShopLooted, RBSpiffo, RBStripclub, RBTrashed, RBTwiggy, RBWoodcraft`

---

public class RandomizedBuildingBase
extends [RandomizedWorldBase](../RandomizedWorldBase.html "class in zombie.randomizedWorld")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `RandomizedBuildingBase.HumanCorpse`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `alwaysDo`

  `private int`

  `chance`

  `protected static final int`

  `KBBuildingX`

  `protected static final int`

  `KBBuildingY`

  `static int`

  `maximumRoomCount`

  `private static final HashMap<RandomizedBuildingBase, Integer>`

  `rbMap`

  `private static int`

  `totalChance`

  `private static final HashMap<String,String>`

  `weaponsList`

  ### Fields inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#field-summary "class in zombie.randomizedWorld")

  `debugLine, isRat, maximumDays, minimumDays, minimumRooms, name, reallyAlwaysForce, unique`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RandomizedBuildingBase()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addBarricade(IsoGridSquare sq,
  int numPlanks)`

  `static void`

  `addClip(HandWeapon gun)`

  `HandWeapon`

  `addRandomRangedWeapon(ItemContainer container,
  boolean addBulletsInGun,
  boolean addBoxInContainer,
  boolean attachPart)`

  `InventoryItem`

  `addWorldItem(String item,
  IsoGridSquare sq,
  float xoffset,
  float yoffset,
  float zoffset)`

  `InventoryItem`

  `addWorldItem(String item,
  IsoGridSquare sq,
  float xoffset,
  float yoffset,
  float zoffset,
  boolean randomRotation)`

  `InventoryItem`

  `addWorldItem(String item,
  IsoGridSquare sq,
  float xoffset,
  float yoffset,
  float zoffset,
  int worldZ)`

  `InventoryItem`

  `addWorldItem(String item,
  IsoGridSquare sq,
  IsoObject obj)`

  `InventoryItem`

  `addWorldItem(String item,
  IsoGridSquare sq,
  IsoObject obj,
  boolean randomRotation)`

  `ArrayList<IsoZombie>`

  `addZombies(BuildingDef def,
  int totalZombies,
  String outfit,
  Integer femaleChance,
  RoomDef room)`

  If you specify a outfit, make sure it works for both gender! (or force
  femaleChance to 0 or 1 if it's gender-specific)

  `ArrayList<IsoZombie>`

  `addZombiesOnSquare(int totalZombies,
  String outfit,
  Integer femaleChance,
  IsoGridSquare square)`

  `static void`

  `ChunkLoaded(IsoBuilding building)`

  `private void`

  `customizeStartingHouse(BuildingDef def)`

  Add barricade and sheets in windows if it's normal, hard or survival game
  mode Also remove some zombies around the spawn house to have a more fair
  start

  `static void`

  `doAmmoCans(PropertyContainer props,
  boolean facingE,
  boolean facingW,
  boolean facingN,
  IsoGridSquare sq,
  zombie.util.list.WeightedList<ItemKey> ammoCans)`

  `static void`

  `doBodyArmor(boolean facingE,
  IsoGridSquare sq,
  ItemKey vestType,
  int spawnChance)`

  `static void`

  `doCornerAmmoCans(boolean facingE,
  boolean facingW,
  boolean facingN,
  IsoGridSquare sq,
  zombie.util.list.WeightedList<ItemKey> ammoCases,
  zombie.util.list.WeightedList<ItemKey> ammoCans)`

  `static void`

  `doCounterAmmoDisplay(boolean facingE,
  boolean facingW,
  boolean facingN,
  IsoGridSquare sq,
  zombie.util.list.WeightedList<ItemKey> ammoBoxes)`

  `static void`

  `doGunShelfHandguns(boolean facingE,
  IsoGridSquare sq,
  zombie.util.list.WeightedList<ItemKey> pistolTypes,
  zombie.util.list.WeightedList<ItemKey> rifleTypes,
  int spawnChancePistol,
  int spawnChanceRifle)`

  `static void`

  `doGunShelfRifles(boolean facingE,
  IsoGridSquare sq,
  zombie.util.list.WeightedList<ItemKey> rifleTypes,
  int spawnChance)`

  `static void`

  `doHandgunCounterDisplay(boolean facingE,
  boolean facingW,
  boolean facingN,
  IsoGridSquare sq,
  zombie.util.list.WeightedList<ItemKey> pistolTypes)`

  `static void`

  `doRifleCounterDisplay(boolean facingE,
  boolean facingW,
  boolean facingN,
  IsoGridSquare sq,
  zombie.util.list.WeightedList<ItemKey> rifleTypes)`

  `static ArrayList<IsoObject>`

  `getBuildingObjects(BuildingDef def)`

  `static ArrayList<IsoObject>`

  `getBuildingObjectsSimple(BuildingDef def)`

  `static ArrayList<IsoGridSquare>`

  `getBuildingSquares(BuildingDef def)`

  `int`

  `getChance()`

  `int`

  `getChance(IsoGridSquare sq)`

  `IsoDoor`

  `getDoor(IsoGridSquare sq)`

  `int`

  `getMinimumDays()`

  `int`

  `getMinimumRooms()`

  `private static RandomizedBuildingBase`

  `getRandomStory()`

  `static ArrayList<IsoGridSquare>`

  `getRectSquares(RoomDef.RoomRect rect,
  RoomDef room)`

  `IsoWindow`

  `getWindow(IsoGridSquare sq)`

  `void`

  `init()`

  `static void`

  `initAllRBMapChance()`

  `boolean`

  `isAlwaysDo()`

  `boolean`

  `isTableFor3DItems(IsoObject obj,
  IsoGridSquare sq)`

  `boolean`

  `isValid(BuildingDef def,
  boolean force)`

  Don't do any building change in a player's building Also check if the
  building have a bathroom, a kitchen and a bedroom
  This is ignored for the alwaysDo building (so i can do stuff in spiffo, pizzawhirled, etc..)

  `void`

  `randomizeBuilding(BuildingDef def)`

  `protected void`

  `removeAllZombies(BuildingDef def)`

  `private static void`

  `rollWeaponUpgrades(HandWeapon gun)`

  `void`

  `setAlwaysDo(boolean alwaysDo)`

  `void`

  `setChance(int chance)`

  `void`

  `setMinimumDays(int minimumDays)`

  `void`

  `setMinimumRooms(int minimumRooms)`

  `static void`

  `setWorldRotation(InventoryItem item,
  float xRotation,
  float yRotation,
  float zRotation)`

  `static void`

  `spawnBodyArmor(InventoryItem vest,
  IsoGridSquare sq,
  float xOffset,
  float yOffset,
  float zOffset,
  int spawnChance)`

  `void`

  `spawnItemsInContainers(BuildingDef def,
  String distribName,
  int chance)`

  `static HandWeapon`

  `spawnPistol(ItemKey gunType)`

  `static HandWeapon`

  `spawnRifle(ItemKey gunType)`

  `InventoryItem`

  `trySpawnStoryItem(String itemType,
  IsoGridSquare square,
  IsoObject obj)`

  ### Methods inherited from class [RandomizedWorldBase](../RandomizedWorldBase.html#method-summary "class in zombie.randomizedWorld")

  `addBloodSplat, addBrazier, addCampfire, addCampfireOrPit, addCharcoalBurner, addCookingPit, addItemOnGround, addItemOnGround, addItemOnGround, addItemOnGroundNoLoot, addItemOnGroundNoLoot, addItemOnGroundStatic, addItemOnGroundStatic, addItemToObjectSurface, addMattressNorthSouth, addMattressWestEast, addRandomFirepit, addRandomItemOnGround, addRandomItemsOnGround, addRandomItemsOnGround, addRandomShelterNorthSouth, addRandomShelterWestEast, addRandomTentNorthSouth, addRandomTentWestEast, addShelterNorthSouth, addShelterWestEast, addSimpleCookingPit, addSimpleFire, addSleepingBagNorthSouth, addSleepingBagOrTentNorthSouth, addSleepingBagOrTentWestEast, addSleepingBagWestEast, addTentNorthSouth, addTentNorthSouthNew, addTentWestEast, addTentWestEastNew, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTileObject, addTrailer, addTrailOfBlood, addTraitOfBlood, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicle, addVehicleFlipped, addVehicleFlipped, addWeapon, addWorkstationEntity, addWorkstationEntity, addZombiesOnVehicle, alignCorpseToSquare, checkAreaForCarsSpawn, checkRadiusForCarSpawn, cleanSquareAndNeighbors, createBodyFromZombie, createCorpse, createCorpse, createCorpse, createCorpse, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomDeadBody, createRandomZombie, createRandomZombie, createRandomZombieForCorpse, createSkeletonCorpse, createSkeletonCorpse, dirtBomb, getBarnClutter, getBarnClutterItem, getBathroomSinkClutter, getBathroomSinkClutterItem, getBBQClutter, getBBQClutterItem, getBeachPartyClutter, getBeachPartyClutterItem, getBedClutter, getBedClutterItem, getCafeClutter, getCafeClutterItem, getCarpentryToolClutter, getCarpentryToolClutterItem, getClutterCopy, getClutterCopy, getClutterItem, getDeadEndClutter, getDeadEndClutterItem, getDebugLine, getDormClutter, getDormClutterItem, getFarmStorageClutter, getFarmStorageClutterItem, getFootballNightDrinkItem, getFootballNightDrinks, getFootballNightSnackItem, getFootballNightSnacks, getGarageStorageClutter, getGarageStorageClutterItem, getGigamartClutter, getGigamartClutterItem, getGroceryClutter, getGroceryClutterItem, getHairSalonClutter, getHairSalonClutterItem, getHallClutter, getHallClutterItem, getHenDoDrinkItem, getHenDoDrinks, getHenDoSnackItem, getHenDoSnacks, getHoedownClutter, getHoedownClutterItem, getHousePartyClutter, getHousePartyClutterItem, getJudgeClutter, getJudgeClutterItem, getKidClutter, getKidClutterItem, getKitchenCounterClutter, getKitchenCounterClutterItem, getKitchenSinkClutter, getKitchenSinkClutterItem, getKitchenStoveClutter, getKitchenStoveClutterItem, getLaundryRoomClutter, getLaundryRoomClutterItem, getLivingroomClutter, getLivingroomClutterItem, getLivingRoomOrKitchen, getMaximumDays, getMedicalClutter, getMedicallutterItem, getMurderSceneClutter, getMurderSceneClutterItem, getName, getNastyMattressClutter, getNastyMattressClutterItem, getOfficeCarDealerClutter, getOfficeCarDealerClutterItem, getOfficeOtherClutter, getOfficeOtherClutterItem, getOfficePaperworkClutter, getOfficePaperworkClutterItem, getOfficePenClutter, getOfficePenClutterItem, getOfficeTreatClutter, getOfficeTreatClutterItem, getOldShelterClutter, getOldShelterClutterItem, getOvenFoodClutter, getOvenFoodClutterItem, getPillowClutter, getPillowClutterItem, getPokerNightClutter, getPokerNightClutterItem, getRandomRoom, getRandomRoomNoKids, getRandomSpawnSquare, getRandomSquareForCorpse, getRichJerkClutter, getRichJerkClutterItem, getRoom, getRoomNoKids, getSadCampsiteClutter, getSadCampsiteClutterItem, getSidetableClutter, getSidetableClutterItem, getSq, getSurvivalistCampsiteClutter, getSurvivalistCampsiteClutterItem, getTwiggyClutter, getTwiggyClutterItem, getUtilityToolClutter, getUtilityToolClutterItem, getVanCampClutter, getVanCampClutterItem, getWatchClutter, getWatchClutterItem, getWoodcraftClutter, getWoodcraftClutterItem, graffSquare, graffSquare, is1x1AreaClear, is1x2AreaClear, is2x1AreaClear, is2x1or1x2AreaClear, is2x2AreaClear, isRat, isTimeValid, isUnique, isValidGraffSquare, removeAllVehiclesOnZone, setAttachedItem, setDebugLine, setMaximumDays, setUnique, spawnCarOnNearestNav, spawnCarOnNearestNav, trashSquare, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem, trySpawnStoryItem`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### chance

    private int chance
  + ### totalChance

    private static int totalChance
  + ### rbMap

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[RandomizedBuildingBase](RandomizedBuildingBase.html "class in zombie.randomizedWorld.randomizedBuilding"), [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> rbMap
  + ### KBBuildingX

    protected static final int KBBuildingX

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedBuilding.RandomizedBuildingBase.KBBuildingX)
  + ### KBBuildingY

    protected static final int KBBuildingY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.randomizedWorld.randomizedBuilding.RandomizedBuildingBase.KBBuildingY)
  + ### alwaysDo

    private boolean alwaysDo
  + ### maximumRoomCount

    public static int maximumRoomCount
  + ### weaponsList

    private static final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> weaponsList
* Constructor Details
  -------------------

  + ### RandomizedBuildingBase

    public RandomizedBuildingBase()
* Method Details
  --------------

  + ### randomizeBuilding

    public void randomizeBuilding([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)
  + ### init

    public void init()
  + ### initAllRBMapChance

    public static void initAllRBMapChance()
  + ### isValid

    public boolean isValid([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def,
    boolean force)

    Don't do any building change in a player's building Also check if the
    building have a bathroom, a kitchen and a bedroom
    This is ignored for the alwaysDo building (so i can do stuff in spiffo, pizzawhirled, etc..)
  + ### customizeStartingHouse

    private void customizeStartingHouse([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)

    Add barricade and sheets in windows if it's normal, hard or survival game
    mode Also remove some zombies around the spawn house to have a more fair
    start
  + ### getMinimumDays

    public int getMinimumDays()
  + ### setMinimumDays

    public void setMinimumDays(int minimumDays)
  + ### getMinimumRooms

    public int getMinimumRooms()
  + ### setMinimumRooms

    public void setMinimumRooms(int minimumRooms)
  + ### ChunkLoaded

    public static void ChunkLoaded([IsoBuilding](../../iso/areas/IsoBuilding.html "class in zombie.iso.areas") building)
  + ### getChance

    public int getChance()
  + ### getChance

    public int getChance([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### setChance

    public void setChance(int chance)
  + ### isAlwaysDo

    public boolean isAlwaysDo()
  + ### setAlwaysDo

    public void setAlwaysDo(boolean alwaysDo)
  + ### getRandomStory

    private static [RandomizedBuildingBase](RandomizedBuildingBase.html "class in zombie.randomizedWorld.randomizedBuilding") getRandomStory()
  + ### addZombiesOnSquare

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../../characters/IsoZombie.html "class in zombie.characters")> addZombiesOnSquare(int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square)

    Overrides:
    :   `addZombiesOnSquare` in class `RandomizedWorldBase`
  + ### addZombies

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](../../characters/IsoZombie.html "class in zombie.characters")> addZombies([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def,
    int totalZombies,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit,
    [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") femaleChance,
    [RoomDef](../../iso/RoomDef.html "class in zombie.iso") room)

    If you specify a outfit, make sure it works for both gender! (or force
    femaleChance to 0 or 1 if it's gender-specific)

    Parameters:
    :   `def` - buildingDef
    :   `totalZombies` - zombies to spawn (if 0 we gonna randomize it)
    :   `outfit` - force zombies spanwed in a specific outfit (not mandatory)
    :   `femaleChance` - force female zombies (if not set it'll be 50% chance, you can set
        it to 0 to exclude female from spawning, or 100 to force only
        female)
    :   `room` - force spawn zombies inside a certain room (not mandatory)
  + ### addRandomRangedWeapon

    public [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") addRandomRangedWeapon([ItemContainer](../../inventory/ItemContainer.html "class in zombie.inventory") container,
    boolean addBulletsInGun,
    boolean addBoxInContainer,
    boolean attachPart)
  + ### spawnItemsInContainers

    public void spawnItemsInContainers([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") distribName,
    int chance)
  + ### removeAllZombies

    protected void removeAllZombies([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)
  + ### getWindow

    public [IsoWindow](../../iso/objects/IsoWindow.html "class in zombie.iso.objects") getWindow([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### getDoor

    public [IsoDoor](../../iso/objects/IsoDoor.html "class in zombie.iso.objects") getDoor([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### addBarricade

    public void addBarricade([IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    int numPlanks)
  + ### addWorldItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") addWorldItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    float xoffset,
    float yoffset,
    float zoffset)
  + ### addWorldItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") addWorldItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    float xoffset,
    float yoffset,
    float zoffset,
    boolean randomRotation)
  + ### addWorldItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") addWorldItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    float xoffset,
    float yoffset,
    float zoffset,
    int worldZ)
  + ### addWorldItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") addWorldItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") obj)
  + ### addWorldItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") addWorldItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") item,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") obj,
    boolean randomRotation)
  + ### isTableFor3DItems

    public boolean isTableFor3DItems([IsoObject](../../iso/IsoObject.html "class in zombie.iso") obj,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### trySpawnStoryItem

    public [InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") trySpawnStoryItem([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") itemType,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") square,
    [IsoObject](../../iso/IsoObject.html "class in zombie.iso") obj)
  + ### getBuildingObjectsSimple

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../../iso/IsoObject.html "class in zombie.iso")> getBuildingObjectsSimple([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)
  + ### getBuildingObjects

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoObject](../../iso/IsoObject.html "class in zombie.iso")> getBuildingObjects([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)
  + ### getBuildingSquares

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso")> getBuildingSquares([BuildingDef](../../iso/BuildingDef.html "class in zombie.iso") def)
  + ### getRectSquares

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso")> getRectSquares([RoomDef.RoomRect](../../iso/RoomDef.RoomRect.html "class in zombie.iso") rect,
    [RoomDef](../../iso/RoomDef.html "class in zombie.iso") room)
  + ### setWorldRotation

    public static void setWorldRotation([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") item,
    float xRotation,
    float yRotation,
    float zRotation)
  + ### addClip

    public static void addClip([HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") gun)
  + ### spawnPistol

    public static [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") spawnPistol([ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects") gunType)
  + ### spawnRifle

    public static [HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") spawnRifle([ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects") gunType)
  + ### doGunShelfRifles

    public static void doGunShelfRifles(boolean facingE,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    zombie.util.list.WeightedList<[ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects")> rifleTypes,
    int spawnChance)
  + ### doGunShelfHandguns

    public static void doGunShelfHandguns(boolean facingE,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    zombie.util.list.WeightedList<[ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects")> pistolTypes,
    zombie.util.list.WeightedList<[ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects")> rifleTypes,
    int spawnChancePistol,
    int spawnChanceRifle)
  + ### doAmmoCans

    public static void doAmmoCans([PropertyContainer](../../core/properties/PropertyContainer.html "class in zombie.core.properties") props,
    boolean facingE,
    boolean facingW,
    boolean facingN,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    zombie.util.list.WeightedList<[ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects")> ammoCans)
  + ### doHandgunCounterDisplay

    public static void doHandgunCounterDisplay(boolean facingE,
    boolean facingW,
    boolean facingN,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    zombie.util.list.WeightedList<[ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects")> pistolTypes)
  + ### doRifleCounterDisplay

    public static void doRifleCounterDisplay(boolean facingE,
    boolean facingW,
    boolean facingN,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    zombie.util.list.WeightedList<[ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects")> rifleTypes)
  + ### doCounterAmmoDisplay

    public static void doCounterAmmoDisplay(boolean facingE,
    boolean facingW,
    boolean facingN,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    zombie.util.list.WeightedList<[ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects")> ammoBoxes)
  + ### doCornerAmmoCans

    public static void doCornerAmmoCans(boolean facingE,
    boolean facingW,
    boolean facingN,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    zombie.util.list.WeightedList<[ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects")> ammoCases,
    zombie.util.list.WeightedList<[ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects")> ammoCans)
  + ### doBodyArmor

    public static void doBodyArmor(boolean facingE,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    [ItemKey](../../scripting/objects/ItemKey.html "class in zombie.scripting.objects") vestType,
    int spawnChance)
  + ### spawnBodyArmor

    public static void spawnBodyArmor([InventoryItem](../../inventory/InventoryItem.html "class in zombie.inventory") vest,
    [IsoGridSquare](../../iso/IsoGridSquare.html "class in zombie.iso") sq,
    float xOffset,
    float yOffset,
    float zOffset,
    int spawnChance)
  + ### rollWeaponUpgrades

    private static void rollWeaponUpgrades([HandWeapon](../../inventory/types/HandWeapon.html "class in zombie.inventory.types") gun)