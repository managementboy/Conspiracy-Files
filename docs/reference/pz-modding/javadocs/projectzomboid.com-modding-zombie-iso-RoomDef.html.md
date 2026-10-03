[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [RoomDef](RoomDef.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [squareChoices](#squareChoices)
   2. [explored](#explored)
   3. [doneSpawn](#doneSpawn)
   4. [indoorZombies](#indoorZombies)
   5. [spawnCount](#spawnCount)
   6. [lightsActive](#lightsActive)
   7. [name](#name)
   8. [level](#level)
   9. [building](#building)
   10. [id](#id)
   11. [rects](#rects)
   12. [objects](#objects)
   13. [x](#x)
   14. [y](#y)
   15. [x2](#x2)
   16. [y2](#y2)
   17. [area](#area)
   18. [proceduralSpawnedContainer](#proceduralSpawnedContainer)
   19. [roofFixed](#roofFixed)
   20. [metaId](#metaId)
   21. [userDefined](#userDefined)
7. [Constructor Details](#constructor-detail)
   1. [RoomDef(long, String)](#%3Cinit%3E(long,java.lang.String))
   2. [RoomDef()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getID()](#getID())
   2. [getIDString()](#getIDString())
   3. [isExplored()](#isExplored())
   4. [isInside(int, int, int)](#isInside(int,int,int))
   5. [contains(int, int)](#contains(int,int))
   6. [intersects(int, int, int, int)](#intersects(int,int,int,int))
   7. [isAdjacent(RoomDef)](#isAdjacent(zombie.iso.RoomDef))
   8. [isAdjacent(int, int, int, int)](#isAdjacent(int,int,int,int))
   9. [overlaps(RoomDef)](#overlaps(zombie.iso.RoomDef))
   10. [getAreaOverlapping(IsoChunk)](#getAreaOverlapping(zombie.iso.IsoChunk))
   11. [getAreaOverlapping(int, int, int, int)](#getAreaOverlapping(int,int,int,int))
   12. [forEachChunk(BiConsumer)](#forEachChunk(java.util.function.BiConsumer))
   13. [setInvalidateCacheForAllChunks(int, long)](#setInvalidateCacheForAllChunks(int,long))
   14. [getIsoRoom()](#getIsoRoom())
   15. [getObjects()](#getObjects())
   16. [getMetaObjects()](#getMetaObjects())
   17. [refreshSquares()](#refreshSquares())
   18. [getBuilding()](#getBuilding())
   19. [setBuilding(BuildingDef)](#setBuilding(zombie.iso.BuildingDef))
   20. [getName()](#getName())
   21. [setName(String)](#setName(java.lang.String))
   22. [getRects()](#getRects())
   23. [getY()](#getY())
   24. [getX()](#getX())
   25. [getX2()](#getX2())
   26. [getY2()](#getY2())
   27. [getW()](#getW())
   28. [getH()](#getH())
   29. [getZ()](#getZ())
   30. [CalculateBounds()](#CalculateBounds())
   31. [calculateMetaID(int, int)](#calculateMetaID(int,int))
   32. [offset(int, int)](#offset(int,int))
   33. [getArea()](#getArea())
   34. [setExplored(boolean)](#setExplored(boolean))
   35. [getFreeSquare()](#getFreeSquare())
   36. [getExtraFreeSquare()](#getExtraFreeSquare())
   37. [getFreeUnoccupiedSquare()](#getFreeUnoccupiedSquare())
   38. [getRandomSquare(Predicate)](#getRandomSquare(java.util.function.Predicate))
   39. [isEmptyOutside()](#isEmptyOutside())
   40. [getProceduralSpawnedContainer()](#getProceduralSpawnedContainer())
   41. [getRoomRect(int, int, int)](#getRoomRect(int,int,int))
   42. [isRoofFixed()](#isRoofFixed())
   43. [setRoofFixed(boolean)](#setRoofFixed(boolean))
   44. [getClosestPoint(float, float, Vector2f)](#getClosestPoint(float,float,org.joml.Vector2f))
   45. [Dispose()](#Dispose())
   46. [isKidsRoom()](#isKidsRoom())
   47. [isShop()](#isShop())
   48. [isUserDefined()](#isUserDefined())
   49. [copyFrom(RoomDef)](#copyFrom(zombie.iso.RoomDef))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class RoomDef
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.RoomDef

---

public final class RoomDef
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `RoomDef.RoomRect`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `area`

  `BuildingDef`

  `building`

  `boolean`

  `doneSpawn`

  `boolean`

  `explored`

  `long`

  `id`

  `int`

  `indoorZombies`

  `int`

  `level`

  `boolean`

  `lightsActive`

  `long`

  `metaId`

  `String`

  `name`

  `final ArrayList<MetaObject>`

  `objects`

  `private final HashMap<String,Integer>`

  `proceduralSpawnedContainer`

  `final ArrayList<RoomDef.RoomRect>`

  `rects`

  `private boolean`

  `roofFixed`

  `int`

  `spawnCount`

  `private static final ArrayList<IsoGridSquare>`

  `squareChoices`

  `boolean`

  `userDefined`

  `int`

  `x`

  `int`

  `x2`

  `int`

  `y`

  `int`

  `y2`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RoomDef()`

  `RoomDef(long id,
  String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `CalculateBounds()`

  `long`

  `calculateMetaID(int cellX,
  int cellY)`

  `boolean`

  `contains(int x,
  int y)`

  `void`

  `copyFrom(RoomDef other)`

  `void`

  `Dispose()`

  `void`

  `forEachChunk(BiConsumer<RoomDef,IsoChunk> consumer)`

  `int`

  `getArea()`

  `float`

  `getAreaOverlapping(int x,
  int y,
  int w,
  int h)`

  `float`

  `getAreaOverlapping(IsoChunk chunk)`

  `BuildingDef`

  `getBuilding()`

  `float`

  `getClosestPoint(float x,
  float y,
  Vector2f closestXY)`

  `IsoGridSquare`

  `getExtraFreeSquare()`

  `IsoGridSquare`

  `getFreeSquare()`

  `IsoGridSquare`

  `getFreeUnoccupiedSquare()`

  `int`

  `getH()`

  `long`

  `getID()`

  `String`

  `getIDString()`

  `IsoRoom`

  `getIsoRoom()`

  `ArrayList<MetaObject>`

  `getMetaObjects()`

  `String`

  `getName()`

  `ArrayList<MetaObject>`

  `getObjects()`

  `HashMap<String,Integer>`

  `getProceduralSpawnedContainer()`

  `IsoGridSquare`

  `getRandomSquare(Predicate<IsoGridSquare> predicate)`

  `ArrayList<RoomDef.RoomRect>`

  `getRects()`

  `RoomDef.RoomRect`

  `getRoomRect(int x,
  int y,
  int z)`

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

  `int`

  `getZ()`

  `boolean`

  `intersects(int x,
  int y,
  int w,
  int h)`

  `boolean`

  `isAdjacent(int x,
  int y,
  int w,
  int h)`

  `boolean`

  `isAdjacent(RoomDef other)`

  `boolean`

  `isEmptyOutside()`

  `boolean`

  `isExplored()`

  `boolean`

  `isInside(int x,
  int y,
  int z)`

  `boolean`

  `isKidsRoom()`

  `boolean`

  `isRoofFixed()`

  `boolean`

  `isShop()`

  `boolean`

  `isUserDefined()`

  `void`

  `offset(int dx,
  int dy)`

  `boolean`

  `overlaps(RoomDef other)`

  `void`

  `refreshSquares()`

  `void`

  `setBuilding(BuildingDef def)`

  `void`

  `setExplored(boolean explored)`

  `void`

  `setInvalidateCacheForAllChunks(int playerIndex,
  long dirtyFlags)`

  `void`

  `setName(String newName)`

  `void`

  `setRoofFixed(boolean b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### squareChoices

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> squareChoices
  + ### explored

    public boolean explored
  + ### doneSpawn

    public boolean doneSpawn
  + ### indoorZombies

    public int indoorZombies
  + ### spawnCount

    public int spawnCount
  + ### lightsActive

    public boolean lightsActive
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### level

    public int level
  + ### building

    public [BuildingDef](BuildingDef.html "class in zombie.iso") building
  + ### id

    public long id
  + ### rects

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef.RoomRect](RoomDef.RoomRect.html "class in zombie.iso")> rects
  + ### objects

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MetaObject](MetaObject.html "class in zombie.iso")> objects
  + ### x

    public int x
  + ### y

    public int y
  + ### x2

    public int x2
  + ### y2

    public int y2
  + ### area

    public int area
  + ### proceduralSpawnedContainer

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> proceduralSpawnedContainer
  + ### roofFixed

    private boolean roofFixed
  + ### metaId

    public long metaId
  + ### userDefined

    public boolean userDefined
* Constructor Details
  -------------------

  + ### RoomDef

    public RoomDef(long id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### RoomDef

    public RoomDef()
* Method Details
  --------------

  + ### getID

    public long getID()
  + ### getIDString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getIDString()
  + ### isExplored

    public boolean isExplored()
  + ### isInside

    public boolean isInside(int x,
    int y,
    int z)
  + ### contains

    public boolean contains(int x,
    int y)
  + ### intersects

    public boolean intersects(int x,
    int y,
    int w,
    int h)
  + ### isAdjacent

    public boolean isAdjacent([RoomDef](RoomDef.html "class in zombie.iso") other)
  + ### isAdjacent

    public boolean isAdjacent(int x,
    int y,
    int w,
    int h)
  + ### overlaps

    public boolean overlaps([RoomDef](RoomDef.html "class in zombie.iso") other)
  + ### getAreaOverlapping

    public float getAreaOverlapping([IsoChunk](IsoChunk.html "class in zombie.iso") chunk)
  + ### getAreaOverlapping

    public float getAreaOverlapping(int x,
    int y,
    int w,
    int h)
  + ### forEachChunk

    public void forEachChunk([BiConsumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/BiConsumer.html "class or interface in java.util.function")<[RoomDef](RoomDef.html "class in zombie.iso"),[IsoChunk](IsoChunk.html "class in zombie.iso")> consumer)
  + ### setInvalidateCacheForAllChunks

    public void setInvalidateCacheForAllChunks(int playerIndex,
    long dirtyFlags)
  + ### getIsoRoom

    public [IsoRoom](areas/IsoRoom.html "class in zombie.iso.areas") getIsoRoom()
  + ### getObjects

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MetaObject](MetaObject.html "class in zombie.iso")> getObjects()
  + ### getMetaObjects

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[MetaObject](MetaObject.html "class in zombie.iso")> getMetaObjects()
  + ### refreshSquares

    public void refreshSquares()
  + ### getBuilding

    public [BuildingDef](BuildingDef.html "class in zombie.iso") getBuilding()
  + ### setBuilding

    public void setBuilding([BuildingDef](BuildingDef.html "class in zombie.iso") def)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") newName)
  + ### getRects

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[RoomDef.RoomRect](RoomDef.RoomRect.html "class in zombie.iso")> getRects()
  + ### getY

    public int getY()
  + ### getX

    public int getX()
  + ### getX2

    public int getX2()
  + ### getY2

    public int getY2()
  + ### getW

    public int getW()
  + ### getH

    public int getH()
  + ### getZ

    public int getZ()
  + ### CalculateBounds

    public void CalculateBounds()
  + ### calculateMetaID

    public long calculateMetaID(int cellX,
    int cellY)
  + ### offset

    public void offset(int dx,
    int dy)
  + ### getArea

    public int getArea()
  + ### setExplored

    public void setExplored(boolean explored)
  + ### getFreeSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getFreeSquare()
  + ### getExtraFreeSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getExtraFreeSquare()
  + ### getFreeUnoccupiedSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getFreeUnoccupiedSquare()
  + ### getRandomSquare

    public [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") getRandomSquare([Predicate](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Predicate.html "class or interface in java.util.function")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> predicate)
  + ### isEmptyOutside

    public boolean isEmptyOutside()
  + ### getProceduralSpawnedContainer

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> getProceduralSpawnedContainer()
  + ### getRoomRect

    public [RoomDef.RoomRect](RoomDef.RoomRect.html "class in zombie.iso") getRoomRect(int x,
    int y,
    int z)
  + ### isRoofFixed

    public boolean isRoofFixed()
  + ### setRoofFixed

    public void setRoofFixed(boolean b)
  + ### getClosestPoint

    public float getClosestPoint(float x,
    float y,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") closestXY)
  + ### Dispose

    public void Dispose()
  + ### isKidsRoom

    public boolean isKidsRoom()
  + ### isShop

    public boolean isShop()
  + ### isUserDefined

    public boolean isUserDefined()
  + ### copyFrom

    public void copyFrom([RoomDef](RoomDef.html "class in zombie.iso") other)