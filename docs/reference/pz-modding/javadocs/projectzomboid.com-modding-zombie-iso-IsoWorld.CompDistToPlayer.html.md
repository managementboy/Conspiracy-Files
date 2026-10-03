[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [IsoWorld](IsoWorld.html)
3. [CompDistToPlayer](IsoWorld.CompDistToPlayer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [px](#px)
   2. [py](#py)
6. [Constructor Details](#constructor-detail)
   1. [CompDistToPlayer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [compare(IsoZombie, IsoZombie)](#compare(zombie.characters.IsoZombie,zombie.characters.IsoZombie))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoWorld.CompDistToPlayer
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoWorld.CompDistToPlayer

All Implemented Interfaces:
:   `Comparator<IsoZombie>`

Enclosing class:
:   `IsoWorld`

---

private static class IsoWorld.CompDistToPlayer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `px`

  `float`

  `py`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CompDistToPlayer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(IsoZombie a,
  IsoZombie b)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Field Details
  -------------

  + ### px

    public float px
  + ### py

    public float py
* Constructor Details
  -------------------

  + ### CompDistToPlayer

    private CompDistToPlayer()
* Method Details
  --------------

  + ### compare

    public int compare([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") a,
    [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") b)

    Specified by:
    :   `compare` in interface `Comparator<IsoZombie>`