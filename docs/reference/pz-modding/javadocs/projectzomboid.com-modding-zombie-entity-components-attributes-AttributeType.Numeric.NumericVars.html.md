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
4. [NumericVars](AttributeType.Numeric.NumericVars.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [min](#min)
   2. [max](#max)
6. [Constructor Details](#constructor-detail)
   1. [NumericVars(T, T)](#%3Cinit%3E(T,T))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AttributeType.Numeric.NumericVars<T>
==========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.entity.components.attributes.AttributeType.Numeric.NumericVars<T>

Enclosing class:
:   `AttributeType.Numeric<C extends AttributeType.Numeric<C,T>, T extends Number>`

---

protected static class AttributeType.Numeric.NumericVars<T>
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `protected final T`

  `max`

  `protected final T`

  `min`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `NumericVars(T min,
  T max)`
* Method Summary
  --------------

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### min

    protected final [T](#type-param-T "type parameter in AttributeType.Numeric.NumericVars") min
  + ### max

    protected final [T](#type-param-T "type parameter in AttributeType.Numeric.NumericVars") max
* Constructor Details
  -------------------

  + ### NumericVars

    protected NumericVars([T](#type-param-T "type parameter in AttributeType.Numeric.NumericVars") min,
    [T](#type-param-T "type parameter in AttributeType.Numeric.NumericVars") max)