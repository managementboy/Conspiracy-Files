[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.characters.animals](package-summary.html)
2. [AnimalZone](AnimalZone.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [animalType](#animalType)
   2. [action](#action)
   3. [junctions](#junctions)
   4. [spawnedAnimals](#spawnedAnimals)
   5. [spawnAnimal](#spawnAnimal)
6. [Constructor Details](#constructor-detail)
   1. [AnimalZone()](#%3Cinit%3E())
   2. [AnimalZone(String, String, int, int, int, int, int, KahluaTable)](#%3Cinit%3E(java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))
   3. [AnimalZone(String, String, int, int, int, int, int, String, String, boolean)](#%3Cinit%3E(java.lang.String,java.lang.String,int,int,int,int,int,java.lang.String,java.lang.String,boolean))
7. [Method Details](#method-detail)
   1. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   2. [save(ByteBuffer, Map)](#save(java.nio.ByteBuffer,java.util.Map))
   3. [load(ByteBuffer, int, Map, SharedStrings)](#load(java.nio.ByteBuffer,int,java.util.Map,zombie.util.SharedStrings))
   4. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   5. [Dispose()](#Dispose())
   6. [getIndexOfPoint(int, int)](#getIndexOfPoint(int,int))
   7. [getAction()](#getAction())
   8. [addJunctionsWithOtherZone(AnimalZone)](#addJunctionsWithOtherZone(zombie.characters.animals.AnimalZone))
   9. [hasJunction(int, AnimalZone, int)](#hasJunction(int,zombie.characters.animals.AnimalZone,int))
   10. [addJunction(int, AnimalZone, int)](#addJunction(int,zombie.characters.animals.AnimalZone,int))
   11. [addJunction(AnimalZoneJunction)](#addJunction(zombie.characters.animals.AnimalZoneJunction))
   12. [getJunctionsBetween(float, float, ArrayList)](#getJunctionsBetween(float,float,java.util.ArrayList))
   13. [getClosedPolylineLength()](#getClosedPolylineLength())
   14. [getPolylineSegment(float)](#getPolylineSegment(float))
   15. [getPointOnPolyline(float, Vector2f)](#getPointOnPolyline(float,org.joml.Vector2f))
   16. [pickRandomPointOnPolyline(Vector2f)](#pickRandomPointOnPolyline(org.joml.Vector2f))
   17. [getClosestPointOnPolyline(float, float, Vector2f)](#getClosestPointOnPolyline(float,float,org.joml.Vector2f))
   18. [getDistanceOfPointFromStart(int)](#getDistanceOfPointFromStart(int))
   19. [getDirectionOnPolyline(float, Vector2f)](#getDirectionOnPolyline(float,org.joml.Vector2f))
   20. [toString()](#toString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AnimalZone
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.iso.zones.Zone](../../iso/zones/Zone.html "class in zombie.iso.zones")

zombie.characters.animals.AnimalZone

---

public final class AnimalZone
extends [Zone](../../iso/zones/Zone.html "class in zombie.iso.zones")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `String`

  `action`

  `(package private) String`

  `animalType`

  `ArrayList<zombie.characters.animals.AnimalZoneJunction>`

  `junctions`

  `(package private) boolean`

  `spawnAnimal`

  `(package private) boolean`

  `spawnedAnimals`

  ### Fields inherited from class [Zone](../../iso/zones/Zone.html#field-summary "class in zombie.iso.zones")

  `clipper, geometryType, h, haveConstruction, hourLastSeen, id, isPreferredZoneForSquare, lastActionTimestamp, name, pickedRzStory, pickedXForZoneStory, pickedYForZoneStory, points, polylineOutlinePoints, polylineWidth, spawnedZombies, spawnSpecialZombies, totalArea, triangleAreas, triangles, type, w, x, y, z, zombiesTypeToSpawn`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimalZone()`

  `AnimalZone(String name,
  String type,
  int x,
  int y,
  int z,
  int w,
  int h,
  String action,
  String animalType,
  boolean spawnAnimal)`

  `AnimalZone(String name,
  String type,
  int x,
  int y,
  int z,
  int w,
  int h,
  se.krka.kahlua.vm.KahluaTable properties)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addJunction(int pointIndexSelf,
  AnimalZone other,
  int pointIndexOther)`

  `void`

  `addJunction(zombie.characters.animals.AnimalZoneJunction junction)`

  `void`

  `addJunctionsWithOtherZone(AnimalZone other)`

  `void`

  `Dispose()`

  `String`

  `getAction()`

  `float`

  `getClosedPolylineLength()`

  `float`

  `getClosestPointOnPolyline(float px,
  float py,
  Vector2f out)`

  `boolean`

  `getDirectionOnPolyline(float t,
  Vector2f out)`

  `float`

  `getDistanceOfPointFromStart(int pointIndex)`

  `int`

  `getIndexOfPoint(int x,
  int y)`

  `void`

  `getJunctionsBetween(float t1,
  float t2,
  ArrayList<zombie.characters.animals.AnimalZoneJunction> junctions)`

  `boolean`

  `getPointOnPolyline(float t,
  Vector2f out)`

  `(package private) int`

  `getPolylineSegment(float t)`

  `(package private) boolean`

  `hasJunction(int pointIndexSelf,
  AnimalZone other,
  int pointIndexOther)`

  `AnimalZone`

  `load(ByteBuffer input,
  int worldVersion)`

  `AnimalZone`

  `load(ByteBuffer input,
  int worldVersion,
  Map<Integer,String> stringMap,
  zombie.util.SharedStrings sharedStrings)`

  `(package private) boolean`

  `pickRandomPointOnPolyline(Vector2f out)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `save(ByteBuffer output,
  Map<String,Integer> stringMap)`

  `String`

  `toString()`

  ### Methods inherited from class [Zone](../../iso/zones/Zone.html#method-summary "class in zombie.iso.zones")

  `addSquare, contains, difference, getClippedSegmentOfPolyline, getHeight, getHoursSinceLastSeen, getLastActionTimestamp, getName, getOriginalName, getPointsToLua, getPolygonTriangles, getPolylineLength, getPolylineOutlineTriangles, getRandomFreeSquareInZone, getRandomSquareInZone, getRandomUnseenSquareInZone, getSquares, getTotalArea, getType, getWidth, getX, getY, getZ, getZombieDensity, haveCons, intersects, isFullyStreamed, isPoint, isPolygon, isPolyline, isPreferredZoneForSquare, isRectangle, pickRandomLocation, removeSquare, sendToServer, setH, setHaveConstruction, setHourSeenToCurrent, setLastActionTimestamp, setName, setOriginalName, setPickedXForZoneStory, setPickedYForZoneStory, setType, setW, setX, setY`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### animalType

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalType
  + ### action

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action
  + ### junctions

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.characters.animals.AnimalZoneJunction> junctions
  + ### spawnedAnimals

    boolean spawnedAnimals
  + ### spawnAnimal

    boolean spawnAnimal
* Constructor Details
  -------------------

  + ### AnimalZone

    public AnimalZone()
  + ### AnimalZone

    public AnimalZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int w,
    int h,
    se.krka.kahlua.vm.KahluaTable properties)
  + ### AnimalZone

    public AnimalZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int w,
    int h,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") action,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") animalType,
    boolean spawnAnimal)
* Method Details
  --------------

  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)

    Overrides:
    :   `save` in class `Zone`
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> stringMap)

    Overrides:
    :   `save` in class `Zone`
  + ### load

    public [AnimalZone](AnimalZone.html "class in zombie.characters.animals") load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> stringMap,
    zombie.util.SharedStrings sharedStrings)

    Overrides:
    :   `load` in class `Zone`
  + ### load

    public [AnimalZone](AnimalZone.html "class in zombie.characters.animals") load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)

    Overrides:
    :   `load` in class `Zone`
  + ### Dispose

    public void Dispose()

    Overrides:
    :   `Dispose` in class `Zone`
  + ### getIndexOfPoint

    public int getIndexOfPoint(int x,
    int y)
  + ### getAction

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAction()
  + ### addJunctionsWithOtherZone

    public void addJunctionsWithOtherZone([AnimalZone](AnimalZone.html "class in zombie.characters.animals") other)
  + ### hasJunction

    boolean hasJunction(int pointIndexSelf,
    [AnimalZone](AnimalZone.html "class in zombie.characters.animals") other,
    int pointIndexOther)
  + ### addJunction

    public void addJunction(int pointIndexSelf,
    [AnimalZone](AnimalZone.html "class in zombie.characters.animals") other,
    int pointIndexOther)
  + ### addJunction

    public void addJunction(zombie.characters.animals.AnimalZoneJunction junction)
  + ### getJunctionsBetween

    public void getJunctionsBetween(float t1,
    float t2,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.characters.animals.AnimalZoneJunction> junctions)
  + ### getClosedPolylineLength

    public float getClosedPolylineLength()
  + ### getPolylineSegment

    int getPolylineSegment(float t)
  + ### getPointOnPolyline

    public boolean getPointOnPolyline(float t,
    [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") out)
  + ### pickRandomPointOnPolyline

    boolean pickRandomPointOnPolyline([Vector2f](../../../org/joml/Vector2f.html "class in org.joml") out)
  + ### getClosestPointOnPolyline

    public float getClosestPointOnPolyline(float px,
    float py,
    [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") out)
  + ### getDistanceOfPointFromStart

    public float getDistanceOfPointFromStart(int pointIndex)
  + ### getDirectionOnPolyline

    public boolean getDirectionOnPolyline(float t,
    [Vector2f](../../../org/joml/Vector2f.html "class in org.joml") out)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Zone`