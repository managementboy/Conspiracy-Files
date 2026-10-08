[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [BuildingDef](BuildingDef.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [squareChoices](#squareChoices)
   2. [emptyoutside](#emptyoutside)
   3. [table](#table)
   4. [seen](#seen)
   5. [hasBeenVisited](#hasBeenVisited)
   6. [stash](#stash)
   7. [lootRespawnHour](#lootRespawnHour)
   8. [overlappedChunks](#overlappedChunks)
   9. [alarmed](#alarmed)
   10. [alarmDecay](#alarmDecay)
   11. [x](#x)
   12. [y](#y)
   13. [x2](#x2)
   14. [y2](#y2)
   15. [rooms](#rooms)
   16. [zone](#zone)
   17. [food](#food)
   18. [items](#items)
   19. [itemTypes](#itemTypes)
   20. [id](#id)
   21. [keySpawned](#keySpawned)
   22. [keyId](#keyId)
   23. [metaId](#metaId)
   24. [minLevel](#minLevel)
   25. [maxLevel](#maxLevel)
   26. [roofRoomId](#roofRoomId)
   27. [userDefined](#userDefined)
   28. [collapseRectX](#collapseRectX)
   29. [collapseRectY](#collapseRectY)
   30. [collapseRectX2](#collapseRectX2)
   31. [collapseRectY2](#collapseRectY2)
6. [Constructor Details](#constructor-detail)
   1. [BuildingDef()](#%3Cinit%3E())
   2. [BuildingDef(boolean)](#%3Cinit%3E(boolean))
7. [Method Details](#method-detail)
   1. [getMinLevel()](#getMinLevel())
   2. [getMaxLevel()](#getMaxLevel())
   3. [getTable()](#getTable())
   4. [getRooms()](#getRooms())
   5. [getEmptyOutside()](#getEmptyOutside())
   6. [getRoom(String)](#getRoom(java.lang.String))
   7. [getRoom(String, boolean)](#getRoom(java.lang.String,boolean))
   8. [isAllExplored()](#isAllExplored())
   9. [setAllExplored(boolean)](#setAllExplored(boolean))
   10. [getRoomsNumber()](#getRoomsNumber())
   11. [getArea()](#getArea())
   12. [getFirstRoom()](#getFirstRoom())
   13. [setUserDefined(boolean)](#setUserDefined(boolean))
   14. [getCellX()](#getCellX())
   15. [getCellY()](#getCellY())
   16. [getCellX2()](#getCellX2())
   17. [getCellY2()](#getCellY2())
   18. [getChunkX()](#getChunkX())
   19. [getChunkY()](#getChunkY())
   20. [getX()](#getX())
   21. [getY()](#getY())
   22. [getX2()](#getX2())
   23. [getY2()](#getY2())
   24. [getW()](#getW())
   25. [getH()](#getH())
   26. [getID()](#getID())
   27. [getIDString()](#getIDString())
   28. [refreshSquares()](#refreshSquares())
   29. [CalculateBounds(ArrayList)](#CalculateBounds(java.util.ArrayList))
   30. [calculateMetaID(int, int)](#calculateMetaID(int,int))
   31. [recalculate()](#recalculate())
   32. [overlapsChunk(int, int)](#overlapsChunk(int,int))
   33. [getFreeSquareInRoom()](#getFreeSquareInRoom())
   34. [containsRoom(String)](#containsRoom(java.lang.String))
   35. [isFullyStreamedIn()](#isFullyStreamedIn())
   36. [isAnyChunkNewlyLoaded()](#isAnyChunkNewlyLoaded())
   37. [getZone()](#getZone())
   38. [getKeyId()](#getKeyId())
   39. [setKeyId(int)](#setKeyId(int))
   40. [getKeySpawned()](#getKeySpawned())
   41. [setKeySpawned(int)](#setKeySpawned(int))
   42. [isHasBeenVisited()](#isHasBeenVisited())
   43. [setHasBeenVisited(boolean)](#setHasBeenVisited(boolean))
   44. [isAlarmed()](#isAlarmed())
   45. [setAlarmed(boolean)](#setAlarmed(boolean))
   46. [getRandomRoom()](#getRandomRoom())
   47. [getRandomRoom(int)](#getRandomRoom(int))
   48. [getRandomRoom(int, boolean)](#getRandomRoom(int,boolean))
   49. [getClosestPoint(float, float, Vector2f)](#getClosestPoint(float,float,org.joml.Vector2f))
   50. [Dispose()](#Dispose())
   51. [containsXYZ(int, int, int)](#containsXYZ(int,int,int))
   52. [addRoomToCollapseRect(RoomDef)](#addRoomToCollapseRect(zombie.iso.RoomDef))
   53. [calculateCollapseRect()](#calculateCollapseRect())
   54. [setInvalidateCacheForAllChunks(int, long)](#setInvalidateCacheForAllChunks(int,long))
   55. [invalidateOverlappedChunkLevelsAbove(int, int, long)](#invalidateOverlappedChunkLevelsAbove(int,int,long))
   56. [intersects(int, int, int, int, int)](#intersects(int,int,int,int,int))
   57. [isAdjacent(int, int, int, int, int)](#isAdjacent(int,int,int,int,int))
   58. [isAdjacent(BuildingDef)](#isAdjacent(zombie.iso.BuildingDef))
   59. [isAdjacent(BuildingDef, boolean)](#isAdjacent(zombie.iso.BuildingDef,boolean))
   60. [overlaps(BuildingDef, boolean)](#overlaps(zombie.iso.BuildingDef,boolean))
   61. [addRoomsOf(BuildingDef, ArrayList)](#addRoomsOf(zombie.iso.BuildingDef,java.util.ArrayList))
   62. [getRoofRoomID(int)](#getRoofRoomID(int))
   63. [isEntirelyEmptyOutside()](#isEntirelyEmptyOutside())
   64. [isShop()](#isShop())
   65. [isResidential()](#isResidential())
   66. [isUserDefined()](#isUserDefined())
   67. [isBasement()](#isBasement())
   68. [resetMinMaxLevel()](#resetMinMaxLevel())
   69. [getObjects()](#getObjects())
   70. [getSquares()](#getSquares())
   71. [isRural()](#isRural())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BuildingDef
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.BuildingDef

---

public final class BuildingDef
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `alarmDecay`

  `boolean`

  `alarmed`

  `int`

  `collapseRectX`

  `int`

  `collapseRectX2`

  `int`

  `collapseRectY`

  `int`

  `collapseRectY2`

  `final ArrayList<RoomDef>`

  `emptyoutside`

  `int`

  `food`

  `boolean`

  `hasBeenVisited`

  `long`

  `id`

  `ArrayList<InventoryItem>`

  `items`

  `HashSet<String>`

  `itemTypes`

  `private int`

  `keyId`

  `private int`

  `keySpawned`

  `int`

  `lootRespawnHour`

  `private int`

  `maxLevel`

  `long`

  `metaId`

  `private int`

  `minLevel`

  `gnu.trove.list.array.TShortArrayList`

  `overlappedChunks`

  `private final HashMap<Integer,Long>`

  `roofRoomId`

  `final ArrayList<RoomDef>`

  `rooms`

  `boolean`

  `seen`

  `(package private) static final ArrayList<IsoGridSquare>`

  `squareChoices`

  `String`

  `stash`

  `se.krka.kahlua.vm.KahluaTable`

  `table`

  `private boolean`

  `userDefined`

  `int`

  `x`

  `int`

  `x2`

  `int`

  `y`

  `int`

  `y2`

  `Zone`

  `zone`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BuildingDef()`

  `BuildingDef(boolean userDefined)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addRoomsOf(BuildingDef sourceDef,
  ArrayList<RoomDef> tempRooms)`

  `void`

  `addRoomToCollapseRect(RoomDef room)`

  `void`

  `CalculateBounds(ArrayList<RoomDef> tempRooms)`

  `void`

  `calculateCollapseRect()`

  `long`

  `calculateMetaID(int cellX,
  int cellY)`

  `boolean`

  `containsRoom(String name)`

  `boolean`

  `containsXYZ(int x,
  int y,
  int z)`

  `void`

  `Dispose()`

  `int`

  `getArea()`

  `int`

  `getCellX()`

  `int`

  `getCellX2()`

  `int`

  `getCellY()`

  `int`

  `getCellY2()`

  `int`

  `getChunkX()`

  `int`

  `getChunkY()`

  `float`

  `getClosestPoint(float x,
  float y,
  Vector2f closestXY)`

  `ArrayList<RoomDef>`

  `getEmptyOutside()`

  `RoomDef`

  `getFirstRoom()`

  `IsoGridSquare`

  `getFreeSquareInRoom()`

  `int`

  `getH()`

  `long`

  `getID()`

  `String`

  `getIDString()`

  `int`

  `getKeyId()`

  `int`

  `getKeySpawned()`

  `int`

  `getMaxLevel()`

  `int`

  `getMinLevel()`

  `List<IsoObject>`

  `getObjects()`

  `RoomDef`

  `getRandomRoom()`

  `RoomDef`

  `getRandomRoom(int minArea)`

  `RoomDef`

  `getRandomRoom(int minArea,
  boolean noKids)`

  `long`

  `getRoofRoomID(int level)`

  `RoomDef`

  `getRoom(String roomName)`

  `RoomDef`

  `getRoom(String roomName,
  boolean noKids)`

  `ArrayList<RoomDef>`

  `getRooms()`

  `int`

  `getRoomsNumber()`

  `List<IsoGridSquare>`

  `getSquares()`

  `se.krka.kahlua.vm.KahluaTable`

  `getTable()`

  `int`

  `getW()`

  `int`

  `getX()`

  `int`

  `getX2()`

  `int`

  `getY()`

  `int`

  `getY2()`

  `Zone`

  `getZone()`

  `boolean`

  `intersects(int x,
  int y,
  int w,
  int h,
  int z)`

  `void`

  `invalidateOverlappedChunkLevelsAbove(int playerIndex,
  int minLevel,
  long dirtyFlags)`

  `boolean`

  `isAdjacent(int x,
  int y,
  int w,
  int h,
  int z)`

  `boolean`

  `isAdjacent(BuildingDef other)`

  `boolean`

  `isAdjacent(BuildingDef other,
  boolean bIgnoreZ)`

  `boolean`

  `isAlarmed()`

  `boolean`

  `isAllExplored()`

  `boolean`

  `isAnyChunkNewlyLoaded()`

  `boolean`

  `isBasement()`

  `boolean`

  `isEntirelyEmptyOutside()`

  `boolean`

  `isFullyStreamedIn()`

  `boolean`

  `isHasBeenVisited()`

  `boolean`

  `isResidential()`

  `boolean`

  `isRural()`

  `boolean`

  `isShop()`

  `boolean`

  `isUserDefined()`

  `boolean`

  `overlaps(BuildingDef other,
  boolean bIgnoreZ)`

  `boolean`

  `overlapsChunk(int wx,
  int wy)`

  `void`

  `recalculate()`

  `void`

  `refreshSquares()`

  `void`

  `resetMinMaxLevel()`

  `void`

  `setAlarmed(boolean alarm)`

  `void`

  `setAllExplored(boolean b)`

  `void`

  `setHasBeenVisited(boolean hasBeenVisited)`

  `void`

  `setInvalidateCacheForAllChunks(int playerIndex,
  long dirtyFlags)`

  `void`

  `setKeyId(int keyId)`

  `void`

  `setKeySpawned(int keySpawned)`

  `void`

  `setUserDefined(boolean b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### squareChoices

    static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> squareChoices
  + ### emptyoutside

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> emptyoutside
  + ### table

    public se.krka.kahlua.vm.KahluaTable table
  + ### seen

    public boolean seen
  + ### hasBeenVisited

    public boolean hasBeenVisited
  + ### stash

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") stash
  + ### lootRespawnHour

    public int lootRespawnHour
  + ### overlappedChunks

    public gnu.trove.list.array.TShortArrayList overlappedChunks
  + ### alarmed

    public boolean alarmed
  + ### alarmDecay

    public int alarmDecay
  + ### x

    public int x
  + ### y

    public int y
  + ### x2

    public int x2
  + ### y2

    public int y2
  + ### rooms

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> rooms
  + ### zone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") zone
  + ### food

    public int food
  + ### items

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory")> items
  + ### itemTypes

    public [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> itemTypes
  + ### id

    public long id
  + ### keySpawned

    private int keySpawned
  + ### keyId

    private int keyId
  + ### metaId

    public long metaId
  + ### minLevel

    private int minLevel
  + ### maxLevel

    private int maxLevel
  + ### roofRoomId

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[Long](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Long.html "class or interface in java.lang")> roofRoomId
  + ### userDefined

    private boolean userDefined
  + ### collapseRectX

    public int collapseRectX
  + ### collapseRectY

    public int collapseRectY
  + ### collapseRectX2

    public int collapseRectX2
  + ### collapseRectY2

    public int collapseRectY2
* Constructor Details
  -------------------

  + ### BuildingDef

    public BuildingDef()
  + ### BuildingDef

    public BuildingDef(boolean userDefined)
* Method Details
  --------------

  + ### getMinLevel

    public int getMinLevel()
  + ### getMaxLevel

    public int getMaxLevel()
  + ### getTable

    public se.krka.kahlua.vm.KahluaTable getTable()
  + ### getRooms

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> getRooms()
  + ### getEmptyOutside

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> getEmptyOutside()
  + ### getRoom

    public [RoomDef](RoomDef.html "class in zombie.iso") getRoom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roomName)
  + ### getRoom

    public [RoomDef](RoomDef.html "class in zombie.iso") getRoom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") roomName,
    boolean noKids)
  + ### isAllExplored

    public boolean isAllExplored()
  + ### setAllExplored

    public void setAllExplored(boolean b)
  + ### getRoomsNumber

    public int getRoomsNumber()
  + ### getArea

    public int getArea()
  + ### getFirstRoom

    public [RoomDef](RoomDef.html "class in zombie.iso") getFirstRoom()
  + ### setUserDefined

    public void setUserDefined(boolean b)
  + ### getCellX

    public int getCellX()
  + ### getCellY

    public int getCellY()
  + ### getCellX2

    public int getCellX2()
  + ### getCellY2

    public int getCellY2()
  + ### getChunkX

    public int getChunkX()
  + ### getChunkY

    public int getChunkY()
  + ### getX

    public int getX()
  + ### getY

    public int getY()
  + ### getX2

    public int getX2()
  + ### getY2

    public int getY2()
  + ### getW

    public int getW()
  + ### getH

    public int getH()
  + ### getID

    public long getID()
  + ### getIDString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getIDString()
  + ### refreshSquares

    public void refreshSquares()
  + ### CalculateBounds

    public void CalculateBounds([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> tempRooms)
  + ### calculateMetaID

    public long calculateMetaID(int cellX,
    int cellY)
  + ### recalculate

    public void recalculate()
  + ### overlapsChunk

    public boolean overlapsChunk(int wx,
    int wy)
  + ### getFreeSquareInRoom

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getFreeSquareInRoom()
  + ### containsRoom

    public boolean containsRoom([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### isFullyStreamedIn

    public boolean isFullyStreamedIn()
  + ### isAnyChunkNewlyLoaded

    public boolean isAnyChunkNewlyLoaded()
  + ### getZone

    public [Zone](zones/Zone.html "class in zombie.iso.zones") getZone()
  + ### getKeyId

    public int getKeyId()
  + ### setKeyId

    public void setKeyId(int keyId)
  + ### getKeySpawned

    public int getKeySpawned()
  + ### setKeySpawned

    public void setKeySpawned(int keySpawned)
  + ### isHasBeenVisited

    public boolean isHasBeenVisited()
  + ### setHasBeenVisited

    public void setHasBeenVisited(boolean hasBeenVisited)
  + ### isAlarmed

    public boolean isAlarmed()
  + ### setAlarmed

    public void setAlarmed(boolean alarm)
  + ### getRandomRoom

    public [RoomDef](RoomDef.html "class in zombie.iso") getRandomRoom()
  + ### getRandomRoom

    public [RoomDef](RoomDef.html "class in zombie.iso") getRandomRoom(int minArea)
  + ### getRandomRoom

    public [RoomDef](RoomDef.html "class in zombie.iso") getRandomRoom(int minArea,
    boolean noKids)
  + ### getClosestPoint

    public float getClosestPoint(float x,
    float y,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") closestXY)
  + ### Dispose

    public void Dispose()
  + ### containsXYZ

    public boolean containsXYZ(int x,
    int y,
    int z)
  + ### addRoomToCollapseRect

    public void addRoomToCollapseRect([RoomDef](RoomDef.html "class in zombie.iso") room)
  + ### calculateCollapseRect

    public void calculateCollapseRect()
  + ### setInvalidateCacheForAllChunks

    public void setInvalidateCacheForAllChunks(int playerIndex,
    long dirtyFlags)
  + ### invalidateOverlappedChunkLevelsAbove

    public void invalidateOverlappedChunkLevelsAbove(int playerIndex,
    int minLevel,
    long dirtyFlags)
  + ### intersects

    public boolean intersects(int x,
    int y,
    int w,
    int h,
    int z)
  + ### isAdjacent

    public boolean isAdjacent(int x,
    int y,
    int w,
    int h,
    int z)
  + ### isAdjacent

    public boolean isAdjacent([BuildingDef](BuildingDef.html "class in zombie.iso") other)
  + ### isAdjacent

    public boolean isAdjacent([BuildingDef](BuildingDef.html "class in zombie.iso") other,
    boolean bIgnoreZ)
  + ### overlaps

    public boolean overlaps([BuildingDef](BuildingDef.html "class in zombie.iso") other,
    boolean bIgnoreZ)
  + ### addRoomsOf

    public void addRoomsOf([BuildingDef](BuildingDef.html "class in zombie.iso") sourceDef,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef](RoomDef.html "class in zombie.iso")> tempRooms)
  + ### getRoofRoomID

    public long getRoofRoomID(int level)
  + ### isEntirelyEmptyOutside

    public boolean isEntirelyEmptyOutside()
  + ### isShop

    public boolean isShop()
  + ### isResidential

    public boolean isResidential()
  + ### isUserDefined

    public boolean isUserDefined()
  + ### isBasement

    public boolean isBasement()
  + ### resetMinMaxLevel

    public void resetMinMaxLevel()
  + ### getObjects

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoObject](IsoObject.html "class in zombie.iso")> getObjects()
  + ### getSquares

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> getSquares()
  + ### isRural

    public boolean isRural()