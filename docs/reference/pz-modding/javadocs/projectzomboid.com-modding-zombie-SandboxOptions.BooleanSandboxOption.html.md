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
3. [BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [translation](#translation)
   2. [tableName](#tableName)
   3. [shortName](#shortName)
   4. [custom](#custom)
   5. [pageName](#pageName)
7. [Constructor Details](#constructor-detail)
   1. [BooleanSandboxOption(SandboxOptions, String, boolean)](#%3Cinit%3E(zombie.SandboxOptions,java.lang.String,boolean))
8. [Method Details](#method-detail)
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

Class SandboxOptions.BooleanSandboxOption
=========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](config/ConfigOption.html "class in zombie.config")

[zombie.config.BooleanConfigOption](config/BooleanConfigOption.html "class in zombie.config")

zombie.SandboxOptions.BooleanSandboxOption

All Implemented Interfaces:
:   `SandboxOptions.SandboxOption`

Enclosing class:
:   `SandboxOptions`

---

public static class SandboxOptions.BooleanSandboxOption
extends [BooleanConfigOption](config/BooleanConfigOption.html "class in zombie.config")
implements [SandboxOptions.SandboxOption](SandboxOptions.SandboxOption.html "interface in zombie")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](config/ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected boolean`

  `custom`

  `protected String`

  `pageName`

  `protected String`

  `shortName`

  `protected String`

  `tableName`

  `protected String`

  `translation`

  ### Fields inherited from class [BooleanConfigOption](config/BooleanConfigOption.html#field-summary "class in zombie.config")

  `defaultValue, value`

  ### Fields inherited from class [ConfigOption](config/ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BooleanSandboxOption(SandboxOptions owner,
  String name,
  boolean defaultValue)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `BooleanConfigOption`

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

  `SandboxOptions.BooleanSandboxOption`

  `setPageName(String pageName)`

  `SandboxOptions.BooleanSandboxOption`

  `setTranslation(String translation)`

  `void`

  `toTable(se.krka.kahlua.vm.KahluaTable table)`

  ### Methods inherited from class [BooleanConfigOption](config/BooleanConfigOption.html#method-summary "class in zombie.config")

  `getDefaultValue, getType, getValue, getValueAsObject, getValueAsString, isValidString, makeCopy, parse, resetToDefault, setDefaultToCurrentValue, setValue, setValueFromObject`

  ### Methods inherited from class [ConfigOption](config/ConfigOption.html#method-summary "class in zombie.config")

  `getName, getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### translation

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translation
  + ### tableName

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tableName
  + ### shortName

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") shortName
  + ### custom

    protected boolean custom
  + ### pageName

    protected [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pageName
* Constructor Details
  -------------------

  + ### BooleanSandboxOption

    public BooleanSandboxOption([SandboxOptions](SandboxOptions.html "class in zombie") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean defaultValue)
* Method Details
  --------------

  + ### asConfigOption

    public [BooleanConfigOption](config/BooleanConfigOption.html "class in zombie.config") asConfigOption()

    Specified by:
    :   `asConfigOption` in interface `SandboxOptions.SandboxOption`
  + ### getShortName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getShortName()

    Specified by:
    :   `getShortName` in interface `SandboxOptions.SandboxOption`
  + ### getTableName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTableName()

    Specified by:
    :   `getTableName` in interface `SandboxOptions.SandboxOption`
  + ### setTranslation

    public [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") setTranslation([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") translation)

    Specified by:
    :   `setTranslation` in interface `SandboxOptions.SandboxOption`
  + ### getTranslatedName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTranslatedName()

    Specified by:
    :   `getTranslatedName` in interface `SandboxOptions.SandboxOption`
  + ### getTooltip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()

    Specified by:
    :   `getTooltip` in interface `SandboxOptions.SandboxOption`

    Overrides:
    :   `getTooltip` in class `BooleanConfigOption`
  + ### fromTable

    public void fromTable(se.krka.kahlua.vm.KahluaTable table)

    Specified by:
    :   `fromTable` in interface `SandboxOptions.SandboxOption`
  + ### toTable

    public void toTable(se.krka.kahlua.vm.KahluaTable table)

    Specified by:
    :   `toTable` in interface `SandboxOptions.SandboxOption`
  + ### setCustom

    public void setCustom()

    Specified by:
    :   `setCustom` in interface `SandboxOptions.SandboxOption`
  + ### isCustom

    public boolean isCustom()

    Specified by:
    :   `isCustom` in interface `SandboxOptions.SandboxOption`
  + ### setPageName

    public [SandboxOptions.BooleanSandboxOption](SandboxOptions.BooleanSandboxOption.html "class in zombie") setPageName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") pageName)

    Specified by:
    :   `setPageName` in interface `SandboxOptions.SandboxOption`
  + ### getPageName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getPageName()

    Specified by:
    :   `getPageName` in interface `SandboxOptions.SandboxOption`