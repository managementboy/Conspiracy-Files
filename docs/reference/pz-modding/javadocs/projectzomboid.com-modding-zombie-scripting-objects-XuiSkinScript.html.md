[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [XuiSkinScript](XuiSkinScript.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [protectedDefaultName](#protectedDefaultName)
   2. [imports](#imports)
   3. [defaultEntityUiScript](#defaultEntityUiScript)
   4. [entityUiScriptMap](#entityUiScriptMap)
   5. [styleInfoMap](#styleInfoMap)
   6. [colorsScript](#colorsScript)
7. [Constructor Details](#constructor-detail)
   1. [XuiSkinScript()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getImports()](#getImports())
   2. [getDefaultEntityUiScript()](#getDefaultEntityUiScript())
   3. [getEntityUiScriptMap()](#getEntityUiScriptMap())
   4. [getStyleInfoMap()](#getStyleInfoMap())
   5. [getColorsScript()](#getColorsScript())
   6. [reset()](#reset())
   7. [Load(String, String)](#Load(java.lang.String,java.lang.String))
   8. [LoadStyleBlock(ScriptParser.Block)](#LoadStyleBlock(zombie.scripting.ScriptParser.Block))
   9. [LoadImports(ScriptParser.Block)](#LoadImports(zombie.scripting.ScriptParser.Block))
   10. [LoadEntityBlock(ScriptParser.Block)](#LoadEntityBlock(zombie.scripting.ScriptParser.Block))
   11. [LoadComponents(ScriptParser.Block, XuiSkinScript.EntityUiScript)](#LoadComponents(zombie.scripting.ScriptParser.Block,zombie.scripting.objects.XuiSkinScript.EntityUiScript))
   12. [LoadComponentBlock(ScriptParser.Block, XuiSkinScript.EntityUiScript)](#LoadComponentBlock(zombie.scripting.ScriptParser.Block,zombie.scripting.objects.XuiSkinScript.EntityUiScript))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiSkinScript
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.scripting.objects.BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

zombie.scripting.objects.XuiSkinScript

---

public class XuiSkinScript
extends [BaseScriptObject](BaseScriptObject.html "class in zombie.scripting.objects")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `XuiSkinScript.ComponentUiScript`

  `static class`

  `XuiSkinScript.EntityUiScript`

  `static class`

  `XuiSkinScript.StyleInfoScript`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final XuiColorsScript`

  `colorsScript`

  `private final XuiSkinScript.EntityUiScript`

  `defaultEntityUiScript`

  `private final Map<String, XuiSkinScript.EntityUiScript>`

  `entityUiScriptMap`

  `private final ArrayList<String>`

  `imports`

  `private static final String`

  `protectedDefaultName`

  `private final Map<String, XuiSkinScript.StyleInfoScript>`

  `styleInfoMap`

  ### Fields inherited from class [BaseScriptObject](BaseScriptObject.html#field-summary "class in zombie.scripting.objects")

  `debugOnly, enabled`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XuiSkinScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `XuiColorsScript`

  `getColorsScript()`

  `XuiSkinScript.EntityUiScript`

  `getDefaultEntityUiScript()`

  `final Map<String, XuiSkinScript.EntityUiScript>`

  `getEntityUiScriptMap()`

  `ArrayList<String>`

  `getImports()`

  `Map<String, XuiSkinScript.StyleInfoScript>`

  `getStyleInfoMap()`

  `void`

  `Load(String name,
  String body)`

  `private void`

  `LoadComponentBlock(zombie.scripting.ScriptParser.Block block,
  XuiSkinScript.EntityUiScript entityUiScript)`

  `private void`

  `LoadComponents(zombie.scripting.ScriptParser.Block block,
  XuiSkinScript.EntityUiScript entityUiScript)`

  `private void`

  `LoadEntityBlock(zombie.scripting.ScriptParser.Block block)`

  `private void`

  `LoadImports(zombie.scripting.ScriptParser.Block block)`

  `private void`

  `LoadStyleBlock(zombie.scripting.ScriptParser.Block block)`

  `void`

  `reset()`

  ### Methods inherited from class [BaseScriptObject](BaseScriptObject.html#method-summary "class in zombie.scripting.objects")

  `addLoadedScriptBody, calculateScriptVersion, debugString, getAllScriptLines, getBodyScriptLines, getLoadedScriptBodies, getLoadedScriptBodyCount, getModule, getObsolete, getParent, getScriptLines, getScriptObjectFullType, getScriptObjectName, getScriptObjectType, getScriptVersion, getVersion, InitLoadPP, isDebugOnly, isEnabled, LoadCommonBlock, LoadCommonBlock, LoadVector3, OnLoadedAfterLua, OnPostWorldDictionaryInit, OnScriptsLoaded, PreReload, resetLoadedScriptBodies, setModule, setParent`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### protectedDefaultName

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") protectedDefaultName

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.objects.XuiSkinScript.protectedDefaultName)
  + ### imports

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> imports
  + ### defaultEntityUiScript

    private final [XuiSkinScript.EntityUiScript](XuiSkinScript.EntityUiScript.html "class in zombie.scripting.objects") defaultEntityUiScript
  + ### entityUiScriptMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiSkinScript.EntityUiScript](XuiSkinScript.EntityUiScript.html "class in zombie.scripting.objects")> entityUiScriptMap
  + ### styleInfoMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiSkinScript.StyleInfoScript](XuiSkinScript.StyleInfoScript.html "class in zombie.scripting.objects")> styleInfoMap
  + ### colorsScript

    private final [XuiColorsScript](XuiColorsScript.html "class in zombie.scripting.objects") colorsScript
* Constructor Details
  -------------------

  + ### XuiSkinScript

    public XuiSkinScript()
* Method Details
  --------------

  + ### getImports

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getImports()
  + ### getDefaultEntityUiScript

    public [XuiSkinScript.EntityUiScript](XuiSkinScript.EntityUiScript.html "class in zombie.scripting.objects") getDefaultEntityUiScript()
  + ### getEntityUiScriptMap

    public final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiSkinScript.EntityUiScript](XuiSkinScript.EntityUiScript.html "class in zombie.scripting.objects")> getEntityUiScriptMap()
  + ### getStyleInfoMap

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiSkinScript.StyleInfoScript](XuiSkinScript.StyleInfoScript.html "class in zombie.scripting.objects")> getStyleInfoMap()
  + ### getColorsScript

    public [XuiColorsScript](XuiColorsScript.html "class in zombie.scripting.objects") getColorsScript()
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
  + ### LoadStyleBlock

    private void LoadStyleBlock(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadImports

    private void LoadImports(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadEntityBlock

    private void LoadEntityBlock(zombie.scripting.ScriptParser.Block block)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadComponents

    private void LoadComponents(zombie.scripting.ScriptParser.Block block,
    [XuiSkinScript.EntityUiScript](XuiSkinScript.EntityUiScript.html "class in zombie.scripting.objects") entityUiScript)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadComponentBlock

    private void LoadComponentBlock(zombie.scripting.ScriptParser.Block block,
    [XuiSkinScript.EntityUiScript](XuiSkinScript.EntityUiScript.html "class in zombie.scripting.objects") entityUiScript)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`