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
3. [Numeric](AttributeType.Numeric.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [initialValue](#initialValue)
   2. [vars](#vars)
   3. [requiresValidation](#requiresValidation)
7. [Constructor Details](#constructor-detail)
   1. [Numeric(short, String, T, boolean, Attribute.UI.Display, Attribute.UI.DisplayAsBar, String)](#%3Cinit%3E(short,java.lang.String,T,boolean,zombie.entity.components.attributes.Attribute.UI.Display,zombie.entity.components.attributes.Attribute.UI.DisplayAsBar,java.lang.String))
8. [Method Details](#method-detail)
   1. [getValueType()](#getValueType())
   2. [isRequiresValidation()](#isRequiresValidation())
   3. [getVars()](#getVars())
   4. [getInitialValue()](#getInitialValue())
   5. [setBounds(T, T)](#setBounds(T,T))
   6. [hasBounds()](#hasBounds())
   7. [validate(T)](#validate(T))
   8. [getMin()](#getMin())
   9. [getMax()](#getMax())
   10. [withinBounds(T)](#withinBounds(T))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeType.Numeric<C extends AttributeType.Numeric<C,T>, T extends [Number](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Number.html "class or interface in java.lang")>
===========================================================================================================================================================================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.attributes.AttributeType](AttributeType.html "class in zombie.entity.components.attributes")

zombie.entity.components.attributes.AttributeType.Numeric<C,T>

Direct Known Subclasses:
:   `AttributeType.Byte, AttributeType.Double, AttributeType.Float, AttributeType.Int, AttributeType.Long, AttributeType.Short`

Enclosing class:
:   `AttributeType`

---

public abstract static class AttributeType.Numeric<C extends AttributeType.Numeric<C,T>, T extends [Number](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Number.html "class or interface in java.lang")>
extends [AttributeType](AttributeType.html "class in zombie.entity.components.attributes")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `protected static class`

  `AttributeType.Numeric.NumericVars<T>`

  ### Nested classes/interfaces inherited from class [AttributeType](AttributeType.html#nested-class-summary "class in zombie.entity.components.attributes")

  `AttributeType.Bool, AttributeType.Byte, AttributeType.Double, AttributeType.Enum<E>, AttributeType.EnumSet<E>, AttributeType.EnumStringSet<E>, AttributeType.Float, AttributeType.Int, AttributeType.Long, AttributeType.Numeric<C,T>, AttributeType.Short, AttributeType.String`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final T`

  `initialValue`

  `private boolean`

  `requiresValidation`

  `private AttributeType.Numeric.NumericVars<T>`

  `vars`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `Numeric(short id,
  String name,
  T initialValue,
  boolean readOnly,
  Attribute.UI.Display display,
  Attribute.UI.DisplayAsBar asBar,
  String tooltipOverride)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `T`

  `getInitialValue()`

  `abstract T`

  `getMax()`

  `abstract T`

  `getMin()`

  `AttributeValueType`

  `getValueType()`

  `protected AttributeType.Numeric.NumericVars<T>`

  `getVars()`

  `boolean`

  `hasBounds()`

  `protected boolean`

  `isRequiresValidation()`

  `protected final AttributeType.Numeric<C,T>`

  `setBounds(T min,
  T max)`

  `abstract T`

  `validate(T value)`

  `protected abstract boolean`

  `withinBounds(T value)`

  ### Methods inherited from class [AttributeType](AttributeType.html#method-summary "class in zombie.entity.components.attributes")

  `getDisplayAsBar, getName, getNameUI, getTranslateKey, id, isDecimal, isHiddenUI, isNumeric, isReadOnly, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### initialValue

    private final [T](#type-param-T "type parameter in AttributeType.Numeric") extends [Number](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Number.html "class or interface in java.lang") initialValue
  + ### vars

    private [AttributeType.Numeric.NumericVars](AttributeType.Numeric.NumericVars.html "class in zombie.entity.components.attributes")<[T](#type-param-T "type parameter in AttributeType.Numeric") extends [Number](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Number.html "class or interface in java.lang")> vars
  + ### requiresValidation

    private boolean requiresValidation
* Constructor Details
  -------------------

  + ### Numeric

    protected Numeric(short id,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name,
    [T](#type-param-T "type parameter in AttributeType.Numeric") initialValue,
    boolean readOnly,
    [Attribute.UI.Display](Attribute.UI.Display.html "enum class in zombie.entity.components.attributes") display,
    [Attribute.UI.DisplayAsBar](Attribute.UI.DisplayAsBar.html "enum class in zombie.entity.components.attributes") asBar,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") tooltipOverride)
* Method Details
  --------------

  + ### getValueType

    public [AttributeValueType](AttributeValueType.html "enum class in zombie.entity.components.attributes") getValueType()

    Specified by:
    :   `getValueType` in class `AttributeType`
  + ### isRequiresValidation

    protected boolean isRequiresValidation()
  + ### getVars

    protected [AttributeType.Numeric.NumericVars](AttributeType.Numeric.NumericVars.html "class in zombie.entity.components.attributes")<[T](#type-param-T "type parameter in AttributeType.Numeric")> getVars()
  + ### getInitialValue

    public [T](#type-param-T "type parameter in AttributeType.Numeric") getInitialValue()
  + ### setBounds

    protected final [AttributeType.Numeric](AttributeType.Numeric.html "class in zombie.entity.components.attributes")<[C](#type-param-C "type parameter in AttributeType.Numeric"),[T](#type-param-T "type parameter in AttributeType.Numeric")> setBounds([T](#type-param-T "type parameter in AttributeType.Numeric") min,
    [T](#type-param-T "type parameter in AttributeType.Numeric") max)
  + ### hasBounds

    public boolean hasBounds()
  + ### validate

    public abstract [T](#type-param-T "type parameter in AttributeType.Numeric") validate([T](#type-param-T "type parameter in AttributeType.Numeric") value)
  + ### getMin

    public abstract [T](#type-param-T "type parameter in AttributeType.Numeric") getMin()
  + ### getMax

    public abstract [T](#type-param-T "type parameter in AttributeType.Numeric") getMax()
  + ### withinBounds

    protected abstract boolean withinBounds([T](#type-param-T "type parameter in AttributeType.Numeric") value)