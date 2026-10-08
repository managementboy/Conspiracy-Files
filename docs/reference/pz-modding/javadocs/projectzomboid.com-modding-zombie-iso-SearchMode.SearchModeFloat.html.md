[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [SearchMode](SearchMode.html)
3. [SearchModeFloat](SearchMode.SearchModeFloat.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [min](#min)
   2. [max](#max)
   3. [stepsize](#stepsize)
   4. [exterior](#exterior)
   5. [targetExterior](#targetExterior)
   6. [interior](#interior)
   7. [targetInterior](#targetInterior)
6. [Constructor Details](#constructor-detail)
   1. [SearchModeFloat(float, float, float)](#%3Cinit%3E(float,float,float))
7. [Method Details](#method-detail)
   1. [set(float, float, float, float)](#set(float,float,float,float))
   2. [setAll(float)](#setAll(float))
   3. [setTargets(float, float)](#setTargets(float,float))
   4. [getExterior()](#getExterior())
   5. [setExterior(float)](#setExterior(float))
   6. [getTargetExterior()](#getTargetExterior())
   7. [setTargetExterior(float)](#setTargetExterior(float))
   8. [getInterior()](#getInterior())
   9. [setInterior(float)](#setInterior(float))
   10. [getTargetInterior()](#getTargetInterior())
   11. [setTargetInterior(float)](#setTargetInterior(float))
   12. [update(float)](#update(float))
   13. [equalise()](#equalise())
   14. [reset()](#reset())
   15. [resetAll()](#resetAll())
   16. [getMin()](#getMin())
   17. [getMax()](#getMax())
   18. [getStepsize()](#getStepsize())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SearchMode.SearchModeFloat
================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.SearchMode.SearchModeFloat

Enclosing class:
:   `SearchMode`

---

public static class SearchMode.SearchModeFloat
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `exterior`

  `private float`

  `interior`

  `private final float`

  `max`

  `private final float`

  `min`

  `private final float`

  `stepsize`

  `private float`

  `targetExterior`

  `private float`

  `targetInterior`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SearchModeFloat(float min,
  float max,
  float stepsize)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `equalise()`

  `float`

  `getExterior()`

  `float`

  `getInterior()`

  `float`

  `getMax()`

  `float`

  `getMin()`

  `float`

  `getStepsize()`

  `float`

  `getTargetExterior()`

  `float`

  `getTargetInterior()`

  `void`

  `reset()`

  `void`

  `resetAll()`

  `void`

  `set(float exterior,
  float targetExterior,
  float interior,
  float targetInterior)`

  `void`

  `setAll(float value)`

  `void`

  `setExterior(float exterior)`

  `void`

  `setInterior(float interior)`

  `void`

  `setTargetExterior(float targetExterior)`

  `void`

  `setTargetInterior(float targetInterior)`

  `void`

  `setTargets(float targetExterior,
  float targetInterior)`

  `void`

  `update(float delta)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### min

    private final float min
  + ### max

    private final float max
  + ### stepsize

    private final float stepsize
  + ### exterior

    private float exterior
  + ### targetExterior

    private float targetExterior
  + ### interior

    private float interior
  + ### targetInterior

    private float targetInterior
* Constructor Details
  -------------------

  + ### SearchModeFloat

    private SearchModeFloat(float min,
    float max,
    float stepsize)
* Method Details
  --------------

  + ### set

    public void set(float exterior,
    float targetExterior,
    float interior,
    float targetInterior)
  + ### setAll

    public void setAll(float value)
  + ### setTargets

    public void setTargets(float targetExterior,
    float targetInterior)
  + ### getExterior

    public float getExterior()
  + ### setExterior

    public void setExterior(float exterior)
  + ### getTargetExterior

    public float getTargetExterior()
  + ### setTargetExterior

    public void setTargetExterior(float targetExterior)
  + ### getInterior

    public float getInterior()
  + ### setInterior

    public void setInterior(float interior)
  + ### getTargetInterior

    public float getTargetInterior()
  + ### setTargetInterior

    public void setTargetInterior(float targetInterior)
  + ### update

    public void update(float delta)
  + ### equalise

    public void equalise()
  + ### reset

    public void reset()
  + ### resetAll

    public void resetAll()
  + ### getMin

    public float getMin()
  + ### getMax

    public float getMax()
  + ### getStepsize

    public float getStepsize()