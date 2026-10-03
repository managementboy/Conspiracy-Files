[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.ui](package-summary.html)
2. [XuiManager](XuiManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [DEFAULT\_SKIN\_NAME](#DEFAULT_SKIN_NAME)
   2. [XUI\_SCRIPT\_TYPES](#XUI_SCRIPT_TYPES)
   3. [layoutScriptsMap](#layoutScriptsMap)
   4. [stylesScriptsMap](#stylesScriptsMap)
   5. [defaultStylesScriptsMap](#defaultStylesScriptsMap)
   6. [combinedList](#combinedList)
   7. [xuiLayoutsList](#xuiLayoutsList)
   8. [xuiStylesList](#xuiStylesList)
   9. [xuiDefaultStylesList](#xuiDefaultStylesList)
   10. [xuiLayouts](#xuiLayouts)
   11. [xuiStyles](#xuiStyles)
   12. [xuiDefaultStyles](#xuiDefaultStyles)
   13. [xuiSkins](#xuiSkins)
   14. [xuiDefaultSkin](#xuiDefaultSkin)
   15. [parseOnce](#parseOnce)
   16. [hasParsedOnce](#hasParsedOnce)
6. [Constructor Details](#constructor-detail)
   1. [XuiManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getDefaultSkinName()](#getDefaultSkinName())
   2. [GetCombinedScripts()](#GetCombinedScripts())
   3. [GetAllLayouts()](#GetAllLayouts())
   4. [GetAllStyles()](#GetAllStyles())
   5. [GetAllDefaultStyles()](#GetAllDefaultStyles())
   6. [GetLayoutScript(String)](#GetLayoutScript(java.lang.String))
   7. [GetStyleScript(String)](#GetStyleScript(java.lang.String))
   8. [GetDefaultStyleScript(String)](#GetDefaultStyleScript(java.lang.String))
   9. [GetLayout(String)](#GetLayout(java.lang.String))
   10. [GetStyle(String)](#GetStyle(java.lang.String))
   11. [GetDefaultStyle(String)](#GetDefaultStyle(java.lang.String))
   12. [GetDefaultSkin()](#GetDefaultSkin())
   13. [GetSkin(String)](#GetSkin(java.lang.String))
   14. [reset()](#reset())
   15. [setParseOnce(boolean)](#setParseOnce(boolean))
   16. [ParseScripts()](#ParseScripts())
   17. [registerLayout(XuiLayoutScript)](#registerLayout(zombie.scripting.objects.XuiLayoutScript))
   18. [parseLayout(XuiLayoutScript)](#parseLayout(zombie.scripting.objects.XuiLayoutScript))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiManager
================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.ui.XuiManager

---

public class XuiManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final ArrayList<XuiScript>`

  `combinedList`

  `private static final String`

  `DEFAULT_SKIN_NAME`

  `private static final Map<String, XuiLayoutScript>`

  `defaultStylesScriptsMap`

  `private static boolean`

  `hasParsedOnce`

  `private static final Map<String, XuiLayoutScript>`

  `layoutScriptsMap`

  `private static boolean`

  `parseOnce`

  `private static final Map<String, XuiLayoutScript>`

  `stylesScriptsMap`

  `static final EnumSet<ScriptType>`

  `XUI_SCRIPT_TYPES`

  `private static XuiSkin`

  `xuiDefaultSkin`

  `private static final Map<String, XuiScript>`

  `xuiDefaultStyles`

  `private static final ArrayList<XuiScript>`

  `xuiDefaultStylesList`

  `private static final Map<String, XuiScript>`

  `xuiLayouts`

  `private static final ArrayList<XuiScript>`

  `xuiLayoutsList`

  `private static final Map<String,XuiSkin>`

  `xuiSkins`

  `private static final Map<String, XuiScript>`

  `xuiStyles`

  `private static final ArrayList<XuiScript>`

  `xuiStylesList`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XuiManager()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static ArrayList<XuiScript>`

  `GetAllDefaultStyles()`

  `static ArrayList<XuiScript>`

  `GetAllLayouts()`

  `static ArrayList<XuiScript>`

  `GetAllStyles()`

  `static ArrayList<XuiScript>`

  `GetCombinedScripts()`

  `static XuiSkin`

  `GetDefaultSkin()`

  `static String`

  `getDefaultSkinName()`

  `static XuiScript`

  `GetDefaultStyle(String luaClass)`

  `static XuiLayoutScript`

  `GetDefaultStyleScript(String name)`

  `static XuiScript`

  `GetLayout(String name)`

  `static XuiLayoutScript`

  `GetLayoutScript(String name)`

  `static XuiSkin`

  `GetSkin(String name)`

  `static XuiScript`

  `GetStyle(String style)`

  `static XuiLayoutScript`

  `GetStyleScript(String name)`

  `private static void`

  `parseLayout(XuiLayoutScript layoutScript)`

  `static void`

  `ParseScripts()`

  `private static void`

  `registerLayout(XuiLayoutScript layoutScript)`

  `private static void`

  `reset()`

  `static void`

  `setParseOnce(boolean b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### DEFAULT\_SKIN\_NAME

    private static final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") DEFAULT\_SKIN\_NAME

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.scripting.ui.XuiManager.DEFAULT_SKIN_NAME)
  + ### XUI\_SCRIPT\_TYPES

    public static final [EnumSet](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/EnumSet.html "class or interface in java.util")<[ScriptType](../ScriptType.html "enum class in zombie.scripting")> XUI\_SCRIPT\_TYPES
  + ### layoutScriptsMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiLayoutScript](../objects/XuiLayoutScript.html "class in zombie.scripting.objects")> layoutScriptsMap
  + ### stylesScriptsMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiLayoutScript](../objects/XuiLayoutScript.html "class in zombie.scripting.objects")> stylesScriptsMap
  + ### defaultStylesScriptsMap

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiLayoutScript](../objects/XuiLayoutScript.html "class in zombie.scripting.objects")> defaultStylesScriptsMap
  + ### combinedList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript](XuiScript.html "class in zombie.scripting.ui")> combinedList
  + ### xuiLayoutsList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript](XuiScript.html "class in zombie.scripting.ui")> xuiLayoutsList
  + ### xuiStylesList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript](XuiScript.html "class in zombie.scripting.ui")> xuiStylesList
  + ### xuiDefaultStylesList

    private static final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript](XuiScript.html "class in zombie.scripting.ui")> xuiDefaultStylesList
  + ### xuiLayouts

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiScript](XuiScript.html "class in zombie.scripting.ui")> xuiLayouts
  + ### xuiStyles

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiScript](XuiScript.html "class in zombie.scripting.ui")> xuiStyles
  + ### xuiDefaultStyles

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiScript](XuiScript.html "class in zombie.scripting.ui")> xuiDefaultStyles
  + ### xuiSkins

    private static final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[XuiSkin](XuiSkin.html "class in zombie.scripting.ui")> xuiSkins
  + ### xuiDefaultSkin

    private static [XuiSkin](XuiSkin.html "class in zombie.scripting.ui") xuiDefaultSkin
  + ### parseOnce

    private static boolean parseOnce
  + ### hasParsedOnce

    private static boolean hasParsedOnce
* Constructor Details
  -------------------

  + ### XuiManager

    public XuiManager()
* Method Details
  --------------

  + ### getDefaultSkinName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDefaultSkinName()
  + ### GetCombinedScripts

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript](XuiScript.html "class in zombie.scripting.ui")> GetCombinedScripts()
  + ### GetAllLayouts

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript](XuiScript.html "class in zombie.scripting.ui")> GetAllLayouts()
  + ### GetAllStyles

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript](XuiScript.html "class in zombie.scripting.ui")> GetAllStyles()
  + ### GetAllDefaultStyles

    public static [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiScript](XuiScript.html "class in zombie.scripting.ui")> GetAllDefaultStyles()
  + ### GetLayoutScript

    public static [XuiLayoutScript](../objects/XuiLayoutScript.html "class in zombie.scripting.objects") GetLayoutScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### GetStyleScript

    public static [XuiLayoutScript](../objects/XuiLayoutScript.html "class in zombie.scripting.objects") GetStyleScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### GetDefaultStyleScript

    public static [XuiLayoutScript](../objects/XuiLayoutScript.html "class in zombie.scripting.objects") GetDefaultStyleScript([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### GetLayout

    public static [XuiScript](XuiScript.html "class in zombie.scripting.ui") GetLayout([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### GetStyle

    public static [XuiScript](XuiScript.html "class in zombie.scripting.ui") GetStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") style)
  + ### GetDefaultStyle

    public static [XuiScript](XuiScript.html "class in zombie.scripting.ui") GetDefaultStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaClass)
  + ### GetDefaultSkin

    public static [XuiSkin](XuiSkin.html "class in zombie.scripting.ui") GetDefaultSkin()
  + ### GetSkin

    public static [XuiSkin](XuiSkin.html "class in zombie.scripting.ui") GetSkin([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
  + ### reset

    private static void reset()
  + ### setParseOnce

    public static void setParseOnce(boolean b)
  + ### ParseScripts

    public static void ParseScripts()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### registerLayout

    private static void registerLayout([XuiLayoutScript](../objects/XuiLayoutScript.html "class in zombie.scripting.objects") layoutScript)
  + ### parseLayout

    private static void parseLayout([XuiLayoutScript](../objects/XuiLayoutScript.html "class in zombie.scripting.objects") layoutScript)