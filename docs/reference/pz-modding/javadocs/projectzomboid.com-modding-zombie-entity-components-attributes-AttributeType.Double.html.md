[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.attributes](package-summary.html)
2. [AttributeType](AttributeType.html)
3. [Double](AttributeType.Double.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Constructor Details](#constructor-detail)
   1. [Double(short, String, double)](#%3Cinit%3E(short,java.lang.String,double))
   2. [Double(short, String, double, boolean, Attribute.UI.Display, Attribute.UI.DisplayAsBar, String)](#%3Cinit%3E(short,java.lang.String,double,boolean,zombie.entity.components.attributes.Attribute.UI.Display,zombie.entity.components.attributes.Attribute.UI.DisplayAsBar,java.lang.String))
6. [Method Details](#method-detail)
   1. [getValueType()](#getValueType())
   2. [validate(Double)](#validate(java.lang.Double))
   3. [getMin()](#getMin())
   4. [getMax()](#getMax())
   5. [withinBounds(Double)](#withinBounds(java.lang.Double))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeType.Double
==========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.attributes.AttributeType](AttributeType.html "class in zombie.entity.components.attributes")

[zombie.entity.components.attributes.AttributeType.Numeric](AttributeType.Numeric.html "class in zombie.entity.components.attributes")<[AttributeType.Double](AttributeType.Double.html "class in zombie.entity.components.attributes"), [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>

zombie.entity.components.attributes.AttributeType.Double

Enclosing class:
:   `AttributeType`

---

public static class AttributeType.Double
extends [AttributeType.Numeric](AttributeType.Numeric.html "class in zombie.entity.components.attributes")<[AttributeType.Double](AttributeType.Double.html "class in zombie.entity.components.attributes"), [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [AttributeType.Numeric](AttributeType.Numeric.html#nested-class-summary "class in zombie.entity.components.attributes")

  `AttributeType.Numeric.NumericVars<T>`

  ### Nested classes/interfaces inherited from class [AttributeType](AttributeType.html#nested-class-summary "class in zombie.entity.components.attributes")

  `AttributeType.Bool, AttributeType.Byte, AttributeType.Double, AttributeType.Enum<E>, AttributeType.EnumSet<E>, AttributeType.EnumStringSet<E>, AttributeType.Float, AttributeType.Int, AttributeType.Long, AttributeType.Numeric<C,T>, AttributeType.Short, AttributeType.String`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `Double(short id,
  String name,
  double initialValue)`

  `protected`

  `Double(short id,
  String name,
  double initialValue,
  boolean readOnly,
  Attribute.UI.Display display,
  Attribute.UI.DisplayAsBar asBar,
  String tooltipOverride)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `Double`

  `getMax()`

  `Double`

  `getMin()`

  `AttributeValueType`

  `getValueType()`

  `Double`

  `validate(Double value)`

  `protected boolean`

  `withinBounds(Double value)`

  ### Methods inherited from class [AttributeType.Numeric](AttributeType.Numeric.html#method-summary "class in zombie.entity.components.attributes")

  `getInitialValue, getVars, hasBounds, isRequiresValidation, setBounds`

  ### Methods inherited from class [AttributeType](AttributeType.html#method-summary "class in zombie.entity.components.attributes")

  `getDisplayAsBar, getName, getNameUI, getTranslateKey, id, isDecimal, isHiddenUI, isNumeric, isReadOnly, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Constructor Details
  -------------------

  + ### Double

    protected Double(short id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    double initialValue)
  + ### Double

    protected Double(short id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    double initialValue,
    boolean readOnly,
    [Attribute.UI.Display](Attribute.UI.Display.html "enum class in zombie.entity.components.attributes") display,
    [Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes") asBar,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltipOverride)
* Method Details
  --------------

  + ### getValueType

    public [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") getValueType()

    Overrides:
    :   `getValueType` in class `AttributeType.Numeric<AttributeType.Double, Double>`
  + ### validate

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") validate([Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") value)

    Specified by:
    :   `validate` in class `AttributeType.Numeric<AttributeType.Double, Double>`
  + ### getMin

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getMin()

    Specified by:
    :   `getMin` in class `AttributeType.Numeric<AttributeType.Double, Double>`
  + ### getMax

    public [Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") getMax()

    Specified by:
    :   `getMax` in class `AttributeType.Numeric<AttributeType.Double, Double>`
  + ### withinBounds

    protected boolean withinBounds([Double](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Double.html "class or interface in java.lang") value)

    Specified by:
    :   `withinBounds` in class `AttributeType.Numeric<AttributeType.Double, Double>`