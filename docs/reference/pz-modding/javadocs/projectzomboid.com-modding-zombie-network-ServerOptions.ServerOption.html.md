[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.network](package-summary.html)
2. [ServerOptions](ServerOptions.html)
3. [ServerOption](ServerOptions.ServerOption.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [asConfigOption()](#asConfigOption())
   2. [getTooltip()](#getTooltip())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Interface ServerOptions.ServerOption
====================================

All Known Implementing Classes:
:   `ServerOptions.BooleanServerOption, ServerOptions.DoubleServerOption, ServerOptions.EnumServerOption, ServerOptions.IntegerServerOption, ServerOptions.StringServerOption, ServerOptions.TextServerOption`

Enclosing class:
:   `ServerOptions`

---

public static interface ServerOptions.ServerOption

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `ConfigOption`

  `asConfigOption()`

  `String`

  `getTooltip()`

* Method Details
  --------------

  + ### asConfigOption

    [ConfigOption](../config/ConfigOption.html "class in zombie.config") asConfigOption()
  + ### getTooltip

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()