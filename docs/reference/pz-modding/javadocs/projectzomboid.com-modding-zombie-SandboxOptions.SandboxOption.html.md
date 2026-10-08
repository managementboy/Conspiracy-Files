[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [SandboxOptions](SandboxOptions.html)
3. [SandboxOption](SandboxOptions.SandboxOption.html)

Contents

1. [Description](#)
2. [Method Summary](#method-summary)
3. [Method Details](#method-detail)
   1. [asConfigOption()](#asConfigOption())
   2. [getShortName()](#getShortName())
   3. [getTableName()](#getTableName())
   4. [setTranslation(String)](#setTranslation(java.lang.String))
   5. [getTranslatedName()](#getTranslatedName())
   6. [getTooltip()](#getTooltip())
   7. [fromTable(KahluaTable)](#fromTable(se.krka.kahlua.vm.KahluaTable))
   8. [toTable(KahluaTable)](#toTable(se.krka.kahlua.vm.KahluaTable))
   9. [setCustom()](#setCustom())
   10. [isCustom()](#isCustom())
   11. [setPageName(String)](#setPageName(java.lang.String))
   12. [getPageName()](#getPageName())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Interface SandboxOptions.SandboxOption
======================================

All Known Implementing Classes:
:   `SandboxOptions.BooleanSandboxOption, SandboxOptions.DoubleSandboxOption, SandboxOptions.EnumSandboxOption, SandboxOptions.IntegerSandboxOption, SandboxOptions.StringSandboxOption, SandboxOptions.StrongEnumSandboxOption`

Enclosing class:
:   `SandboxOptions`

---

public static interface SandboxOptions.SandboxOption

* Method Summary
  --------------

  All MethodsInstance MethodsAbstract Methods

  Modifier and Type

  Method

  Description

  `ConfigOption`

  `asConfigOption()`

  `void`

  `fromTable(se.krka.kahlua.vm.KahluaTable table)`

  `String`

  `getPageName()`

  `String`

  `getShortName()`

  `String`

  `getTableName()`

  `String`

  `getTooltip()`

  `String`

  `getTranslatedName()`

  `boolean`

  `isCustom()`

  `void`

  `setCustom()`

  `SandboxOptions.SandboxOption`

  `setPageName(String pageName)`

  `SandboxOptions.SandboxOption`

  `setTranslation(String translation)`

  `void`

  `toTable(se.krka.kahlua.vm.KahluaTable table)`

* Method Details
  --------------

  + ### asConfigOption

    [ConfigOption](config/ConfigOption.html "class in zombie.config") asConfigOption()
  + ### getShortName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getShortName()
  + ### getTableName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTableName()
  + ### setTranslation

    [SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie") setTranslation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translation)
  + ### getTranslatedName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedName()
  + ### getTooltip

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()
  + ### fromTable

    void fromTable(se.krka.kahlua.vm.KahluaTable table)
  + ### toTable

    void toTable(se.krka.kahlua.vm.KahluaTable table)
  + ### setCustom

    void setCustom()
  + ### isCustom

    boolean isCustom()
  + ### setPageName

    [SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie") setPageName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pageName)
  + ### getPageName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPageName()