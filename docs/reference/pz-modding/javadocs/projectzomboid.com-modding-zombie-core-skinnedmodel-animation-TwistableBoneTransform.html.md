[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.animation](package-summary.html)
2. [TwistableBoneTransform](TwistableBoneTransform.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [blendWeight](#blendWeight)
   2. [twist](#twist)
   3. [s\_pool](#s_pool)
6. [Constructor Details](#constructor-detail)
   1. [TwistableBoneTransform()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [reset()](#reset())
   2. [set(BoneTransform)](#set(zombie.core.skinnedmodel.animation.BoneTransform))
   3. [alloc()](#alloc())
   4. [allocArray(int)](#allocArray(int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class TwistableBoneTransform
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.util.PooledObject

[zombie.core.skinnedmodel.animation.BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation")

zombie.core.skinnedmodel.animation.TwistableBoneTransform

All Implemented Interfaces:
:   `zombie.util.IPooledObject`

Direct Known Subclasses:
:   `AnimatorsBoneTransform`

---

public class TwistableBoneTransform
extends [BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `blendWeight`

  `private static final zombie.util.Pool<TwistableBoneTransform>`

  `s_pool`

  `float`

  `twist`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `TwistableBoneTransform()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static TwistableBoneTransform`

  `alloc()`

  `static TwistableBoneTransform[]`

  `allocArray(int count)`

  `void`

  `reset()`

  `void`

  `set(BoneTransform rhs)`

  ### Methods inherited from class [BoneTransform](BoneTransform.html#method-summary "class in zombie.core.skinnedmodel.animation")

  `getMatrix, getPosition, getPRS, getRotation, mul, mul, mul, mul, mul, onReleased, set, set, setIdentity, setPosition, validateInternal, validatePRS`

  ### Methods inherited from class zombie.util.PooledObject

  `getPoolReference, isFree, release, setFree, setPool`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### blendWeight

    public float blendWeight
  + ### twist

    public float twist
  + ### s\_pool

    private static final zombie.util.Pool<[TwistableBoneTransform](TwistableBoneTransform.html "class in zombie.core.skinnedmodel.animation")> s\_pool
* Constructor Details
  -------------------

  + ### TwistableBoneTransform

    protected TwistableBoneTransform()
* Method Details
  --------------

  + ### reset

    public void reset()

    Overrides:
    :   `reset` in class `BoneTransform`
  + ### set

    public void set([BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") rhs)

    Overrides:
    :   `set` in class `BoneTransform`
  + ### alloc

    public static [TwistableBoneTransform](TwistableBoneTransform.html "class in zombie.core.skinnedmodel.animation") alloc()
  + ### allocArray

    public static [TwistableBoneTransform](TwistableBoneTransform.html "class in zombie.core.skinnedmodel.animation")[] allocArray(int count)