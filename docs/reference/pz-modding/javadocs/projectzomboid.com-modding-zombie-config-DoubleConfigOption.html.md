[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.config](package-summary.html)
2. [DoubleConfigOption](DoubleConfigOption.html)

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
   1. [DoubleConfigOption(String, double, double, double)](#%3Cinit%3E(java.lang.String,double,double,double))
8. [Method Details](#method-detail)
   1. [getType()](#getType())
   2. [getMin()](#getMin())
   3. [getMax()](#getMax())
   4. [resetToDefault()](#resetToDefault())
   5. [setDefaultToCurrentValue()](#setDefaultToCurrentValue())
   6. [parse(String)](#parse(java.lang.String))
   7. [getValueAsString()](#getValueAsString())
   8. [setValueFromObject(Object)](#setValueFromObject(java.lang.Object))
   9. [getValueAsObject()](#getValueAsObject())
   10. [isValidString(String)](#isValidString(java.lang.String))
   11. [setValue(double)](#setValue(double))
   12. [getValue()](#getValue())
   13. [getDefaultValue()](#getDefaultValue())
   14. [setDefault(double)](#setDefault(double))
   15. [getTooltip()](#getTooltip())
   16. [makeCopy()](#makeCopy())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class DoubleConfigOption
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.config.ConfigOption](ConfigOption.html "class in zombie.config")

zombie.config.DoubleConfigOption

Direct Known Subclasses:
:   `DebugChunkState.DoubleDebugOption, FBORenderTracerEffects.DoubleConfigOption1, SandboxOptions.DoubleSandboxOption, ServerOptions.DoubleServerOption`

---

public class DoubleConfigOption
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

  `protected double`

  `defaultValue`

  `protected double`

  `max`

  `protected double`

  `min`

  `protected double`

  `value`

  ### Fields inherited from class [ConfigOption](ConfigOption.html#field-summary "class in zombie.config")

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DoubleConfigOption(String name,
  double min,
  double max,
  double defaultValue)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `double`

  `getDefaultValue()`

  `double`

  `getMax()`

  `double`

  `getMin()`

  `String`

  `getTooltip()`

  `String`

  `getType()`

  `double`

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

  `setDefault(double value)`

  `void`

  `setDefaultToCurrentValue()`

  `void`

  `setValue(double value)`

  `void`

  `setValueFromObject(Object o)`

  ### Methods inherited from class [ConfigOption](ConfigOption.html#method-summary "class in zombie.config")

  `getName, getValueAsLuaString, invokeOnChangeEvent, setOnChangeCallback`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### value

    protected double value
  + ### defaultValue

    protected double defaultValue
  + ### min

    protected double min
  + ### max

    protected double max
* Constructor Details
  -------------------

  + ### DoubleConfigOption

    public DoubleConfigOption([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    double min,
    double max,
    double defaultValue)
* Method Details
  --------------

  + ### getType

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getType()

    Specified by:
    :   `getType` in class `ConfigOption`
  + ### getMin

    public double getMin()
  + ### getMax

    public double getMax()
  + ### resetToDefault

    public void resetToDefault()

    Specified by:
    :   `resetToDefault` in class `ConfigOption`
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

    public void setValue(double value)
  + ### getValue

    public double getValue()
  + ### getDefaultValue

    public double getDefaultValue()
  + ### setDefault

    public void setDefault(double value)
  + ### getTooltip

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTooltip()

    Specified by:
    :   `getTooltip` in class `ConfigOption`
  + ### makeCopy

    public [ConfigOption](ConfigOption.html "class in zombie.config") makeCopy()

    Specified by:
    :   `makeCopy` in class `ConfigOption`