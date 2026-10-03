[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [VirtualZombieManager](VirtualZombieManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [reusableZombies](#reusableZombies)
   2. [reusableZombieSet](#reusableZombieSet)
   3. [reusedThisFrame](#reusedThisFrame)
   4. [recentlyRemoved](#recentlyRemoved)
   5. [instance](#instance)
   6. [maxRealZombies](#maxRealZombies)
   7. [tempZombies](#tempZombies)
   8. [choices](#choices)
   9. [bestchoices](#bestchoices)
   10. [w](#w)
   11. [BLOCKED\_N](#BLOCKED_N)
   12. [BLOCKED\_S](#BLOCKED_S)
   13. [BLOCKED\_W](#BLOCKED_W)
   14. [BLOCKED\_E](#BLOCKED_E)
   15. [NO\_SQUARE\_N](#NO_SQUARE_N)
   16. [NO\_SQUARE\_S](#NO_SQUARE_S)
   17. [NO\_SQUARE\_W](#NO_SQUARE_W)
   18. [NO\_SQUARE\_E](#NO_SQUARE_E)
6. [Constructor Details](#constructor-detail)
   1. [VirtualZombieManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getKeySpawnChanceD100()](#getKeySpawnChanceD100())
   2. [removeZombieFromWorld(IsoZombie)](#removeZombieFromWorld(zombie.characters.IsoZombie))
   3. [reuseZombie(IsoZombie)](#reuseZombie(zombie.characters.IsoZombie))
   4. [addToReusable(IsoZombie)](#addToReusable(zombie.characters.IsoZombie))
   5. [isReused(IsoZombie)](#isReused(zombie.characters.IsoZombie))
   6. [init()](#init())
   7. [Reset()](#Reset())
   8. [update()](#update())
   9. [createRealZombieAlways(IsoDirections, boolean)](#createRealZombieAlways(zombie.iso.IsoDirections,boolean))
   10. [createRealZombieAlways(int, IsoDirections, boolean)](#createRealZombieAlways(int,zombie.iso.IsoDirections,boolean))
   11. [createRealZombieAlways(IsoDirections, boolean, int)](#createRealZombieAlways(zombie.iso.IsoDirections,boolean,int))
   12. [pickEatingZombieSquare(float, float, float, float, int)](#pickEatingZombieSquare(float,float,float,float,int))
   13. [createEatingZombies(IsoDeadBody, int)](#createEatingZombies(zombie.iso.objects.IsoDeadBody,int))
   14. [createRealZombie(IsoDirections, boolean)](#createRealZombie(zombie.iso.IsoDirections,boolean))
   15. [AddBloodToMap(int, IsoChunk)](#AddBloodToMap(int,zombie.iso.IsoChunk))
   16. [shouldSpawnZombiesOnLevel(int)](#shouldSpawnZombiesOnLevel(int))
   17. [addZombiesToMap(int, RoomDef)](#addZombiesToMap(int,zombie.iso.RoomDef))
   18. [addZombiesToMap(int, RoomDef, boolean)](#addZombiesToMap(int,zombie.iso.RoomDef,boolean))
   19. [tryAddIndoorZombies(RoomDef, boolean)](#tryAddIndoorZombies(zombie.iso.RoomDef,boolean))
   20. [addIndoorZombies(int, RoomDef, boolean)](#addIndoorZombies(int,zombie.iso.RoomDef,boolean))
   21. [addIndoorZombiesToChunk(IsoChunk, IsoRoom, int, ArrayList)](#addIndoorZombiesToChunk(zombie.iso.IsoChunk,zombie.iso.areas.IsoRoom,int,java.util.ArrayList))
   22. [addIndoorZombiesToChunk(IsoChunk, IsoRoom)](#addIndoorZombiesToChunk(zombie.iso.IsoChunk,zombie.iso.areas.IsoRoom))
   23. [addDeadZombiesToMap(int, RoomDef)](#addDeadZombiesToMap(int,zombie.iso.RoomDef))
   24. [RemoveZombie(IsoZombie)](#RemoveZombie(zombie.characters.IsoZombie))
   25. [createHordeFromTo(float, float, float, float, int)](#createHordeFromTo(float,float,float,float,int))
   26. [createRealZombie(float, float, float)](#createRealZombie(float,float,float))
   27. [createRealZombieNow(float, float, float)](#createRealZombieNow(float,float,float))
   28. [getZombieCountForRoom(IsoRoom)](#getZombieCountForRoom(zombie.iso.areas.IsoRoom))
   29. [roomSpotted(IsoRoom)](#roomSpotted(zombie.iso.areas.IsoRoom))
   30. [getBlockedBits(IsoGridSquare)](#getBlockedBits(zombie.iso.IsoGridSquare))
   31. [isBlockedInAllDirections(int, int, int)](#isBlockedInAllDirections(int,int,int))
   32. [canPathOnlyN(IsoGridSquare)](#canPathOnlyN(zombie.iso.IsoGridSquare))
   33. [canPathOnlyS(IsoGridSquare)](#canPathOnlyS(zombie.iso.IsoGridSquare))
   34. [canPathOnlyW(IsoGridSquare)](#canPathOnlyW(zombie.iso.IsoGridSquare))
   35. [canPathOnlyE(IsoGridSquare)](#canPathOnlyE(zombie.iso.IsoGridSquare))
   36. [canSpawnAt(int, int, int)](#canSpawnAt(int,int,int))
   37. [reusableZombiesSize()](#reusableZombiesSize())
   38. [checkZombieKeyForBuilding(String, IsoGridSquare)](#checkZombieKeyForBuilding(java.lang.String,zombie.iso.IsoGridSquare))
   39. [spawnBuildingKeyOnZombie(IsoZombie)](#spawnBuildingKeyOnZombie(zombie.characters.IsoZombie))
   40. [spawnBuildingKeyOnZombie(IsoZombie, BuildingDef)](#spawnBuildingKeyOnZombie(zombie.characters.IsoZombie,zombie.iso.BuildingDef))
   41. [checkAndSpawnZombieForBuildingKey(IsoZombie)](#checkAndSpawnZombieForBuildingKey(zombie.characters.IsoZombie))
   42. [checkAndSpawnZombieForBuildingKey(IsoZombie, boolean)](#checkAndSpawnZombieForBuildingKey(zombie.characters.IsoZombie,boolean))
   43. [doKeySandboxSettings(int)](#doKeySandboxSettings(int))

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class VirtualZombieManager
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.VirtualZombieManager

---

public final class VirtualZombieManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<IsoGridSquare>`

  `bestchoices`

  `private static final int`

  `BLOCKED_E`

  `private static final int`

  `BLOCKED_N`

  `private static final int`

  `BLOCKED_S`

  `private static final int`

  `BLOCKED_W`

  `final ArrayList<IsoGridSquare>`

  `choices`

  `static VirtualZombieManager`

  `instance`

  `int`

  `maxRealZombies`

  `private static final int`

  `NO_SQUARE_E`

  `private static final int`

  `NO_SQUARE_N`

  `private static final int`

  `NO_SQUARE_S`

  `private static final int`

  `NO_SQUARE_W`

  `private final ArrayList<IsoZombie>`

  `recentlyRemoved`

  `private final ArrayDeque<IsoZombie>`

  `reusableZombies`

  `private final HashSet<IsoZombie>`

  `reusableZombieSet`

  `private final ArrayList<IsoZombie>`

  `reusedThisFrame`

  `private final ArrayList<IsoZombie>`

  `tempZombies`

  `(package private) HandWeapon`

  `w`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `VirtualZombieManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `AddBloodToMap(int nSize,
  IsoChunk chk)`

  `void`

  `addDeadZombiesToMap(int nSize,
  RoomDef room)`

  `private void`

  `addIndoorZombies(int nSize,
  RoomDef room,
  boolean bAllowDead)`

  `void`

  `addIndoorZombiesToChunk(IsoChunk chunk,
  IsoRoom room)`

  `void`

  `addIndoorZombiesToChunk(IsoChunk chunk,
  IsoRoom room,
  int zombieCountForRoom,
  ArrayList<IsoZombie> zombies)`

  `void`

  `addToReusable(IsoZombie z)`

  `ArrayList<IsoZombie>`

  `addZombiesToMap(int nSize,
  RoomDef room)`

  `ArrayList<IsoZombie>`

  `addZombiesToMap(int nSize,
  RoomDef room,
  boolean bAllowDead)`

  `private boolean`

  `canPathOnlyE(IsoGridSquare sq)`

  `private boolean`

  `canPathOnlyN(IsoGridSquare sq)`

  `private boolean`

  `canPathOnlyS(IsoGridSquare sq)`

  `private boolean`

  `canPathOnlyW(IsoGridSquare sq)`

  `boolean`

  `canSpawnAt(int x,
  int y,
  int z)`

  `boolean`

  `checkAndSpawnZombieForBuildingKey(IsoZombie zombie)`

  `boolean`

  `checkAndSpawnZombieForBuildingKey(IsoZombie zombie,
  boolean bandits)`

  `boolean`

  `checkZombieKeyForBuilding(String outfitName,
  IsoGridSquare square)`

  `void`

  `createEatingZombies(IsoDeadBody target,
  int nb)`

  `void`

  `createHordeFromTo(float spawnX,
  float spawnY,
  float targetX,
  float targetY,
  int count)`

  `IsoZombie`

  `createRealZombie(float x,
  float y,
  float z)`

  `private IsoZombie`

  `createRealZombie(IsoDirections dir,
  boolean bDead)`

  `IsoZombie`

  `createRealZombieAlways(int descriptorId,
  IsoDirections dir,
  boolean bDead)`

  `IsoZombie`

  `createRealZombieAlways(IsoDirections dir,
  boolean bDead)`

  `IsoZombie`

  `createRealZombieAlways(IsoDirections dir,
  boolean bDead,
  int outfitID)`

  `IsoZombie`

  `createRealZombieNow(float x,
  float y,
  float z)`

  `private static float`

  `doKeySandboxSettings(int value)`

  `private int`

  `getBlockedBits(IsoGridSquare sq)`

  `float`

  `getKeySpawnChanceD100()`

  `private int`

  `getZombieCountForRoom(IsoRoom room)`

  `void`

  `init()`

  `private boolean`

  `isBlockedInAllDirections(int x,
  int y,
  int z)`

  `boolean`

  `isReused(IsoZombie z)`

  `private IsoGridSquare`

  `pickEatingZombieSquare(float bodyX,
  float bodyY,
  float zombieX,
  float zombieY,
  int z)`

  `void`

  `RemoveZombie(IsoZombie obj)`

  `boolean`

  `removeZombieFromWorld(IsoZombie z)`

  `void`

  `Reset()`

  `int`

  `reusableZombiesSize()`

  `private void`

  `reuseZombie(IsoZombie z)`

  `void`

  `roomSpotted(IsoRoom room)`

  `boolean`

  `shouldSpawnZombiesOnLevel(int level)`

  `boolean`

  `spawnBuildingKeyOnZombie(IsoZombie zombie)`

  `boolean`

  `spawnBuildingKeyOnZombie(IsoZombie zombie,
  BuildingDef def)`

  `void`

  `tryAddIndoorZombies(RoomDef room,
  boolean bAllowDead)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### reusableZombies

    private final [ArrayDeque](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayDeque.html "class or interface in java.util")<[IsoZombie](characters/IsoZombie.html "class in zombie.characters")> reusableZombies
  + ### reusableZombieSet

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[IsoZombie](characters/IsoZombie.html "class in zombie.characters")> reusableZombieSet
  + ### reusedThisFrame

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](characters/IsoZombie.html "class in zombie.characters")> reusedThisFrame
  + ### recentlyRemoved

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](characters/IsoZombie.html "class in zombie.characters")> recentlyRemoved
  + ### instance

    public static [VirtualZombieManager](VirtualZombieManager.html "class in zombie") instance
  + ### maxRealZombies

    public int maxRealZombies
  + ### tempZombies

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](characters/IsoZombie.html "class in zombie.characters")> tempZombies
  + ### choices

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso")> choices
  + ### bestchoices

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso")> bestchoices
  + ### w

    [HandWeapon](inventory/types/HandWeapon.html "class in zombie.inventory.types") w
  + ### BLOCKED\_N

    private static final int BLOCKED\_N

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.VirtualZombieManager.BLOCKED_N)
  + ### BLOCKED\_S

    private static final int BLOCKED\_S

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.VirtualZombieManager.BLOCKED_S)
  + ### BLOCKED\_W

    private static final int BLOCKED\_W

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.VirtualZombieManager.BLOCKED_W)
  + ### BLOCKED\_E

    private static final int BLOCKED\_E

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.VirtualZombieManager.BLOCKED_E)
  + ### NO\_SQUARE\_N

    private static final int NO\_SQUARE\_N

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.VirtualZombieManager.NO_SQUARE_N)
  + ### NO\_SQUARE\_S

    private static final int NO\_SQUARE\_S

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.VirtualZombieManager.NO_SQUARE_S)
  + ### NO\_SQUARE\_W

    private static final int NO\_SQUARE\_W

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.VirtualZombieManager.NO_SQUARE_W)
  + ### NO\_SQUARE\_E

    private static final int NO\_SQUARE\_E

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.VirtualZombieManager.NO_SQUARE_E)
* Constructor Details
  -------------------

  + ### VirtualZombieManager

    public VirtualZombieManager()
* Method Details
  --------------

  + ### getKeySpawnChanceD100

    public float getKeySpawnChanceD100()
  + ### removeZombieFromWorld

    public boolean removeZombieFromWorld([IsoZombie](characters/IsoZombie.html "class in zombie.characters") z)
  + ### reuseZombie

    private void reuseZombie([IsoZombie](characters/IsoZombie.html "class in zombie.characters") z)
  + ### addToReusable

    public void addToReusable([IsoZombie](characters/IsoZombie.html "class in zombie.characters") z)
  + ### isReused

    public boolean isReused([IsoZombie](characters/IsoZombie.html "class in zombie.characters") z)
  + ### init

    public void init()
  + ### Reset

    public void Reset()
  + ### update

    public void update()
  + ### createRealZombieAlways

    public [IsoZombie](characters/IsoZombie.html "class in zombie.characters") createRealZombieAlways([IsoDirections](iso/IsoDirections.html "enum class in zombie.iso") dir,
    boolean bDead)
  + ### createRealZombieAlways

    public [IsoZombie](characters/IsoZombie.html "class in zombie.characters") createRealZombieAlways(int descriptorId,
    [IsoDirections](iso/IsoDirections.html "enum class in zombie.iso") dir,
    boolean bDead)
  + ### createRealZombieAlways

    public [IsoZombie](characters/IsoZombie.html "class in zombie.characters") createRealZombieAlways([IsoDirections](iso/IsoDirections.html "enum class in zombie.iso") dir,
    boolean bDead,
    int outfitID)
  + ### pickEatingZombieSquare

    private [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") pickEatingZombieSquare(float bodyX,
    float bodyY,
    float zombieX,
    float zombieY,
    int z)
  + ### createEatingZombies

    public void createEatingZombies([IsoDeadBody](iso/objects/IsoDeadBody.html "class in zombie.iso.objects") target,
    int nb)
  + ### createRealZombie

    private [IsoZombie](characters/IsoZombie.html "class in zombie.characters") createRealZombie([IsoDirections](iso/IsoDirections.html "enum class in zombie.iso") dir,
    boolean bDead)
  + ### AddBloodToMap

    public void AddBloodToMap(int nSize,
    [IsoChunk](iso/IsoChunk.html "class in zombie.iso") chk)
  + ### shouldSpawnZombiesOnLevel

    public boolean shouldSpawnZombiesOnLevel(int level)
  + ### addZombiesToMap

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](characters/IsoZombie.html "class in zombie.characters")> addZombiesToMap(int nSize,
    [RoomDef](iso/RoomDef.html "class in zombie.iso") room)
  + ### addZombiesToMap

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](characters/IsoZombie.html "class in zombie.characters")> addZombiesToMap(int nSize,
    [RoomDef](iso/RoomDef.html "class in zombie.iso") room,
    boolean bAllowDead)
  + ### tryAddIndoorZombies

    public void tryAddIndoorZombies([RoomDef](iso/RoomDef.html "class in zombie.iso") room,
    boolean bAllowDead)
  + ### addIndoorZombies

    private void addIndoorZombies(int nSize,
    [RoomDef](iso/RoomDef.html "class in zombie.iso") room,
    boolean bAllowDead)
  + ### addIndoorZombiesToChunk

    public void addIndoorZombiesToChunk([IsoChunk](iso/IsoChunk.html "class in zombie.iso") chunk,
    [IsoRoom](iso/areas/IsoRoom.html "class in zombie.iso.areas") room,
    int zombieCountForRoom,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoZombie](characters/IsoZombie.html "class in zombie.characters")> zombies)
  + ### addIndoorZombiesToChunk

    public void addIndoorZombiesToChunk([IsoChunk](iso/IsoChunk.html "class in zombie.iso") chunk,
    [IsoRoom](iso/areas/IsoRoom.html "class in zombie.iso.areas") room)
  + ### addDeadZombiesToMap

    public void addDeadZombiesToMap(int nSize,
    [RoomDef](iso/RoomDef.html "class in zombie.iso") room)
  + ### RemoveZombie

    public void RemoveZombie([IsoZombie](characters/IsoZombie.html "class in zombie.characters") obj)
  + ### createHordeFromTo

    public void createHordeFromTo(float spawnX,
    float spawnY,
    float targetX,
    float targetY,
    int count)
  + ### createRealZombie

    public [IsoZombie](characters/IsoZombie.html "class in zombie.characters") createRealZombie(float x,
    float y,
    float z)
  + ### createRealZombieNow

    public [IsoZombie](characters/IsoZombie.html "class in zombie.characters") createRealZombieNow(float x,
    float y,
    float z)
  + ### getZombieCountForRoom

    private int getZombieCountForRoom([IsoRoom](iso/areas/IsoRoom.html "class in zombie.iso.areas") room)
  + ### roomSpotted

    public void roomSpotted([IsoRoom](iso/areas/IsoRoom.html "class in zombie.iso.areas") room)
  + ### getBlockedBits

    private int getBlockedBits([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### isBlockedInAllDirections

    private boolean isBlockedInAllDirections(int x,
    int y,
    int z)
  + ### canPathOnlyN

    private boolean canPathOnlyN([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### canPathOnlyS

    private boolean canPathOnlyS([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### canPathOnlyW

    private boolean canPathOnlyW([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### canPathOnlyE

    private boolean canPathOnlyE([IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### canSpawnAt

    public boolean canSpawnAt(int x,
    int y,
    int z)
  + ### reusableZombiesSize

    public int reusableZombiesSize()
  + ### checkZombieKeyForBuilding

    public boolean checkZombieKeyForBuilding([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfitName,
    [IsoGridSquare](iso/IsoGridSquare.html "class in zombie.iso") square)
  + ### spawnBuildingKeyOnZombie

    public boolean spawnBuildingKeyOnZombie([IsoZombie](characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### spawnBuildingKeyOnZombie

    public boolean spawnBuildingKeyOnZombie([IsoZombie](characters/IsoZombie.html "class in zombie.characters") zombie,
    [BuildingDef](iso/BuildingDef.html "class in zombie.iso") def)
  + ### checkAndSpawnZombieForBuildingKey

    public boolean checkAndSpawnZombieForBuildingKey([IsoZombie](characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### checkAndSpawnZombieForBuildingKey

    public boolean checkAndSpawnZombieForBuildingKey([IsoZombie](characters/IsoZombie.html "class in zombie.characters") zombie,
    boolean bandits)
  + ### doKeySandboxSettings

    private static float doKeySandboxSettings(int value)