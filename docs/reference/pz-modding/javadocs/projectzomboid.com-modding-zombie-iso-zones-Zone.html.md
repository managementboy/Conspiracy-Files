[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.zones](package-summary.html)
2. [Zone](Zone.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [LIANG\_BARSKY](#LIANG_BARSKY)
   2. [L\_lineSegmentIntersects](#L_lineSegmentIntersects)
   3. [s\_PreferredZoneTypes](#s_PreferredZoneTypes)
   4. [clipper](#clipper)
   5. [spawnedZombies](#spawnedZombies)
   6. [points](#points)
   7. [id](#id)
   8. [hourLastSeen](#hourLastSeen)
   9. [lastActionTimestamp](#lastActionTimestamp)
   10. [haveConstruction](#haveConstruction)
   11. [zombiesTypeToSpawn](#zombiesTypeToSpawn)
   12. [spawnSpecialZombies](#spawnSpecialZombies)
   13. [name](#name)
   14. [type](#type)
   15. [x](#x)
   16. [y](#y)
   17. [z](#z)
   18. [w](#w)
   19. [h](#h)
   20. [geometryType](#geometryType)
   21. [polylineWidth](#polylineWidth)
   22. [polylineOutlinePoints](#polylineOutlinePoints)
   23. [triangles](#triangles)
   24. [triangleAreas](#triangleAreas)
   25. [totalArea](#totalArea)
   26. [pickedXForZoneStory](#pickedXForZoneStory)
   27. [pickedYForZoneStory](#pickedYForZoneStory)
   28. [pickedRzStory](#pickedRzStory)
   29. [isPreferredZoneForSquare](#isPreferredZoneForSquare)
   30. [triangulateFailed](#triangulateFailed)
   31. [originalName](#originalName)
7. [Constructor Details](#constructor-detail)
   1. [Zone()](#%3Cinit%3E())
   2. [Zone(String, String, int, int, int, int, int)](#%3Cinit%3E(java.lang.String,java.lang.String,int,int,int,int,int))
   3. [Zone(String, String, int, int, int, int, int, ZoneGeometryType, TIntArrayList, int)](#%3Cinit%3E(java.lang.String,java.lang.String,int,int,int,int,int,zombie.iso.zones.ZoneGeometryType,gnu.trove.list.array.TIntArrayList,int))
8. [Method Details](#method-detail)
   1. [load(ByteBuffer, int, Map, SharedStrings)](#load(java.nio.ByteBuffer,int,java.util.Map,zombie.util.SharedStrings))
   2. [load(ByteBuffer, int)](#load(java.nio.ByteBuffer,int))
   3. [loadData(ByteBuffer, int)](#loadData(java.nio.ByteBuffer,int))
   4. [isPreferredZoneForSquare(String)](#isPreferredZoneForSquare(java.lang.String))
   5. [save(ByteBuffer, Map)](#save(java.nio.ByteBuffer,java.util.Map))
   6. [save(ByteBuffer)](#save(java.nio.ByteBuffer))
   7. [saveData(ByteBuffer)](#saveData(java.nio.ByteBuffer))
   8. [isFullyStreamed()](#isFullyStreamed())
   9. [setW(int)](#setW(int))
   10. [setH(int)](#setH(int))
   11. [isPoint()](#isPoint())
   12. [isPolygon()](#isPolygon())
   13. [isPolyline()](#isPolyline())
   14. [isRectangle()](#isRectangle())
   15. [setPickedXForZoneStory(int)](#setPickedXForZoneStory(int))
   16. [setPickedYForZoneStory(int)](#setPickedYForZoneStory(int))
   17. [getHoursSinceLastSeen()](#getHoursSinceLastSeen())
   18. [setHourSeenToCurrent()](#setHourSeenToCurrent())
   19. [setHaveConstruction(boolean)](#setHaveConstruction(boolean))
   20. [haveCons()](#haveCons())
   21. [getZombieDensity()](#getZombieDensity())
   22. [contains(int, int, int)](#contains(int,int,int))
   23. [intersects(int, int, int, int, int)](#intersects(int,int,int,int,int))
   24. [difference(int, int, int, int, int, ArrayList)](#difference(int,int,int,int,int,java.util.ArrayList))
   25. [pickRandomTriangle()](#pickRandomTriangle())
   26. [pickRandomPointInTriangle(int, Vector2)](#pickRandomPointInTriangle(int,zombie.iso.Vector2))
   27. [pickRandomLocation(IsoGameCharacter.Location)](#pickRandomLocation(zombie.characters.IsoGameCharacter.Location))
   28. [getRandomSquareInZone()](#getRandomSquareInZone())
   29. [getRandomFreeSquareInZone()](#getRandomFreeSquareInZone())
   30. [getRandomUnseenSquareInZone()](#getRandomUnseenSquareInZone())
   31. [addSquare(IsoGridSquare)](#addSquare(zombie.iso.IsoGridSquare))
   32. [getSquares()](#getSquares())
   33. [removeSquare(IsoGridSquare)](#removeSquare(zombie.iso.IsoGridSquare))
   34. [getName()](#getName())
   35. [setName(String)](#setName(java.lang.String))
   36. [getType()](#getType())
   37. [setType(String)](#setType(java.lang.String))
   38. [getLastActionTimestamp()](#getLastActionTimestamp())
   39. [setLastActionTimestamp(int)](#setLastActionTimestamp(int))
   40. [getX()](#getX())
   41. [setX(int)](#setX(int))
   42. [getY()](#getY())
   43. [setY(int)](#setY(int))
   44. [getZ()](#getZ())
   45. [getHeight()](#getHeight())
   46. [getWidth()](#getWidth())
   47. [getTotalArea()](#getTotalArea())
   48. [sendToServer()](#sendToServer())
   49. [getOriginalName()](#getOriginalName())
   50. [setOriginalName(String)](#setOriginalName(java.lang.String))
   51. [getClippedSegmentOfPolyline(int, int, int, int, double[])](#getClippedSegmentOfPolyline(int,int,int,int,double%5B%5D))
   52. [checkPolylineOutline()](#checkPolylineOutline())
   53. [isLeft(float, float, float, float, float, float)](#isLeft(float,float,float,float,float,float))
   54. [isPointInPolygon\_WindingNumber(float, float, int)](#isPointInPolygon_WindingNumber(float,float,int))
   55. [isPointInPolyline\_WindingNumber(float, float, int)](#isPointInPolyline_WindingNumber(float,float,int))
   56. [polygonRectIntersect(int, int, int, int)](#polygonRectIntersect(int,int,int,int))
   57. [lineSegmentIntersects(float, float, float, float)](#lineSegmentIntersects(float,float,float,float))
   58. [polylineOutlineRectIntersect(int, int, int, int)](#polylineOutlineRectIntersect(int,int,int,int))
   59. [polylineOutlineSegmentIntersects(float, float, float, float)](#polylineOutlineSegmentIntersects(float,float,float,float))
   60. [isClockwise()](#isClockwise())
   61. [getPolygonTriangles()](#getPolygonTriangles())
   62. [triangleArea(float, float, float, float, float, float)](#triangleArea(float,float,float,float,float,float))
   63. [initTriangleAreas()](#initTriangleAreas())
   64. [getPolylineOutlineTriangles()](#getPolylineOutlineTriangles())
   65. [getPolylineLength()](#getPolylineLength())
   66. [Dispose()](#Dispose())
   67. [getPointsToLua()](#getPointsToLua())
   68. [toString()](#toString())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Zone
==========

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.zones.Zone

Direct Known Subclasses:
:   `AnimalZone, IsoMannequin.MannequinZone, VehicleZone, WorldGenZone`

---

public class Zone
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static enum`

  `Zone.PolygonHit`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static zombie.vehicles.Clipper`

  `clipper`

  `zombie.iso.zones.ZoneGeometryType`

  `geometryType`

  `int`

  `h`

  `boolean`

  `haveConstruction`

  `int`

  `hourLastSeen`

  `UUID`

  `id`

  `boolean`

  `isPreferredZoneForSquare`

  `(package private) static final Vector2`

  `L_lineSegmentIntersects`

  `int`

  `lastActionTimestamp`

  `(package private) static final zombie.pathfind.LiangBarsky`

  `LIANG_BARSKY`

  `String`

  `name`

  `private String`

  `originalName`

  `RandomizedZoneStoryBase`

  `pickedRzStory`

  `int`

  `pickedXForZoneStory`

  `int`

  `pickedYForZoneStory`

  `final gnu.trove.list.array.TIntArrayList`

  `points`

  `float[]`

  `polylineOutlinePoints`

  `int`

  `polylineWidth`

  `private static final List<String>`

  `s_PreferredZoneTypes`

  `HashMap<String,Integer>`

  `spawnedZombies`

  `Boolean`

  `spawnSpecialZombies`

  `float`

  `totalArea`

  `float[]`

  `triangleAreas`

  `float[]`

  `triangles`

  `private boolean`

  `triangulateFailed`

  `String`

  `type`

  `int`

  `w`

  `int`

  `x`

  `int`

  `y`

  `int`

  `z`

  `String`

  `zombiesTypeToSpawn`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Zone()`

  `Zone(String name,
  String type,
  int x,
  int y,
  int z,
  int w,
  int h)`

  `Zone(String name,
  String type,
  int x,
  int y,
  int z,
  int w,
  int h,
  zombie.iso.zones.ZoneGeometryType geometryType,
  gnu.trove.list.array.TIntArrayList points,
  int polylineWidth)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addSquare(IsoGridSquare sq)`

  `private void`

  `checkPolylineOutline()`

  `boolean`

  `contains(int x,
  int y,
  int z)`

  `boolean`

  `difference(int x,
  int y,
  int z,
  int w,
  int h,
  ArrayList<Zone> result)`

  `void`

  `Dispose()`

  `int`

  `getClippedSegmentOfPolyline(int clipX1,
  int clipY1,
  int clipX2,
  int clipY2,
  double[] t1t2)`

  `int`

  `getHeight()`

  `float`

  `getHoursSinceLastSeen()`

  `int`

  `getLastActionTimestamp()`

  `String`

  `getName()`

  `String`

  `getOriginalName()`

  `List<Integer>`

  `getPointsToLua()`

  `float[]`

  `getPolygonTriangles()`

  `float`

  `getPolylineLength()`

  `float[]`

  `getPolylineOutlineTriangles()`

  `IsoGridSquare`

  `getRandomFreeSquareInZone()`

  `IsoGridSquare`

  `getRandomSquareInZone()`

  `IsoGridSquare`

  `getRandomUnseenSquareInZone()`

  `ArrayList<IsoGridSquare>`

  `getSquares()`

  `float`

  `getTotalArea()`

  `String`

  `getType()`

  `int`

  `getWidth()`

  `int`

  `getX()`

  `int`

  `getY()`

  `int`

  `getZ()`

  `int`

  `getZombieDensity()`

  `boolean`

  `haveCons()`

  `private void`

  `initTriangleAreas()`

  `boolean`

  `intersects(int x,
  int y,
  int z,
  int w,
  int h)`

  `private boolean`

  `isClockwise()`

  `boolean`

  `isFullyStreamed()`

  `(package private) float`

  `isLeft(float x0,
  float y0,
  float x1,
  float y1,
  float x2,
  float y2)`

  `boolean`

  `isPoint()`

  `(package private) Zone.PolygonHit`

  `isPointInPolygon_WindingNumber(float x,
  float y,
  int flags)`

  `(package private) Zone.PolygonHit`

  `isPointInPolyline_WindingNumber(float x,
  float y,
  int flags)`

  `boolean`

  `isPolygon()`

  `boolean`

  `isPolyline()`

  `static boolean`

  `isPreferredZoneForSquare(String type)`

  `boolean`

  `isRectangle()`

  `(package private) boolean`

  `lineSegmentIntersects(float sx,
  float sy,
  float ex,
  float ey)`

  `Zone`

  `load(ByteBuffer input,
  int worldVersion)`

  `Zone`

  `load(ByteBuffer input,
  int worldVersion,
  Map<Integer,String> stringMap,
  zombie.util.SharedStrings sharedStrings)`

  `private void`

  `loadData(ByteBuffer input,
  int worldVersion)`

  `IsoGameCharacter.Location`

  `pickRandomLocation(IsoGameCharacter.Location location)`

  `private Vector2`

  `pickRandomPointInTriangle(int triangleIndex,
  Vector2 out)`

  `private int`

  `pickRandomTriangle()`

  `(package private) boolean`

  `polygonRectIntersect(int x,
  int y,
  int w,
  int h)`

  `(package private) boolean`

  `polylineOutlineRectIntersect(int x,
  int y,
  int w,
  int h)`

  `(package private) boolean`

  `polylineOutlineSegmentIntersects(float sx,
  float sy,
  float ex,
  float ey)`

  `void`

  `removeSquare(IsoGridSquare sq)`

  `void`

  `save(ByteBuffer output)`

  `void`

  `save(ByteBuffer output,
  Map<String,Integer> stringMap)`

  `private void`

  `saveData(ByteBuffer output)`

  `void`

  `sendToServer()`

  `void`

  `setH(int h)`

  `void`

  `setHaveConstruction(boolean have)`

  `void`

  `setHourSeenToCurrent()`

  `void`

  `setLastActionTimestamp(int lastActionTimestamp)`

  `void`

  `setName(String name)`

  `void`

  `setOriginalName(String originalName)`

  `void`

  `setPickedXForZoneStory(int pickedXForZoneStory)`

  `void`

  `setPickedYForZoneStory(int pickedYForZoneStory)`

  `void`

  `setType(String type)`

  `void`

  `setW(int w)`

  `void`

  `setX(int x)`

  `void`

  `setY(int y)`

  `String`

  `toString()`

  `private float`

  `triangleArea(float x0,
  float y0,
  float x1,
  float y1,
  float x2,
  float y2)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### LIANG\_BARSKY

    static final zombie.pathfind.LiangBarsky LIANG\_BARSKY
  + ### L\_lineSegmentIntersects

    static final [Vector2](../Vector2.html "class in zombie.iso") L\_lineSegmentIntersects
  + ### s\_PreferredZoneTypes

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> s\_PreferredZoneTypes
  + ### clipper

    public static zombie.vehicles.Clipper clipper
  + ### spawnedZombies

    public [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> spawnedZombies
  + ### points

    public final gnu.trove.list.array.TIntArrayList points
  + ### id

    public [UUID](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/UUID.html "class or interface in java.util") id
  + ### hourLastSeen

    public int hourLastSeen
  + ### lastActionTimestamp

    public int lastActionTimestamp
  + ### haveConstruction

    public boolean haveConstruction
  + ### zombiesTypeToSpawn

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") zombiesTypeToSpawn
  + ### spawnSpecialZombies

    public [Boolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Boolean.html "class or interface in java.lang") spawnSpecialZombies
  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### type

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type
  + ### x

    public int x
  + ### y

    public int y
  + ### z

    public int z
  + ### w

    public int w
  + ### h

    public int h
  + ### geometryType

    public zombie.iso.zones.ZoneGeometryType geometryType
  + ### polylineWidth

    public int polylineWidth
  + ### polylineOutlinePoints

    public float[] polylineOutlinePoints
  + ### triangles

    public float[] triangles
  + ### triangleAreas

    public float[] triangleAreas
  + ### totalArea

    public float totalArea
  + ### pickedXForZoneStory

    public int pickedXForZoneStory
  + ### pickedYForZoneStory

    public int pickedYForZoneStory
  + ### pickedRzStory

    public [RandomizedZoneStoryBase](../../randomizedWorld/randomizedZoneStory/RandomizedZoneStoryBase.html "class in zombie.randomizedWorld.randomizedZoneStory") pickedRzStory
  + ### isPreferredZoneForSquare

    public boolean isPreferredZoneForSquare
  + ### triangulateFailed

    private boolean triangulateFailed
  + ### originalName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalName
* Constructor Details
  -------------------

  + ### Zone

    public Zone()
  + ### Zone

    public Zone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int w,
    int h)
  + ### Zone

    public Zone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    int x,
    int y,
    int z,
    int w,
    int h,
    zombie.iso.zones.ZoneGeometryType geometryType,
    gnu.trove.list.array.TIntArrayList points,
    int polylineWidth)
* Method Details
  --------------

  + ### load

    public [Zone](Zone.html "class in zombie.iso.zones") load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang"),[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> stringMap,
    zombie.util.SharedStrings sharedStrings)
  + ### load

    public [Zone](Zone.html "class in zombie.iso.zones") load([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### loadData

    private void loadData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") input,
    int worldVersion)
  + ### isPreferredZoneForSquare

    public static boolean isPreferredZoneForSquare([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output,
    [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> stringMap)
  + ### save

    public void save([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### saveData

    private void saveData([ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") output)
  + ### isFullyStreamed

    public boolean isFullyStreamed()
  + ### setW

    public void setW(int w)
  + ### setH

    public void setH(int h)
  + ### isPoint

    public boolean isPoint()
  + ### isPolygon

    public boolean isPolygon()
  + ### isPolyline

    public boolean isPolyline()
  + ### isRectangle

    public boolean isRectangle()
  + ### setPickedXForZoneStory

    public void setPickedXForZoneStory(int pickedXForZoneStory)
  + ### setPickedYForZoneStory

    public void setPickedYForZoneStory(int pickedYForZoneStory)
  + ### getHoursSinceLastSeen

    public float getHoursSinceLastSeen()
  + ### setHourSeenToCurrent

    public void setHourSeenToCurrent()
  + ### setHaveConstruction

    public void setHaveConstruction(boolean have)
  + ### haveCons

    public boolean haveCons()
  + ### getZombieDensity

    public int getZombieDensity()
  + ### contains

    public boolean contains(int x,
    int y,
    int z)
  + ### intersects

    public boolean intersects(int x,
    int y,
    int z,
    int w,
    int h)
  + ### difference

    public boolean difference(int x,
    int y,
    int z,
    int w,
    int h,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Zone](Zone.html "class in zombie.iso.zones")> result)
  + ### pickRandomTriangle

    private int pickRandomTriangle()
  + ### pickRandomPointInTriangle

    private [Vector2](../Vector2.html "class in zombie.iso") pickRandomPointInTriangle(int triangleIndex,
    [Vector2](../Vector2.html "class in zombie.iso") out)
  + ### pickRandomLocation

    public [IsoGameCharacter.Location](../../characters/IsoGameCharacter.Location.html "class in zombie.characters") pickRandomLocation([IsoGameCharacter.Location](../../characters/IsoGameCharacter.Location.html "class in zombie.characters") location)
  + ### getRandomSquareInZone

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomSquareInZone()
  + ### getRandomFreeSquareInZone

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomFreeSquareInZone()
  + ### getRandomUnseenSquareInZone

    public [IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") getRandomUnseenSquareInZone()
  + ### addSquare

    public void addSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### getSquares

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](../IsoGridSquare.html "class in zombie.iso")> getSquares()
  + ### removeSquare

    public void removeSquare([IsoGridSquare](../IsoGridSquare.html "class in zombie.iso") sq)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()
  + ### setType

    public void setType([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type)
  + ### getLastActionTimestamp

    public int getLastActionTimestamp()
  + ### setLastActionTimestamp

    public void setLastActionTimestamp(int lastActionTimestamp)
  + ### getX

    public int getX()
  + ### setX

    public void setX(int x)
  + ### getY

    public int getY()
  + ### setY

    public void setY(int y)
  + ### getZ

    public int getZ()
  + ### getHeight

    public int getHeight()
  + ### getWidth

    public int getWidth()
  + ### getTotalArea

    public float getTotalArea()
  + ### sendToServer

    public void sendToServer()
  + ### getOriginalName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOriginalName()
  + ### setOriginalName

    public void setOriginalName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalName)
  + ### getClippedSegmentOfPolyline

    public int getClippedSegmentOfPolyline(int clipX1,
    int clipY1,
    int clipX2,
    int clipY2,
    double[] t1t2)
  + ### checkPolylineOutline

    private void checkPolylineOutline()
  + ### isLeft

    float isLeft(float x0,
    float y0,
    float x1,
    float y1,
    float x2,
    float y2)
  + ### isPointInPolygon\_WindingNumber

    [Zone.PolygonHit](Zone.PolygonHit.html "enum class in zombie.iso.zones") isPointInPolygon\_WindingNumber(float x,
    float y,
    int flags)
  + ### isPointInPolyline\_WindingNumber

    [Zone.PolygonHit](Zone.PolygonHit.html "enum class in zombie.iso.zones") isPointInPolyline\_WindingNumber(float x,
    float y,
    int flags)
  + ### polygonRectIntersect

    boolean polygonRectIntersect(int x,
    int y,
    int w,
    int h)
  + ### lineSegmentIntersects

    boolean lineSegmentIntersects(float sx,
    float sy,
    float ex,
    float ey)
  + ### polylineOutlineRectIntersect

    boolean polylineOutlineRectIntersect(int x,
    int y,
    int w,
    int h)
  + ### polylineOutlineSegmentIntersects

    boolean polylineOutlineSegmentIntersects(float sx,
    float sy,
    float ex,
    float ey)
  + ### isClockwise

    private boolean isClockwise()
  + ### getPolygonTriangles

    public float[] getPolygonTriangles()
  + ### triangleArea

    private float triangleArea(float x0,
    float y0,
    float x1,
    float y1,
    float x2,
    float y2)
  + ### initTriangleAreas

    private void initTriangleAreas()
  + ### getPolylineOutlineTriangles

    public float[] getPolylineOutlineTriangles()
  + ### getPolylineLength

    public float getPolylineLength()
  + ### Dispose

    public void Dispose()
  + ### getPointsToLua

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> getPointsToLua()
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`