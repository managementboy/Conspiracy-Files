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
3. [ComponentUiStyle](XuiSkin.ComponentUiStyle.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [luaPanelClass](#luaPanelClass)
   2. [xuiStyle](#xuiStyle)
   3. [displayName](#displayName)
   4. [icon](#icon)
   5. [listOrderZ](#listOrderZ)
   6. [enabled](#enabled)
6. [Constructor Details](#constructor-detail)
   1. [ComponentUiStyle()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getLuaPanelClass()](#getLuaPanelClass())
   2. [getXuiStyle()](#getXuiStyle())
   3. [isEnabled()](#isEnabled())
   4. [getIcon()](#getIcon())
   5. [getListOrderZ()](#getListOrderZ())
   6. [getDisplayName()](#getDisplayName())
   7. [copy()](#copy())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiSkin.ComponentUiStyle
==============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.ui.XuiSkin.ComponentUiStyle

Enclosing class:
:   `XuiSkin`

---

public static class XuiSkin.ComponentUiStyle
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `displayName`

  `private boolean`

  `enabled`

  `private Texture`

  `icon`

  `private int`

  `listOrderZ`

  `private String`

  `luaPanelClass`

  `private String`

  `xuiStyle`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ComponentUiStyle()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private XuiSkin.ComponentUiStyle`

  `copy()`

  `String`

  `getDisplayName()`

  `Texture`

  `getIcon()`

  `int`

  `getListOrderZ()`

  `String`

  `getLuaPanelClass()`

  `String`

  `getXuiStyle()`

  `boolean`

  `isEnabled()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### luaPanelClass

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") luaPanelClass
  + ### xuiStyle

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") xuiStyle
  + ### displayName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") displayName
  + ### icon

    private [Texture](../../core/textures/Texture.html "class in zombie.core.textures") icon
  + ### listOrderZ

    private int listOrderZ
  + ### enabled

    private boolean enabled
* Constructor Details
  -------------------

  + ### ComponentUiStyle

    public ComponentUiStyle()
* Method Details
  --------------

  + ### getLuaPanelClass

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getLuaPanelClass()
  + ### getXuiStyle

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getXuiStyle()
  + ### isEnabled

    public boolean isEnabled()
  + ### getIcon

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getIcon()
  + ### getListOrderZ

    public int getListOrderZ()
  + ### getDisplayName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getDisplayName()
  + ### copy

    private [XuiSkin.ComponentUiStyle](XuiSkin.ComponentUiStyle.html "class in zombie.scripting.ui") copy()