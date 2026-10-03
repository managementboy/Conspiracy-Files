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
3. [CompScoreToPlayer](IsoWorld.CompScoreToPlayer.html)

Contents

1. [Description](#)
2. [Constructor Summary](#constructor-summary)
3. [Method Summary](#method-summary)
4. [Constructor Details](#constructor-detail)
   1. [CompScoreToPlayer()](#%3Cinit%3E())
5. [Method Details](#method-detail)
   1. [compare(IsoZombie, IsoZombie)](#compare(zombie.characters.IsoZombie,zombie.characters.IsoZombie))
   2. [getScore(IsoZombie)](#getScore(zombie.characters.IsoZombie))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoWorld.CompScoreToPlayer
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.IsoWorld.CompScoreToPlayer

All Implemented Interfaces:
:   `Comparator<IsoZombie>`

Enclosing class:
:   `IsoWorld`

---

private static class IsoWorld.CompScoreToPlayer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[IsoZombie](../characters/IsoZombie.html "class in zombie.characters")>

* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `CompScoreToPlayer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `compare(IsoZombie a,
  IsoZombie b)`

  `float`

  `getScore(IsoZombie zombie)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html#method-summary "class or interface in java.util")

  `equals, reversed, thenComparing, thenComparing, thenComparing, thenComparingDouble, thenComparingInt, thenComparingLong`

* Constructor Details
  -------------------

  + ### CompScoreToPlayer

    private CompScoreToPlayer()
* Method Details
  --------------

  + ### compare

    public int compare([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") a,
    [IsoZombie](../characters/IsoZombie.html "class in zombie.characters") b)

    Specified by:
    :   `compare` in interface `Comparator<IsoZombie>`
  + ### getScore

    public float getScore([IsoZombie](../characters/IsoZombie.html "class in zombie.characters") zombie)