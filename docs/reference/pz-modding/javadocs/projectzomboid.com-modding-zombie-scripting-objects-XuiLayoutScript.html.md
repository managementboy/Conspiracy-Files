[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [XuiLayoutScript](XuiLayoutScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [xuiScript](#xuiScript)
   2. [name](#name)
   3. [totalFile](#totalFile)
   4. [hasParsed](#hasParsed)
   5. [scriptType](#scriptType)
   6. [block](#block)
6. [Constructor Details](#constructor-detail)
   1. [XuiLayoutScript(ScriptType, XuiScriptType)](#%3Cinit%3E(zombie.scripting.ScriptType,zombie.scripting.ui.XuiScriptType))
7. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [getScriptType()](#getScriptType())
   3. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   4. [preParse()](#preParse())
   5. [parseScript()](#parseScript())
   6. [getXuiScript()](#getXuiScript())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiLayoutScript
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.XuiLayoutScript

---

public class XuiLayoutScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private zombie.scripting.ScriptParser.Block`

  `block`

  `private boolean`

  `hasParsed`

  `private String`

  `name`

  `private final XuiScriptType`

  `scriptType`

  `private String`

  `totalFile`

  `private XuiScript`

  `xuiScript`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XuiLayoutScript(ScriptType scriptType,
  XuiScriptType xuiScriptType)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getName()`

  `XuiScriptType`

  `getScriptType()`

  `XuiScript`

  `getXuiScript()`

  `void`

  `Load(String name,
  String totalFile)`

  `void`

  `parseScript()`

  `void`

  `preParse()`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, reset, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### xuiScript

    private [XuiScript](../ui/XuiScript.html "class in zombie.scripting.ui") xuiScript
  + ### name

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### totalFile

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile
  + ### hasParsed

    private boolean hasParsed
  + ### scriptType

    private final [XuiScriptType](../ui/XuiScriptType.html "enum class in zombie.scripting.ui") scriptType
  + ### block

    private zombie.scripting.ScriptParser.Block block
* Constructor Details
  -------------------

  + ### XuiLayoutScript

    public XuiLayoutScript([ScriptType](../ScriptType.html "enum class in zombie.scripting") scriptType,
    [XuiScriptType](../ui/XuiScriptType.html "enum class in zombie.scripting.ui") xuiScriptType)
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getScriptType

    public [XuiScriptType](../ui/XuiScriptType.html "enum class in zombie.scripting.ui") getScriptType()
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") totalFile)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### preParse

    public void preParse()
  + ### parseScript

    public void parseScript()
  + ### getXuiScript

    public [XuiScript](../ui/XuiScript.html "class in zombie.scripting.ui") getXuiScript()