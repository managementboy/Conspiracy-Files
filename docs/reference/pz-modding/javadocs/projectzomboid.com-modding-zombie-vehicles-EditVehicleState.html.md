[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [EditVehicleState](EditVehicleState.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [INDENT](#INDENT)
   2. [instance](#instance)
   3. [luaEnv](#luaEnv)
   4. [exit](#exit)
   5. [initialScript](#initialScript)
   6. [gameUi](#gameUi)
   7. [selfUi](#selfUi)
   8. [suspendUi](#suspendUi)
   9. [table](#table)
7. [Constructor Details](#constructor-detail)
   1. [EditVehicleState()](#%3Cinit%3E())
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
   14. [setScript(String)](#setScript(java.lang.String))
   15. [fromLua0(String)](#fromLua0(java.lang.String))
   16. [fromLua1(String, Object)](#fromLua1(java.lang.String,java.lang.Object))
   17. [readScriptNew(VehicleScript)](#readScriptNew(zombie.scripting.objects.VehicleScript))
   18. [addBlocks(StringBuilder, String, VehicleScript)](#addBlocks(java.lang.StringBuilder,java.lang.String,zombie.scripting.objects.VehicleScript))
   19. [addPassengerBlock(StringBuilder, VehicleScript)](#addPassengerBlock(java.lang.StringBuilder,zombie.scripting.objects.VehicleScript))
   20. [addAttachmentBlock(StringBuilder, VehicleScript)](#addAttachmentBlock(java.lang.StringBuilder,zombie.scripting.objects.VehicleScript))
   21. [addAreaBlock(StringBuilder, VehicleScript)](#addAreaBlock(java.lang.StringBuilder,zombie.scripting.objects.VehicleScript))
   22. [addPhysicsBlock(StringBuilder, VehicleScript)](#addPhysicsBlock(java.lang.StringBuilder,zombie.scripting.objects.VehicleScript))
   23. [formatFloat(float)](#formatFloat(float))
   24. [removeBlock(String, String, List, int, StringBuilder)](#removeBlock(java.lang.String,java.lang.String,java.util.List,int,java.lang.StringBuilder))
   25. [parseFloat(String, String, Float...)](#parseFloat(java.lang.String,java.lang.String,java.lang.Float...))
   26. [readScript(String)](#readScript(java.lang.String))
   27. [updateScript(String, ArrayList, VehicleScript)](#updateScript(java.lang.String,java.util.ArrayList,zombie.scripting.objects.VehicleScript))
   28. [vehicleScriptToText(VehicleScript, String)](#vehicleScriptToText(zombie.scripting.objects.VehicleScript,java.lang.String))
   29. [removeAttachments(ScriptParser.Block)](#removeAttachments(zombie.scripting.ScriptParser.Block))
   30. [attachmentToBlock(VehicleScript, ModelAttachment, ScriptParser.Block)](#attachmentToBlock(zombie.scripting.objects.VehicleScript,zombie.scripting.objects.ModelAttachment,zombie.scripting.ScriptParser.Block))
   31. [writeScript(String, ArrayList)](#writeScript(java.lang.String,java.util.ArrayList))
   32. [updateModelScripts(VehicleScript)](#updateModelScripts(zombie.scripting.objects.VehicleScript))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class EditVehicleState
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.GameState

zombie.vehicles.EditVehicleState

---

public final class EditVehicleState
extends zombie.gameStates.GameState

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `EditVehicleState.LuaEnvironment`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private boolean`

  `exit`

  `private final ArrayList<zombie.ui.UIElementInterface>`

  `gameUi`

  `private static final String`

  `INDENT`

  `private String`

  `initialScript`

  `static EditVehicleState`

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

  `EditVehicleState()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addAreaBlock(StringBuilder sb,
  VehicleScript vehicleScript)`

  `private void`

  `addAttachmentBlock(StringBuilder sb,
  VehicleScript vehicleScript)`

  `private void`

  `addBlocks(StringBuilder sb,
  String originalLine,
  VehicleScript script)`

  `private void`

  `addPassengerBlock(StringBuilder sb,
  VehicleScript vehicleScript)`

  `private void`

  `addPhysicsBlock(StringBuilder sb,
  VehicleScript vehicleScript)`

  `private void`

  `attachmentToBlock(VehicleScript vehicleScript,
  ModelAttachment attach,
  zombie.scripting.ScriptParser.Block block)`

  `static EditVehicleState`

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

  `parseFloat(String type,
  String originalLine,
  Float... values)`

  `private ArrayList<String>`

  `readScript(String fileName)`

  `private void`

  `readScriptNew(VehicleScript vehicleScript)`

  `void`

  `reenter()`

  `private void`

  `removeAttachments(zombie.scripting.ScriptParser.Block block)`

  `private int`

  `removeBlock(String originalLine,
  String type,
  List<String> lines,
  int i,
  StringBuilder sb)`

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

  `setScript(String scriptName)`

  `void`

  `setTable(se.krka.kahlua.vm.KahluaTable table)`

  `zombie.gameStates.GameStateMachine.StateAction`

  `update()`

  `private void`

  `updateModelScripts(VehicleScript vehicleScript)`

  `private void`

  `updateScene()`

  `private void`

  `updateScript(String fileName,
  ArrayList<String> tokens,
  VehicleScript vehicleScript)`

  `private String`

  `vehicleScriptToText(VehicleScript vehicleScript,
  String token)`

  `private void`

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

  + ### INDENT

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") INDENT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.EditVehicleState.INDENT)
  + ### instance

    public static [EditVehicleState](EditVehicleState.html "class in zombie.vehicles") instance
  + ### luaEnv

    private [EditVehicleState.LuaEnvironment](EditVehicleState.LuaEnvironment.html "class in zombie.vehicles") luaEnv
  + ### exit

    private boolean exit
  + ### initialScript

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") initialScript
  + ### gameUi

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> gameUi
  + ### selfUi

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.ui.UIElementInterface> selfUi
  + ### suspendUi

    private boolean suspendUi
  + ### table

    private se.krka.kahlua.vm.KahluaTable table
* Constructor Details
  -------------------

  + ### EditVehicleState

    public EditVehicleState()
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

    public static [EditVehicleState](EditVehicleState.html "class in zombie.vehicles") checkInstance()
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
  + ### setScript

    public void setScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") scriptName)
  + ### fromLua0

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua0([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func)
  + ### fromLua1

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua1([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0)
  + ### readScriptNew

    private void readScriptNew([VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") vehicleScript)
    throws [IOException](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/io/IOException.html "class or interface in java.io")

    Throws:
    :   `IOException`
  + ### addBlocks

    private void addBlocks([StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") sb,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalLine,
    [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") script)
  + ### addPassengerBlock

    private void addPassengerBlock([StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") sb,
    [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") vehicleScript)
  + ### addAttachmentBlock

    private void addAttachmentBlock([StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") sb,
    [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") vehicleScript)
  + ### addAreaBlock

    private void addAreaBlock([StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") sb,
    [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") vehicleScript)
  + ### addPhysicsBlock

    private void addPhysicsBlock([StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") sb,
    [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") vehicleScript)
  + ### formatFloat

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") formatFloat(float value)
  + ### removeBlock

    private int removeBlock([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalLine,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> lines,
    int i,
    [StringBuilder](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/StringBuilder.html "class or interface in java.lang") sb)
  + ### parseFloat

    private static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parseFloat([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") type,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") originalLine,
    [Float](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Float.html "class or interface in java.lang")... values)
  + ### readScript

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> readScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName)
  + ### updateScript

    private void updateScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tokens,
    [VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") vehicleScript)
  + ### vehicleScriptToText

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") vehicleScriptToText([VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") vehicleScript,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") token)
  + ### removeAttachments

    private void removeAttachments(zombie.scripting.ScriptParser.Block block)
  + ### attachmentToBlock

    private void attachmentToBlock([VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") vehicleScript,
    [ModelAttachment](../scripting/objects/ModelAttachment.html "class in zombie.scripting.objects") attach,
    zombie.scripting.ScriptParser.Block block)
  + ### writeScript

    private void writeScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fileName,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tokens)
  + ### updateModelScripts

    private void updateModelScripts([VehicleScript](../scripting/objects/VehicleScript.html "class in zombie.scripting.objects") vehicleScript)