[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [BaseVehicle](BaseVehicle.html)
3. [Vector3ObjectPool](BaseVehicle.Vector3ObjectPool.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [allocated](#allocated)
7. [Constructor Details](#constructor-detail)
   1. [Vector3ObjectPool()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [makeObject()](#makeObject())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class BaseVehicle.Vector3ObjectPool
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.statistics.counters.ObjectPoolCounter

zombie.popman.ObjectPool<[Vector3](../iso/Vector3.html "class in zombie.iso")>

zombie.vehicles.BaseVehicle.Vector3ObjectPool

Enclosing class:
:   `BaseVehicle`

---

public static final class BaseVehicle.Vector3ObjectPool
extends zombie.popman.ObjectPool<[Vector3](../iso/Vector3.html "class in zombie.iso")>

* Nested Class Summary
  --------------------

  ### Nested classes/interfaces inherited from class zombie.popman.ObjectPool

  `zombie.popman.ObjectPool.Allocator<T>`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `allocated`

  ### Fields inherited from class zombie.popman.ObjectPool

  `DEFAULT_MAX_SIZE`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Vector3ObjectPool()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected Vector3`

  `makeObject()`

  ### Methods inherited from class zombie.popman.ObjectPool

  `alloc, clear, forEach, release, release, release, release, releaseAll, releaseAll, setMaxSize, size`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### allocated

    private int allocated
* Constructor Details
  -------------------

  + ### Vector3ObjectPool

    private Vector3ObjectPool()
* Method Details
  --------------

  + ### makeObject

    protected [Vector3](../iso/Vector3.html "class in zombie.iso") makeObject()

    Overrides:
    :   `makeObject` in class `zombie.popman.ObjectPool<Vector3>`