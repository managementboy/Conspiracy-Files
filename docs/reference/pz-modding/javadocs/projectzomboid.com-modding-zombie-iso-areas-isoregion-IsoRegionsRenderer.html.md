[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.areas.isoregion](package-summary.html)
2. [IsoRegionsRenderer](IsoRegionsRenderer.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [tempChunkList](#tempChunkList)
   2. [debugLines](#debugLines)
   3. [xPos](#xPos)
   4. [yPos](#yPos)
   5. [offx](#offx)
   6. [offy](#offy)
   7. [zoom](#zoom)
   8. [draww](#draww)
   9. [drawh](#drawh)
   10. [hasSelected](#hasSelected)
   11. [validSelection](#validSelection)
   12. [selectedX](#selectedX)
   13. [selectedY](#selectedY)
   14. [selectedZ](#selectedZ)
   15. [drawnCells](#drawnCells)
   16. [editSquareInRange](#editSquareInRange)
   17. [editSquareX](#editSquareX)
   18. [editSquareY](#editSquareY)
   19. [editOptions](#editOptions)
   20. [editingEnabled](#editingEnabled)
   21. [editWallN](#editWallN)
   22. [editWallW](#editWallW)
   23. [editDoorN](#editDoorN)
   24. [editDoorW](#editDoorW)
   25. [editFloor](#editFloor)
   26. [zLevelOptions](#zLevelOptions)
   27. [zLevelPlayer](#zLevelPlayer)
   28. [zLevel0](#zLevel0)
   29. [zLevel1](#zLevel1)
   30. [zLevel2](#zLevel2)
   31. [zLevel3](#zLevel3)
   32. [zLevel4](#zLevel4)
   33. [zLevel5](#zLevel5)
   34. [zLevel6](#zLevel6)
   35. [zLevel7](#zLevel7)
   36. [VERSION](#VERSION)
   37. [options](#options)
   38. [cellGrid](#cellGrid)
   39. [metaGridBuildings](#metaGridBuildings)
   40. [isoRegionRender](#isoRegionRender)
   41. [isoRegionRenderChunks](#isoRegionRenderChunks)
   42. [isoRegionRenderChunksPlus](#isoRegionRenderChunksPlus)
7. [Constructor Details](#constructor-detail)
   1. [IsoRegionsRenderer()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [worldToScreenX(float)](#worldToScreenX(float))
   2. [worldToScreenY(float)](#worldToScreenY(float))
   3. [uiToWorldX(float)](#uiToWorldX(float))
   4. [uiToWorldY(float)](#uiToWorldY(float))
   5. [renderStringUI(float, float, String, Color)](#renderStringUI(float,float,java.lang.String,zombie.core.Color))
   6. [renderStringUI(float, float, String, double, double, double, double)](#renderStringUI(float,float,java.lang.String,double,double,double,double))
   7. [renderString(float, float, String, double, double, double, double)](#renderString(float,float,java.lang.String,double,double,double,double))
   8. [renderRect(float, float, float, float, float, float, float, float)](#renderRect(float,float,float,float,float,float,float,float))
   9. [renderLine(float, float, float, float, float, float, float, float)](#renderLine(float,float,float,float,float,float,float,float))
   10. [outlineRect(float, float, float, float, float, float, float, float)](#outlineRect(float,float,float,float,float,float,float,float))
   11. [renderCellInfo(int, int, int, int, float)](#renderCellInfo(int,int,int,int,float))
   12. [renderZombie(float, float, float, float, float)](#renderZombie(float,float,float,float,float))
   13. [renderSquare(float, float, float, float, float, float)](#renderSquare(float,float,float,float,float,float))
   14. [renderEntity(float, float, float, float, float, float, float)](#renderEntity(float,float,float,float,float,float,float))
   15. [render(UIElement, float, float, float)](#render(zombie.ui.UIElement,float,float,float))
   16. [debugLine(String)](#debugLine(java.lang.String))
   17. [recalcSurroundings()](#recalcSurroundings())
   18. [hasChunkRegion(int, int)](#hasChunkRegion(int,int))
   19. [getChunkRegion(int, int)](#getChunkRegion(int,int))
   20. [setSelected(int, int)](#setSelected(int,int))
   21. [setSelectedWorld(int, int)](#setSelectedWorld(int,int))
   22. [unsetSelected()](#unsetSelected())
   23. [isHasSelected()](#isHasSelected())
   24. [\_render(UIElement, float, float, float)](#_render(zombie.ui.UIElement,float,float,float))
   25. [setEditSquareCoord(int, int)](#setEditSquareCoord(int,int))
   26. [editCoordInRange(int, int)](#editCoordInRange(int,int))
   27. [getActiveEditKind()](#getActiveEditKind())
   28. [isEditingEnabled()](#isEditingEnabled())
   29. [editRotate()](#editRotate())
   30. [getEditOptionByName(String)](#getEditOptionByName(java.lang.String))
   31. [getEditOptionCount()](#getEditOptionCount())
   32. [getEditOptionByIndex(int)](#getEditOptionByIndex(int))
   33. [setEditOption(int, boolean)](#setEditOption(int,boolean))
   34. [getZLevel()](#getZLevel())
   35. [getZLevelOptionByName(String)](#getZLevelOptionByName(java.lang.String))
   36. [getZLevelOptionCount()](#getZLevelOptionCount())
   37. [getZLevelOptionByIndex(int)](#getZLevelOptionByIndex(int))
   38. [setZLevelOption(int, boolean)](#setZLevelOption(int,boolean))
   39. [getOptionByName(String)](#getOptionByName(java.lang.String))
   40. [getOptionCount()](#getOptionCount())
   41. [getOptionByIndex(int)](#getOptionByIndex(int))
   42. [setBoolean(String, boolean)](#setBoolean(java.lang.String,boolean))
   43. [getBoolean(String)](#getBoolean(java.lang.String))
   44. [save()](#save())
   45. [load()](#load())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class IsoRegionsRenderer
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.areas.isoregion.IsoRegionsRenderer

---

public class IsoRegionsRenderer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `IsoRegionsRenderer.BooleanDebugOption`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `cellGrid`

  `private final List<String>`

  `debugLines`

  `private float`

  `drawh`

  `private final HashSet<Integer>`

  `drawnCells`

  `private float`

  `draww`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `editDoorN`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `editDoorW`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `editFloor`

  `private boolean`

  `editingEnabled`

  `private final ArrayList<ConfigOption>`

  `editOptions`

  `private boolean`

  `editSquareInRange`

  `private int`

  `editSquareX`

  `private int`

  `editSquareY`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `editWallN`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `editWallW`

  `private boolean`

  `hasSelected`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `isoRegionRender`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `isoRegionRenderChunks`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `isoRegionRenderChunksPlus`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `metaGridBuildings`

  `private float`

  `offx`

  `private float`

  `offy`

  `private final ArrayList<ConfigOption>`

  `options`

  `private int`

  `selectedX`

  `private int`

  `selectedY`

  `private int`

  `selectedZ`

  `private final List<DataChunk>`

  `tempChunkList`

  `private boolean`

  `validSelection`

  `private static final int`

  `VERSION`

  `private float`

  `xPos`

  `private float`

  `yPos`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `zLevel0`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `zLevel1`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `zLevel2`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `zLevel3`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `zLevel4`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `zLevel5`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `zLevel6`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `zLevel7`

  `private final ArrayList<ConfigOption>`

  `zLevelOptions`

  `private final IsoRegionsRenderer.BooleanDebugOption`

  `zLevelPlayer`

  `private float`

  `zoom`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoRegionsRenderer()`
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

  `private void`

  `debugLine(String str)`

  `private boolean`

  `editCoordInRange(int x,
  int y)`

  `void`

  `editRotate()`

  `String`

  `getActiveEditKind()`

  `boolean`

  `getBoolean(String name)`

  `IsoChunkRegion`

  `getChunkRegion(int x,
  int y)`

  `ConfigOption`

  `getEditOptionByIndex(int index)`

  `ConfigOption`

  `getEditOptionByName(String name)`

  `int`

  `getEditOptionCount()`

  `ConfigOption`

  `getOptionByIndex(int index)`

  `ConfigOption`

  `getOptionByName(String name)`

  `int`

  `getOptionCount()`

  `int`

  `getZLevel()`

  `ConfigOption`

  `getZLevelOptionByIndex(int index)`

  `ConfigOption`

  `getZLevelOptionByName(String name)`

  `int`

  `getZLevelOptionCount()`

  `boolean`

  `hasChunkRegion(int x,
  int y)`

  `boolean`

  `isEditingEnabled()`

  `boolean`

  `isHasSelected()`

  `void`

  `load()`

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

  `recalcSurroundings()`

  `void`

  `render(UIElement ui,
  float zoom,
  float xPos,
  float yPos)`

  `void`

  `renderCellInfo(int cellX,
  int cellY,
  int effectivePopulation,
  int targetPopulation,
  float lastRepopTime)`

  `void`

  `renderEntity(float size,
  float x,
  float y,
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

  `renderSquare(float x,
  float y,
  float r,
  float g,
  float b,
  float alpha)`

  `void`

  `renderString(float x,
  float y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `renderStringUI(float x,
  float y,
  String str,
  double r,
  double g,
  double b,
  double a)`

  `void`

  `renderStringUI(float x,
  float y,
  String str,
  Color c)`

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

  `setEditOption(int index,
  boolean b)`

  `void`

  `setEditSquareCoord(int x,
  int y)`

  `void`

  `setSelected(int x,
  int y)`

  `void`

  `setSelectedWorld(int x,
  int y)`

  `void`

  `setZLevelOption(int index,
  boolean b)`

  `float`

  `uiToWorldX(float x)`

  `float`

  `uiToWorldY(float y)`

  `void`

  `unsetSelected()`

  `float`

  `worldToScreenX(float x)`

  `float`

  `worldToScreenY(float y)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tempChunkList

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[DataChunk](data/DataChunk.html "class in zombie.iso.areas.isoregion.data")> tempChunkList
  + ### debugLines

    private final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> debugLines
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
  + ### hasSelected

    private boolean hasSelected
  + ### validSelection

    private boolean validSelection
  + ### selectedX

    private int selectedX
  + ### selectedY

    private int selectedY
  + ### selectedZ

    private int selectedZ
  + ### drawnCells

    private final [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang")> drawnCells
  + ### editSquareInRange

    private boolean editSquareInRange
  + ### editSquareX

    private int editSquareX
  + ### editSquareY

    private int editSquareY
  + ### editOptions

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../../../config/ConfigOption.html "class in zombie.config")> editOptions
  + ### editingEnabled

    private boolean editingEnabled
  + ### editWallN

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") editWallN
  + ### editWallW

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") editWallW
  + ### editDoorN

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") editDoorN
  + ### editDoorW

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") editDoorW
  + ### editFloor

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") editFloor
  + ### zLevelOptions

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../../../config/ConfigOption.html "class in zombie.config")> zLevelOptions
  + ### zLevelPlayer

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") zLevelPlayer
  + ### zLevel0

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") zLevel0
  + ### zLevel1

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") zLevel1
  + ### zLevel2

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") zLevel2
  + ### zLevel3

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") zLevel3
  + ### zLevel4

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") zLevel4
  + ### zLevel5

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") zLevel5
  + ### zLevel6

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") zLevel6
  + ### zLevel7

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") zLevel7
  + ### VERSION

    private static final int VERSION

    See Also:
    :   - [Constant Field Values](../../../../constant-values.html#zombie.iso.areas.isoregion.IsoRegionsRenderer.VERSION)
  + ### options

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../../../config/ConfigOption.html "class in zombie.config")> options
  + ### cellGrid

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") cellGrid
  + ### metaGridBuildings

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") metaGridBuildings
  + ### isoRegionRender

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") isoRegionRender
  + ### isoRegionRenderChunks

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") isoRegionRenderChunks
  + ### isoRegionRenderChunksPlus

    private final [IsoRegionsRenderer.BooleanDebugOption](IsoRegionsRenderer.BooleanDebugOption.html "class in zombie.iso.areas.isoregion") isoRegionRenderChunksPlus
* Constructor Details
  -------------------

  + ### IsoRegionsRenderer

    public IsoRegionsRenderer()
* Method Details
  --------------

  + ### worldToScreenX

    public float worldToScreenX(float x)
  + ### worldToScreenY

    public float worldToScreenY(float y)
  + ### uiToWorldX

    public float uiToWorldX(float x)
  + ### uiToWorldY

    public float uiToWorldY(float y)
  + ### renderStringUI

    public void renderStringUI(float x,
    float y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    [Color](../../../core/Color.html "class in zombie.core") c)
  + ### renderStringUI

    public void renderStringUI(float x,
    float y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str,
    double r,
    double g,
    double b,
    double a)
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
  + ### renderZombie

    public void renderZombie(float x,
    float y,
    float r,
    float g,
    float b)
  + ### renderSquare

    public void renderSquare(float x,
    float y,
    float r,
    float g,
    float b,
    float alpha)
  + ### renderEntity

    public void renderEntity(float size,
    float x,
    float y,
    float r,
    float g,
    float b,
    float a)
  + ### render

    public void render([UIElement](../../../ui/UIElement.html "class in zombie.ui") ui,
    float zoom,
    float xPos,
    float yPos)
  + ### debugLine

    private void debugLine([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") str)
  + ### recalcSurroundings

    public void recalcSurroundings()
  + ### hasChunkRegion

    public boolean hasChunkRegion(int x,
    int y)
  + ### getChunkRegion

    public [IsoChunkRegion](regions/IsoChunkRegion.html "class in zombie.iso.areas.isoregion.regions") getChunkRegion(int x,
    int y)
  + ### setSelected

    public void setSelected(int x,
    int y)
  + ### setSelectedWorld

    public void setSelectedWorld(int x,
    int y)
  + ### unsetSelected

    public void unsetSelected()
  + ### isHasSelected

    public boolean isHasSelected()
  + ### \_render

    private void \_render([UIElement](../../../ui/UIElement.html "class in zombie.ui") ui,
    float zoom,
    float xPos,
    float yPos)
  + ### setEditSquareCoord

    public void setEditSquareCoord(int x,
    int y)
  + ### editCoordInRange

    private boolean editCoordInRange(int x,
    int y)
  + ### getActiveEditKind

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getActiveEditKind()
  + ### isEditingEnabled

    public boolean isEditingEnabled()
  + ### editRotate

    public void editRotate()
  + ### getEditOptionByName

    public [ConfigOption](../../../config/ConfigOption.html "class in zombie.config") getEditOptionByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getEditOptionCount

    public int getEditOptionCount()
  + ### getEditOptionByIndex

    public [ConfigOption](../../../config/ConfigOption.html "class in zombie.config") getEditOptionByIndex(int index)
  + ### setEditOption

    public void setEditOption(int index,
    boolean b)
  + ### getZLevel

    public int getZLevel()
  + ### getZLevelOptionByName

    public [ConfigOption](../../../config/ConfigOption.html "class in zombie.config") getZLevelOptionByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getZLevelOptionCount

    public int getZLevelOptionCount()
  + ### getZLevelOptionByIndex

    public [ConfigOption](../../../config/ConfigOption.html "class in zombie.config") getZLevelOptionByIndex(int index)
  + ### setZLevelOption

    public void setZLevelOption(int index,
    boolean b)
  + ### getOptionByName

    public [ConfigOption](../../../config/ConfigOption.html "class in zombie.config") getOptionByName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### getOptionCount

    public int getOptionCount()
  + ### getOptionByIndex

    public [ConfigOption](../../../config/ConfigOption.html "class in zombie.config") getOptionByIndex(int index)
  + ### setBoolean

    public void setBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean value)
  + ### getBoolean

    public boolean getBoolean([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### save

    public void save()
  + ### load

    public void load()