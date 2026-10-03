[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.crafting](package-summary.html)
2. [CraftLogicScript](CraftLogicScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [recipeTagQuery](#recipeTagQuery)
   2. [startMode](#startMode)
   3. [inputsGroupName](#inputsGroupName)
   4. [outputsGroupName](#outputsGroupName)
   5. [actionAnim](#actionAnim)
6. [Constructor Details](#constructor-detail)
   1. [CraftLogicScript()](#%3Cinit%3E())
   2. [CraftLogicScript(ComponentType)](#%3Cinit%3E(zombie.entity.ComponentType))
7. [Method Details](#method-detail)
   1. [getRecipeTagQuery()](#getRecipeTagQuery())
   2. [getStartMode()](#getStartMode())
   3. [getInputsGroupName()](#getInputsGroupName())
   4. [getOutputsGroupName()](#getOutputsGroupName())
   5. [getActionAnim()](#getActionAnim())
   6. [getCraftProcessorScripts()](#getCraftProcessorScripts())
   7. [copyFrom(ComponentScript)](#copyFrom(zombie.scripting.entity.ComponentScript))
   8. [PreReload()](#PreReload())
   9. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   10. [load(ScriptParser.Block)](#load(zombie.scripting.ScriptParser.Block))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftLogicScript
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")

[zombie.scripting.entity.ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

zombie.scripting.entity.components.crafting.CraftLogicScript

Direct Known Subclasses:
:   `DryingCraftLogicScript`

---

public class CraftLogicScript
extends [ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `actionAnim`

  `private String`

  `inputsGroupName`

  `private String`

  `outputsGroupName`

  `private String`

  `recipeTagQuery`

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

  `CraftLogicScript()`

  `protected`

  `CraftLogicScript(ComponentType type)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete MethodsDeprecated Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `copyFrom(ComponentScript other)`

  `String`

  `getActionAnim()`

  `ArrayList<Object>`

  `getCraftProcessorScripts()`

  Deprecated.

  `String`

  `getInputsGroupName()`

  `String`

  `getOutputsGroupName()`

  `String`

  `getRecipeTagQuery()`

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

  + ### recipeTagQuery

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeTagQuery
  + ### startMode

    private [StartMode](../../../../entity/components/crafting/StartMode.html "enum class in zombie.entity.components.crafting") startMode
  + ### inputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") inputsGroupName
  + ### outputsGroupName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") outputsGroupName
  + ### actionAnim

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") actionAnim
* Constructor Details
  -------------------

  + ### CraftLogicScript

    private CraftLogicScript()
  + ### CraftLogicScript

    protected CraftLogicScript([ComponentType](../../../../entity/ComponentType.html "enum class in zombie.entity") type)
* Method Details
  --------------

  + ### getRecipeTagQuery

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeTagQuery()
  + ### getStartMode

    public [StartMode](../../../../entity/components/crafting/StartMode.html "enum class in zombie.entity.components.crafting") getStartMode()
  + ### getInputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getInputsGroupName()
  + ### getOutputsGroupName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOutputsGroupName()
  + ### getActionAnim

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getActionAnim()
  + ### getCraftProcessorScripts

    [@Deprecated](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Deprecated.html "class or interface in java.lang")
    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")> getCraftProcessorScripts()

    Deprecated.
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