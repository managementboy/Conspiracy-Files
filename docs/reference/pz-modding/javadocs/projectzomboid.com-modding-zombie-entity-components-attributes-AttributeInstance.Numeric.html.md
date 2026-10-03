[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.entity.components.attributes](package-summary.html)
2. [AttributeInstance](AttributeInstance.html)
3. [Numeric](AttributeInstance.Numeric.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Constructor Details](#constructor-detail)
   1. [Numeric()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [floatValue()](#floatValue())
   2. [fromFloat(float)](#fromFloat(float))
   3. [isRequiresValidation()](#isRequiresValidation())
   4. [isDisplayAsBar()](#isDisplayAsBar())
   5. [getDisplayAsBarUnit()](#getDisplayAsBarUnit())
   6. [getFloatValue()](#getFloatValue())
   7. [getIntValue()](#getIntValue())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeInstance.Numeric<C extends AttributeInstance.Numeric<C,T>, T extends [AttributeType.Numeric](AttributeType.Numeric.html "class in zombie.entity.components.attributes")<T,?>>
============================================================================================================================================================================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.entity.components.attributes.AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<C,T>

zombie.entity.components.attributes.AttributeInstance.Numeric<C,T>

Direct Known Subclasses:
:   `AttributeInstance.Byte, AttributeInstance.Double, AttributeInstance.Float, AttributeInstance.Int, AttributeInstance.Long, AttributeInstance.Short`

Enclosing class:
:   `AttributeInstance<C extends AttributeInstance<C,T>, T extends AttributeType>`

---

public abstract static class AttributeInstance.Numeric<C extends AttributeInstance.Numeric<C,T>, T extends [AttributeType.Numeric](AttributeType.Numeric.html "class in zombie.entity.components.attributes")<T,?>>
extends [AttributeInstance](AttributeInstance.html "class in zombie.entity.components.attributes")<C,T>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class [AttributeInstance](AttributeInstance.html#nested-class-summary "class in zombie.entity.components.attributes")

  `AttributeInstance.Bool, AttributeInstance.Byte, AttributeInstance.Double, AttributeInstance.Enum<E>, AttributeInstance.EnumSet<E>, AttributeInstance.EnumStringSet<E>, AttributeInstance.Float, AttributeInstance.Int, AttributeInstance.Long, AttributeInstance.Numeric<C,T>, AttributeInstance.Short, AttributeInstance.String`
* Field Summary
  -------------

  ### Fields inherited from class [AttributeInstance](AttributeInstance.html#field-summary "class in zombie.entity.components.attributes")

  `type`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Numeric()`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `abstract float`

  `floatValue()`

  `abstract void`

  `fromFloat(float f)`

  `float`

  `getDisplayAsBarUnit()`

  `float`

  `getFloatValue()`

  `int`

  `getIntValue()`

  `boolean`

  `isDisplayAsBar()`

  `boolean`

  `isRequiresValidation()`

  ### Methods inherited from class [AttributeInstance](AttributeInstance.html#method-summary "class in zombie.entity.components.attributes")

  `canSetValue, copy, equalTo, getNameUI, getType, getValueType, isHiddenUI, isReadOnly, load, release, reset, save, setType, setValueFromScriptString, stringValue, toString`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Constructor Details
  -------------------

  + ### Numeric

    public Numeric()
* Method Details
  --------------

  + ### floatValue

    public abstract float floatValue()
  + ### fromFloat

    public abstract void fromFloat(float f)
  + ### isRequiresValidation

    public boolean isRequiresValidation()

    Overrides:
    :   `isRequiresValidation` in class `AttributeInstance<C extends AttributeInstance.Numeric<C,T>, T extends AttributeType.Numeric<T,?>>`
  + ### isDisplayAsBar

    public boolean isDisplayAsBar()

    Overrides:
    :   `isDisplayAsBar` in class `AttributeInstance<C extends AttributeInstance.Numeric<C,T>, T extends AttributeType.Numeric<T,?>>`
  + ### getDisplayAsBarUnit

    public float getDisplayAsBarUnit()

    Overrides:
    :   `getDisplayAsBarUnit` in class `AttributeInstance<C extends AttributeInstance.Numeric<C,T>, T extends AttributeType.Numeric<T,?>>`
  + ### getFloatValue

    public float getFloatValue()

    Overrides:
    :   `getFloatValue` in class `AttributeInstance<C extends AttributeInstance.Numeric<C,T>, T extends AttributeType.Numeric<T,?>>`
  + ### getIntValue

    public int getIntValue()

    Overrides:
    :   `getIntValue` in class `AttributeInstance<C extends AttributeInstance.Numeric<C,T>, T extends AttributeType.Numeric<T,?>>`