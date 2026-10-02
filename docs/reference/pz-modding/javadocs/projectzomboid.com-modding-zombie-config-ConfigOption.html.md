[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.config](package-summary.html)
2. [ConfigOption](ConfigOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [name](#name)
   2. [onChangedCallback](#onChangedCallback)
7. [Constructor Details](#constructor-detail)
   1. [ConfigOption(String)](#%3Cinit%3E(java.lang.String))
8. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [getType()](#getType())
   3. [resetToDefault()](#resetToDefault())
   4. [setDefaultToCurrentValue()](#setDefaultToCurrentValue())
   5. [parse(String)](#parse(java.lang.String))
   6. [getValueAsString()](#getValueAsString())
   7. [getValueAsLuaString()](#getValueAsLuaString())
   8. [setValueFromObject(Object)](#setValueFromObject(java.lang.Object))
   9. [getValueAsObject()](#getValueAsObject())
   10. [isValidString(String)](#isValidString(java.lang.String))
   11. [getTooltip()](#getTooltip())
   12. [makeCopy()](#makeCopy())
   13. [setOnChangeCallback(ConfigOption.ConfigOptionOnChangeCallback)](#setOnChangeCallback(zombie.config.ConfigOption.ConfigOptionOnChangeCallback))
   14. [invokeOnChangeEvent()](#invokeOnChangeEvent())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class ConfigOption
==================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.config.ConfigOption

Direct Known Subclasses:
:   `ArrayConfigOption, BooleanConfigOption, DoubleConfigOption, IntegerConfigOption, StringConfigOption`

---

public abstract class ConfigOption
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static interface`

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final String`

  `name`

  `private ConfigOption.ConfigOptionOnChangeCallback`

  `onChangedCallback`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ConfigOption(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getName()`

  `abstract String`

  `getTooltip()`

  `abstract String`

  `getType()`

  `String`

  `getValueAsLuaString()`

  `abstract Object`

  `getValueAsObject()`

  `abstract String`

  `getValueAsString()`

  `void`

  `invokeOnChangeEvent()`

  `abstract boolean`

  `isValidString(String s)`

  `abstract ConfigOption`

  `makeCopy()`

  `abstract void`

  `parse(String s)`

  `abstract void`

  `resetToDefault()`

  `abstract void`

  `setDefaultToCurrentValue()`

  `void`

  `setOnChangeCallback(ConfigOption.ConfigOptionOnChangeCallback onChange)`

  `abstract void`

  `setValueFromObject(Object o)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    protected final [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### onChangedCallback

    private [ConfigOption.ConfigOptionOnChangeCallback](ConfigOption.ConfigOptionOnChangeCallback.html "interface in zombie.config") onChangedCallback
* Constructor Details
  -------------------

  + ### ConfigOption

    public ConfigOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getType

    public abstract [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()
  + ### resetToDefault

    public abstract void resetToDefault()
  + ### setDefaultToCurrentValue

    public abstract void setDefaultToCurrentValue()
  + ### parse

    public abstract void parse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getValueAsString

    public abstract [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueAsString()
  + ### getValueAsLuaString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueAsLuaString()
  + ### setValueFromObject

    public abstract void setValueFromObject([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)
  + ### getValueAsObject

    public abstract [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getValueAsObject()
  + ### isValidString

    public abstract boolean isValidString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)
  + ### getTooltip

    public abstract [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()
  + ### makeCopy

    public abstract [ConfigOption](ConfigOption.html "class in zombie.config") makeCopy()
  + ### setOnChangeCallback

    public void setOnChangeCallback([ConfigOption.ConfigOptionOnChangeCallback](ConfigOption.ConfigOptionOnChangeCallback.html "interface in zombie.config") onChange)
  + ### invokeOnChangeEvent

    public void invokeOnChangeEvent()