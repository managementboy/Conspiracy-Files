[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.characters](package-summary.html)
2. [IsoZombie](IsoZombie.html)
3. [Aggro](IsoZombie.Aggro.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [obj](#obj)
   2. [damage](#damage)
   3. [lastDamage](#lastDamage)
6. [Constructor Details](#constructor-detail)
   1. [Aggro(IsoMovingObject, float)](#%3Cinit%3E(zombie.iso.IsoMovingObject,float))
7. [Method Details](#method-detail)
   1. [addDamage(float)](#addDamage(float))
   2. [getAggro()](#getAggro())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class IsoZombie.Aggro
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.characters.IsoZombie.Aggro

Enclosing class:
:   `IsoZombie`

---

private static class IsoZombie.Aggro
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `damage`

  `private long`

  `lastDamage`

  `private final IsoMovingObject`

  `obj`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Aggro(IsoMovingObject obj,
  float damage)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addDamage(float damage)`

  `float`

  `getAggro()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### obj

    private final [IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") obj
  + ### damage

    private float damage
  + ### lastDamage

    private long lastDamage
* Constructor Details
  -------------------

  + ### Aggro

    public Aggro([IsoMovingObject](../iso/IsoMovingObject.html "class in zombie.iso") obj,
    float damage)
* Method Details
  --------------

  + ### addDamage

    public void addDamage(float damage)
  + ### getAggro

    public float getAggro()