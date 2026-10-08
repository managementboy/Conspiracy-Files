[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.crafting](package-summary.html)
2. [FurnaceLogicScript](FurnaceLogicScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [furnaceRecipeTagQuery](#furnaceRecipeTagQuery)
   2. [fuelRecipeTagQuery](#fuelRecipeTagQuery)
   3. [startMode](#startMode)
   4. [inputsGroupName](#inputsGroupName)
   5. [outputsGroupName](#outputsGroupName)
   6. [fuelInputsGroupName](#fuelInputsGroupName)
   7. [fuelOutputsGroupName](#fuelOutputsGroupName)
6. [Constructor Details](#constructor-detail)
   1. [FurnaceLogicScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getFurnaceRecipeTagQuery()](#getFurnaceRecipeTagQuery())
   2. [getFuelRecipeTagQuery()](#getFuelRecipeTagQuery())
   3. [getStartMode()](#getStartMode())
   4. [getInputsGroupName()](#getInputsGroupName())
   5. [getOutputsGroupName()](#getOutputsGroupName())
   6. [getFuelInputsGroupName()](#getFuelInputsGroupName())
   7. [getFuelOutputsGroupName()](#getFuelOutputsGroupName())
   8. [copyFrom(ComponentScript)](#copyFrom(zombie.scripting.entity.ComponentScript))
   9. [PreReload()](#PreReload())
   10. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   11. [load(ScriptParser.Block)](#load(zombie.scripting.ScriptParser.Block))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class FurnaceLogicScript
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")

[zombie.scripting.entity.ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

zombie.scripting.entity.components.crafting.FurnaceLogicScript

---

public class FurnaceLogicScript
extends [ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `fuelInputsGroupName`

  `private String`

  `fuelOutputsGroupName`

  `private String`

  `fuelRecipeTagQuery`

  `private String`

  `furnaceRecipeTagQuery`

  `private String`

  `inputsGroupName`

  `private String`

  `outputsGroupName`

  `private StartMode`

  `startMode`

  ### Fields inherited from class [ComponentScript](../../ComponentScript.html#field-summary "class in zombie.scripting.entity")

  `type`

  ### Fields inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `FurnaceLogicScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `copyFrom(ComponentScript other)`

  `String`

  `getFuelInputsGroupName()`

  `String`

  `getFuelOutputsGroupName()`

  `String`

  `getFuelRecipeTagQuery()`

  `String`

  `getFurnaceRecipeTagQuery()`

  `String`

  `getInputsGroupName()`

  `String`

  `getOutputsGroupName()`

  `StartMode`

  `getStartMode()`

  `protected void`

  `load(zombie.scripting.ScriptParser.Block block)`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  `void`

  `PreReload()`

  ### Methods inherited from class [ComponentScript](../../ComponentScript.html#method-summary "class in zombie.scripting.entity")

  `getName, isoMasterOnly, parseKeyValue`

  ### Methods inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, Load, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### furnaceRecipeTagQuery

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") furnaceRecipeTagQuery
  + ### fuelRecipeTagQuery

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fuelRecipeTagQuery
  + ### startMode

    private [StartMode](../../../../entity/components/crafting/StartMode.html "enum class in zombie.entity.components.crafting") startMode
  + ### inputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") inputsGroupName
  + ### outputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outputsGroupName
  + ### fuelInputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fuelInputsGroupName
  + ### fuelOutputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") fuelOutputsGroupName
* Constructor Details
  -------------------

  + ### FurnaceLogicScript

    private FurnaceLogicScript()
* Method Details
  --------------

  + ### getFurnaceRecipeTagQuery

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFurnaceRecipeTagQuery()
  + ### getFuelRecipeTagQuery

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFuelRecipeTagQuery()
  + ### getStartMode

    public [StartMode](../../../../entity/components/crafting/StartMode.html "enum class in zombie.entity.components.crafting") getStartMode()
  + ### getInputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInputsGroupName()
  + ### getOutputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOutputsGroupName()
  + ### getFuelInputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFuelInputsGroupName()
  + ### getFuelOutputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFuelOutputsGroupName()
  + ### copyFrom

    protected void copyFrom([ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity") other)

    Specified by:
    :   `copyFrom` in class `ComponentScript`
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
  + ### load

    protected void load(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `load` in class `ComponentScript`

    Throws:
    :   `Exception`