[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.crafting](package-summary.html)
2. [CraftBenchScript](CraftBenchScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [fluidInputChannels](#fluidInputChannels)
   2. [energyInputChannels](#energyInputChannels)
   3. [recipeTagQuery](#recipeTagQuery)
6. [Constructor Details](#constructor-detail)
   1. [CraftBenchScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getRecipeTagQuery()](#getRecipeTagQuery())
   2. [getRecipes()](#getRecipes())
   3. [getFluidInputChannels()](#getFluidInputChannels())
   4. [getEnergyInputChannels()](#getEnergyInputChannels())
   5. [copyFrom(ComponentScript)](#copyFrom(zombie.scripting.entity.ComponentScript))
   6. [OnScriptsLoaded(ScriptLoadMode)](#OnScriptsLoaded(zombie.scripting.ScriptLoadMode))
   7. [load(ScriptParser.Block)](#load(zombie.scripting.ScriptParser.Block))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class CraftBenchScript
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")

[zombie.scripting.entity.ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

zombie.scripting.entity.components.crafting.CraftBenchScript

---

public class CraftBenchScript
extends [ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.entity.util.enums.EnumBitStore<ResourceChannel>`

  `energyInputChannels`

  `private final zombie.entity.util.enums.EnumBitStore<ResourceChannel>`

  `fluidInputChannels`

  `private String`

  `recipeTagQuery`

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

  `CraftBenchScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `copyFrom(ComponentScript other)`

  `zombie.entity.util.enums.EnumBitStore<ResourceChannel>`

  `getEnergyInputChannels()`

  `zombie.entity.util.enums.EnumBitStore<ResourceChannel>`

  `getFluidInputChannels()`

  `List<CraftRecipe>`

  `getRecipes()`

  `String`

  `getRecipeTagQuery()`

  `protected void`

  `load(zombie.scripting.ScriptParser.Block block)`

  `void`

  `OnScriptsLoaded(zombie.scripting.ScriptLoadMode loadMode)`

  ### Methods inherited from class [ComponentScript](../../ComponentScript.html#method-summary "class in zombie.scripting.entity")

  `getName, isoMasterOnly, parseKeyValue`

  ### Methods inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, Load, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### fluidInputChannels

    private final zombie.entity.util.enums.EnumBitStore<[ResourceChannel](../../../../entity/components/resources/ResourceChannel.html "enum class in zombie.entity.components.resources")> fluidInputChannels
  + ### energyInputChannels

    private final zombie.entity.util.enums.EnumBitStore<[ResourceChannel](../../../../entity/components/resources/ResourceChannel.html "enum class in zombie.entity.components.resources")> energyInputChannels
  + ### recipeTagQuery

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") recipeTagQuery
* Constructor Details
  -------------------

  + ### CraftBenchScript

    private CraftBenchScript()
* Method Details
  --------------

  + ### getRecipeTagQuery

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getRecipeTagQuery()
  + ### getRecipes

    public [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[CraftRecipe](CraftRecipe.html "class in zombie.scripting.entity.components.crafting")> getRecipes()
  + ### getFluidInputChannels

    public zombie.entity.util.enums.EnumBitStore<[ResourceChannel](../../../../entity/components/resources/ResourceChannel.html "enum class in zombie.entity.components.resources")> getFluidInputChannels()
  + ### getEnergyInputChannels

    public zombie.entity.util.enums.EnumBitStore<[ResourceChannel](../../../../entity/components/resources/ResourceChannel.html "enum class in zombie.entity.components.resources")> getEnergyInputChannels()
  + ### copyFrom

    protected void copyFrom([ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity") other)

    Specified by:
    :   `copyFrom` in class `ComponentScript`
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