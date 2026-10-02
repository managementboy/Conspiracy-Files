[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.contextmenuconfig](package-summary.html)
2. [ContextMenuConfigScript](ContextMenuConfigScript.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [entries](#entries)
7. [Constructor Details](#constructor-detail)
   1. [ContextMenuConfigScript()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [copyFrom(ComponentScript)](#copyFrom(zombie.scripting.entity.ComponentScript))
   2. [load(ScriptParser.Block)](#load(zombie.scripting.ScriptParser.Block))
   3. [LoadEntry(ScriptParser.Block)](#LoadEntry(zombie.scripting.ScriptParser.Block))
   4. [getEntries()](#getEntries())

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class ContextMenuConfigScript
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")

[zombie.scripting.entity.ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

zombie.scripting.entity.components.contextmenuconfig.ContextMenuConfigScript

---

public class ContextMenuConfigScript
extends [ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

Soul Filcher

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `ContextMenuConfigScript.EntryScript`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected ArrayList<ContextMenuConfigScript.EntryScript>`

  `entries`

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

  `ContextMenuConfigScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `copyFrom(ComponentScript other)`

  `ArrayList<ContextMenuConfigScript.EntryScript>`

  `getEntries()`

  `protected void`

  `load(zombie.scripting.ScriptParser.Block block)`

  `private ContextMenuConfigScript.EntryScript`

  `LoadEntry(zombie.scripting.ScriptParser.Block block)`

  ### Methods inherited from class [ComponentScript](../../ComponentScript.html#method-summary "class in zombie.scripting.entity")

  `getName, isoMasterOnly, parseKeyValue`

  ### Methods inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, Load, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### entries

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ContextMenuConfigScript.EntryScript](ContextMenuConfigScript.EntryScript.html "class in zombie.scripting.entity.components.contextmenuconfig")> entries
* Constructor Details
  -------------------

  + ### ContextMenuConfigScript

    private ContextMenuConfigScript()
* Method Details
  --------------

  + ### copyFrom

    protected void copyFrom([ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity") other)

    Specified by:
    :   `copyFrom` in class `ComponentScript`
  + ### load

    protected void load(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `load` in class `ComponentScript`

    Throws:
    :   `Exception`
  + ### LoadEntry

    private [ContextMenuConfigScript.EntryScript](ContextMenuConfigScript.EntryScript.html "class in zombie.scripting.entity.components.contextmenuconfig") LoadEntry(zombie.scripting.ScriptParser.Block block)
  + ### getEntries

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[ContextMenuConfigScript.EntryScript](ContextMenuConfigScript.EntryScript.html "class in zombie.scripting.entity.components.contextmenuconfig")> getEntries()