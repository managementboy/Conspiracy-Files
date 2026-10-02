[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [FluidFilterScript](FluidFilterScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fluids](#fluids)
   2. [categories](#categories)
   3. [isWhitelist](#isWhitelist)
   4. [filter](#filter)
   5. [name](#name)
   6. [anonymous](#anonymous)
6. [Constructor Details](#constructor-detail)
   1. [FluidFilterScript()](#%3Cinit%3E())
   2. [FluidFilterScript(boolean)](#%3Cinit%3E(boolean))
7. [Method Details](#method-detail)
   1. [GetAnonymous()](#GetAnonymous())
   2. [GetAnonymous(boolean)](#GetAnonymous(boolean))
   3. [copy()](#copy())
   4. [isSingleFluid()](#isSingleFluid())
   5. [addFluid(String)](#addFluid(java.lang.String))
   6. [addCategory(String)](#addCategory(java.lang.String))
   7. [getFilter()](#getFilter())
   8. [createFilter()](#createFilter())
   9. [getVersion(IVersionHash)](#getVersion(zombie.world.scripts.IVersionHash))
   10. [PreReload()](#PreReload())
   11. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   12. [OnPostWorldDictionaryInit()](#OnPostWorldDictionaryInit())
   13. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   14. [LoadAnonymousFromBlock(ScriptParser.Block)](#LoadAnonymousFromBlock(zombie.scripting.ScriptParser.Block))
   15. [LoadAnonymousSingleFluid(String)](#LoadAnonymousSingleFluid(java.lang.String))
   16. [readBlock(ScriptParser.Block)](#readBlock(zombie.scripting.ScriptParser.Block))
   17. [readFilterBlock(ScriptParser.Block, ArrayList)](#readFilterBlock(zombie.scripting.ScriptParser.Block,java.util.ArrayList))
   18. [parseInputString(ArrayList, String)](#parseInputString(java.util.ArrayList,java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FluidFilterScript
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.FluidFilterScript

---

public class FluidFilterScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final boolean`

  `anonymous`

  `private final ArrayList<String>`

  `categories`

  `private FluidFilter`

  `filter`

  `private final ArrayList<String>`

  `fluids`

  `private boolean`

  `isWhitelist`

  `private String`

  `name`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `FluidFilterScript()`

  `private`

  `FluidFilterScript(boolean anonymous)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private void`

  `addCategory(String category)`

  `private void`

  `addFluid(String fluid)`

  `FluidFilterScript`

  `copy()`

  `FluidFilter`

  `createFilter()`

  `static FluidFilterScript`

  `GetAnonymous()`

  `static FluidFilterScript`

  `GetAnonymous(boolean isWhitelist)`

  `FluidFilter`

  `getFilter()`

  `void`

  `getVersion(zombie.world.scripts.IVersionHash hash)`

  `boolean`

  `isSingleFluid()`

  `void`

  `Load(String name,
  String totalFile)`

  `void`

  `LoadAnonymousFromBlock(zombie.scripting.ScriptParser.Block block)`

  `void`

  `LoadAnonymousSingleFluid(String fluidName)`

  `void`

  `OnPostWorldDictionaryInit()`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `private void`

  `parseInputString(ArrayList<String> list,
  String input)`

  `void`

  `PreReload()`

  `private void`

  `readBlock(zombie.scripting.ScriptParser.Block block)`

  `private void`

  `readFilterBlock(zombie.scripting.ScriptParser.Block block,
  ArrayList<String> list)`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### fluids

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> fluids
  + ### categories

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> categories
  + ### isWhitelist

    private boolean isWhitelist
  + ### filter

    private [FluidFilter](../../entity/components/fluids/FluidFilter.html "class in zombie.entity.components.fluids") filter
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### anonymous

    private final boolean anonymous
* Constructor Details
  -------------------

  + ### FluidFilterScript

    public FluidFilterScript()
  + ### FluidFilterScript

    private FluidFilterScript(boolean anonymous)
* Method Details
  --------------

  + ### GetAnonymous

    public static [FluidFilterScript](FluidFilterScript.html "class in zombie.scripting.objects") GetAnonymous()
  + ### GetAnonymous

    public static [FluidFilterScript](FluidFilterScript.html "class in zombie.scripting.objects") GetAnonymous(boolean isWhitelist)
  + ### copy

    public [FluidFilterScript](FluidFilterScript.html "class in zombie.scripting.objects") copy()
  + ### isSingleFluid

    public boolean isSingleFluid()
  + ### addFluid

    private void addFluid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluid)
  + ### addCategory

    private void addCategory([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category)
  + ### getFilter

    public [FluidFilter](../../entity/components/fluids/FluidFilter.html "class in zombie.entity.components.fluids") getFilter()
  + ### createFilter

    public [FluidFilter](../../entity/components/fluids/FluidFilter.html "class in zombie.entity.components.fluids") createFilter()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### getVersion

    public void getVersion(zombie.world.scripts.IVersionHash hash)

    Overrides:
    :   `getVersion` in class `BaseScriptObject`
  + ### PreReload

    public void PreReload()

    Overrides:
    :   `PreReload` in class `BaseScriptObject`
  + ### OnScriptsLoaded

    public void OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `OnScriptsLoaded` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### OnPostWorldDictionaryInit

    public void OnPostWorldDictionaryInit()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `OnPostWorldDictionaryInit` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### LoadAnonymousFromBlock

    public void LoadAnonymousFromBlock(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadAnonymousSingleFluid

    public void LoadAnonymousSingleFluid([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fluidName)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### readBlock

    private void readBlock(zombie.scripting.ScriptParser.Block block)
  + ### readFilterBlock

    private void readFilterBlock(zombie.scripting.ScriptParser.Block block,
    [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list)
  + ### parseInputString

    private void parseInputString([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> list,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") input)