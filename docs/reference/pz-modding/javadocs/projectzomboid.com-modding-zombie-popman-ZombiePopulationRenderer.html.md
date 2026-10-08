[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.popman](package-summary.html)
2. [ZombiePopulationRenderer](ZombiePopulationRenderer.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [xPos](#xPos)
   2. [yPos](#yPos)
   3. [offx](#offx)
   4. [offy](#offy)
   5. [zoom](#zoom)
   6. [draww](#draww)
   7. [drawh](#drawh)
   8. [RENDER\_RECT\_FILLED](#RENDER_RECT_FILLED)
   9. [RENDER\_RECT\_OUTLINE](#RENDER_RECT_OUTLINE)
   10. [RENDER\_LINE](#RENDER_LINE)
   11. [RENDER\_CIRCLE](#RENDER_CIRCLE)
   12. [RENDER\_TEXT](#RENDER_TEXT)
   13. [drawers](#drawers)
   14. [currentDrawer](#currentDrawer)
   15. [textDrawer](#textDrawer)
   16. [VERSION](#VERSION)
   17. [options](#options)
   18. [cellGrid](#cellGrid)
   19. [cellGrid300](#cellGrid300)
   20. [cellInfo](#cellInfo)
   21. [metaGridBuildings](#metaGridBuildings)
   22. [zombiesReal](#zombiesReal)
   23. [zombiesStanding](#zombiesStanding)
   24. [zombiesMoving](#zombiesMoving)
   25. [mcdObstacles](#mcdObstacles)
   26. [mcdRegularChunkOutlines](#mcdRegularChunkOutlines)
   27. [mcdRooms](#mcdRooms)
   28. [vehicles](#vehicles)
   29. [worldSounds](#worldSounds)
   30. [zombieIntensity](#zombieIntensity)
7. [Constructor Details](#constructor-detail)
   1. [ZombiePopulationRenderer()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [n\_render(float, int, int, float, float, int, int)](#n_render(float,int,int,float,float,int,int))
   2. [n\_setWallFollowerStart(int, int)](#n_setWallFollowerStart(int,int))
   3. [n\_setWallFollowerEnd(int, int)](#n_setWallFollowerEnd(int,int))
   4. [n\_wallFollowerMouseMove(int, int)](#n_wallFollowerMouseMove(int,int))
   5. [n\_setDebugOption(String, String)](#n_setDebugOption(java.lang.String,java.lang.String))
   6. [worldToScreenX(float)](#worldToScreenX(float))
   7. [worldToScreenY(float)](#worldToScreenY(float))
   8. [uiToWorldX(float)](#uiToWorldX(float))
   9. [uiToWorldY(float)](#uiToWorldY(float))
   10. [renderString(float, float, String, double, double, double, double)](#renderString(float,float,java.lang.String,double,double,double,double))
   11. [renderRect(float, float, float, float, float, float, float, float)](#renderRect(float,float,float,float,float,float,float,float))
   12. [renderLine(float, float, float, float, float, float, float, float)](#renderLine(float,float,float,float,float,float,float,float))
   13. [renderCircle(float, float, float, float, float, float, float)](#renderCircle(float,float,float,float,float,float,float))
   14. [renderZombie(float, float, float, float, float)](#renderZombie(float,float,float,float,float))
   15. [renderVehicle(int, float, float, float, float, float)](#renderVehicle(int,float,float,float,float,float))
   16. [outlineRect(float, float, float, float, float, float, float, float)](#outlineRect(float,float,float,float,float,float,float,float))
   17. [renderCellInfo(int, int, int, int, float)](#renderCellInfo(int,int,int,int,float))
   18. [render(UIElement, float, float, float)](#render(zombie.ui.UIElement,float,float,float))
   19. [renderAllText(UIElement)](#renderAllText(zombie.ui.UIElement))
   20. [\_render(UIElement, float, float, float)](#_render(zombie.ui.UIElement,float,float,float))
   21. [renderWorldSounds()](#renderWorldSounds())
   22. [setWallFollowerStart(int, int)](#setWallFollowerStart(int,int))
   23. [setWallFollowerEnd(int, int)](#setWallFollowerEnd(int,int))
   24. [wallFollowerMouseMove(int, int)](#wallFollowerMouseMove(int,int))
   25. [getOptionByName(String)](#getOptionByName(java.lang.String))
   26. [getOptionCount()](#getOptionCount())
   27. [getOptionByIndex(int)](#getOptionByIndex(int))
   28. [setBoolean(String, boolean)](#setBoolean(java.lang.String,boolean))
   29. [getBoolean(String)](#getBoolean(java.lang.String))
   30. [save()](#save())
   31. [load()](#load())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ZombiePopulationRenderer
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.popman.ZombiePopulationRenderer

---

public final class ZombiePopulationRenderer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `class`

  `ZombiePopulationRenderer.BooleanDebugOption`

  `private static final class`

  `ZombiePopulationRenderer.Drawer`

  `private static class`

  `ZombiePopulationRenderer.DrawerImpl`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `cellGrid`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `cellGrid300`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `cellInfo`

  `private ZombiePopulationRenderer.DrawerImpl`

  `currentDrawer`

  `private final ZombiePopulationRenderer.Drawer[]`

  `drawers`

  `private float`

  `drawh`

  `private float`

  `draww`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `mcdObstacles`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `mcdRegularChunkOutlines`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `mcdRooms`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `metaGridBuildings`

  `private float`

  `offx`

  `private float`

  `offy`

  `private final ArrayList<ConfigOption>`

  `options`

  `(package private) static final byte`

  `RENDER_CIRCLE`

  `(package private) static final byte`

  `RENDER_LINE`

  `(package private) static final byte`

  `RENDER_RECT_FILLED`

  `(package private) static final byte`

  `RENDER_RECT_OUTLINE`

  `(package private) static final byte`

  `RENDER_TEXT`

  `private final ZombiePopulationRenderer.DrawerImpl`

  `textDrawer`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `vehicles`

  `private static final int`

  `VERSION`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `worldSounds`

  `private float`

  `xPos`

  `private float`

  `yPos`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `zombieIntensity`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `zombiesMoving`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `zombiesReal`

  `private final ZombiePopulationRenderer.BooleanDebugOption`

  `zombiesStanding`

  `private float`

  `zoom`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ZombiePopulationRenderer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `_render(UIElement ui,
  float zoom,
  float xPos,
  float yPos)`

  `boolean`

  `getBoolean(String name)`

  `ConfigOption`

  `getOptionByIndex(int index)`

  `ConfigOption`

  `getOptionByName(String name)`

  `int`

  `getOptionCount()`

  `void`

  `load()`

  `private void`

  `n_render(float zoom,
  int offx,
  int offy,
  float xPos,
  float yPos,
  int draww,
  int drawh)`

  `private void`

  `n_setDebugOption(String name,
  String value)`

  `private void`

  `n_setWallFollowerEnd(int x,
  int y)`

  `private void`

  `n_setWallFollowerStart(int x,
  int y)`

  `private void`

  `n_wallFollowerMouseMove(int x,
  int y)`

  `void`

  `outlineRect(float x,
  float y,
  float w,
  float h,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `render(UIElement ui,
  float zoom,
  float xPos,
  float yPos)`

  `private void`

  `renderAllText(UIElement ui)`

  `void`

  `renderCellInfo(int cellX,
  int cellY,
  int effectivePopulation,
  int targetPopulation,
  float lastRepopTime)`

  `void`

  `renderCircle(float x,
  float y,
  float radius,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `renderLine(float x1,
  float y1,
  float x2,
  float y2,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `renderRect(float x,
  float y,
  float w,
  float h,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `renderString(float x,
  float y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `renderVehicle(int sqlid,
  float x,
  float y,
  float r,
  float g,
  float b)`

  `private void`

  `renderWorldSounds()`

  `void`

  `renderZombie(float x,
  float y,
  float r,
  float g,
  float b)`

  `void`

  `save()`

  `void`

  `setBoolean(String name,
  boolean value)`

  `void`

  `setWallFollowerEnd(int x,
  int y)`

  `void`

  `setWallFollowerStart(int x,
  int y)`

  `float`

  `uiToWorldX(float x)`

  `float`

  `uiToWorldY(float y)`

  `void`

  `wallFollowerMouseMove(int x,
  int y)`

  `float`

  `worldToScreenX(float x)`

  `float`

  `worldToScreenY(float y)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### xPos

    private float xPos
  + ### yPos

    private float yPos
  + ### offx

    private float offx
  + ### offy

    private float offy
  + ### zoom

    private float zoom
  + ### draww

    private float draww
  + ### drawh

    private float drawh
  + ### RENDER\_RECT\_FILLED

    static final byte RENDER\_RECT\_FILLED

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.popman.ZombiePopulationRenderer.RENDER_RECT_FILLED)
  + ### RENDER\_RECT\_OUTLINE

    static final byte RENDER\_RECT\_OUTLINE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.popman.ZombiePopulationRenderer.RENDER_RECT_OUTLINE)
  + ### RENDER\_LINE

    static final byte RENDER\_LINE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.popman.ZombiePopulationRenderer.RENDER_LINE)
  + ### RENDER\_CIRCLE

    static final byte RENDER\_CIRCLE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.popman.ZombiePopulationRenderer.RENDER_CIRCLE)
  + ### RENDER\_TEXT

    static final byte RENDER\_TEXT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.popman.ZombiePopulationRenderer.RENDER_TEXT)
  + ### drawers

    private final [ZombiePopulationRenderer.Drawer](ZombiePopulationRenderer.Drawer.html "class in zombie.popman")[] drawers
  + ### currentDrawer

    private [ZombiePopulationRenderer.DrawerImpl](ZombiePopulationRenderer.DrawerImpl.html "class in zombie.popman") currentDrawer
  + ### textDrawer

    private final [ZombiePopulationRenderer.DrawerImpl](ZombiePopulationRenderer.DrawerImpl.html "class in zombie.popman") textDrawer
  + ### VERSION

    private static final int VERSION

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.popman.ZombiePopulationRenderer.VERSION)
  + ### options

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../config/ConfigOption.html "class in zombie.config")> options
  + ### cellGrid

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") cellGrid
  + ### cellGrid300

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") cellGrid300
  + ### cellInfo

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") cellInfo
  + ### metaGridBuildings

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") metaGridBuildings
  + ### zombiesReal

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") zombiesReal
  + ### zombiesStanding

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") zombiesStanding
  + ### zombiesMoving

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") zombiesMoving
  + ### mcdObstacles

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") mcdObstacles
  + ### mcdRegularChunkOutlines

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") mcdRegularChunkOutlines
  + ### mcdRooms

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") mcdRooms
  + ### vehicles

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") vehicles
  + ### worldSounds

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") worldSounds
  + ### zombieIntensity

    private final [ZombiePopulationRenderer.BooleanDebugOption](ZombiePopulationRenderer.BooleanDebugOption.html "class in zombie.popman") zombieIntensity
* Constructor Details
  -------------------

  + ### ZombiePopulationRenderer

    public ZombiePopulationRenderer()
* Method Details
  --------------

  + ### n\_render

    private void n\_render(float zoom,
    int offx,
    int offy,
    float xPos,
    float yPos,
    int draww,
    int drawh)
  + ### n\_setWallFollowerStart

    private void n\_setWallFollowerStart(int x,
    int y)
  + ### n\_setWallFollowerEnd

    private void n\_setWallFollowerEnd(int x,
    int y)
  + ### n\_wallFollowerMouseMove

    private void n\_wallFollowerMouseMove(int x,
    int y)
  + ### n\_setDebugOption

    private void n\_setDebugOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") value)
  + ### worldToScreenX

    public float worldToScreenX(float x)
  + ### worldToScreenY

    public float worldToScreenY(float y)
  + ### uiToWorldX

    public float uiToWorldX(float x)
  + ### uiToWorldY

    public float uiToWorldY(float y)
  + ### renderString

    public void renderString(float x,
    float y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
  + ### renderRect

    public void renderRect(float x,
    float y,
    float w,
    float h,
    float r,
    float g,
    float b,
    float a)
  + ### renderLine

    public void renderLine(float x1,
    float y1,
    float x2,
    float y2,
    float r,
    float g,
    float b,
    float a)
  + ### renderCircle

    public void renderCircle(float x,
    float y,
    float radius,
    float r,
    float g,
    float b,
    float a)
  + ### renderZombie

    public void renderZombie(float x,
    float y,
    float r,
    float g,
    float b)
  + ### renderVehicle

    public void renderVehicle(int sqlid,
    float x,
    float y,
    float r,
    float g,
    float b)
  + ### outlineRect

    public void outlineRect(float x,
    float y,
    float w,
    float h,
    float r,
    float g,
    float b,
    float a)
  + ### renderCellInfo

    public void renderCellInfo(int cellX,
    int cellY,
    int effectivePopulation,
    int targetPopulation,
    float lastRepopTime)
  + ### render

    public void render([UIElement](../ui/UIElement.html "class in zombie.ui") ui,
    float zoom,
    float xPos,
    float yPos)
  + ### renderAllText

    private void renderAllText([UIElement](../ui/UIElement.html "class in zombie.ui") ui)
  + ### \_render

    private void \_render([UIElement](../ui/UIElement.html "class in zombie.ui") ui,
    float zoom,
    float xPos,
    float yPos)
  + ### renderWorldSounds

    private void renderWorldSounds()
  + ### setWallFollowerStart

    public void setWallFollowerStart(int x,
    int y)
  + ### setWallFollowerEnd

    public void setWallFollowerEnd(int x,
    int y)
  + ### wallFollowerMouseMove

    public void wallFollowerMouseMove(int x,
    int y)
  + ### getOptionByName

    public [ConfigOption](../config/ConfigOption.html "class in zombie.config") getOptionByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getOptionCount

    public int getOptionCount()
  + ### getOptionByIndex

    public [ConfigOption](../config/ConfigOption.html "class in zombie.config") getOptionByIndex(int index)
  + ### setBoolean

    public void setBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean value)
  + ### getBoolean

    public boolean getBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### save

    public void save()
  + ### load

    public void load()