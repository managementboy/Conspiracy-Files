[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [AttachmentEditorState](AttachmentEditorState.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [INDENT](#INDENT)
   3. [luaEnv](#luaEnv)
   4. [exit](#exit)
   5. [gameUi](#gameUi)
   6. [selfUi](#selfUi)
   7. [suspendUi](#suspendUi)
   8. [table](#table)
   9. [clipNames](#clipNames)
6. [Constructor Details](#constructor-detail)
   1. [AttachmentEditorState()](#%3Cinit%3E())
7. [Method Details](#method-detail)
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
   16. [formatFloat(float)](#formatFloat(float))
   17. [readScriptNew(ModelScript)](#readScriptNew(zombie.scripting.objects.ModelScript))
   18. [readScript(String)](#readScript(java.lang.String))
   19. [updateScript(String, ArrayList, ModelScript)](#updateScript(java.lang.String,java.util.ArrayList,zombie.scripting.objects.ModelScript))
   20. [modelScriptToText(ModelScript, String)](#modelScriptToText(zombie.scripting.objects.ModelScript,java.lang.String))
   21. [writeScript(String, ArrayList)](#writeScript(java.lang.String,java.util.ArrayList))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class AttachmentEditorState
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.GameState

zombie.gameStates.AttachmentEditorState

---

public final class AttachmentEditorState
extends zombie.gameStates.GameState

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<String>`

  `clipNames`

  `private boolean`

  `exit`

  `private final ArrayList<zombie.ui.UIElementInterface>`

  `gameUi`

  `private static final String`

  `INDENT`

  `static AttachmentEditorState`

  `instance`

  `private EditVehicleState.LuaEnvironment`

  `luaEnv`

  `private final ArrayList<zombie.ui.UIElementInterface>`

  `selfUi`

  `private boolean`

  `suspendUi`

  `private se.krka.kahlua.vm.KahluaTable`

  `table`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AttachmentEditorState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static AttachmentEditorState`

  `checkInstance()`

  `void`

  `enter()`

  `void`

  `exit()`

  `private static String`

  `formatFloat(float value)`

  `Object`

  `fromLua0(String func)`

  `Object`

  `fromLua1(String func,
  Object arg0)`

  `private static String`

  `modelScriptToText(ModelScript modelScript,
  String token)`

  `static ArrayList<String>`

  `readScript(String fileName)`

  `static void`

  `readScriptNew(ModelScript script)`

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

  `saveGameUI()`

  `void`

  `setTable(se.krka.kahlua.vm.KahluaTable table)`

  `zombie.gameStates.GameStateMachine.StateAction`

  `update()`

  `private void`

  `updateScene()`

  `static boolean`

  `updateScript(String fileName,
  ArrayList<String> tokens,
  ModelScript modelScript)`

  `private static boolean`

  `writeScript(String fileName,
  ArrayList<String> tokens)`

  `void`

  `yield()`

  ### Methods inherited from class zombie.gameStates.GameState

  `redirectState`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static [AttachmentEditorState](AttachmentEditorState.html "class in zombie.gameStates") instance
  + ### INDENT

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") INDENT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.gameStates.AttachmentEditorState.INDENT)
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
* Constructor Details
  -------------------

  + ### AttachmentEditorState

    public AttachmentEditorState()
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

    public static [AttachmentEditorState](AttachmentEditorState.html "class in zombie.gameStates") checkInstance()
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
  + ### formatFloat

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") formatFloat(float value)
  + ### readScriptNew

    public static void readScriptNew([ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") script)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### readScript

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> readScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### updateScript

    public static boolean updateScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tokens,
    [ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") modelScript)
  + ### modelScriptToText

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") modelScriptToText([ModelScript](../scripting/objects/ModelScript.html "class in zombie.scripting.objects") modelScript,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") token)
  + ### writeScript

    private static boolean writeScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tokens)