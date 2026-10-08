[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.worldgen.zones](package-summary.html)
2. [WorldGenZone](WorldGenZone.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [rocks](#rocks)
6. [Constructor Details](#constructor-detail)
   1. [WorldGenZone(String, String, int, int, int, int, int, KahluaTable)](#%3Cinit%3E(java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))
7. [Method Details](#method-detail)
   1. [getRocks()](#getRocks())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class WorldGenZone
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.iso.zones.Zone](../../zones/Zone.html "class in zombie.iso.zones")

zombie.iso.worldgen.zones.WorldGenZone

---

public class WorldGenZone
extends [Zone](../../zones/Zone.html "class in zombie.iso.zones")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `rocks`

  ### Fields inherited from class [Zone](../../zones/Zone.html#field-summary "class in zombie.iso.zones")

  `clipper, geometryType, h, haveConstruction, hourLastSeen, id, isPreferredZoneForSquare, lastActionTimestamp, name, pickedRzStory, pickedXForZoneStory, pickedYForZoneStory, points, polylineOutlinePoints, polylineWidth, spawnedZombies, spawnSpecialZombies, totalArea, triangleAreas, triangles, type, w, x, y, z, zombiesTypeToSpawn`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WorldGenZone(String name,
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

  `boolean`

  `getRocks()`

  ### Methods inherited from class [Zone](../../zones/Zone.html#method-summary "class in zombie.iso.zones")

  `addSquare, contains, difference, Dispose, getClippedSegmentOfPolyline, getHeight, getHoursSinceLastSeen, getLastActionTimestamp, getName, getOriginalName, getPointsToLua, getPolygonTriangles, getPolylineLength, getPolylineOutlineTriangles, getRandomFreeSquareInZone, getRandomSquareInZone, getRandomUnseenSquareInZone, getSquares, getTotalArea, getType, getWidth, getX, getY, getZ, getZombieDensity, haveCons, intersects, isFullyStreamed, isPoint, isPolygon, isPolyline, isPreferredZoneForSquare, isRectangle, load, load, pickRandomLocation, removeSquare, save, save, sendToServer, setH, setHaveConstruction, setHourSeenToCurrent, setLastActionTimestamp, setName, setOriginalName, setPickedXForZoneStory, setPickedYForZoneStory, setType, setW, setX, setY, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### rocks

    private boolean rocks
* Constructor Details
  -------------------

  + ### WorldGenZone

    public WorldGenZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int w,
    int h,
    se.krka.kahlua.vm.KahluaTable properties)
* Method Details
  --------------

  + ### getRocks

    public boolean getRocks()