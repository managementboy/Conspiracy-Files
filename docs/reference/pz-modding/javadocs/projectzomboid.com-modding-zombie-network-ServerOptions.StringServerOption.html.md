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
3. [StringServerOption](ServerOptions.StringServerOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Constructor Details](#constructor-detail)
   1. [StringServerOption(ServerOptions, String, String, int)](#%3Cinit%3E(zombie.network.ServerOptions,java.lang.String,java.lang.String,int))
7. [Method Details](#method-detail)
   1. [asConfigOption()](#asConfigOption())
   2. [getTooltip()](#getTooltip())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ServerOptions.StringServerOption
======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](../config/ConfigOption.html "class in zombie.config")

[zombie.config.StringConfigOption](../config/StringConfigOption.html "class in zombie.config")

zombie.network.ServerOptions.StringServerOption

All Implemented Interfaces:
:   `ServerOptions.ServerOption`

Enclosing class:
:   `ServerOptions`

---

public static class ServerOptions.StringServerOption
extends [StringConfigOption](../config/StringConfigOption.html "class in zombie.config")
implements [ServerOptions.ServerOption](ServerOptions.ServerOption.html "interface in zombie.network")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](../config/ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  ### Fields inherited from class [StringConfigOption](../config/StringConfigOption.html#field-summary "class in zombie.config")

  `defaultValue, maxLength, value, values`

  ### Fields inherited from class [ConfigOption](../config/ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `StringServerOption(ServerOptions owner,
  String name,
  String defaultValue,
  int maxLength)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `ConfigOption`

  `asConfigOption()`

  `String`

  `getTooltip()`

  ### Methods inherited from class [StringConfigOption](../config/StringConfigOption.html#method-summary "class in zombie.config")

  `getDefaultValue, getSplitCSVList, getType, getValue, getValueAsLuaString, getValueAsObject, getValueAsString, isValidString, makeCopy, parse, resetToDefault, setDefaultToCurrentValue, setValue, setValueFromObject`

  ### Methods inherited from class [ConfigOption](../config/ConfigOption.html#method-summary "class in zombie.config")

  `getName, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### StringServerOption

    public StringServerOption([ServerOptions](ServerOptions.html "class in zombie.network") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") defaultValue,
    int maxLength)
* Method Details
  --------------

  + ### asConfigOption

    public [ConfigOption](../config/ConfigOption.html "class in zombie.config") asConfigOption()

    Specified by:
    :   `asConfigOption` in interface `ServerOptions.ServerOption`
  + ### getTooltip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()

    Specified by:
    :   `getTooltip` in interface `ServerOptions.ServerOption`

    Overrides:
    :   `getTooltip` in class `StringConfigOption`