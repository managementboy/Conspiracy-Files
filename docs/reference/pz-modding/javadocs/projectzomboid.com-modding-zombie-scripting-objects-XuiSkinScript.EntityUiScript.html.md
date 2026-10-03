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
3. [EntityUiScript](XuiSkinScript.EntityUiScript.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [luaWindowClass](#luaWindowClass)
   2. [xuiStyle](#xuiStyle)
   3. [luaCanOpenWindow](#luaCanOpenWindow)
   4. [luaOpenWindow](#luaOpenWindow)
   5. [displayName](#displayName)
   6. [description](#description)
   7. [buildDescription](#buildDescription)
   8. [iconPath](#iconPath)
   9. [clearComponents](#clearComponents)
   10. [componentUiScriptMap](#componentUiScriptMap)
6. [Constructor Details](#constructor-detail)
   1. [EntityUiScript()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getLuaWindowClass()](#getLuaWindowClass())
   2. [getXuiStyle()](#getXuiStyle())
   3. [getLuaCanOpenWindow()](#getLuaCanOpenWindow())
   4. [getLuaOpenWindow()](#getLuaOpenWindow())
   5. [getDisplayName()](#getDisplayName())
   6. [getDescription()](#getDescription())
   7. [getBuildDescription()](#getBuildDescription())
   8. [getIconPath()](#getIconPath())
   9. [isClearComponents()](#isClearComponents())
   10. [getComponentUiScriptMap()](#getComponentUiScriptMap())
   11. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiSkinScript.EntityUiScript
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.XuiSkinScript.EntityUiScript

Enclosing class:
:   `XuiSkinScript`

---

public static class XuiSkinScript.EntityUiScript
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `buildDescription`

  `private boolean`

  `clearComponents`

  `private final Map<ComponentType, XuiSkinScript.ComponentUiScript>`

  `componentUiScriptMap`

  `private String`

  `description`

  `private String`

  `displayName`

  `private String`

  `iconPath`

  `private String`

  `luaCanOpenWindow`

  `private String`

  `luaOpenWindow`

  `private String`

  `luaWindowClass`

  `private String`

  `xuiStyle`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `EntityUiScript()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getBuildDescription()`

  `Map<ComponentType, XuiSkinScript.ComponentUiScript>`

  `getComponentUiScriptMap()`

  `String`

  `getDescription()`

  `String`

  `getDisplayName()`

  `String`

  `getIconPath()`

  `String`

  `getLuaCanOpenWindow()`

  `String`

  `getLuaOpenWindow()`

  `String`

  `getLuaWindowClass()`

  `String`

  `getXuiStyle()`

  `boolean`

  `isClearComponents()`

  `protected void`

  `reset()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### luaWindowClass

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaWindowClass
  + ### xuiStyle

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiStyle
  + ### luaCanOpenWindow

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaCanOpenWindow
  + ### luaOpenWindow

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaOpenWindow
  + ### displayName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName
  + ### description

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### buildDescription

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") buildDescription
  + ### iconPath

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") iconPath
  + ### clearComponents

    private boolean clearComponents
  + ### componentUiScriptMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[ComponentType](../../entity/ComponentType.html "enum class in zombie.entity"), [XuiSkinScript.ComponentUiScript](XuiSkinScript.ComponentUiScript.html "class in zombie.scripting.objects")> componentUiScriptMap
* Constructor Details
  -------------------

  + ### EntityUiScript

    public EntityUiScript()
* Method Details
  --------------

  + ### getLuaWindowClass

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLuaWindowClass()
  + ### getXuiStyle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getXuiStyle()
  + ### getLuaCanOpenWindow

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLuaCanOpenWindow()
  + ### getLuaOpenWindow

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLuaOpenWindow()
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### getBuildDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBuildDescription()
  + ### getIconPath

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getIconPath()
  + ### isClearComponents

    public boolean isClearComponents()
  + ### getComponentUiScriptMap

    public [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[ComponentType](../../entity/ComponentType.html "enum class in zombie.entity"), [XuiSkinScript.ComponentUiScript](XuiSkinScript.ComponentUiScript.html "class in zombie.scripting.objects")> getComponentUiScriptMap()
  + ### reset

    protected void reset()