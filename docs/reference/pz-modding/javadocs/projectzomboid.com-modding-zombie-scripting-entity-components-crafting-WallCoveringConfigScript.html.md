[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../../deprecated-list.html)
* [Index](../../../../../index-files/index-1.html)
* [Search](../../../../../search.html)
* [Help](../../../../../help-doc.html#class)

1. [zombie.scripting.entity.components.crafting](package-summary.html)
2. [WallCoveringConfigScript](WallCoveringConfigScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [type](#type)
   2. [name](#name)
   3. [sign](#sign)
6. [Constructor Details](#constructor-detail)
   1. [WallCoveringConfigScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getType()](#getType())
   2. [getTypeString()](#getTypeString())
   3. [getName()](#getName())
   4. [copyFrom(ComponentScript)](#copyFrom(zombie.scripting.entity.ComponentScript))
   5. [getSignIndex()](#getSignIndex())
   6. [getSignSpriteName()](#getSignSpriteName())
   7. [load(ScriptParser.Block)](#load(zombie.scripting.ScriptParser.Block))

Hide sidebar ![Hide sidebar](../../../../../resource-files/left.svg)![Show sidebar](../../../../../resource-files/right.svg) Show sidebar

Class WallCoveringConfigScript
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](../../../objects/BaseScriptObject.html "class in zombie.scripting.objects")

[zombie.scripting.entity.ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

zombie.scripting.entity.components.crafting.WallCoveringConfigScript

---

public class WallCoveringConfigScript
extends [ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `name`

  `private zombie.scripting.objects.SignType`

  `sign`

  `private WallCoveringType`

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

  `WallCoveringConfigScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected void`

  `copyFrom(ComponentScript other)`

  `String`

  `getName()`

  `Integer`

  `getSignIndex()`

  `String`

  `getSignSpriteName()`

  `WallCoveringType`

  `getType()`

  `String`

  `getTypeString()`

  `protected void`

  `load(zombie.scripting.ScriptParser.Block block)`

  ### Methods inherited from class [ComponentScript](../../ComponentScript.html#method-summary "class in zombie.scripting.entity")

  `isoMasterOnly, parseKeyValue`

  ### Methods inherited from class [BaseScriptObject](../../../objects/BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, Load, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### type

    private [WallCoveringType](../../../objects/WallCoveringType.html "enum class in zombie.scripting.objects") type
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### sign

    private zombie.scripting.objects.SignType sign
* Constructor Details
  -------------------

  + ### WallCoveringConfigScript

    private WallCoveringConfigScript()
* Method Details
  --------------

  + ### getType

    public [WallCoveringType](../../../objects/WallCoveringType.html "enum class in zombie.scripting.objects") getType()
  + ### getTypeString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTypeString()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()

    Overrides:
    :   `getName` in class `ComponentScript`
  + ### copyFrom

    protected void copyFrom([ComponentScript](../../ComponentScript.html "class in zombie.scripting.entity") other)

    Specified by:
    :   `copyFrom` in class `ComponentScript`
  + ### getSignIndex

    public [Integer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Integer.html "class or interface in java.lang") getSignIndex()
  + ### getSignSpriteName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getSignSpriteName()
  + ### load

    protected void load(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `load` in class `ComponentScript`

    Throws:
    :   `Exception`