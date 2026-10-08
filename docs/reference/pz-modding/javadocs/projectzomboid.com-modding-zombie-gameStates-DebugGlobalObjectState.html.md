[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [DebugGlobalObjectState](DebugGlobalObjectState.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [luaEnv](#luaEnv)
   3. [exit](#exit)
   4. [gameUi](#gameUi)
   5. [selfUi](#selfUi)
   6. [suspendUi](#suspendUi)
   7. [table](#table)
   8. [playerIndex](#playerIndex)
   9. [z](#z)
   10. [gridX](#gridX)
   11. [gridY](#gridY)
   12. [FONT](#FONT)
6. [Constructor Details](#constructor-detail)
   1. [DebugGlobalObjectState()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [enter()](#enter())
   2. [yield()](#yield())
   3. [reenter()](#reenter())
   4. [exit()](#exit())
   5. [render()](#render())
   6. [update()](#update())
   7. [renderScene()](#renderScene())
   8. [renderUI()](#renderUI())
   9. [setTable(KahluaTable)](#setTable(se.krka.kahlua.vm.KahluaTable))
   10. [updateScene()](#updateScene())
   11. [updateCursor()](#updateCursor())
   12. [saveGameUI()](#saveGameUI())
   13. [restoreGameUI()](#restoreGameUI())
   14. [DrawIsoLine(float, float, float, float, float, float, float, float, float, float, int)](#DrawIsoLine(float,float,float,float,float,float,float,float,float,float,int))
   15. [DrawIsoRect(float, float, float, float, float, float, float, float, float, int)](#DrawIsoRect(float,float,float,float,float,float,float,float,float,int))
   16. [fromLua0(String)](#fromLua0(java.lang.String))
   17. [fromLua1(String, Object)](#fromLua1(java.lang.String,java.lang.Object))
   18. [fromLua2(String, Object, Object)](#fromLua2(java.lang.String,java.lang.Object,java.lang.Object))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DebugGlobalObjectState
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.GameState

zombie.gameStates.DebugGlobalObjectState

---

public final class DebugGlobalObjectState
extends zombie.gameStates.GameState

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `exit`

  `private static final UIFont`

  `FONT`

  `private final ArrayList<zombie.ui.UIElementInterface>`

  `gameUi`

  `private int`

  `gridX`

  `private int`

  `gridY`

  `static DebugGlobalObjectState`

  `instance`

  `private EditVehicleState.LuaEnvironment`

  `luaEnv`

  `private int`

  `playerIndex`

  `private final ArrayList<zombie.ui.UIElementInterface>`

  `selfUi`

  `private boolean`

  `suspendUi`

  `private se.krka.kahlua.vm.KahluaTable`

  `table`

  `private int`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DebugGlobalObjectState()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `DrawIsoLine(float x,
  float y,
  float z,
  float x2,
  float y2,
  float z2,
  float r,
  float g,
  float b,
  float a,
  int thickness)`

  `private void`

  `DrawIsoRect(float x,
  float y,
  float z,
  float width,
  float height,
  float r,
  float g,
  float b,
  float a,
  int thickness)`

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

  `void`

  `reenter()`

  `void`

  `render()`

  `void`

  `renderScene()`

  `private void`

  `renderUI()`

  `private void`

  `restoreGameUI()`

  `private void`

  `saveGameUI()`

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

  + ### instance

    public static [DebugGlobalObjectState](DebugGlobalObjectState.html "class in zombie.gameStates") instance
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
  + ### playerIndex

    private int playerIndex
  + ### z

    private int z
  + ### gridX

    private int gridX
  + ### gridY

    private int gridY
  + ### FONT

    private static final [UIFont](../ui/UIFont.html "enum class in zombie.ui") FONT
* Constructor Details
  -------------------

  + ### DebugGlobalObjectState

    public DebugGlobalObjectState()
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
  + ### renderScene

    public void renderScene()
  + ### renderUI

    private void renderUI()
  + ### setTable

    public void setTable(se.krka.kahlua.vm.KahluaTable table)
  + ### updateScene

    public zombie.gameStates.GameStateMachine.StateAction updateScene()
  + ### updateCursor

    private void updateCursor()
  + ### saveGameUI

    private void saveGameUI()
  + ### restoreGameUI

    private void restoreGameUI()
  + ### DrawIsoLine

    private void DrawIsoLine(float x,
    float y,
    float z,
    float x2,
    float y2,
    float z2,
    float r,
    float g,
    float b,
    float a,
    int thickness)
  + ### DrawIsoRect

    private void DrawIsoRect(float x,
    float y,
    float z,
    float width,
    float height,
    float r,
    float g,
    float b,
    float a,
    int thickness)
  + ### fromLua0

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua0([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func)
  + ### fromLua1

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua1([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0)
  + ### fromLua2

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua2([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1)