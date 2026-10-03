[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [WorldMarkers](WorldMarkers.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [CIRCLE\_TEXTURE\_SCALE](#CIRCLE_TEXTURE_SCALE)
   2. [instance](#instance)
   3. [nextGridSquareMarkerId](#nextGridSquareMarkerId)
   4. [nextHomingPointId](#nextHomingPointId)
   5. [gridSquareMarkers](#gridSquareMarkers)
   6. [homingPoints](#homingPoints)
   7. [directionArrows](#directionArrows)
   8. [stCol](#stCol)
   9. [playerScreen](#playerScreen)
   10. [intersectPoint](#intersectPoint)
   11. [arrowStart](#arrowStart)
   12. [arrowEnd](#arrowEnd)
   13. [arrowLine](#arrowLine)
7. [Constructor Details](#constructor-detail)
   1. [WorldMarkers()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [init()](#init())
   2. [reset()](#reset())
   3. [GetDistance(int, int, int, int)](#GetDistance(int,int,int,int))
   4. [getAngle(int, int, int, int)](#getAngle(int,int,int,int))
   5. [angleDegrees(float)](#angleDegrees(float))
   6. [getHomingPoint(int)](#getHomingPoint(int))
   7. [addPlayerHomingPoint(IsoPlayer, int, int)](#addPlayerHomingPoint(zombie.characters.IsoPlayer,int,int))
   8. [addPlayerHomingPoint(IsoPlayer, int, int, float, float, float, float)](#addPlayerHomingPoint(zombie.characters.IsoPlayer,int,int,float,float,float,float))
   9. [addPlayerHomingPoint(IsoPlayer, int, int, String, float, float, float, float, boolean, int)](#addPlayerHomingPoint(zombie.characters.IsoPlayer,int,int,java.lang.String,float,float,float,float,boolean,int))
   10. [removeHomingPoint(WorldMarkers.PlayerHomingPoint)](#removeHomingPoint(zombie.iso.WorldMarkers.PlayerHomingPoint))
   11. [removeHomingPoint(int)](#removeHomingPoint(int))
   12. [removePlayerHomingPoint(IsoPlayer, WorldMarkers.PlayerHomingPoint)](#removePlayerHomingPoint(zombie.characters.IsoPlayer,zombie.iso.WorldMarkers.PlayerHomingPoint))
   13. [removePlayerHomingPoint(IsoPlayer, int)](#removePlayerHomingPoint(zombie.characters.IsoPlayer,int))
   14. [removeAllHomingPoints(IsoPlayer)](#removeAllHomingPoints(zombie.characters.IsoPlayer))
   15. [getDirectionArrow(int)](#getDirectionArrow(int))
   16. [addDirectionArrow(IsoPlayer, int, int, int, String, float, float, float, float)](#addDirectionArrow(zombie.characters.IsoPlayer,int,int,int,java.lang.String,float,float,float,float))
   17. [removeDirectionArrow(WorldMarkers.DirectionArrow)](#removeDirectionArrow(zombie.iso.WorldMarkers.DirectionArrow))
   18. [removeDirectionArrow(int)](#removeDirectionArrow(int))
   19. [removePlayerDirectionArrow(IsoPlayer, WorldMarkers.DirectionArrow)](#removePlayerDirectionArrow(zombie.characters.IsoPlayer,zombie.iso.WorldMarkers.DirectionArrow))
   20. [removePlayerDirectionArrow(IsoPlayer, int)](#removePlayerDirectionArrow(zombie.characters.IsoPlayer,int))
   21. [removeAllDirectionArrows(IsoPlayer)](#removeAllDirectionArrows(zombie.characters.IsoPlayer))
   22. [update()](#update())
   23. [updateDirectionArrows()](#updateDirectionArrows())
   24. [updateHomingPoints()](#updateHomingPoints())
   25. [updateGridSquareMarkers()](#updateGridSquareMarkers())
   26. [removeGridSquareMarker(WorldMarkers.GridSquareMarker)](#removeGridSquareMarker(zombie.iso.WorldMarkers.GridSquareMarker))
   27. [removeGridSquareMarker(int)](#removeGridSquareMarker(int))
   28. [getGridSquareMarker(int)](#getGridSquareMarker(int))
   29. [addGridSquareMarker(IsoGridSquare, float, float, float, boolean, float)](#addGridSquareMarker(zombie.iso.IsoGridSquare,float,float,float,boolean,float))
   30. [addGridSquareMarker(String, String, IsoGridSquare, float, float, float, boolean, float)](#addGridSquareMarker(java.lang.String,java.lang.String,zombie.iso.IsoGridSquare,float,float,float,boolean,float))
   31. [addGridSquareMarker(String, String, IsoGridSquare, float, float, float, boolean, float, float, float, float)](#addGridSquareMarker(java.lang.String,java.lang.String,zombie.iso.IsoGridSquare,float,float,float,boolean,float,float,float,float))
   32. [renderGridSquareMarkers(IsoCell.PerPlayerRender, int, int)](#renderGridSquareMarkers(zombie.iso.IsoCell.PerPlayerRender,int,int))
   33. [renderGridSquareMarkers(int)](#renderGridSquareMarkers(int))
   34. [debugRender()](#debugRender())
   35. [render()](#render())
   36. [renderHomingPoint()](#renderHomingPoint())
   37. [renderDirectionArrow(boolean)](#renderDirectionArrow(boolean))
   38. [DrawTextureAngle(Texture, float, float, double, double, double, float, float, float, float, float)](#DrawTextureAngle(zombie.core.textures.Texture,float,float,double,double,double,float,float,float,float,float))
   39. [intersectLineSegments(WorldMarkers.Line, WorldMarkers.Line, WorldMarkers.Point)](#intersectLineSegments(zombie.iso.WorldMarkers.Line,zombie.iso.WorldMarkers.Line,zombie.iso.WorldMarkers.Point))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class WorldMarkers
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.WorldMarkers

---

public final class WorldMarkers
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `class`

  `WorldMarkers.DirectionArrow`

  `(package private) class`

  `WorldMarkers.DirectionArrowList`

  `static final class`

  `WorldMarkers.GridSquareMarker`

  `private static class`

  `WorldMarkers.Line`

  `static class`

  `WorldMarkers.PlayerHomingPoint`

  `(package private) class`

  `WorldMarkers.PlayerHomingPointList`

  `(package private) class`

  `WorldMarkers.PlayerScreen`

  `private static class`

  `WorldMarkers.Point`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final WorldMarkers.Point`

  `arrowEnd`

  `private final WorldMarkers.Line`

  `arrowLine`

  `private final WorldMarkers.Point`

  `arrowStart`

  `private static final float`

  `CIRCLE_TEXTURE_SCALE`

  `private final WorldMarkers.DirectionArrowList[]`

  `directionArrows`

  `private final List<WorldMarkers.GridSquareMarker>`

  `gridSquareMarkers`

  `private final WorldMarkers.PlayerHomingPointList[]`

  `homingPoints`

  `static final WorldMarkers`

  `instance`

  `private final WorldMarkers.Point`

  `intersectPoint`

  `private static int`

  `nextGridSquareMarkerId`

  `private static int`

  `nextHomingPointId`

  `private final WorldMarkers.PlayerScreen`

  `playerScreen`

  `private static final ColorInfo`

  `stCol`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `WorldMarkers()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `WorldMarkers.DirectionArrow`

  `addDirectionArrow(IsoPlayer player,
  int x,
  int y,
  int z,
  String texname,
  float r,
  float g,
  float b,
  float a)`

  `WorldMarkers.GridSquareMarker`

  `addGridSquareMarker(String texid,
  String overlay,
  IsoGridSquare gs,
  float r,
  float g,
  float b,
  boolean doAlpha,
  float size)`

  `WorldMarkers.GridSquareMarker`

  `addGridSquareMarker(String texid,
  String overlay,
  IsoGridSquare gs,
  float r,
  float g,
  float b,
  boolean doAlpha,
  float size,
  float fadeSpeed,
  float fadeMin,
  float fadeMax)`

  `WorldMarkers.GridSquareMarker`

  `addGridSquareMarker(IsoGridSquare gs,
  float r,
  float g,
  float b,
  boolean doAlpha,
  float size)`

  `WorldMarkers.PlayerHomingPoint`

  `addPlayerHomingPoint(IsoPlayer player,
  int x,
  int y)`

  `WorldMarkers.PlayerHomingPoint`

  `addPlayerHomingPoint(IsoPlayer player,
  int x,
  int y,
  float r,
  float g,
  float b,
  float a)`

  `WorldMarkers.PlayerHomingPoint`

  `addPlayerHomingPoint(IsoPlayer player,
  int x,
  int y,
  String texname,
  float r,
  float g,
  float b,
  float a,
  boolean homeOnTarget,
  int homeOnDist)`

  `private float`

  `angleDegrees(float angle)`

  `void`

  `debugRender()`

  `private void`

  `DrawTextureAngle(Texture tex,
  float width,
  float height,
  double centerX,
  double centerY,
  double angle,
  float r,
  float g,
  float b,
  float a,
  float renderSize)`

  `private float`

  `getAngle(int px,
  int py,
  int tx,
  int ty)`

  `WorldMarkers.DirectionArrow`

  `getDirectionArrow(int id)`

  `private int`

  `GetDistance(int dx,
  int dy,
  int sx,
  int sy)`

  `WorldMarkers.GridSquareMarker`

  `getGridSquareMarker(int id)`

  `WorldMarkers.PlayerHomingPoint`

  `getHomingPoint(int id)`

  `void`

  `init()`

  `static boolean`

  `intersectLineSegments(WorldMarkers.Line l1,
  WorldMarkers.Line l2,
  WorldMarkers.Point intersection)`

  `void`

  `removeAllDirectionArrows(IsoPlayer player)`

  `void`

  `removeAllHomingPoints(IsoPlayer player)`

  `boolean`

  `removeDirectionArrow(int id)`

  `boolean`

  `removeDirectionArrow(WorldMarkers.DirectionArrow arrow)`

  `boolean`

  `removeGridSquareMarker(int id)`

  `boolean`

  `removeGridSquareMarker(WorldMarkers.GridSquareMarker marker)`

  `boolean`

  `removeHomingPoint(int id)`

  `boolean`

  `removeHomingPoint(WorldMarkers.PlayerHomingPoint point)`

  `boolean`

  `removePlayerDirectionArrow(IsoPlayer player,
  int id)`

  `boolean`

  `removePlayerDirectionArrow(IsoPlayer player,
  WorldMarkers.DirectionArrow arrow)`

  `boolean`

  `removePlayerHomingPoint(IsoPlayer player,
  int id)`

  `boolean`

  `removePlayerHomingPoint(IsoPlayer player,
  WorldMarkers.PlayerHomingPoint point)`

  `void`

  `render()`

  `void`

  `renderDirectionArrow(boolean worldDraw)`

  `void`

  `renderGridSquareMarkers(int z)`

  `void`

  `renderGridSquareMarkers(IsoCell.PerPlayerRender perPlayerRender,
  int zLayer,
  int playerIndex)`

  `void`

  `renderHomingPoint()`

  `void`

  `reset()`

  `void`

  `update()`

  `private void`

  `updateDirectionArrows()`

  `private void`

  `updateGridSquareMarkers()`

  `private void`

  `updateHomingPoints()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### CIRCLE\_TEXTURE\_SCALE

    private static final float CIRCLE\_TEXTURE\_SCALE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.WorldMarkers.CIRCLE_TEXTURE_SCALE)
  + ### instance

    public static final [WorldMarkers](WorldMarkers.html "class in zombie.iso") instance
  + ### nextGridSquareMarkerId

    private static int nextGridSquareMarkerId
  + ### nextHomingPointId

    private static int nextHomingPointId
  + ### gridSquareMarkers

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[WorldMarkers.GridSquareMarker](WorldMarkers.GridSquareMarker.html "class in zombie.iso")> gridSquareMarkers
  + ### homingPoints

    private final [WorldMarkers.PlayerHomingPointList](WorldMarkers.PlayerHomingPointList.html "class in zombie.iso")[] homingPoints
  + ### directionArrows

    private final [WorldMarkers.DirectionArrowList](WorldMarkers.DirectionArrowList.html "class in zombie.iso")[] directionArrows
  + ### stCol

    private static final [ColorInfo](../core/textures/ColorInfo.html "class in zombie.core.textures") stCol
  + ### playerScreen

    private final [WorldMarkers.PlayerScreen](WorldMarkers.PlayerScreen.html "class in zombie.iso") playerScreen
  + ### intersectPoint

    private final [WorldMarkers.Point](WorldMarkers.Point.html "class in zombie.iso") intersectPoint
  + ### arrowStart

    private final [WorldMarkers.Point](WorldMarkers.Point.html "class in zombie.iso") arrowStart
  + ### arrowEnd

    private final [WorldMarkers.Point](WorldMarkers.Point.html "class in zombie.iso") arrowEnd
  + ### arrowLine

    private final [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso") arrowLine
* Constructor Details
  -------------------

  + ### WorldMarkers

    private WorldMarkers()
* Method Details
  --------------

  + ### init

    public void init()
  + ### reset

    public void reset()
  + ### GetDistance

    private int GetDistance(int dx,
    int dy,
    int sx,
    int sy)
  + ### getAngle

    private float getAngle(int px,
    int py,
    int tx,
    int ty)
  + ### angleDegrees

    private float angleDegrees(float angle)
  + ### getHomingPoint

    public [WorldMarkers.PlayerHomingPoint](WorldMarkers.PlayerHomingPoint.html "class in zombie.iso") getHomingPoint(int id)
  + ### addPlayerHomingPoint

    public [WorldMarkers.PlayerHomingPoint](WorldMarkers.PlayerHomingPoint.html "class in zombie.iso") addPlayerHomingPoint([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int x,
    int y)
  + ### addPlayerHomingPoint

    public [WorldMarkers.PlayerHomingPoint](WorldMarkers.PlayerHomingPoint.html "class in zombie.iso") addPlayerHomingPoint([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int x,
    int y,
    float r,
    float g,
    float b,
    float a)
  + ### addPlayerHomingPoint

    public [WorldMarkers.PlayerHomingPoint](WorldMarkers.PlayerHomingPoint.html "class in zombie.iso") addPlayerHomingPoint([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int x,
    int y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texname,
    float r,
    float g,
    float b,
    float a,
    boolean homeOnTarget,
    int homeOnDist)
  + ### removeHomingPoint

    public boolean removeHomingPoint([WorldMarkers.PlayerHomingPoint](WorldMarkers.PlayerHomingPoint.html "class in zombie.iso") point)
  + ### removeHomingPoint

    public boolean removeHomingPoint(int id)
  + ### removePlayerHomingPoint

    public boolean removePlayerHomingPoint([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [WorldMarkers.PlayerHomingPoint](WorldMarkers.PlayerHomingPoint.html "class in zombie.iso") point)
  + ### removePlayerHomingPoint

    public boolean removePlayerHomingPoint([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int id)
  + ### removeAllHomingPoints

    public void removeAllHomingPoints([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### getDirectionArrow

    public [WorldMarkers.DirectionArrow](WorldMarkers.DirectionArrow.html "class in zombie.iso") getDirectionArrow(int id)
  + ### addDirectionArrow

    public [WorldMarkers.DirectionArrow](WorldMarkers.DirectionArrow.html "class in zombie.iso") addDirectionArrow([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int x,
    int y,
    int z,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texname,
    float r,
    float g,
    float b,
    float a)
  + ### removeDirectionArrow

    public boolean removeDirectionArrow([WorldMarkers.DirectionArrow](WorldMarkers.DirectionArrow.html "class in zombie.iso") arrow)
  + ### removeDirectionArrow

    public boolean removeDirectionArrow(int id)
  + ### removePlayerDirectionArrow

    public boolean removePlayerDirectionArrow([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    [WorldMarkers.DirectionArrow](WorldMarkers.DirectionArrow.html "class in zombie.iso") arrow)
  + ### removePlayerDirectionArrow

    public boolean removePlayerDirectionArrow([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player,
    int id)
  + ### removeAllDirectionArrows

    public void removeAllDirectionArrows([IsoPlayer](../characters/IsoPlayer.html "class in zombie.characters") player)
  + ### update

    public void update()
  + ### updateDirectionArrows

    private void updateDirectionArrows()
  + ### updateHomingPoints

    private void updateHomingPoints()
  + ### updateGridSquareMarkers

    private void updateGridSquareMarkers()
  + ### removeGridSquareMarker

    public boolean removeGridSquareMarker([WorldMarkers.GridSquareMarker](WorldMarkers.GridSquareMarker.html "class in zombie.iso") marker)
  + ### removeGridSquareMarker

    public boolean removeGridSquareMarker(int id)
  + ### getGridSquareMarker

    public [WorldMarkers.GridSquareMarker](WorldMarkers.GridSquareMarker.html "class in zombie.iso") getGridSquareMarker(int id)
  + ### addGridSquareMarker

    public [WorldMarkers.GridSquareMarker](WorldMarkers.GridSquareMarker.html "class in zombie.iso") addGridSquareMarker([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gs,
    float r,
    float g,
    float b,
    boolean doAlpha,
    float size)
  + ### addGridSquareMarker

    public [WorldMarkers.GridSquareMarker](WorldMarkers.GridSquareMarker.html "class in zombie.iso") addGridSquareMarker([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") overlay,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gs,
    float r,
    float g,
    float b,
    boolean doAlpha,
    float size)
  + ### addGridSquareMarker

    public [WorldMarkers.GridSquareMarker](WorldMarkers.GridSquareMarker.html "class in zombie.iso") addGridSquareMarker([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") overlay,
    [IsoGridSquare](IsoGridSquare.html "class in zombie.iso") gs,
    float r,
    float g,
    float b,
    boolean doAlpha,
    float size,
    float fadeSpeed,
    float fadeMin,
    float fadeMax)
  + ### renderGridSquareMarkers

    public void renderGridSquareMarkers([IsoCell.PerPlayerRender](IsoCell.PerPlayerRender.html "class in zombie.iso") perPlayerRender,
    int zLayer,
    int playerIndex)
  + ### renderGridSquareMarkers

    public void renderGridSquareMarkers(int z)
  + ### debugRender

    public void debugRender()
  + ### render

    public void render()
  + ### renderHomingPoint

    public void renderHomingPoint()
  + ### renderDirectionArrow

    public void renderDirectionArrow(boolean worldDraw)
  + ### DrawTextureAngle

    private void DrawTextureAngle([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    float width,
    float height,
    double centerX,
    double centerY,
    double angle,
    float r,
    float g,
    float b,
    float a,
    float renderSize)
  + ### intersectLineSegments

    public static boolean intersectLineSegments([WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso") l1,
    [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso") l2,
    [WorldMarkers.Point](WorldMarkers.Point.html "class in zombie.iso") intersection)