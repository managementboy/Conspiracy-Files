[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.config](package-summary.html)
2. [IntegerConfigOption](IntegerConfigOption.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [value](#value)
   2. [defaultValue](#defaultValue)
   3. [min](#min)
   4. [max](#max)
7. [Constructor Details](#constructor-detail)
   1. [IntegerConfigOption(String, int, int, int)](#%3Cinit%3E(java.lang.String,int,int,int))
   2. [IntegerConfigOption(String, int, int, int, ConfigOption.ConfigOptionOnChangeCallback)](#%3Cinit%3E(java.lang.String,int,int,int,zombie.config.ConfigOption.ConfigOptionOnChangeCallback))
8. [Method Details](#method-detail)
   1. [getType()](#getType())
   2. [resetToDefault()](#resetToDefault())
   3. [getMin()](#getMin())
   4. [getMax()](#getMax())
   5. [setDefaultToCurrentValue()](#setDefaultToCurrentValue())
   6. [parse(String)](#parse(java.lang.String))
   7. [getValueAsString()](#getValueAsString())
   8. [setValueFromObject(Object)](#setValueFromObject(java.lang.Object))
   9. [getValueAsObject()](#getValueAsObject())
   10. [isValidString(String)](#isValidString(java.lang.String))
   11. [setValue(int)](#setValue(int))
   12. [getValue()](#getValue())
   13. [getDefaultValue()](#getDefaultValue())
   14. [getTooltip()](#getTooltip())
   15. [makeCopy()](#makeCopy())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IntegerConfigOption
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](ConfigOption.html "class in zombie.config")

zombie.config.IntegerConfigOption

Direct Known Subclasses:
:   `DebugChunkState.IntegerDebugOption, EnumConfigOption, SandboxOptions.IntegerSandboxOption, ServerOptions.IntegerServerOption`

---

public class IntegerConfigOption
extends [ConfigOption](ConfigOption.html "class in zombie.config")

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [ConfigOption](ConfigOption.html#nested-class-summary "class in zombie.config")

  `ConfigOption.ConfigOptionOnChangeCallback`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected int`

  `defaultValue`

  `protected int`

  `max`

  `protected int`

  `min`

  `protected int`

  `value`

  ### Fields inherited from class [ConfigOption](ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IntegerConfigOption(String name,
  int min,
  int max,
  int defaultValue)`

  `IntegerConfigOption(String name,
  int min,
  int max,
  int defaultValue,
  ConfigOption.ConfigOptionOnChangeCallback onChange)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getDefaultValue()`

  `double`

  `getMax()`

  `double`

  `getMin()`

  `String`

  `getTooltip()`

  `String`

  `getType()`

  `int`

  `getValue()`

  `Object`

  `getValueAsObject()`

  `String`

  `getValueAsString()`

  `boolean`

  `isValidString(String s)`

  `ConfigOption`

  `makeCopy()`

  `void`

  `parse(String s)`

  `void`

  `resetToDefault()`

  `void`

  `setDefaultToCurrentValue()`

  `void`

  `setValue(int value)`

  `void`

  `setValueFromObject(Object o)`

  ### Methods inherited from class [ConfigOption](ConfigOption.html#method-summary "class in zombie.config")

  `getName, getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### value

    protected int value
  + ### defaultValue

    protected int defaultValue
  + ### min

    protected int min
  + ### max

    protected int max
* Constructor Details
  -------------------

  + ### IntegerConfigOption

    public IntegerConfigOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int min,
    int max,
    int defaultValue)
  + ### IntegerConfigOption

    public IntegerConfigOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    int min,
    int max,
    int defaultValue,
    [ConfigOption.ConfigOptionOnChangeCallback](ConfigOption.ConfigOptionOnChangeCallback.html "interface in zombie.config") onChange)
* Method Details
  --------------

  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()

    Specified by:
    :   `getType` in class `ConfigOption`
  + ### resetToDefault

    public void resetToDefault()

    Specified by:
    :   `resetToDefault` in class `ConfigOption`
  + ### getMin

    public double getMin()
  + ### getMax

    public double getMax()
  + ### setDefaultToCurrentValue

    public void setDefaultToCurrentValue()

    Specified by:
    :   `setDefaultToCurrentValue` in class `ConfigOption`
  + ### parse

    public void parse([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)

    Specified by:
    :   `parse` in class `ConfigOption`
  + ### getValueAsString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getValueAsString()

    Specified by:
    :   `getValueAsString` in class `ConfigOption`
  + ### setValueFromObject

    public void setValueFromObject([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o)

    Specified by:
    :   `setValueFromObject` in class `ConfigOption`
  + ### getValueAsObject

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") getValueAsObject()

    Specified by:
    :   `getValueAsObject` in class `ConfigOption`
  + ### isValidString

    public boolean isValidString([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") s)

    Specified by:
    :   `isValidString` in class `ConfigOption`
  + ### setValue

    public void setValue(int value)
  + ### getValue

    public int getValue()
  + ### getDefaultValue

    public int getDefaultValue()
  + ### getTooltip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()

    Specified by:
    :   `getTooltip` in class `ConfigOption`
  + ### makeCopy

    public [ConfigOption](ConfigOption.html "class in zombie.config") makeCopy()

    Specified by:
    :   `makeCopy` in class `ConfigOption`