[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.crafting](package-summary.html)
2. [CraftRecipeMonitor](CraftRecipeMonitor.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [lines](#lines)
   2. [tempStrings](#tempStrings)
   3. [openedBlocks](#openedBlocks)
   4. [sealed](#sealed)
   5. [printToConsole](#printToConsole)
   6. [recipe](#recipe)
6. [Constructor Details](#constructor-detail)
   1. [CraftRecipeMonitor()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [Create()](#Create())
   2. [setPrintToConsole(boolean)](#setPrintToConsole(boolean))
   3. [reset()](#reset())
   4. [setRecipe(CraftRecipe)](#setRecipe(zombie.scripting.entity.components.crafting.CraftRecipe))
   5. [getRecipe()](#getRecipe())
   6. [GetLines()](#GetLines())
   7. [seal()](#seal())
   8. [open()](#open())
   9. [close()](#close())
   10. [canLog()](#canLog())
   11. [warn(String)](#warn(java.lang.String))
   12. [success(String)](#success(java.lang.String))
   13. [log(String)](#log(java.lang.String))
   14. [logList(String, ArrayList)](#logList(java.lang.String,java.util.ArrayList))
   15. [logCraftLogic(CraftLogic)](#logCraftLogic(zombie.entity.components.crafting.CraftLogic))
   16. [logFurnaceLogic(FurnaceLogic)](#logFurnaceLogic(zombie.entity.components.crafting.FurnaceLogic))
   17. [logDryingLogic(DryingLogic)](#logDryingLogic(zombie.entity.components.crafting.DryingLogic))
   18. [logMashingLogic(MashingLogic)](#logMashingLogic(zombie.entity.components.crafting.MashingLogic))
   19. [logResources(List, List)](#logResources(java.util.List,java.util.List))
   20. [logResourcesList(String, List)](#logResourcesList(java.lang.String,java.util.List))
   21. [logRecipe(CraftRecipe, boolean)](#logRecipe(zombie.scripting.entity.components.crafting.CraftRecipe,boolean))
   22. [logInputScript(InputScript)](#logInputScript(zombie.scripting.entity.components.crafting.InputScript))
   23. [logOutputScript(OutputScript)](#logOutputScript(zombie.scripting.entity.components.crafting.OutputScript))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class CraftRecipeMonitor
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.crafting.CraftRecipeMonitor

---

public class CraftRecipeMonitor
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<String>`

  `lines`

  `private int`

  `openedBlocks`

  `private boolean`

  `printToConsole`

  `private CraftRecipe`

  `recipe`

  `private boolean`

  `sealed`

  `private final ArrayList<String>`

  `tempStrings`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CraftRecipeMonitor()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `canLog()`

  `void`

  `close()`

  `static CraftRecipeMonitor`

  `Create()`

  `ArrayList<String>`

  `GetLines()`

  `CraftRecipe`

  `getRecipe()`

  `void`

  `log(String s)`

  `void`

  `logCraftLogic(CraftLogic logic)`

  `void`

  `logDryingLogic(zombie.entity.components.crafting.DryingLogic logic)`

  `void`

  `logFurnaceLogic(FurnaceLogic logic)`

  `void`

  `logInputScript(InputScript input)`

  `<T> void`

  `logList(String tag,
  ArrayList<T> list)`

  `void`

  `logMashingLogic(MashingLogic logic)`

  `void`

  `logOutputScript(OutputScript output)`

  `void`

  `logRecipe(CraftRecipe recipe,
  boolean doInputsOutputs)`

  `void`

  `logResources(List<Resource> inputs,
  List<Resource> outputs)`

  `void`

  `logResourcesList(String tag,
  List<Resource> resources)`

  `void`

  `open()`

  `void`

  `reset()`

  `CraftRecipeMonitor`

  `seal()`

  `void`

  `setPrintToConsole(boolean b)`

  `void`

  `setRecipe(CraftRecipe recipe)`

  `void`

  `success(String s)`

  `void`

  `warn(String s)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### lines

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> lines
  + ### tempStrings

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> tempStrings
  + ### openedBlocks

    private int openedBlocks
  + ### sealed

    private boolean sealed
  + ### printToConsole

    private boolean printToConsole
  + ### recipe

    private [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe
* Constructor Details
  -------------------

  + ### CraftRecipeMonitor

    private CraftRecipeMonitor()
* Method Details
  --------------

  + ### Create

    public static [CraftRecipeMonitor](CraftRecipeMonitor.html "class in zombie.entity.components.crafting") Create()
  + ### setPrintToConsole

    public void setPrintToConsole(boolean b)
  + ### reset

    public void reset()
  + ### setRecipe

    public void setRecipe([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe)
  + ### getRecipe

    public [CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") getRecipe()
  + ### GetLines

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> GetLines()
  + ### seal

    public [CraftRecipeMonitor](CraftRecipeMonitor.html "class in zombie.entity.components.crafting") seal()
  + ### open

    public void open()
  + ### close

    public void close()
  + ### canLog

    public boolean canLog()
  + ### warn

    public void warn([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### success

    public void success([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### log

    public void log([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### logList

    public <T> void logList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<T> list)
  + ### logCraftLogic

    public void logCraftLogic([CraftLogic](CraftLogic.html "class in zombie.entity.components.crafting") logic)
  + ### logFurnaceLogic

    public void logFurnaceLogic([FurnaceLogic](FurnaceLogic.html "class in zombie.entity.components.crafting") logic)
  + ### logDryingLogic

    public void logDryingLogic(zombie.entity.components.crafting.DryingLogic logic)
  + ### logMashingLogic

    public void logMashingLogic([MashingLogic](MashingLogic.html "class in zombie.entity.components.crafting") logic)
  + ### logResources

    public void logResources([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> inputs,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> outputs)
  + ### logResourcesList

    public void logResourcesList([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tag,
    [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[Resource](../resources/Resource.html "class in zombie.entity.components.resources")> resources)
  + ### logRecipe

    public void logRecipe([CraftRecipe](../../../scripting/entity/components/crafting/CraftRecipe.html "class in zombie.scripting.entity.components.crafting") recipe,
    boolean doInputsOutputs)
  + ### logInputScript

    public void logInputScript([InputScript](../../../scripting/entity/components/crafting/InputScript.html "class in zombie.scripting.entity.components.crafting") input)
  + ### logOutputScript

    public void logOutputScript([OutputScript](../../../scripting/entity/components/crafting/OutputScript.html "class in zombie.scripting.entity.components.crafting") output)