[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [AnimationViewerState](AnimationViewerState.html)

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
   8. [clipNames](#clipNames)
   9. [ambientVolume](#ambientVolume)
   10. [musicVolume](#musicVolume)
   11. [VERSION](#VERSION)
   12. [options](#options)
   13. [drawGrid](#drawGrid)
   14. [isometric](#isometric)
   15. [showBones](#showBones)
   16. [useDeferredMovement](#useDeferredMovement)
7. [Constructor Details](#constructor-detail)
   1. [AnimationViewerState()](#%3Cinit%3E())
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
   10. [saveSoundState()](#saveSoundState())
   11. [restoreSoundState()](#restoreSoundState())
   12. [updateScene()](#updateScene())
   13. [renderScene()](#renderScene())
   14. [renderUI()](#renderUI())
   15. [setTable(KahluaTable)](#setTable(se.krka.kahlua.vm.KahluaTable))
   16. [fromLua0(String)](#fromLua0(java.lang.String))
   17. [fromLua1(String, Object)](#fromLua1(java.lang.String,java.lang.Object))
   18. [getOptionByName(String)](#getOptionByName(java.lang.String))
   19. [getOptionCount()](#getOptionCount())
   20. [getOptionByIndex(int)](#getOptionByIndex(int))
   21. [setBoolean(String, boolean)](#setBoolean(java.lang.String,boolean))
   22. [getBoolean(String)](#getBoolean(java.lang.String))
   23. [save()](#save())
   24. [load()](#load())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class AnimationViewerState
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.GameState

zombie.gameStates.AnimationViewerState

---

public final class AnimationViewerState
extends zombie.gameStates.GameState

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `class`

  `AnimationViewerState.BooleanDebugOption`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `ambientVolume`

  `private final ArrayList<String>`

  `clipNames`

  `private final AnimationViewerState.BooleanDebugOption`

  `drawGrid`

  `private boolean`

  `exit`

  `private final ArrayList<zombie.ui.UIElementInterface>`

  `gameUi`

  `static AnimationViewerState`

  `instance`

  `private final AnimationViewerState.BooleanDebugOption`

  `isometric`

  `private EditVehicleState.LuaEnvironment`

  `luaEnv`

  `private float`

  `musicVolume`

  `private final ArrayList<ConfigOption>`

  `options`

  `private final ArrayList<zombie.ui.UIElementInterface>`

  `selfUi`

  `private final AnimationViewerState.BooleanDebugOption`

  `showBones`

  `private boolean`

  `suspendUi`

  `private se.krka.kahlua.vm.KahluaTable`

  `table`

  `private final AnimationViewerState.BooleanDebugOption`

  `useDeferredMovement`

  `private static final int`

  `VERSION`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimationViewerState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static AnimationViewerState`

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

  `private void`

  `restoreSoundState()`

  `void`

  `save()`

  `private void`

  `saveGameUI()`

  `private void`

  `saveSoundState()`

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

    public static [AnimationViewerState](AnimationViewerState.html "class in zombie.gameStates") instance
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
  + ### clipNames

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> clipNames
  + ### ambientVolume

    private float ambientVolume
  + ### musicVolume

    private float musicVolume
  + ### VERSION

    private static final int VERSION

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.gameStates.AnimationViewerState.VERSION)
  + ### options

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ConfigOption](../config/ConfigOption.html "class in zombie.config")> options
  + ### drawGrid

    private final [AnimationViewerState.BooleanDebugOption](AnimationViewerState.BooleanDebugOption.html "class in zombie.gameStates") drawGrid
  + ### isometric

    private final [AnimationViewerState.BooleanDebugOption](AnimationViewerState.BooleanDebugOption.html "class in zombie.gameStates") isometric
  + ### showBones

    private final [AnimationViewerState.BooleanDebugOption](AnimationViewerState.BooleanDebugOption.html "class in zombie.gameStates") showBones
  + ### useDeferredMovement

    private final [AnimationViewerState.BooleanDebugOption](AnimationViewerState.BooleanDebugOption.html "class in zombie.gameStates") useDeferredMovement
* Constructor Details
  -------------------

  + ### AnimationViewerState

    public AnimationViewerState()
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

    public static [AnimationViewerState](AnimationViewerState.html "class in zombie.gameStates") checkInstance()
  + ### saveGameUI

    private void saveGameUI()
  + ### restoreGameUI

    private void restoreGameUI()
  + ### saveSoundState

    private void saveSoundState()
  + ### restoreSoundState

    private void restoreSoundState()
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