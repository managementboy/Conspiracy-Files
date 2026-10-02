[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.ui](package-summary.html)
2. [XuiSkin](XuiSkin.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [imports](#imports)
   2. [colorMap](#colorMap)
   3. [defaultEntityUiStyle](#defaultEntityUiStyle)
   4. [entityUiStyleMap](#entityUiStyleMap)
   5. [styles](#styles)
   6. [name](#name)
   7. [script](#script)
   8. [hasLoaded](#hasLoaded)
   9. [invalidated](#invalidated)
7. [Constructor Details](#constructor-detail)
   1. [XuiSkin(String, XuiSkinScript)](#%3Cinit%3E(java.lang.String,zombie.scripting.objects.XuiSkinScript))
8. [Method Details](#method-detail)
   1. [Default()](#Default())
   2. [getDefaultSkinName()](#getDefaultSkinName())
   3. [isInvalidated()](#isInvalidated())
   4. [setInvalidated(boolean)](#setInvalidated(boolean))
   5. [getName()](#getName())
   6. [getEntityDisplayName(String)](#getEntityDisplayName(java.lang.String))
   7. [getEntityUiStyle(String)](#getEntityUiStyle(java.lang.String))
   8. [getComponentUiStyle(String, ComponentType)](#getComponentUiStyle(java.lang.String,zombie.entity.ComponentType))
   9. [color(String)](#color(java.lang.String))
   10. [colorInternal(String, boolean, boolean)](#colorInternal(java.lang.String,boolean,boolean))
   11. [getDefault(String)](#getDefault(java.lang.String))
   12. [get(String, String)](#get(java.lang.String,java.lang.String))
   13. [Load()](#Load())
   14. [LoadDefaultEntityUiInfo(XuiSkinScript)](#LoadDefaultEntityUiInfo(zombie.scripting.objects.XuiSkinScript))
   15. [LoadEntityUiInfo(XuiSkinScript)](#LoadEntityUiInfo(zombie.scripting.objects.XuiSkinScript))
   16. [LoadColors(XuiSkinScript)](#LoadColors(zombie.scripting.objects.XuiSkinScript))
   17. [LoadAllDefaultStyles(XuiSkinScript)](#LoadAllDefaultStyles(zombie.scripting.objects.XuiSkinScript))
   18. [LoadDefaultStyle(String, XuiSkinScript.StyleInfoScript)](#LoadDefaultStyle(java.lang.String,zombie.scripting.objects.XuiSkinScript.StyleInfoScript))
   19. [LoadAllStyles(XuiSkinScript)](#LoadAllStyles(zombie.scripting.objects.XuiSkinScript))
   20. [LoadStyle(String, XuiSkinScript.StyleInfoScript)](#LoadStyle(java.lang.String,zombie.scripting.objects.XuiSkinScript.StyleInfoScript))
   21. [debugPrint()](#debugPrint())
   22. [printEntityStyle(String, XuiSkin.EntityUiStyle)](#printEntityStyle(java.lang.String,zombie.scripting.ui.XuiSkin.EntityUiStyle))
   23. [printComponentStyle(String, ComponentType, XuiSkin.ComponentUiStyle)](#printComponentStyle(java.lang.String,zombie.entity.ComponentType,zombie.scripting.ui.XuiSkin.ComponentUiStyle))
   24. [printStyle(String, XuiSkin.StyleInfo)](#printStyle(java.lang.String,zombie.scripting.ui.XuiSkin.StyleInfo))
   25. [printStyle(String, String, XuiLuaStyle)](#printStyle(java.lang.String,java.lang.String,zombie.scripting.ui.XuiLuaStyle))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiSkin
=============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.ui.XuiSkin

---

public class XuiSkin
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static class`

  `XuiSkin.ComponentUiStyle`

  `static class`

  `XuiSkin.EntityUiStyle`

  `private static class`

  `XuiSkin.StyleInfo`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Map<String,Color>`

  `colorMap`

  `private final XuiSkin.EntityUiStyle`

  `defaultEntityUiStyle`

  `private final Map<String, XuiSkin.EntityUiStyle>`

  `entityUiStyleMap`

  `private boolean`

  `hasLoaded`

  `private final ArrayList<XuiSkin>`

  `imports`

  `private boolean`

  `invalidated`

  `private final String`

  `name`

  `private final XuiSkinScript`

  `script`

  `private final Map<String, XuiSkin.StyleInfo>`

  `styles`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `XuiSkin(String name,
  XuiSkinScript script)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Color`

  `color(String alias)`

  `protected Color`

  `colorInternal(String alias,
  boolean doSystemColorsFallback,
  boolean allowNull)`

  `void`

  `debugPrint()`

  `static XuiSkin`

  `Default()`

  `XuiLuaStyle`

  `get(String luaClass,
  String alias)`

  Returns a style for the specified luaClass or default style if the latter is null.

  `XuiSkin.ComponentUiStyle`

  `getComponentUiStyle(String entityAlias,
  ComponentType componentType)`

  `XuiLuaStyle`

  `getDefault(String luaClass)`

  Returns the default style for the specified luaClass.

  `static String`

  `getDefaultSkinName()`

  `String`

  `getEntityDisplayName(String entityAlias)`

  `XuiSkin.EntityUiStyle`

  `getEntityUiStyle(String alias)`

  `String`

  `getName()`

  `boolean`

  `isInvalidated()`

  `protected void`

  `Load()`

  `private void`

  `LoadAllDefaultStyles(XuiSkinScript script)`

  `private void`

  `LoadAllStyles(XuiSkinScript script)`

  `private void`

  `LoadColors(XuiSkinScript script)`

  `private void`

  `LoadDefaultEntityUiInfo(XuiSkinScript script)`

  Loads default entity ui info and applies default settings to all entity style aliases.

  `private void`

  `LoadDefaultStyle(String luaClassName,
  XuiSkinScript.StyleInfoScript script)`

  `private void`

  `LoadEntityUiInfo(XuiSkinScript script)`

  Applies settings to entity ui info style aliases.

  `private void`

  `LoadStyle(String luaClassName,
  XuiSkinScript.StyleInfoScript script)`

  `private void`

  `printComponentStyle(String prefix,
  ComponentType componentType,
  XuiSkin.ComponentUiStyle style)`

  `private void`

  `printEntityStyle(String styleName,
  XuiSkin.EntityUiStyle style)`

  `private void`

  `printStyle(String prefix,
  String styleName,
  XuiLuaStyle style)`

  `private void`

  `printStyle(String luaClassName,
  XuiSkin.StyleInfo styleInfo)`

  `protected void`

  `setInvalidated(boolean b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### imports

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[XuiSkin](XuiSkin.html "class in zombie.scripting.ui")> imports
  + ### colorMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"),[Color](../../core/Color.html "class in zombie.core")> colorMap
  + ### defaultEntityUiStyle

    private final [XuiSkin.EntityUiStyle](XuiSkin.EntityUiStyle.html "class in zombie.scripting.ui") defaultEntityUiStyle
  + ### entityUiStyleMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiSkin.EntityUiStyle](XuiSkin.EntityUiStyle.html "class in zombie.scripting.ui")> entityUiStyleMap
  + ### styles

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiSkin.StyleInfo](XuiSkin.StyleInfo.html "class in zombie.scripting.ui")> styles
  + ### name

    private final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### script

    private final [XuiSkinScript](../objects/XuiSkinScript.html "class in zombie.scripting.objects") script
  + ### hasLoaded

    private boolean hasLoaded
  + ### invalidated

    private boolean invalidated
* Constructor Details
  -------------------

  + ### XuiSkin

    public XuiSkin([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [XuiSkinScript](../objects/XuiSkinScript.html "class in zombie.scripting.objects") script)
* Method Details
  --------------

  + ### Default

    public static [XuiSkin](XuiSkin.html "class in zombie.scripting.ui") Default()
  + ### getDefaultSkinName

    public static [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDefaultSkinName()
  + ### isInvalidated

    public boolean isInvalidated()
  + ### setInvalidated

    protected void setInvalidated(boolean b)
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getEntityDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getEntityDisplayName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") entityAlias)
  + ### getEntityUiStyle

    public [XuiSkin.EntityUiStyle](XuiSkin.EntityUiStyle.html "class in zombie.scripting.ui") getEntityUiStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias)
  + ### getComponentUiStyle

    public [XuiSkin.ComponentUiStyle](XuiSkin.ComponentUiStyle.html "class in zombie.scripting.ui") getComponentUiStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") entityAlias,
    [ComponentType](../../entity/ComponentType.html "enum class in zombie.entity") componentType)
  + ### color

    public [Color](../../core/Color.html "class in zombie.core") color([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias)
  + ### colorInternal

    protected [Color](../../core/Color.html "class in zombie.core") colorInternal([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias,
    boolean doSystemColorsFallback,
    boolean allowNull)
  + ### getDefault

    public [XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") getDefault([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaClass)

    Returns the default style for the specified luaClass.
  + ### get

    public [XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") get([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaClass,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") alias)

    Returns a style for the specified luaClass or default style if the latter is null.
  + ### Load

    protected void Load()
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadDefaultEntityUiInfo

    private void LoadDefaultEntityUiInfo([XuiSkinScript](../objects/XuiSkinScript.html "class in zombie.scripting.objects") script)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Loads default entity ui info and applies default settings to all entity style aliases.

    Throws:
    :   `Exception`
  + ### LoadEntityUiInfo

    private void LoadEntityUiInfo([XuiSkinScript](../objects/XuiSkinScript.html "class in zombie.scripting.objects") script)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Applies settings to entity ui info style aliases.

    Throws:
    :   `Exception`
  + ### LoadColors

    private void LoadColors([XuiSkinScript](../objects/XuiSkinScript.html "class in zombie.scripting.objects") script)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadAllDefaultStyles

    private void LoadAllDefaultStyles([XuiSkinScript](../objects/XuiSkinScript.html "class in zombie.scripting.objects") script)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadDefaultStyle

    private void LoadDefaultStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaClassName,
    [XuiSkinScript.StyleInfoScript](../objects/XuiSkinScript.StyleInfoScript.html "class in zombie.scripting.objects") script)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadAllStyles

    private void LoadAllStyles([XuiSkinScript](../objects/XuiSkinScript.html "class in zombie.scripting.objects") script)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### LoadStyle

    private void LoadStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaClassName,
    [XuiSkinScript.StyleInfoScript](../objects/XuiSkinScript.StyleInfoScript.html "class in zombie.scripting.objects") script)
    throws [Exception](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Exception.html "class or interface in java.lang")

    Throws:
    :   `Exception`
  + ### debugPrint

    public void debugPrint()
  + ### printEntityStyle

    private void printEntityStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") styleName,
    [XuiSkin.EntityUiStyle](XuiSkin.EntityUiStyle.html "class in zombie.scripting.ui") style)
  + ### printComponentStyle

    private void printComponentStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prefix,
    [ComponentType](../../entity/ComponentType.html "enum class in zombie.entity") componentType,
    [XuiSkin.ComponentUiStyle](XuiSkin.ComponentUiStyle.html "class in zombie.scripting.ui") style)
  + ### printStyle

    private void printStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaClassName,
    [XuiSkin.StyleInfo](XuiSkin.StyleInfo.html "class in zombie.scripting.ui") styleInfo)
  + ### printStyle

    private void printStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") prefix,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") styleName,
    [XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") style)