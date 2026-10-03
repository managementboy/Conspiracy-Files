[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.advancedanimation](package-summary.html)
2. [PooledAnimBoneWeightArray](PooledAnimBoneWeightArray.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [s\_empty](#s_empty)
   2. [s\_pool](#s_pool)
6. [Constructor Details](#constructor-detail)
   1. [PooledAnimBoneWeightArray()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [alloc(int)](#alloc(int))
   2. [toArray(List)](#toArray(java.util.List))
   3. [toArray(PooledArrayObject)](#toArray(zombie.util.PooledArrayObject))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class PooledAnimBoneWeightArray
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.util.PooledObject

zombie.util.PooledArrayObject<zombie.core.skinnedmodel.advancedanimation.AnimBoneWeight>

zombie.core.skinnedmodel.advancedanimation.PooledAnimBoneWeightArray

All Implemented Interfaces:
:   `zombie.util.IPooledObject`

---

public class PooledAnimBoneWeightArray
extends zombie.util.PooledArrayObject<zombie.core.skinnedmodel.advancedanimation.AnimBoneWeight>

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private static final PooledAnimBoneWeightArray`

  `s_empty`

  `private static final zombie.util.Pool<PooledAnimBoneWeightArray>`

  `s_pool`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PooledAnimBoneWeightArray()`
* Method Summary
  --------------

  All MethodsStatic MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static PooledAnimBoneWeightArray`

  `alloc(int count)`

  `static PooledAnimBoneWeightArray`

  `toArray(List<zombie.core.skinnedmodel.advancedanimation.AnimBoneWeight> list)`

  `static PooledAnimBoneWeightArray`

  `toArray(zombie.util.PooledArrayObject<zombie.core.skinnedmodel.advancedanimation.AnimBoneWeight> source)`

  ### Methods inherited from class zombie.util.PooledArrayObject

  `array, get, initCapacity, isEmpty, length, set`

  ### Methods inherited from class zombie.util.PooledObject

  `getPoolReference, isFree, release, setFree, setPool`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

  ### Methods inherited from interface zombie.util.IPooledObject

  `onReleased`

* Field Details
  -------------

  + ### s\_empty

    private static final [PooledAnimBoneWeightArray](PooledAnimBoneWeightArray.html "class in zombie.core.skinnedmodel.advancedanimation") s\_empty
  + ### s\_pool

    private static final zombie.util.Pool<[PooledAnimBoneWeightArray](PooledAnimBoneWeightArray.html "class in zombie.core.skinnedmodel.advancedanimation")> s\_pool
* Constructor Details
  -------------------

  + ### PooledAnimBoneWeightArray

    public PooledAnimBoneWeightArray()
* Method Details
  --------------

  + ### alloc

    public static [PooledAnimBoneWeightArray](PooledAnimBoneWeightArray.html "class in zombie.core.skinnedmodel.advancedanimation") alloc(int count)
  + ### toArray

    public static [PooledAnimBoneWeightArray](PooledAnimBoneWeightArray.html "class in zombie.core.skinnedmodel.advancedanimation") toArray([List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<zombie.core.skinnedmodel.advancedanimation.AnimBoneWeight> list)
  + ### toArray

    public static [PooledAnimBoneWeightArray](PooledAnimBoneWeightArray.html "class in zombie.core.skinnedmodel.advancedanimation") toArray(zombie.util.PooledArrayObject<zombie.core.skinnedmodel.advancedanimation.AnimBoneWeight> source)