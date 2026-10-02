[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoMannequin](IsoMannequin.html)
3. [MannequinZone](IsoMannequin.MannequinZone.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [female](#female)
   2. [dir](#dir)
   3. [mannequinScript](#mannequinScript)
   4. [pose](#pose)
   5. [skin](#skin)
   6. [outfit](#outfit)
6. [Constructor Details](#constructor-detail)
   1. [MannequinZone(String, String, int, int, int, int, int, KahluaTable)](#%3Cinit%3E(java.lang.String,java.lang.String,int,int,int,int,int,se.krka.kahlua.vm.KahluaTable))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoMannequin.MannequinZone
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.iso.zones.Zone](../zones/Zone.html "class in zombie.iso.zones")

zombie.iso.objects.IsoMannequin.MannequinZone

Enclosing class:
:   `IsoMannequin`

---

public static final class IsoMannequin.MannequinZone
extends [Zone](../zones/Zone.html "class in zombie.iso.zones")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `IsoDirections`

  `dir`

  `int`

  `female`

  `String`

  `mannequinScript`

  `String`

  `outfit`

  `String`

  `pose`

  `String`

  `skin`

  ### Fields inherited from class [Zone](../zones/Zone.html#field-summary "class in zombie.iso.zones")

  `clipper, geometryType, h, haveConstruction, hourLastSeen, id, isPreferredZoneForSquare, lastActionTimestamp, name, pickedRzStory, pickedXForZoneStory, pickedYForZoneStory, points, polylineOutlinePoints, polylineWidth, spawnedZombies, spawnSpecialZombies, totalArea, triangleAreas, triangles, type, w, x, y, z, zombiesTypeToSpawn`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `MannequinZone(String name,
  String type,
  int x,
  int y,
  int z,
  int w,
  int h,
  se.krka.kahlua.vm.KahluaTable properties)`
* Method Summary
  --------------

  ### Methods inherited from class [Zone](../zones/Zone.html#method-summary "class in zombie.iso.zones")

  `addSquare, contains, difference, Dispose, getClippedSegmentOfPolyline, getHeight, getHoursSinceLastSeen, getLastActionTimestamp, getName, getOriginalName, getPointsToLua, getPolygonTriangles, getPolylineLength, getPolylineOutlineTriangles, getRandomFreeSquareInZone, getRandomSquareInZone, getRandomUnseenSquareInZone, getSquares, getTotalArea, getType, getWidth, getX, getY, getZ, getZombieDensity, haveCons, intersects, isFullyStreamed, isPoint, isPolygon, isPolyline, isPreferredZoneForSquare, isRectangle, load, load, pickRandomLocation, removeSquare, save, save, sendToServer, setH, setHaveConstruction, setHourSeenToCurrent, setLastActionTimestamp, setName, setOriginalName, setPickedXForZoneStory, setPickedYForZoneStory, setType, setW, setX, setY, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### female

    public int female
  + ### dir

    public [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir
  + ### mannequinScript

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") mannequinScript
  + ### pose

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pose
  + ### skin

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") skin
  + ### outfit

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outfit
* Constructor Details
  -------------------

  + ### MannequinZone

    public MannequinZone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int w,
    int h,
    se.krka.kahlua.vm.KahluaTable properties)