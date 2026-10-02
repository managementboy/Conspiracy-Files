[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.vehicles](package-summary.html)
2. [UI3DScene](UI3DScene.html)
3. [RayObjectPool](UI3DScene.RayObjectPool.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [allocated](#allocated)
7. [Constructor Details](#constructor-detail)
   1. [RayObjectPool()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [makeObject()](#makeObject())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.RayObjectPool
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.network.statistics.counters.ObjectPoolCounter

zombie.popman.ObjectPool<[UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles")>

zombie.vehicles.UI3DScene.RayObjectPool

Enclosing class:
:   `UI3DScene`

---

public static final class UI3DScene.RayObjectPool
extends zombie.popman.ObjectPool<[UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles")>

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

  `(package private) int`

  `allocated`

  ### Fields inherited from class zombie.popman.ObjectPool

  `DEFAULT_MAX_SIZE`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RayObjectPool()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `protected UI3DScene.Ray`

  `makeObject()`

  ### Methods inherited from class zombie.popman.ObjectPool

  `alloc, clear, forEach, release, release, release, release, releaseAll, releaseAll, setMaxSize, size`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### allocated

    int allocated
* Constructor Details
  -------------------

  + ### RayObjectPool

    public RayObjectPool()
* Method Details
  --------------

  + ### makeObject

    protected [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") makeObject()

    Overrides:
    :   `makeObject` in class `zombie.popman.ObjectPool<UI3DScene.Ray>`