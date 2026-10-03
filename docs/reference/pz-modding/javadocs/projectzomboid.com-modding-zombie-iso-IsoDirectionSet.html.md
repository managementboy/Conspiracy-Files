[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoDirectionSet](IsoDirectionSet.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [set](#set)
6. [Constructor Details](#constructor-detail)
   1. [IsoDirectionSet()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [rotate(IsoDirections, int)](#rotate(zombie.iso.IsoDirections,int))
   2. [getNext()](#getNext())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoDirectionSet
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoDirectionSet

---

public class IsoDirectionSet
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `set`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoDirectionSet()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `IsoDirections`

  `getNext()`

  `static IsoDirections`

  `rotate(IsoDirections dir,
  int amount)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### set

    public int set
* Constructor Details
  -------------------

  + ### IsoDirectionSet

    public IsoDirectionSet()
* Method Details
  --------------

  + ### rotate

    public static [IsoDirections](IsoDirections.html "enum class in zombie.iso") rotate([IsoDirections](IsoDirections.html "enum class in zombie.iso") dir,
    int amount)
  + ### getNext

    public [IsoDirections](IsoDirections.html "enum class in zombie.iso") getNext()