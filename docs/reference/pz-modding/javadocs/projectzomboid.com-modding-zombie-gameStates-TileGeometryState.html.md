[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [TileGeometryState](TileGeometryState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [luaEnv](#luaEnv)
   3. [exit](#exit)
   4. [gameUi](#gameUi)
   5. [selfUi](#selfUi)
   6. [suspendUi](#suspendUi)
   7. [table](#table)
   8. [VERSION](#VERSION)
   9. [options](#options)
   10. [drawGrid](#drawGrid)
   11. [drawPixelGrid](#drawPixelGrid)
   12. [drawSpriteGrid](#drawSpriteGrid)
   13. [drawSpriteGridTextureMask](#drawSpriteGridTextureMask)
   14. [drawSquareBox](#drawSquareBox)
   15. [drawSolidSquareBox](#drawSolidSquareBox)
   16. [drawNorthWall](#drawNorthWall)
   17. [drawWestWall](#drawWestWall)
   18. [drawTextureMask](#drawTextureMask)
   19. [drawTextureOutline](#drawTextureOutline)
   20. [drawUnderlyingSprite](#drawUnderlyingSprite)
7. [Constructor Details](#constructor-detail)
   1. [TileGeometryState()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [enter()](#enter())
   2. [yield()](#yield())
   3. [reenter()](#reenter())
   4. [exit()](#exit())
   5. [render()](#render())
   6. [update()](#update())
   7. [checkInstance()](#checkInstance())
   8. [saveGameUI()](#saveGameUI())
   9. [restoreGameUI()](#restoreGameUI())
   10. [updateScene()](#updateScene())
   11. [renderScene()](#renderScene())
   12. [renderUI()](#renderUI())
   13. [setTable(KahluaTable)](#setTable(se.krka.kahlua.vm.KahluaTable))
   14. [fromLua0(String)](#fromLua0(java.lang.String))
   15. [fromLua1(String, Object)](#fromLua1(java.lang.String,java.lang.Object))
   16. [fromLua2(String, Object, Object)](#fromLua2(java.lang.String,java.lang.Object,java.lang.Object))
   17. [getOptionByName(String)](#getOptionByName(java.lang.String))
   18. [getOptionCount()](#getOptionCount())
   19. [getOptionByIndex(int)](#getOptionByIndex(int))
   20. [setBoolean(String, boolean)](#setBoolean(java.lang.String,boolean))
   21. [getBoolean(String)](#getBoolean(java.lang.String))
   22. [save()](#save())
   23. [load()](#load())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class TileGeometryState
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.GameState

zombie.gameStates.TileGeometryState

---

public final class TileGeometryState
extends zombie.gameStates.GameState

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `class`

  `TileGeometryState.BooleanDebugOption`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final TileGeometryState.BooleanDebugOption`

  `drawGrid`

  `private final TileGeometryState.BooleanDebugOption`

  `drawNorthWall`

  `private final TileGeometryState.BooleanDebugOption`

  `drawPixelGrid`

  `private final TileGeometryState.BooleanDebugOption`

  `drawSolidSquareBox`

  `private final TileGeometryState.BooleanDebugOption`

  `drawSpriteGrid`

  `private final TileGeometryState.BooleanDebugOption`

  `drawSpriteGridTextureMask`

  `private final TileGeometryState.BooleanDebugOption`

  `drawSquareBox`

  `private final TileGeometryState.BooleanDebugOption`

  `drawTextureMask`

  `private final TileGeometryState.BooleanDebugOption`

  `drawTextureOutline`

  `private final TileGeometryState.BooleanDebugOption`

  `drawUnderlyingSprite`

  `private final TileGeometryState.BooleanDebugOption`

  `drawWestWall`

  `private boolean`

  `exit`

  `private final ArrayList<zombie.ui.UIElementInterface>`

  `gameUi`

  `static TileGeometryState`

  `instance`

  `private EditVehicleState.LuaEnvironment`

  `luaEnv`

  `private final ArrayList<ConfigOption>`

  `options`

  `private final ArrayList<zombie.ui.UIElementInterface>`

  `selfUi`

  `private boolean`

  `suspendUi`

  `private se.krka.kahlua.vm.KahluaTable`

  `table`

  `private static final int`

  `VERSION`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `TileGeometryState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static TileGeometryState`

  `checkInstance()`

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

  `ConfigOption`

  `getOptionByIndex(int index)`

  `ConfigOption`

  `getOptionByName(String name)`

  `int`

  `getOptionCount()`

  `void`

  `load()`

  `void`

  `reenter()`

  `void`

  `render()`

  `private void`

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

  `updateScene()`

  `void`

  `yield()`

  ### Methods inherited from class zombie.gameStates.GameState

  `redirectState`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static [TileGeometryState](TileGeometryState.html "class in zombie.gameStates") instance
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
  + ### table

    private se.krka.kahlua.vm.KahluaTable table
  + ### VERSION

    private static final int VERSION

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.gameStates.TileGeometryState.VERSION)
  + ### options

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../config/ConfigOption.html "class in zombie.config")> options
  + ### drawGrid

    private final [TileGeometryState.BooleanDebugOption](TileGeometryState.BooleanDebugOption.html "class in zombie.gameStates") drawGrid
  + ### drawPixelGrid

    private final [TileGeometryState.BooleanDebugOption](TileGeometryState.BooleanDebugOption.html "class in zombie.gameStates") drawPixelGrid
  + ### drawSpriteGrid

    private final [TileGeometryState.BooleanDebugOption](TileGeometryState.BooleanDebugOption.html "class in zombie.gameStates") drawSpriteGrid
  + ### drawSpriteGridTextureMask

    private final [TileGeometryState.BooleanDebugOption](TileGeometryState.BooleanDebugOption.html "class in zombie.gameStates") drawSpriteGridTextureMask
  + ### drawSquareBox

    private final [TileGeometryState.BooleanDebugOption](TileGeometryState.BooleanDebugOption.html "class in zombie.gameStates") drawSquareBox
  + ### drawSolidSquareBox

    private final [TileGeometryState.BooleanDebugOption](TileGeometryState.BooleanDebugOption.html "class in zombie.gameStates") drawSolidSquareBox
  + ### drawNorthWall

    private final [TileGeometryState.BooleanDebugOption](TileGeometryState.BooleanDebugOption.html "class in zombie.gameStates") drawNorthWall
  + ### drawWestWall

    private final [TileGeometryState.BooleanDebugOption](TileGeometryState.BooleanDebugOption.html "class in zombie.gameStates") drawWestWall
  + ### drawTextureMask

    private final [TileGeometryState.BooleanDebugOption](TileGeometryState.BooleanDebugOption.html "class in zombie.gameStates") drawTextureMask
  + ### drawTextureOutline

    private final [TileGeometryState.BooleanDebugOption](TileGeometryState.BooleanDebugOption.html "class in zombie.gameStates") drawTextureOutline
  + ### drawUnderlyingSprite

    private final [TileGeometryState.BooleanDebugOption](TileGeometryState.BooleanDebugOption.html "class in zombie.gameStates") drawUnderlyingSprite
* Constructor Details
  -------------------

  + ### TileGeometryState

    public TileGeometryState()
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

    public static [TileGeometryState](TileGeometryState.html "class in zombie.gameStates") checkInstance()
  + ### saveGameUI

    private void saveGameUI()
  + ### restoreGameUI

    private void restoreGameUI()
  + ### updateScene

    private void updateScene()
  + ### renderScene

    private void renderScene()
  + ### renderUI

    private void renderUI()
  + ### setTable

    public void setTable(se.krka.kahlua.vm.KahluaTable table)
  + ### fromLua0

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua0([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func)
  + ### fromLua1

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua1([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0)
  + ### fromLua2

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua2([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
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