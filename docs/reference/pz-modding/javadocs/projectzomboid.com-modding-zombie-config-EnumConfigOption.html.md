[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.config](package-summary.html)
2. [EnumConfigOption](EnumConfigOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Constructor Details](#constructor-detail)
   1. [EnumConfigOption(String, int, int)](#%3Cinit%3E(java.lang.String,int,int))
7. [Method Details](#method-detail)
   1. [getType()](#getType())
   2. [getNumValues()](#getNumValues())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class EnumConfigOption
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](ConfigOption.html "class in zombie.config")

[zombie.config.IntegerConfigOption](IntegerConfigOption.html "class in zombie.config")

zombie.config.EnumConfigOption

Direct Known Subclasses:
:   `SandboxOptions.EnumSandboxOption, ServerOptions.EnumServerOption`

---

public class EnumConfigOption
extends [IntegerConfigOption](IntegerConfigOption.html "class in zombie.config")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  ### Fields inherited from class [IntegerConfigOption](IntegerConfigOption.html#field-summary "class in zombie.config")

  `defaultValue, max, min, value`

  ### Fields inherited from class [ConfigOption](ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `EnumConfigOption(String name,
  int numValues,
  int defaultValue)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getNumValues()`

  `String`

  `getType()`

  ### Methods inherited from class [IntegerConfigOption](IntegerConfigOption.html#method-summary "class in zombie.config")

  `getDefaultValue, getMax, getMin, getTooltip, getValue, getValueAsObject, getValueAsString, isValidString, makeCopy, parse, resetToDefault, setDefaultToCurrentValue, setValue, setValueFromObject`

  ### Methods inherited from class [ConfigOption](ConfigOption.html#method-summary "class in zombie.config")

  `getName, getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Constructor Details
  -------------------

  + ### EnumConfigOption

    public EnumConfigOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int numValues,
    int defaultValue)
* Method Details
  --------------

  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()

    Overrides:
    :   `getType` in class `IntegerConfigOption`
  + ### getNumValues

    public int getNumValues()