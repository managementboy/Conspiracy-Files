[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.properties](package-summary.html)
2. [PropertyContainer](PropertyContainer.html)
3. [ProfileEntryComparitor](PropertyContainer.ProfileEntryComparitor.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [ProfileEntryComparitor()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [compare(Object, Object)](#compare(java.lang.Object,java.lang.Object))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class PropertyContainer.ProfileEntryComparitor
==============================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.properties.PropertyContainer.ProfileEntryComparitor

All Implemented Interfaces:
:   `Comparator<Object>`

Enclosing class:
:   `PropertyContainer`

---

private static class PropertyContainer.ProfileEntryComparitor
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")>

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ProfileEntryComparitor()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(Object o1,
  Object o2)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Constructor Details
  -------------------

  + ### ProfileEntryComparitor

    public ProfileEntryComparitor()
* Method Details
  --------------

  + ### compare

    public int compare([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") o2)

    Specified by:
    :   `compare` in interface `Comparator<Object>`