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
3. [EntityUiStyle](XuiSkin.EntityUiStyle.html)

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
   5. [componentUiStyleMap](#componentUiStyleMap)
   6. [displayName](#displayName)
   7. [description](#description)
   8. [buildDescription](#buildDescription)
   9. [icon](#icon)
6. [Constructor Details](#constructor-detail)
   1. [EntityUiStyle()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getLuaWindowClass()](#getLuaWindowClass())
   2. [getXuiStyle()](#getXuiStyle())
   3. [getLuaCanOpenWindow()](#getLuaCanOpenWindow())
   4. [getLuaOpenWindow()](#getLuaOpenWindow())
   5. [getDisplayName()](#getDisplayName())
   6. [getDescription()](#getDescription())
   7. [getBuildDescription()](#getBuildDescription())
   8. [getIcon()](#getIcon())
   9. [getComponentUiStyle(ComponentType)](#getComponentUiStyle(zombie.entity.ComponentType))
   10. [isComponentEnabled(ComponentType)](#isComponentEnabled(zombie.entity.ComponentType))
   11. [copy()](#copy())
   12. [Load(XuiSkinScript.EntityUiScript)](#Load(zombie.scripting.objects.XuiSkinScript.EntityUiScript))
   13. [LoadComponentInfo(XuiSkinScript.EntityUiScript)](#LoadComponentInfo(zombie.scripting.objects.XuiSkinScript.EntityUiScript))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiSkin.EntityUiStyle
===========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.ui.XuiSkin.EntityUiStyle

Enclosing class:
:   `XuiSkin`

---

public static class XuiSkin.EntityUiStyle
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `buildDescription`

  `private final Map<ComponentType, XuiSkin.ComponentUiStyle>`

  `componentUiStyleMap`

  `private String`

  `description`

  `private String`

  `displayName`

  `private Texture`

  `icon`

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

  `EntityUiStyle()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private XuiSkin.EntityUiStyle`

  `copy()`

  `String`

  `getBuildDescription()`

  `XuiSkin.ComponentUiStyle`

  `getComponentUiStyle(ComponentType componentType)`

  `String`

  `getDescription()`

  `String`

  `getDisplayName()`

  `Texture`

  `getIcon()`

  `Object`

  `getLuaCanOpenWindow()`

  `Object`

  `getLuaOpenWindow()`

  `String`

  `getLuaWindowClass()`

  `String`

  `getXuiStyle()`

  `boolean`

  `isComponentEnabled(ComponentType componentType)`

  `private void`

  `Load(XuiSkinScript.EntityUiScript script)`

  `private void`

  `LoadComponentInfo(XuiSkinScript.EntityUiScript script)`

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
  + ### componentUiStyleMap

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[ComponentType](../../entity/ComponentType.html "enum class in zombie.entity"), [XuiSkin.ComponentUiStyle](XuiSkin.ComponentUiStyle.html "class in zombie.scripting.ui")> componentUiStyleMap
  + ### displayName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName
  + ### description

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") description
  + ### buildDescription

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") buildDescription
  + ### icon

    private [Texture](../../core/textures/Texture.html "class in zombie.core.textures") icon
* Constructor Details
  -------------------

  + ### EntityUiStyle

    public EntityUiStyle()
* Method Details
  --------------

  + ### getLuaWindowClass

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLuaWindowClass()
  + ### getXuiStyle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getXuiStyle()
  + ### getLuaCanOpenWindow

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getLuaCanOpenWindow()
  + ### getLuaOpenWindow

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getLuaOpenWindow()
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()
  + ### getDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDescription()
  + ### getBuildDescription

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBuildDescription()
  + ### getIcon

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getIcon()
  + ### getComponentUiStyle

    public [XuiSkin.ComponentUiStyle](XuiSkin.ComponentUiStyle.html "class in zombie.scripting.ui") getComponentUiStyle([ComponentType](../../entity/ComponentType.html "enum class in zombie.entity") componentType)
  + ### isComponentEnabled

    public boolean isComponentEnabled([ComponentType](../../entity/ComponentType.html "enum class in zombie.entity") componentType)
  + ### copy

    private [XuiSkin.EntityUiStyle](XuiSkin.EntityUiStyle.html "class in zombie.scripting.ui") copy()
  + ### Load

    private void Load([XuiSkinScript.EntityUiScript](../objects/XuiSkinScript.EntityUiScript.html "class in zombie.scripting.objects") script)
  + ### LoadComponentInfo

    private void LoadComponentInfo([XuiSkinScript.EntityUiScript](../objects/XuiSkinScript.EntityUiScript.html "class in zombie.scripting.objects") script)