[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.worldMap.streets](package-summary.html)
2. [WorldMapStreet](WorldMapStreet.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [s\_pool](#s_pool)
   2. [s\_pointsPool](#s_pointsPool)
   3. [s\_closestPoint](#s_closestPoint)
   4. [s\_pointOn](#s_pointOn)
   5. [s\_clipped](#s_clipped)
   6. [s\_reverse](#s_reverse)
   7. [s\_charLayoutPool](#s_charLayoutPool)
   8. [s\_layout](#s_layout)
   9. [triangles2](#triangles2)
   10. [cosA](#cosA)
   11. [sinA](#sinA)
   12. [x](#x)
   13. [y](#y)
   14. [xAlongLine](#xAlongLine)
   15. [GAP](#GAP)
   16. [fontScale](#fontScale)
   17. [sdfThreshold](#sdfThreshold)
   18. [shadow](#shadow)
   19. [outlineThickness](#outlineThickness)
   20. [outlineR](#outlineR)
   21. [outlineG](#outlineG)
   22. [outlineB](#outlineB)
   23. [outlineA](#outlineA)
   24. [owner](#owner)
   25. [untranslatedText](#untranslatedText)
   26. [points](#points)
   27. [width](#width)
   28. [intersections](#intersections)
   29. [connectedToStart](#connectedToStart)
   30. [connectedToEnd](#connectedToEnd)
   31. [splitStreets](#splitStreets)
   32. [changeCount](#changeCount)
   33. [NAV\_ZONE](#NAV_ZONE)
   34. [RAILROAD\_STRINGS](#RAILROAD_STRINGS)
   35. [countsForward](#countsForward)
   36. [countsBackward](#countsBackward)
   37. [clipper](#clipper)
7. [Constructor Details](#constructor-detail)
   1. [WorldMapStreet()](#%3Cinit%3E())
   2. [WorldMapStreet(WorldMapStreets, String, StreetPoints)](#%3Cinit%3E(zombie.worldMap.streets.WorldMapStreets,java.lang.String,zombie.worldMap.streets.StreetPoints))
8. [Method Details](#method-detail)
   1. [init(WorldMapStreets, String, StreetPoints)](#init(zombie.worldMap.streets.WorldMapStreets,java.lang.String,zombie.worldMap.streets.StreetPoints))
   2. [getOwner()](#getOwner())
   3. [getMinX()](#getMinX())
   4. [getMinY()](#getMinY())
   5. [getMaxX()](#getMaxX())
   6. [getMaxY()](#getMaxY())
   7. [getNumPoints()](#getNumPoints())
   8. [getPointX(int)](#getPointX(int))
   9. [getPointY(int)](#getPointY(int))
   10. [getLength(UIWorldMap)](#getLength(zombie.worldMap.UIWorldMap))
   11. [getLengthSquared(UIWorldMap)](#getLengthSquared(zombie.worldMap.UIWorldMap))
   12. [getPoints()](#getPoints())
   13. [addPoint(float, float)](#addPoint(float,float))
   14. [insertPoint(int, float, float)](#insertPoint(int,float,float))
   15. [removePoint(int)](#removePoint(int))
   16. [setPoint(int, float, float)](#setPoint(int,float,float))
   17. [setWidth(int)](#setWidth(int))
   18. [getWidth()](#getWidth())
   19. [reverseDirection()](#reverseDirection())
   20. [getTranslatedText()](#getTranslatedText())
   21. [getUntranslatedText()](#getUntranslatedText())
   22. [setUntranslatedText(String)](#setUntranslatedText(java.lang.String))
   23. [getFont(UIWorldMap)](#getFont(zombie.worldMap.UIWorldMap))
   24. [getFontScale(UIWorldMap)](#getFontScale(zombie.worldMap.UIWorldMap))
   25. [getIntersections()](#getIntersections())
   26. [resetIntersectionRenderFlag()](#resetIntersectionRenderFlag())
   27. [setIntersectionRenderFlag(UIWorldMap, float, float)](#setIntersectionRenderFlag(zombie.worldMap.UIWorldMap,float,float))
   28. [getMatchingIntersection(WorldMapStreet, float, float)](#getMatchingIntersection(zombie.worldMap.streets.WorldMapStreet,float,float))
   29. [overlapsAnotherLabel(UIWorldMap, float, float)](#overlapsAnotherLabel(zombie.worldMap.UIWorldMap,float,float))
   30. [getPointOn(UIWorldMap, float, PointOn)](#getPointOn(zombie.worldMap.UIWorldMap,float,zombie.worldMap.streets.PointOn))
   31. [splitAtOccludedIntersections(ArrayList)](#splitAtOccludedIntersections(java.util.ArrayList))
   32. [render(UIWorldMap, StreetRenderData)](#render(zombie.worldMap.UIWorldMap,zombie.worldMap.streets.StreetRenderData))
   33. [getDistanceAlongOriginalStreet(UIWorldMap, float, WorldMapStreet)](#getDistanceAlongOriginalStreet(zombie.worldMap.UIWorldMap,float,zombie.worldMap.streets.WorldMapStreet))
   34. [render2(UIWorldMap, WorldMapStreet, StreetRenderData)](#render2(zombie.worldMap.UIWorldMap,zombie.worldMap.streets.WorldMapStreet,zombie.worldMap.streets.StreetRenderData))
   35. [render2b(UIWorldMap, WorldMapStreet, StreetRenderData, float, float, float, float)](#render2b(zombie.worldMap.UIWorldMap,zombie.worldMap.streets.WorldMapStreet,zombie.worldMap.streets.StreetRenderData,float,float,float,float))
   36. [renderSection(UIWorldMap, float, float, float, float, float, float, int, StreetRenderData)](#renderSection(zombie.worldMap.UIWorldMap,float,float,float,float,float,float,int,zombie.worldMap.streets.StreetRenderData))
   37. [renderLines(UIWorldMap, float, float, float, float, int, StreetRenderData)](#renderLines(zombie.worldMap.UIWorldMap,float,float,float,float,int,zombie.worldMap.streets.StreetRenderData))
   38. [renderLine(UIWorldMap, float, float, float, float, float, float, float, float, int, StreetRenderData)](#renderLine(zombie.worldMap.UIWorldMap,float,float,float,float,float,float,float,float,int,zombie.worldMap.streets.StreetRenderData))
   39. [renderIntersections(UIWorldMap, float, float, float, float)](#renderIntersections(zombie.worldMap.UIWorldMap,float,float,float,float))
   40. [shouldRenderForward(UIWorldMap, double, float, float)](#shouldRenderForward(zombie.worldMap.UIWorldMap,double,float,float))
   41. [countUpsideDownCharacters(WorldMapStreet.LayoutCounts)](#countUpsideDownCharacters(zombie.worldMap.streets.WorldMapStreet.LayoutCounts))
   42. [clipToObscuredCells()](#clipToObscuredCells())
   43. [layoutForward(UIWorldMap, float, float)](#layoutForward(zombie.worldMap.UIWorldMap,float,float))
   44. [layoutBackward(UIWorldMap, double, float, float)](#layoutBackward(zombie.worldMap.UIWorldMap,double,float,float))
   45. [renderForward(UIWorldMap, float, float, float, StreetRenderData)](#renderForward(zombie.worldMap.UIWorldMap,float,float,float,zombie.worldMap.streets.StreetRenderData))
   46. [renderBackward(UIWorldMap, double, float, float, StreetRenderData)](#renderBackward(zombie.worldMap.UIWorldMap,double,float,float,zombie.worldMap.streets.StreetRenderData))
   47. [layoutTextAlongLine(UIWorldMap, int, float, float, float, float)](#layoutTextAlongLine(zombie.worldMap.UIWorldMap,int,float,float,float,float))
   48. [getSdfThreshold(UIWorldMap)](#getSdfThreshold(zombie.worldMap.UIWorldMap))
   49. [getAbsolutePosition(UIWorldMap, double, double, double[])](#getAbsolutePosition(zombie.worldMap.UIWorldMap,double,double,double%5B%5D))
   50. [getClosestPointOn(UIWorldMap, float, float, ClosestPoint)](#getClosestPointOn(zombie.worldMap.UIWorldMap,float,float,zombie.worldMap.streets.ClosestPoint))
   51. [getClosestPointOn(float, float, ClosestPoint)](#getClosestPointOn(float,float,zombie.worldMap.streets.ClosestPoint))
   52. [pickPoint(UIWorldMap, float, float)](#pickPoint(zombie.worldMap.UIWorldMap,float,float))
   53. [getAddPointLocation(UIWorldMap, float, float, ClosestPoint)](#getAddPointLocation(zombie.worldMap.UIWorldMap,float,float,zombie.worldMap.streets.ClosestPoint))
   54. [calculateIntersections(WorldMapStreet)](#calculateIntersections(zombie.worldMap.streets.WorldMapStreet))
   55. [createHighlightPolygons(TFloatArrayList, TFloatArrayList)](#createHighlightPolygons(gnu.trove.list.array.TFloatArrayList,gnu.trove.list.array.TFloatArrayList))
   56. [createPolygon(TFloatArrayList)](#createPolygon(gnu.trove.list.array.TFloatArrayList))
   57. [isClockwise(TFloatArrayList)](#isClockwise(gnu.trove.list.array.TFloatArrayList))
   58. [triangulate(TFloatArrayList, TFloatArrayList)](#triangulate(gnu.trove.list.array.TFloatArrayList,gnu.trove.list.array.TFloatArrayList))
   59. [isOnScreen(UIWorldMap)](#isOnScreen(zombie.worldMap.UIWorldMap))
   60. [createCopy(WorldMapStreets)](#createCopy(zombie.worldMap.streets.WorldMapStreets))
   61. [registerNavZones()](#registerNavZones())
   62. [registerNavZone(int, int, int, int)](#registerNavZone(int,int,int,int))
   63. [registerNavZone2(int, int, int, int)](#registerNavZone2(int,int,int,int))
   64. [registerNavZonePolyline(TIntArrayList)](#registerNavZonePolyline(gnu.trove.list.array.TIntArrayList))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class WorldMapStreet
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.worldMap.streets.WorldMapStreet

---

public final class WorldMapStreet
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `(package private) static final class`

  `WorldMapStreet.L_getSdfThreshold`

  `(package private) static final class`

  `WorldMapStreet.LayoutCounts`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) long`

  `changeCount`

  `(package private) static zombie.vehicles.Clipper`

  `clipper`

  `(package private) WorldMapStreet`

  `connectedToEnd`

  `(package private) WorldMapStreet`

  `connectedToStart`

  `private static double`

  `cosA`

  `(package private) static final WorldMapStreet.LayoutCounts`

  `countsBackward`

  `(package private) static final WorldMapStreet.LayoutCounts`

  `countsForward`

  `private static double`

  `fontScale`

  `private static final int`

  `GAP`

  `private final ArrayList<zombie.worldMap.streets.Intersection>`

  `intersections`

  `private static final String`

  `NAV_ZONE`

  `private static float`

  `outlineA`

  `private static float`

  `outlineB`

  `private static float`

  `outlineG`

  `private static float`

  `outlineR`

  `private static float`

  `outlineThickness`

  `private zombie.worldMap.streets.WorldMapStreets`

  `owner`

  `private StreetPoints`

  `points`

  `private static final List<String>`

  `RAILROAD_STRINGS`

  `(package private) static final zombie.popman.ObjectPool<zombie.worldMap.streets.CharLayout>`

  `s_charLayoutPool`

  `private static final StreetPoints`

  `s_clipped`

  `private static final zombie.worldMap.streets.ClosestPoint`

  `s_closestPoint`

  `private static final ArrayList<zombie.worldMap.streets.CharLayout>`

  `s_layout`

  `private static final zombie.worldMap.streets.PointOn`

  `s_pointOn`

  `(package private) static final zombie.popman.ObjectPool<StreetPoints>`

  `s_pointsPool`

  `(package private) static final zombie.popman.ObjectPool<WorldMapStreet>`

  `s_pool`

  `private static final StreetPoints`

  `s_reverse`

  `private static float`

  `sdfThreshold`

  `private static float`

  `shadow`

  `private static double`

  `sinA`

  `(package private) final ArrayList<WorldMapStreet>`

  `splitStreets`

  `private static final gnu.trove.list.array.TFloatArrayList`

  `triangles2`

  `private String`

  `untranslatedText`

  `private int`

  `width`

  `private static double`

  `x`

  `private static double`

  `xAlongLine`

  `private static double`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `WorldMapStreet()`

  `WorldMapStreet(zombie.worldMap.streets.WorldMapStreets owner,
  String untranslatedText,
  StreetPoints points)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `void`

  `addPoint(float x,
  float y)`

  `(package private) void`

  `calculateIntersections(WorldMapStreet other)`

  `void`

  `clipToObscuredCells()`

  `private void`

  `countUpsideDownCharacters(WorldMapStreet.LayoutCounts counts)`

  `WorldMapStreet`

  `createCopy(zombie.worldMap.streets.WorldMapStreets owner)`

  `void`

  `createHighlightPolygons(gnu.trove.list.array.TFloatArrayList polygon,
  gnu.trove.list.array.TFloatArrayList triangles)`

  `void`

  `createPolygon(gnu.trove.list.array.TFloatArrayList points)`

  `private double[]`

  `getAbsolutePosition(zombie.worldMap.UIWorldMap ui,
  double localX,
  double localY,
  double[] xy)`

  `zombie.worldMap.streets.ClosestPoint`

  `getAddPointLocation(zombie.worldMap.UIWorldMap ui,
  float uiX,
  float uiY,
  zombie.worldMap.streets.ClosestPoint closestPoint)`

  `float`

  `getClosestPointOn(float worldX,
  float worldY,
  zombie.worldMap.streets.ClosestPoint closestPoint)`

  `float`

  `getClosestPointOn(zombie.worldMap.UIWorldMap ui,
  float uiX,
  float uiY,
  zombie.worldMap.streets.ClosestPoint closestPoint)`

  `(package private) float`

  `getDistanceAlongOriginalStreet(zombie.worldMap.UIWorldMap ui,
  float t,
  WorldMapStreet originalStreet)`

  `UIFont`

  `getFont(zombie.worldMap.UIWorldMap ui)`

  `double`

  `getFontScale(zombie.worldMap.UIWorldMap ui)`

  `ArrayList<zombie.worldMap.streets.Intersection>`

  `getIntersections()`

  `float`

  `getLength(zombie.worldMap.UIWorldMap ui)`

  `float`

  `getLengthSquared(zombie.worldMap.UIWorldMap ui)`

  `(package private) zombie.worldMap.streets.Intersection`

  `getMatchingIntersection(WorldMapStreet street,
  float worldX,
  float worldY)`

  `float`

  `getMaxX()`

  `float`

  `getMaxY()`

  `float`

  `getMinX()`

  `float`

  `getMinY()`

  `int`

  `getNumPoints()`

  `zombie.worldMap.streets.WorldMapStreets`

  `getOwner()`

  `boolean`

  `getPointOn(zombie.worldMap.UIWorldMap ui,
  float t,
  zombie.worldMap.streets.PointOn pointOn)`

  `StreetPoints`

  `getPoints()`

  `float`

  `getPointX(int index)`

  `float`

  `getPointY(int index)`

  `private float`

  `getSdfThreshold(zombie.worldMap.UIWorldMap ui)`

  `String`

  `getTranslatedText()`

  `String`

  `getUntranslatedText()`

  `int`

  `getWidth()`

  `(package private) WorldMapStreet`

  `init(zombie.worldMap.streets.WorldMapStreets owner,
  String untranslatedText,
  StreetPoints points)`

  `void`

  `insertPoint(int index,
  float x,
  float y)`

  `(package private) boolean`

  `isClockwise(gnu.trove.list.array.TFloatArrayList polygon)`

  `boolean`

  `isOnScreen(zombie.worldMap.UIWorldMap ui)`

  `private double`

  `layoutBackward(zombie.worldMap.UIWorldMap ui,
  double textWidth,
  float xAlongStreet,
  float streetLength)`

  `private double`

  `layoutForward(zombie.worldMap.UIWorldMap ui,
  float xAlongStreet,
  float streetLength)`

  `private int`

  `layoutTextAlongLine(zombie.worldMap.UIWorldMap ui,
  int firstChar,
  float lx1,
  float ly1,
  float lx2,
  float ly2)`

  `(package private) boolean`

  `overlapsAnotherLabel(zombie.worldMap.UIWorldMap ui,
  float start,
  float end)`

  `int`

  `pickPoint(zombie.worldMap.UIWorldMap ui,
  float uiX,
  float uiY)`

  `void`

  `registerNavZone(int worldX1,
  int worldY1,
  int worldX2,
  int worldY2)`

  `void`

  `registerNavZone2(int x,
  int y,
  int zoneWidth,
  int zoneHeight)`

  `void`

  `registerNavZonePolyline(gnu.trove.list.array.TIntArrayList linePoints)`

  `void`

  `registerNavZones()`

  `void`

  `removePoint(int index)`

  `void`

  `render(zombie.worldMap.UIWorldMap ui,
  zombie.worldMap.streets.StreetRenderData renderData)`

  `(package private) void`

  `render2(zombie.worldMap.UIWorldMap ui,
  WorldMapStreet originalStreet,
  zombie.worldMap.streets.StreetRenderData renderData)`

  `(package private) void`

  `render2b(zombie.worldMap.UIWorldMap ui,
  WorldMapStreet originalStreet,
  zombie.worldMap.streets.StreetRenderData renderData,
  float textWidth,
  float streetLength,
  float startFractionWS,
  float endFractionWS)`

  `private double`

  `renderBackward(zombie.worldMap.UIWorldMap ui,
  double textWidth,
  float xAlongStreet,
  float streetLength,
  zombie.worldMap.streets.StreetRenderData renderData)`

  `private double`

  `renderForward(zombie.worldMap.UIWorldMap ui,
  float textWidth,
  float xAlongStreet,
  float streetLength,
  zombie.worldMap.streets.StreetRenderData renderData)`

  `void`

  `renderIntersections(zombie.worldMap.UIWorldMap ui,
  float r,
  float g,
  float b,
  float a)`

  `(package private) void`

  `renderLine(zombie.worldMap.UIWorldMap ui,
  float worldX1,
  float worldY1,
  float worldX2,
  float worldY2,
  float r,
  float g,
  float b,
  float a,
  int thickness,
  zombie.worldMap.streets.StreetRenderData renderData)`

  `void`

  `renderLines(zombie.worldMap.UIWorldMap ui,
  float r,
  float g,
  float b,
  float a,
  int thickness,
  zombie.worldMap.streets.StreetRenderData renderData)`

  `(package private) void`

  `renderSection(zombie.worldMap.UIWorldMap ui,
  float start,
  float end,
  float r,
  float g,
  float b,
  float a,
  int thickness,
  zombie.worldMap.streets.StreetRenderData renderData)`

  `void`

  `resetIntersectionRenderFlag()`

  `void`

  `reverseDirection()`

  `(package private) boolean`

  `setIntersectionRenderFlag(zombie.worldMap.UIWorldMap ui,
  float start,
  float end)`

  `void`

  `setPoint(int index,
  float x,
  float y)`

  `void`

  `setUntranslatedText(String text)`

  `void`

  `setWidth(int width)`

  `private boolean`

  `shouldRenderForward(zombie.worldMap.UIWorldMap ui,
  double textWidth,
  float xAlongStreet,
  float streetLength)`

  `(package private) void`

  `splitAtOccludedIntersections(ArrayList<WorldMapStreet> split)`

  Deprecated.

  `void`

  `triangulate(gnu.trove.list.array.TFloatArrayList polygon,
  gnu.trove.list.array.TFloatArrayList triangles)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### s\_pool

    static final zombie.popman.ObjectPool<[WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets")> s\_pool
  + ### s\_pointsPool

    static final zombie.popman.ObjectPool<[StreetPoints](StreetPoints.html "class in zombie.worldMap.streets")> s\_pointsPool
  + ### s\_closestPoint

    private static final zombie.worldMap.streets.ClosestPoint s\_closestPoint
  + ### s\_pointOn

    private static final zombie.worldMap.streets.PointOn s\_pointOn
  + ### s\_clipped

    private static final [StreetPoints](StreetPoints.html "class in zombie.worldMap.streets") s\_clipped
  + ### s\_reverse

    private static final [StreetPoints](StreetPoints.html "class in zombie.worldMap.streets") s\_reverse
  + ### s\_charLayoutPool

    static final zombie.popman.ObjectPool<zombie.worldMap.streets.CharLayout> s\_charLayoutPool
  + ### s\_layout

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.worldMap.streets.CharLayout> s\_layout
  + ### triangles2

    private static final gnu.trove.list.array.TFloatArrayList triangles2
  + ### cosA

    private static double cosA
  + ### sinA

    private static double sinA
  + ### x

    private static double x
  + ### y

    private static double y
  + ### xAlongLine

    private static double xAlongLine
  + ### GAP

    private static final int GAP

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.worldMap.streets.WorldMapStreet.GAP)
  + ### fontScale

    private static double fontScale
  + ### sdfThreshold

    private static float sdfThreshold
  + ### shadow

    private static float shadow
  + ### outlineThickness

    private static float outlineThickness
  + ### outlineR

    private static float outlineR
  + ### outlineG

    private static float outlineG
  + ### outlineB

    private static float outlineB
  + ### outlineA

    private static float outlineA
  + ### owner

    private zombie.worldMap.streets.WorldMapStreets owner
  + ### untranslatedText

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") untranslatedText
  + ### points

    private [StreetPoints](StreetPoints.html "class in zombie.worldMap.streets") points
  + ### width

    private int width
  + ### intersections

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.worldMap.streets.Intersection> intersections
  + ### connectedToStart

    [WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets") connectedToStart
  + ### connectedToEnd

    [WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets") connectedToEnd
  + ### splitStreets

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets")> splitStreets
  + ### changeCount

    long changeCount
  + ### NAV\_ZONE

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") NAV\_ZONE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.worldMap.streets.WorldMapStreet.NAV_ZONE)
  + ### RAILROAD\_STRINGS

    private static final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> RAILROAD\_STRINGS
  + ### countsForward

    static final [WorldMapStreet.LayoutCounts](WorldMapStreet.LayoutCounts.html "class in zombie.worldMap.streets") countsForward
  + ### countsBackward

    static final [WorldMapStreet.LayoutCounts](WorldMapStreet.LayoutCounts.html "class in zombie.worldMap.streets") countsBackward
  + ### clipper

    static zombie.vehicles.Clipper clipper
* Constructor Details
  -------------------

  + ### WorldMapStreet

    private WorldMapStreet()
  + ### WorldMapStreet

    public WorldMapStreet(zombie.worldMap.streets.WorldMapStreets owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") untranslatedText,
    [StreetPoints](StreetPoints.html "class in zombie.worldMap.streets") points)
* Method Details
  --------------

  + ### init

    [WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets") init(zombie.worldMap.streets.WorldMapStreets owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") untranslatedText,
    [StreetPoints](StreetPoints.html "class in zombie.worldMap.streets") points)
  + ### getOwner

    public zombie.worldMap.streets.WorldMapStreets getOwner()
  + ### getMinX

    public float getMinX()
  + ### getMinY

    public float getMinY()
  + ### getMaxX

    public float getMaxX()
  + ### getMaxY

    public float getMaxY()
  + ### getNumPoints

    public int getNumPoints()
  + ### getPointX

    public float getPointX(int index)
  + ### getPointY

    public float getPointY(int index)
  + ### getLength

    public float getLength(zombie.worldMap.UIWorldMap ui)
  + ### getLengthSquared

    public float getLengthSquared(zombie.worldMap.UIWorldMap ui)
  + ### getPoints

    public [StreetPoints](StreetPoints.html "class in zombie.worldMap.streets") getPoints()
  + ### addPoint

    public void addPoint(float x,
    float y)
  + ### insertPoint

    public void insertPoint(int index,
    float x,
    float y)
  + ### removePoint

    public void removePoint(int index)
  + ### setPoint

    public void setPoint(int index,
    float x,
    float y)
  + ### setWidth

    public void setWidth(int width)
  + ### getWidth

    public int getWidth()
  + ### reverseDirection

    public void reverseDirection()
  + ### getTranslatedText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedText()
  + ### getUntranslatedText

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getUntranslatedText()
  + ### setUntranslatedText

    public void setUntranslatedText([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### getFont

    public [UIFont](../../ui/UIFont.html "enum class in zombie.ui") getFont(zombie.worldMap.UIWorldMap ui)
  + ### getFontScale

    public double getFontScale(zombie.worldMap.UIWorldMap ui)
  + ### getIntersections

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.worldMap.streets.Intersection> getIntersections()
  + ### resetIntersectionRenderFlag

    public void resetIntersectionRenderFlag()
  + ### setIntersectionRenderFlag

    boolean setIntersectionRenderFlag(zombie.worldMap.UIWorldMap ui,
    float start,
    float end)
  + ### getMatchingIntersection

    zombie.worldMap.streets.Intersection getMatchingIntersection([WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets") street,
    float worldX,
    float worldY)
  + ### overlapsAnotherLabel

    boolean overlapsAnotherLabel(zombie.worldMap.UIWorldMap ui,
    float start,
    float end)
  + ### getPointOn

    public boolean getPointOn(zombie.worldMap.UIWorldMap ui,
    float t,
    zombie.worldMap.streets.PointOn pointOn)
  + ### splitAtOccludedIntersections

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    void splitAtOccludedIntersections([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets")> split)

    Deprecated.
  + ### render

    public void render(zombie.worldMap.UIWorldMap ui,
    zombie.worldMap.streets.StreetRenderData renderData)
  + ### getDistanceAlongOriginalStreet

    float getDistanceAlongOriginalStreet(zombie.worldMap.UIWorldMap ui,
    float t,
    [WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets") originalStreet)
  + ### render2

    void render2(zombie.worldMap.UIWorldMap ui,
    [WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets") originalStreet,
    zombie.worldMap.streets.StreetRenderData renderData)
  + ### render2b

    void render2b(zombie.worldMap.UIWorldMap ui,
    [WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets") originalStreet,
    zombie.worldMap.streets.StreetRenderData renderData,
    float textWidth,
    float streetLength,
    float startFractionWS,
    float endFractionWS)
  + ### renderSection

    void renderSection(zombie.worldMap.UIWorldMap ui,
    float start,
    float end,
    float r,
    float g,
    float b,
    float a,
    int thickness,
    zombie.worldMap.streets.StreetRenderData renderData)
  + ### renderLines

    public void renderLines(zombie.worldMap.UIWorldMap ui,
    float r,
    float g,
    float b,
    float a,
    int thickness,
    zombie.worldMap.streets.StreetRenderData renderData)
  + ### renderLine

    void renderLine(zombie.worldMap.UIWorldMap ui,
    float worldX1,
    float worldY1,
    float worldX2,
    float worldY2,
    float r,
    float g,
    float b,
    float a,
    int thickness,
    zombie.worldMap.streets.StreetRenderData renderData)
  + ### renderIntersections

    public void renderIntersections(zombie.worldMap.UIWorldMap ui,
    float r,
    float g,
    float b,
    float a)
  + ### shouldRenderForward

    private boolean shouldRenderForward(zombie.worldMap.UIWorldMap ui,
    double textWidth,
    float xAlongStreet,
    float streetLength)
  + ### countUpsideDownCharacters

    private void countUpsideDownCharacters([WorldMapStreet.LayoutCounts](WorldMapStreet.LayoutCounts.html "class in zombie.worldMap.streets") counts)
  + ### clipToObscuredCells

    public void clipToObscuredCells()
  + ### layoutForward

    private double layoutForward(zombie.worldMap.UIWorldMap ui,
    float xAlongStreet,
    float streetLength)
  + ### layoutBackward

    private double layoutBackward(zombie.worldMap.UIWorldMap ui,
    double textWidth,
    float xAlongStreet,
    float streetLength)
  + ### renderForward

    private double renderForward(zombie.worldMap.UIWorldMap ui,
    float textWidth,
    float xAlongStreet,
    float streetLength,
    zombie.worldMap.streets.StreetRenderData renderData)
  + ### renderBackward

    private double renderBackward(zombie.worldMap.UIWorldMap ui,
    double textWidth,
    float xAlongStreet,
    float streetLength,
    zombie.worldMap.streets.StreetRenderData renderData)
  + ### layoutTextAlongLine

    private int layoutTextAlongLine(zombie.worldMap.UIWorldMap ui,
    int firstChar,
    float lx1,
    float ly1,
    float lx2,
    float ly2)
  + ### getSdfThreshold

    private float getSdfThreshold(zombie.worldMap.UIWorldMap ui)
  + ### getAbsolutePosition

    private double[] getAbsolutePosition(zombie.worldMap.UIWorldMap ui,
    double localX,
    double localY,
    double[] xy)
  + ### getClosestPointOn

    public float getClosestPointOn(zombie.worldMap.UIWorldMap ui,
    float uiX,
    float uiY,
    zombie.worldMap.streets.ClosestPoint closestPoint)
  + ### getClosestPointOn

    public float getClosestPointOn(float worldX,
    float worldY,
    zombie.worldMap.streets.ClosestPoint closestPoint)
  + ### pickPoint

    public int pickPoint(zombie.worldMap.UIWorldMap ui,
    float uiX,
    float uiY)
  + ### getAddPointLocation

    public zombie.worldMap.streets.ClosestPoint getAddPointLocation(zombie.worldMap.UIWorldMap ui,
    float uiX,
    float uiY,
    zombie.worldMap.streets.ClosestPoint closestPoint)
  + ### calculateIntersections

    void calculateIntersections([WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets") other)
  + ### createHighlightPolygons

    public void createHighlightPolygons(gnu.trove.list.array.TFloatArrayList polygon,
    gnu.trove.list.array.TFloatArrayList triangles)
  + ### createPolygon

    public void createPolygon(gnu.trove.list.array.TFloatArrayList points)
  + ### isClockwise

    boolean isClockwise(gnu.trove.list.array.TFloatArrayList polygon)
  + ### triangulate

    public void triangulate(gnu.trove.list.array.TFloatArrayList polygon,
    gnu.trove.list.array.TFloatArrayList triangles)
  + ### isOnScreen

    public boolean isOnScreen(zombie.worldMap.UIWorldMap ui)
  + ### createCopy

    public [WorldMapStreet](WorldMapStreet.html "class in zombie.worldMap.streets") createCopy(zombie.worldMap.streets.WorldMapStreets owner)
  + ### registerNavZones

    public void registerNavZones()
  + ### registerNavZone

    public void registerNavZone(int worldX1,
    int worldY1,
    int worldX2,
    int worldY2)
  + ### registerNavZone2

    public void registerNavZone2(int x,
    int y,
    int zoneWidth,
    int zoneHeight)
  + ### registerNavZonePolyline

    public void registerNavZonePolyline(gnu.trove.list.array.TIntArrayList linePoints)