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
3. [BooleanServerOption](ServerOptions.BooleanServerOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Constructor Details](#constructor-detail)
   1. [BooleanServerOption(ServerOptions, String, boolean)](#%3Cinit%3E(zombie.network.ServerOptions,java.lang.String,boolean))
7. [Method Details](#method-detail)
   1. [asConfigOption()](#asConfigOption())
   2. [getTooltip()](#getTooltip())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ServerOptions.BooleanServerOption
=======================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](../config/ConfigOption.html "class in zombie.config")

[zombie.config.BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config")

zombie.network.ServerOptions.BooleanServerOption

All Implemented Interfaces:
:   `ServerOptions.ServerOption`

Enclosing class:
:   `ServerOptions`

---

public static class ServerOptions.BooleanServerOption
extends [BooleanConfigOption](../config/BooleanConfigOption.html "class in zombie.config")
implements [ServerOptions.ServerOption](ServerOptions.ServerOption.html "interface in zombie.network")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](../config/ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  ### Fields inherited from class [BooleanConfigOption](../config/BooleanConfigOption.html#field-summary "class in zombie.config")

  `defaultValue, value`

  ### Fields inherited from class [ConfigOption](../config/ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `BooleanServerOption(ServerOptions owner,
  String name,
  boolean defaultValue)`
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

  ### Methods inherited from class [BooleanConfigOption](../config/BooleanConfigOption.html#method-summary "class in zombie.config")

  `getDefaultValue, getType, getValue, getValueAsObject, getValueAsString, isValidString, makeCopy, parse, resetToDefault, setDefaultToCurrentValue, setValue, setValueFromObject`

  ### Methods inherited from class [ConfigOption](../config/ConfigOption.html#method-summary "class in zombie.config")

  `getName, getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### BooleanServerOption

    public BooleanServerOption([ServerOptions](ServerOptions.html "class in zombie.network") owner,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    boolean defaultValue)
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
    :   `getTooltip` in class `BooleanConfigOption`