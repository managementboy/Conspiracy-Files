[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [DebugChunkState](DebugChunkState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [DIRECTIONS](#DIRECTIONS)
   2. [instance](#instance)
   3. [luaEnv](#luaEnv)
   4. [exit](#exit)
   5. [gameUi](#gameUi)
   6. [selfUi](#selfUi)
   7. [suspendUi](#suspendUi)
   8. [eventList](#eventList)
   9. [eventMap](#eventMap)
   10. [table](#table)
   11. [playerIndex](#playerIndex)
   12. [z](#z)
   13. [gridX](#gridX)
   14. [gridY](#gridY)
   15. [gridXf](#gridXf)
   16. [gridYf](#gridYf)
   17. [FONT](#FONT)
   18. [vehicleStoryName](#vehicleStoryName)
   19. [keyQpressed](#keyQpressed)
   20. [geometryDrawers](#geometryDrawers)
   21. [inventoryItem1](#inventoryItem1)
   22. [m\_clipperOffset](#m_clipperOffset)
   23. [clipperBuffer](#clipperBuffer)
   24. [VERSION](#VERSION)
   25. [options](#options)
   26. [optionsHidden](#optionsHidden)
   27. [buildingRect](#buildingRect)
   28. [chunkGrid](#chunkGrid)
   29. [chunkColorTexture](#chunkColorTexture)
   30. [chunkDepthTexture](#chunkDepthTexture)
   31. [closestRoomSquare](#closestRoomSquare)
   32. [depthValues](#depthValues)
   33. [emptySquares](#emptySquares)
   34. [flyBuzzEmitters](#flyBuzzEmitters)
   35. [lightSquares](#lightSquares)
   36. [lineClearCollide](#lineClearCollide)
   37. [nearestWalls](#nearestWalls)
   38. [nearestExteriorWalls](#nearestExteriorWalls)
   39. [objectAtCursor](#objectAtCursor)
   40. [objectAtCursorId](#objectAtCursorId)
   41. [objectAtCursorLevels](#objectAtCursorLevels)
   42. [objectAtCursorScale](#objectAtCursorScale)
   43. [objectAtCursorWidth](#objectAtCursorWidth)
   44. [objectPicker](#objectPicker)
   45. [occludedSquares](#occludedSquares)
   46. [roofHideBuilding](#roofHideBuilding)
   47. [roomLightRects](#roomLightRects)
   48. [vehicleStory](#vehicleStory)
   49. [randomSquareInZone](#randomSquareInZone)
   50. [zoneRect](#zoneRect)
7. [Constructor Details](#constructor-detail)
   1. [DebugChunkState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [enter()](#enter())
   2. [yield()](#yield())
   3. [reenter()](#reenter())
   4. [exit()](#exit())
   5. [render()](#render())
   6. [update()](#update())
   7. [checkInstance()](#checkInstance())
   8. [renderScene()](#renderScene())
   9. [renderUI()](#renderUI())
   10. [renderChunkTexture(int, int, boolean)](#renderChunkTexture(int,int,boolean))
   11. [setTable(KahluaTable)](#setTable(se.krka.kahlua.vm.KahluaTable))
   12. [updateScene()](#updateScene())
   13. [saveGameUI()](#saveGameUI())
   14. [restoreGameUI()](#restoreGameUI())
   15. [fromLua0(String)](#fromLua0(java.lang.String))
   16. [fromLua1(String, Object)](#fromLua1(java.lang.String,java.lang.Object))
   17. [fromLua2(String, Object, Object)](#fromLua2(java.lang.String,java.lang.Object,java.lang.Object))
   18. [updateCursor()](#updateCursor())
   19. [DrawIsoLine(float, float, float, float, float, float, float, float, int)](#DrawIsoLine(float,float,float,float,float,float,float,float,int))
   20. [DrawIsoRect(float, float, float, float, float, float, float, float, int)](#DrawIsoRect(float,float,float,float,float,float,float,float,int))
   21. [drawGrid()](#drawGrid())
   22. [drawObjectAtCursor()](#drawObjectAtCursor())
   23. [drawTestModels()](#drawTestModels())
   24. [drawCursor()](#drawCursor())
   25. [drawZones()](#drawZones())
   26. [drawVehicleStory()](#drawVehicleStory())
   27. [DrawBehindStuff()](#DrawBehindStuff())
   28. [IsBehindStuff(IsoGridSquare)](#IsBehindStuff(zombie.iso.IsoGridSquare))
   29. [IsBehindStuffRecY(int, int, int)](#IsBehindStuffRecY(int,int,int))
   30. [IsBehindStuffRecXY(int, int, int, int)](#IsBehindStuffRecXY(int,int,int,int))
   31. [IsBehindStuffRecX(int, int, int)](#IsBehindStuffRecX(int,int,int))
   32. [paintSquare(int, int, int, float, float, float, float)](#paintSquare(int,int,int,float,float,float,float))
   33. [drawModData()](#drawModData())
   34. [drawPlayerInfo()](#drawPlayerInfo())
   35. [lineClearCached(IsoCell, int, int, int, int, int, int, boolean)](#lineClearCached(zombie.iso.IsoCell,int,int,int,int,int,int,boolean))
   36. [DrawString(int, int, String)](#DrawString(int,int,java.lang.String))
   37. [getObjectAtCursorScale()](#getObjectAtCursorScale())
   38. [registerOption(ConfigOption)](#registerOption(zombie.config.ConfigOption))
   39. [getOptionByName(String)](#getOptionByName(java.lang.String))
   40. [getOptionCount()](#getOptionCount())
   41. [getOptionByIndex(int)](#getOptionByIndex(int))
   42. [setBoolean(String, boolean)](#setBoolean(java.lang.String,boolean))
   43. [getBoolean(String)](#getBoolean(java.lang.String))
   44. [save()](#save())
   45. [load()](#load())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DebugChunkState
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.GameState

zombie.gameStates.DebugChunkState

---

public final class DebugChunkState
extends zombie.gameStates.GameState

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `class`

  `DebugChunkState.BooleanDebugOption`

  `class`

  `DebugChunkState.DoubleDebugOption`

  `private class`

  `DebugChunkState.FloodFill`

  `private static final class`

  `DebugChunkState.GeometryDrawer`

  `class`

  `DebugChunkState.IntegerDebugOption`

  `class`

  `DebugChunkState.StringDebugOption`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final DebugChunkState.BooleanDebugOption`

  `buildingRect`

  `private final DebugChunkState.BooleanDebugOption`

  `chunkColorTexture`

  `private final DebugChunkState.BooleanDebugOption`

  `chunkDepthTexture`

  `private final DebugChunkState.BooleanDebugOption`

  `chunkGrid`

  `private static ByteBuffer`

  `clipperBuffer`

  `private final DebugChunkState.BooleanDebugOption`

  `closestRoomSquare`

  `private final DebugChunkState.BooleanDebugOption`

  `depthValues`

  `private static final IsoDirections[]`

  `DIRECTIONS`

  `private final DebugChunkState.BooleanDebugOption`

  `emptySquares`

  `private final ArrayList<zombie.Lua.Event>`

  `eventList`

  `private final HashMap<String, zombie.Lua.Event>`

  `eventMap`

  `private boolean`

  `exit`

  `private final DebugChunkState.BooleanDebugOption`

  `flyBuzzEmitters`

  `private static final UIFont`

  `FONT`

  `private final ArrayList<zombie.ui.UIElementInterface>`

  `gameUi`

  `private final DebugChunkState.GeometryDrawer[]`

  `geometryDrawers`

  `private int`

  `gridX`

  `float`

  `gridXf`

  `private int`

  `gridY`

  `float`

  `gridYf`

  `static DebugChunkState`

  `instance`

  `private InventoryItem`

  `inventoryItem1`

  `private static boolean`

  `keyQpressed`

  `private final DebugChunkState.BooleanDebugOption`

  `lightSquares`

  `private final DebugChunkState.BooleanDebugOption`

  `lineClearCollide`

  `private EditVehicleState.LuaEnvironment`

  `luaEnv`

  `private static final zombie.vehicles.ClipperOffset`

  `m_clipperOffset`

  `private final DebugChunkState.BooleanDebugOption`

  `nearestExteriorWalls`

  `private final DebugChunkState.BooleanDebugOption`

  `nearestWalls`

  `private final DebugChunkState.BooleanDebugOption`

  `objectAtCursor`

  `private final DebugChunkState.StringDebugOption`

  `objectAtCursorId`

  `private final DebugChunkState.IntegerDebugOption`

  `objectAtCursorLevels`

  `private final DebugChunkState.DoubleDebugOption`

  `objectAtCursorScale`

  `private final DebugChunkState.DoubleDebugOption`

  `objectAtCursorWidth`

  `private final DebugChunkState.BooleanDebugOption`

  `objectPicker`

  `private final DebugChunkState.BooleanDebugOption`

  `occludedSquares`

  `private final ArrayList<ConfigOption>`

  `options`

  `private final ArrayList<ConfigOption>`

  `optionsHidden`

  `private int`

  `playerIndex`

  `private final DebugChunkState.BooleanDebugOption`

  `randomSquareInZone`

  `private final DebugChunkState.BooleanDebugOption`

  `roofHideBuilding`

  `private final DebugChunkState.BooleanDebugOption`

  `roomLightRects`

  `private final ArrayList<zombie.ui.UIElementInterface>`

  `selfUi`

  `private boolean`

  `suspendUi`

  `private se.krka.kahlua.vm.KahluaTable`

  `table`

  `private final DebugChunkState.BooleanDebugOption`

  `vehicleStory`

  `private String`

  `vehicleStoryName`

  `private static final int`

  `VERSION`

  `int`

  `z`

  `private final DebugChunkState.BooleanDebugOption`

  `zoneRect`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DebugChunkState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static DebugChunkState`

  `checkInstance()`

  `private void`

  `DrawBehindStuff()`

  `private void`

  `drawCursor()`

  `private void`

  `drawGrid()`

  `private void`

  `DrawIsoLine(float x,
  float y,
  float x2,
  float y2,
  float r,
  float g,
  float b,
  float a,
  int thickness)`

  `private void`

  `DrawIsoRect(float x,
  float y,
  float width,
  float height,
  float r,
  float g,
  float b,
  float a,
  int thickness)`

  `private void`

  `drawModData()`

  `void`

  `drawObjectAtCursor()`

  `private void`

  `drawPlayerInfo()`

  `private void`

  `DrawString(int x,
  int y,
  String text)`

  `private void`

  `drawTestModels()`

  `private void`

  `drawVehicleStory()`

  `private void`

  `drawZones()`

  `void`

  `enter()`

  `void`

  `exit()`

  `Object`

  `fromLua0(String func)`

  `Object`

  `fromLua1(String func,
  Object arg0)`

  `Object`

  `fromLua2(String func,
  Object arg0,
  Object arg1)`

  `boolean`

  `getBoolean(String name)`

  `float`

  `getObjectAtCursorScale()`

  `ConfigOption`

  `getOptionByIndex(int index)`

  `ConfigOption`

  `getOptionByName(String name)`

  `int`

  `getOptionCount()`

  `private boolean`

  `IsBehindStuff(IsoGridSquare sq)`

  `private boolean`

  `IsBehindStuffRecX(int x,
  int y,
  int z)`

  `private boolean`

  `IsBehindStuffRecXY(int x,
  int y,
  int z,
  int n)`

  `private boolean`

  `IsBehindStuffRecY(int x,
  int y,
  int z)`

  `LosUtil.TestResults`

  `lineClearCached(IsoCell cell,
  int x1,
  int y1,
  int z1,
  int x0,
  int y0,
  int z0,
  boolean bIgnoreDoors)`

  `void`

  `load()`

  `private void`

  `paintSquare(int x,
  int y,
  int z,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `reenter()`

  `private void`

  `registerOption(ConfigOption option)`

  `void`

  `render()`

  `private int`

  `renderChunkTexture(int x,
  int y,
  boolean colorTexture)`

  `void`

  `renderScene()`

  `private void`

  `renderUI()`

  `private void`

  `restoreGameUI()`

  `void`

  `save()`

  `private void`

  `saveGameUI()`

  `void`

  `setBoolean(String name,
  boolean value)`

  `void`

  `setTable(se.krka.kahlua.vm.KahluaTable table)`

  `zombie.gameStates.GameStateMachine.StateAction`

  `update()`

  `private void`

  `updateCursor()`

  `zombie.gameStates.GameStateMachine.StateAction`

  `updateScene()`

  `void`

  `yield()`

  ### Methods inherited from class zombie.gameStates.GameState

  `redirectState`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### DIRECTIONS

    private static final [IsoDirections](../iso/IsoDirections.html "enum class in zombie.iso")[] DIRECTIONS
  + ### instance

    public static [DebugChunkState](DebugChunkState.html "class in zombie.gameStates") instance
  + ### luaEnv

    private [EditVehicleState.LuaEnvironment](../vehicles/EditVehicleState.LuaEnvironment.html "class in zombie.vehicles") luaEnv
  + ### exit

    private boolean exit
  + ### gameUi

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> gameUi
  + ### selfUi

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> selfUi
  + ### suspendUi

    private boolean suspendUi
  + ### eventList

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.Lua.Event> eventList
  + ### eventMap

    private final [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), zombie.Lua.Event> eventMap
  + ### table

    private se.krka.kahlua.vm.KahluaTable table
  + ### playerIndex

    private int playerIndex
  + ### z

    public int z
  + ### gridX

    private int gridX
  + ### gridY

    private int gridY
  + ### gridXf

    public float gridXf
  + ### gridYf

    public float gridYf
  + ### FONT

    private static final [UIFont](../ui/UIFont.html "enum class in zombie.ui") FONT
  + ### vehicleStoryName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") vehicleStoryName
  + ### keyQpressed

    private static boolean keyQpressed
  + ### geometryDrawers

    private final [DebugChunkState.GeometryDrawer](DebugChunkState.GeometryDrawer.html "class in zombie.gameStates")[] geometryDrawers
  + ### inventoryItem1

    private [InventoryItem](../inventory/InventoryItem.html "class in zombie.inventory") inventoryItem1
  + ### m\_clipperOffset

    private static final zombie.vehicles.ClipperOffset m\_clipperOffset
  + ### clipperBuffer

    private static [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio") clipperBuffer
  + ### VERSION

    private static final int VERSION

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.gameStates.DebugChunkState.VERSION)
  + ### options

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../config/ConfigOption.html "class in zombie.config")> options
  + ### optionsHidden

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../config/ConfigOption.html "class in zombie.config")> optionsHidden
  + ### buildingRect

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") buildingRect
  + ### chunkGrid

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") chunkGrid
  + ### chunkColorTexture

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") chunkColorTexture
  + ### chunkDepthTexture

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") chunkDepthTexture
  + ### closestRoomSquare

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") closestRoomSquare
  + ### depthValues

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") depthValues
  + ### emptySquares

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") emptySquares
  + ### flyBuzzEmitters

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") flyBuzzEmitters
  + ### lightSquares

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") lightSquares
  + ### lineClearCollide

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") lineClearCollide
  + ### nearestWalls

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") nearestWalls
  + ### nearestExteriorWalls

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") nearestExteriorWalls
  + ### objectAtCursor

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") objectAtCursor
  + ### objectAtCursorId

    private final [DebugChunkState.StringDebugOption](DebugChunkState.StringDebugOption.html "class in zombie.gameStates") objectAtCursorId
  + ### objectAtCursorLevels

    private final [DebugChunkState.IntegerDebugOption](DebugChunkState.IntegerDebugOption.html "class in zombie.gameStates") objectAtCursorLevels
  + ### objectAtCursorScale

    private final [DebugChunkState.DoubleDebugOption](DebugChunkState.DoubleDebugOption.html "class in zombie.gameStates") objectAtCursorScale
  + ### objectAtCursorWidth

    private final [DebugChunkState.DoubleDebugOption](DebugChunkState.DoubleDebugOption.html "class in zombie.gameStates") objectAtCursorWidth
  + ### objectPicker

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") objectPicker
  + ### occludedSquares

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") occludedSquares
  + ### roofHideBuilding

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") roofHideBuilding
  + ### roomLightRects

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") roomLightRects
  + ### vehicleStory

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") vehicleStory
  + ### randomSquareInZone

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") randomSquareInZone
  + ### zoneRect

    private final [DebugChunkState.BooleanDebugOption](DebugChunkState.BooleanDebugOption.html "class in zombie.gameStates") zoneRect
* Constructor Details
  -------------------

  + ### DebugChunkState

    public DebugChunkState()
* Method Details
  --------------

  + ### enter

    public void enter()

    Overrides:
    :   `enter` in class `zombie.gameStates.GameState`
  + ### yield

    public void yield()

    Overrides:
    :   `yield` in class `zombie.gameStates.GameState`
  + ### reenter

    public void reenter()

    Overrides:
    :   `reenter` in class `zombie.gameStates.GameState`
  + ### exit

    public void exit()

    Overrides:
    :   `exit` in class `zombie.gameStates.GameState`
  + ### render

    public void render()

    Overrides:
    :   `render` in class `zombie.gameStates.GameState`
  + ### update

    public zombie.gameStates.GameStateMachine.StateAction update()

    Overrides:
    :   `update` in class `zombie.gameStates.GameState`
  + ### checkInstance

    public static [DebugChunkState](DebugChunkState.html "class in zombie.gameStates") checkInstance()
  + ### renderScene

    public void renderScene()
  + ### renderUI

    private void renderUI()
  + ### renderChunkTexture

    private int renderChunkTexture(int x,
    int y,
    boolean colorTexture)
  + ### setTable

    public void setTable(se.krka.kahlua.vm.KahluaTable table)
  + ### updateScene

    public zombie.gameStates.GameStateMachine.StateAction updateScene()
  + ### saveGameUI

    private void saveGameUI()
  + ### restoreGameUI

    private void restoreGameUI()
  + ### fromLua0

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua0([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func)
  + ### fromLua1

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua1([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0)
  + ### fromLua2

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua2([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1)
  + ### updateCursor

    private void updateCursor()
  + ### DrawIsoLine

    private void DrawIsoLine(float x,
    float y,
    float x2,
    float y2,
    float r,
    float g,
    float b,
    float a,
    int thickness)
  + ### DrawIsoRect

    private void DrawIsoRect(float x,
    float y,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a,
    int thickness)
  + ### drawGrid

    private void drawGrid()
  + ### drawObjectAtCursor

    public void drawObjectAtCursor()
  + ### drawTestModels

    private void drawTestModels()
  + ### drawCursor

    private void drawCursor()
  + ### drawZones

    private void drawZones()
  + ### drawVehicleStory

    private void drawVehicleStory()
  + ### DrawBehindStuff

    private void DrawBehindStuff()
  + ### IsBehindStuff

    private boolean IsBehindStuff([IsoGridSquare](../iso/IsoGridSquare.html "class in zombie.iso") sq)
  + ### IsBehindStuffRecY

    private boolean IsBehindStuffRecY(int x,
    int y,
    int z)
  + ### IsBehindStuffRecXY

    private boolean IsBehindStuffRecXY(int x,
    int y,
    int z,
    int n)
  + ### IsBehindStuffRecX

    private boolean IsBehindStuffRecX(int x,
    int y,
    int z)
  + ### paintSquare

    private void paintSquare(int x,
    int y,
    int z,
    float r,
    float g,
    float b,
    float a)
  + ### drawModData

    private void drawModData()
  + ### drawPlayerInfo

    private void drawPlayerInfo()
  + ### lineClearCached

    public [LosUtil.TestResults](../iso/LosUtil.TestResults.html "enum class in zombie.iso") lineClearCached([IsoCell](../iso/IsoCell.html "class in zombie.iso") cell,
    int x1,
    int y1,
    int z1,
    int x0,
    int y0,
    int z0,
    boolean bIgnoreDoors)
  + ### DrawString

    private void DrawString(int x,
    int y,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") text)
  + ### getObjectAtCursorScale

    public float getObjectAtCursorScale()
  + ### registerOption

    private void registerOption([ConfigOption](../config/ConfigOption.html "class in zombie.config") option)
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