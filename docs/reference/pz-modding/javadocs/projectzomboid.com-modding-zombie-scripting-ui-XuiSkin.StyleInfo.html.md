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
3. [StyleInfo](XuiSkin.StyleInfo.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [defaultStyle](#defaultStyle)
   2. [styles](#styles)
6. [Constructor Details](#constructor-detail)
   1. [StyleInfo()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getDefaultStyle()](#getDefaultStyle())
   2. [getStyle(String)](#getStyle(java.lang.String))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class XuiSkin.StyleInfo
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.ui.XuiSkin.StyleInfo

Enclosing class:
:   `XuiSkin`

---

private static class XuiSkin.StyleInfo
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private XuiLuaStyle`

  `defaultStyle`

  `private final Map<String, XuiLuaStyle>`

  `styles`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `StyleInfo()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `XuiLuaStyle`

  `getDefaultStyle()`

  `XuiLuaStyle`

  `getStyle(String name)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### defaultStyle

    private [XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") defaultStyle
  + ### styles

    private final [Map](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Map.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang"), [XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui")> styles
* Constructor Details
  -------------------

  + ### StyleInfo

    private StyleInfo()
* Method Details
  --------------

  + ### getDefaultStyle

    public [XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") getDefaultStyle()
  + ### getStyle

    public [XuiLuaStyle](XuiLuaStyle.html "class in zombie.scripting.ui") getStyle([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)