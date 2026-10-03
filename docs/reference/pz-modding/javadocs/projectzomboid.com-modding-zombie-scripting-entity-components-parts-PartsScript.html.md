[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.parts](package-summary.html)
2. [PartsScript](PartsScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [PartsScript()](#%3Cinit%3E())
6. [Method Details](#method-detail)
   1. [copyFrom(ComponentScript)](#copyFrom(zombie.scripting.entity.ComponentScript))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class PartsScript
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")

[zombie.scripting.entity.ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

zombie.scripting.entity.components.parts.PartsScript

---

public class PartsScript
extends [ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

* Field Summary
  -------------

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

  `PartsScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `copyFrom(ComponentScript other)`

  ### Methods inherited from class [ComponentScript](../../ComponentScript.html#method-summary "class in zombie.scripting.entity")

  `getName, isoMasterOnly, load, parseKeyValue`

  ### Methods inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, Load, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### PartsScript

    private PartsScript()
* Method Details
  --------------

  + ### copyFrom

    protected void copyFrom([ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity") other)

    Specified by:
    :   `copyFrom` in class `ComponentScript`