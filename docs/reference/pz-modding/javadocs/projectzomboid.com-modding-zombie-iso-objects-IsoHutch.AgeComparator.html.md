[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoHutch](IsoHutch.html)
3. [AgeComparator](IsoHutch.AgeComparator.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [AgeComparator()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [compare(IsoAnimal, IsoAnimal)](#compare(zombie.characters.animals.IsoAnimal,zombie.characters.animals.IsoAnimal))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoHutch.AgeComparator
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.objects.IsoHutch.AgeComparator

All Implemented Interfaces:
:   `Comparator<IsoAnimal>`

Enclosing class:
:   `IsoHutch`

---

class IsoHutch.AgeComparator
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals")>

* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AgeComparator()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(IsoAnimal a,
  IsoAnimal b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Constructor Details
  -------------------

  + ### AgeComparator

    AgeComparator()
* Method Details
  --------------

  + ### compare

    public int compare([IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") a,
    [IsoAnimal](../../characters/animals/IsoAnimal.html "class in zombie.characters.animals") b)

    Specified by:
    :   `compare` in interface `Comparator<IsoAnimal>`