[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.entity](package-summary.html)
2. [ComponentScript](ComponentScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [type](#type)
6. [Constructor Details](#constructor-detail)
   1. [ComponentScript(ComponentType)](#%3Cinit%3E(zombie.entity.ComponentType))
7. [Method Details](#method-detail)
   1. [isoMasterOnly()](#isoMasterOnly())
   2. [getName()](#getName())
   3. [copyFrom(T)](#copyFrom(T))
   4. [load(ScriptParser.Block)](#load(zombie.scripting.ScriptParser.Block))
   5. [parseKeyValue(String, String)](#parseKeyValue(java.lang.String,java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ComponentScript
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../objects/BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.entity.ComponentScript

Direct Known Subclasses:
:   `AttributesScript, ContextMenuConfigScript, CraftBenchScript, CraftLogicScript, CraftRecipeComponentScript, FluidContainerScript, FurnaceLogicScript, LuaComponentScript, MashingLogicScript, PartsScript, SignalsScript, SpriteConfigScript, TestComponentScript, UiConfigScript, WallCoveringConfigScript`

---

public abstract class ComponentScript
extends [BaseScriptObject](../objects/BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final ComponentType`

  `type`

  ### Fields inherited from class [BaseScriptObject](../objects/BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `ComponentScript(ComponentType type)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected abstract <T extends ComponentScript>  
  void`

  `copyFrom(T source)`

  `String`

  `getName()`

  `boolean`

  `isoMasterOnly()`

  This should be TRUE for almost all components, with only few exceptions.

  `protected void`

  `load(zombie.scripting.ScriptParser.Block block)`

  `protected boolean`

  `parseKeyValue(String k,
  String v)`

  ### Methods inherited from class [BaseScriptObject](../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, Load, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### type

    public final [ComponentType](../../entity/ComponentType.html "enum class in zombie.entity") type
* Constructor Details
  -------------------

  + ### ComponentScript

    protected ComponentScript([ComponentType](../../entity/ComponentType.html "enum class in zombie.entity") type)
* Method Details
  --------------

  + ### isoMasterOnly

    public boolean isoMasterOnly()

    This should be TRUE for almost all components, with only few exceptions.
    For the exceptions its important they are non-meta components like SpriteConfig.
    This due to only the master object of multi-tile entities being stored in meta.
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### copyFrom

    protected abstract <T extends [ComponentScript](ComponentScript.html "class in zombie.scripting.entity")> void copyFrom(T source)
  + ### load

    protected void load(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### parseKeyValue

    protected boolean parseKeyValue([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") k,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") v)