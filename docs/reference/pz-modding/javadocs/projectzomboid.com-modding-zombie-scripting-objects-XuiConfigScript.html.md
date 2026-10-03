[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [XuiConfigScript](XuiConfigScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [varConfigs](#varConfigs)
6. [Constructor Details](#constructor-detail)
   1. [XuiConfigScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getVarConfigs()](#getVarConfigs())
   2. [reset()](#reset())
   3. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   4. [LoadVarTypeBlock(XuiVarType, ScriptParser.Block)](#LoadVarTypeBlock(zombie.scripting.ui.XuiVarType,zombie.scripting.ScriptParser.Block))
   5. [otherTypesContainsKey(String, XuiVarType)](#otherTypesContainsKey(java.lang.String,zombie.scripting.ui.XuiVarType))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiConfigScript
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.XuiConfigScript

---

public class XuiConfigScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Map<XuiVarType, ArrayList<String>>`

  `varConfigs`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XuiConfigScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Map<XuiVarType, ArrayList<String>>`

  `getVarConfigs()`

  `void`

  `Load(String name,
  String body)`

  `private void`

  `LoadVarTypeBlock(XuiVarType varType,
  zombie.scripting.ScriptParser.Block block)`

  `private boolean`

  `otherTypesContainsKey(String key,
  XuiVarType ignoreType)`

  `void`

  `reset()`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### varConfigs

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[XuiVarType](../ui/XuiVarType.html "enum class in zombie.scripting.ui"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> varConfigs
* Constructor Details
  -------------------

  + ### XuiConfigScript

    public XuiConfigScript()
* Method Details
  --------------

  + ### getVarConfigs

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[XuiVarType](../ui/XuiVarType.html "enum class in zombie.scripting.ui"), [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> getVarConfigs()
  + ### reset

    public void reset()

    Overrides:
    :   `reset` in class `BaseScriptObject`
  + ### Load

    public void Load([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") body)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Overrides:
    :   `Load` in class `BaseScriptObject`

    Throws:
    :   `Exception`
  + ### LoadVarTypeBlock

    private void LoadVarTypeBlock([XuiVarType](../ui/XuiVarType.html "enum class in zombie.scripting.ui") varType,
    zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### otherTypesContainsKey

    private boolean otherTypesContainsKey([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [XuiVarType](../ui/XuiVarType.html "enum class in zombie.scripting.ui") ignoreType)