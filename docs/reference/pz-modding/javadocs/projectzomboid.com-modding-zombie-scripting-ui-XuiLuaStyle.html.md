[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.ui](package-summary.html)
2. [XuiLuaStyle](XuiLuaStyle.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [ALLOWED\_VAR\_TYPES](#ALLOWED_VAR_TYPES)
   2. [varRegisteryMap](#varRegisteryMap)
   3. [xuiLuaClass](#xuiLuaClass)
   4. [xuiStyleName](#xuiStyleName)
   5. [xuiSkin](#xuiSkin)
   6. [varsMap](#varsMap)
   7. [vars](#vars)
7. [Constructor Details](#constructor-detail)
   1. [XuiLuaStyle(String, String)](#%3Cinit%3E(java.lang.String,java.lang.String))
8. [Method Details](#method-detail)
   1. [addStaticVar(XuiLuaStyle.XuiVar)](#addStaticVar(zombie.scripting.ui.XuiLuaStyle.XuiVar))
   2. [getStaticVar(String)](#getStaticVar(java.lang.String))
   3. [ReadConfigs(ArrayList)](#ReadConfigs(java.util.ArrayList))
   4. [parseConfig(Map, XuiConfigScript)](#parseConfig(java.util.Map,zombie.scripting.objects.XuiConfigScript))
   5. [otherTypesContainsKey(Map, String, XuiVarType)](#otherTypesContainsKey(java.util.Map,java.lang.String,zombie.scripting.ui.XuiVarType))
   6. [Reset()](#Reset())
   7. [getXuiLuaClass()](#getXuiLuaClass())
   8. [getXuiStyleName()](#getXuiStyleName())
   9. [getVar(String)](#getVar(java.lang.String))
   10. [addVar(String, XuiLuaStyle.XuiVar)](#addVar(java.lang.String,zombie.scripting.ui.XuiLuaStyle.XuiVar))
   11. [getVars()](#getVars())
   12. [loadVar(String, String)](#loadVar(java.lang.String,java.lang.String))
   13. [copyVarsFrom(XuiLuaStyle)](#copyVarsFrom(zombie.scripting.ui.XuiLuaStyle))
   14. [toString()](#toString())
   15. [logWithInfo(String)](#logWithInfo(java.lang.String))
   16. [warnWithInfo(String)](#warnWithInfo(java.lang.String))
   17. [errorWithInfo(String)](#errorWithInfo(java.lang.String))
   18. [logInfo()](#logInfo())
   19. [debugPrint(String)](#debugPrint(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiLuaStyle
=================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.ui.XuiLuaStyle

---

public class XuiLuaStyle
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `XuiLuaStyle.XuiBoolean`

  `static class`

  `XuiLuaStyle.XuiColor`

  `static class`

  `XuiLuaStyle.XuiDouble`

  `static class`

  `XuiLuaStyle.XuiFontType`

  `static class`

  `XuiLuaStyle.XuiString`

  `static class`

  `XuiLuaStyle.XuiStringList`

  `static class`

  `XuiLuaStyle.XuiTexture`

  `static class`

  `XuiLuaStyle.XuiTranslateString`

  `static class`

  `XuiLuaStyle.XuiVar<T, C extends XuiLuaStyle.XuiVar<?,?>>`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static final EnumSet<XuiVarType>`

  `ALLOWED_VAR_TYPES`

  `private static final Map<String, XuiLuaStyle.XuiVar<?,?>>`

  `varRegisteryMap`

  `protected ArrayList<XuiLuaStyle.XuiVar<?,?>>`

  `vars`

  `protected HashMap<String, XuiLuaStyle.XuiVar<?,?>>`

  `varsMap`

  `private final String`

  `xuiLuaClass`

  `protected XuiSkin`

  `xuiSkin`

  `private final String`

  `xuiStyleName`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `XuiLuaStyle(String xuiLuaClass,
  String xuiStyleName)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static void`

  `addStaticVar(XuiLuaStyle.XuiVar<?,?> var)`

  `private void`

  `addVar(String key,
  XuiLuaStyle.XuiVar<?,?> var)`

  `void`

  `copyVarsFrom(XuiLuaStyle other)`

  `protected void`

  `debugPrint(String prefix)`

  `protected void`

  `errorWithInfo(String s)`

  `private static XuiLuaStyle.XuiVar<?,?>`

  `getStaticVar(String name)`

  `XuiLuaStyle.XuiVar<?,?>`

  `getVar(String key)`

  `ArrayList<XuiLuaStyle.XuiVar<?,?>>`

  `getVars()`

  `String`

  `getXuiLuaClass()`

  `String`

  `getXuiStyleName()`

  `boolean`

  `loadVar(String key,
  String val)`

  `private void`

  `logInfo()`

  `protected void`

  `logWithInfo(String s)`

  `private static boolean`

  `otherTypesContainsKey(Map<XuiVarType, HashSet<String>> parsed,
  String key,
  XuiVarType ignoreType)`

  `private static void`

  `parseConfig(Map<XuiVarType, HashSet<String>> parsed,
  XuiConfigScript config)`

  `static void`

  `ReadConfigs(ArrayList<XuiConfigScript> configs)`

  `static void`

  `Reset()`

  `String`

  `toString()`

  `protected void`

  `warnWithInfo(String s)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### ALLOWED\_VAR\_TYPES

    public static final [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[XuiVarType](XuiVarType.html "enum class in zombie.scripting.ui")> ALLOWED\_VAR\_TYPES
  + ### varRegisteryMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<?,?>> varRegisteryMap
  + ### xuiLuaClass

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLuaClass
  + ### xuiStyleName

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiStyleName
  + ### xuiSkin

    protected [XuiSkin](XuiSkin.html "class in zombie.scripting.ui") xuiSkin
  + ### varsMap

    protected [HashMap](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashMap.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<?,?>> varsMap
  + ### vars

    protected [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<?,?>> vars
* Constructor Details
  -------------------

  + ### XuiLuaStyle

    protected XuiLuaStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiLuaClass,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiStyleName)
* Method Details
  --------------

  + ### addStaticVar

    private static void addStaticVar([XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<?,?> var)
  + ### getStaticVar

    private static [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<?,?> getStaticVar([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### ReadConfigs

    public static void ReadConfigs([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiConfigScript](../objects/XuiConfigScript.html "class in zombie.scripting.objects")> configs)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### parseConfig

    private static void parseConfig([Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[XuiVarType](XuiVarType.html "enum class in zombie.scripting.ui"), [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> parsed,
    [XuiConfigScript](../objects/XuiConfigScript.html "class in zombie.scripting.objects") config)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### otherTypesContainsKey

    private static boolean otherTypesContainsKey([Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[XuiVarType](XuiVarType.html "enum class in zombie.scripting.ui"), [HashSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/HashSet.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")>> parsed,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [XuiVarType](XuiVarType.html "enum class in zombie.scripting.ui") ignoreType)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### Reset

    public static void Reset()
  + ### getXuiLuaClass

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getXuiLuaClass()
  + ### getXuiStyleName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getXuiStyleName()
  + ### getVar

    public [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<?,?> getVar([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key)
  + ### addVar

    private void addVar([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<?,?> var)
  + ### getVars

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiLuaStyle.XuiVar](XuiLuaStyle.XuiVar.html "class in zombie.scripting.ui")<?,?>> getVars()
  + ### loadVar

    public boolean loadVar([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") key,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") val)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### copyVarsFrom

    public void copyVarsFrom([XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") other)
  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### logWithInfo

    protected void logWithInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### warnWithInfo

    protected void warnWithInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### errorWithInfo

    protected void errorWithInfo([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### logInfo

    private void logInfo()
  + ### debugPrint

    protected void debugPrint([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prefix)