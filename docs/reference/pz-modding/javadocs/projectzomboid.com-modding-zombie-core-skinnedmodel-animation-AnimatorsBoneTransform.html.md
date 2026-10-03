[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.animation](package-summary.html)
2. [AnimatorsBoneTransform](AnimatorsBoneTransform.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [timeDelta](#timeDelta)
   2. [previousTransform](#previousTransform)
   3. [s\_pool](#s_pool)
6. [Constructor Details](#constructor-detail)
   1. [AnimatorsBoneTransform()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(BoneTransform)](#set(zombie.core.skinnedmodel.animation.BoneTransform))
   2. [reset()](#reset())
   3. [getPreviousTransform(T)](#getPreviousTransform(T))
   4. [getTimeDelta()](#getTimeDelta())
   5. [nextFrame(float)](#nextFrame(float))
   6. [alloc()](#alloc())
   7. [allocArray(int)](#allocArray(int))

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class AnimatorsBoneTransform
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.util.PooledObject

[zombie.core.skinnedmodel.animation.BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation")

[zombie.core.skinnedmodel.animation.TwistableBoneTransform](TwistableBoneTransform.html "class in zombie.core.skinnedmodel.animation")

zombie.core.skinnedmodel.animation.AnimatorsBoneTransform

All Implemented Interfaces:
:   `zombie.util.IPooledObject`

---

public class AnimatorsBoneTransform
extends [TwistableBoneTransform](TwistableBoneTransform.html "class in zombie.core.skinnedmodel.animation")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final TwistableBoneTransform`

  `previousTransform`

  The previous transform.

  `private static final zombie.util.Pool<AnimatorsBoneTransform>`

  `s_pool`

  `private float`

  `timeDelta`

  The time (in seconds) it takes to get from previous transform to current transform

  ### Fields inherited from class [TwistableBoneTransform](TwistableBoneTransform.html#field-summary "class in zombie.core.skinnedmodel.animation")

  `blendWeight, twist`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimatorsBoneTransform()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static AnimatorsBoneTransform`

  `alloc()`

  `static TwistableBoneTransform[]`

  `allocArray(int count)`

  `<T extends BoneTransform>  
  T`

  `getPreviousTransform(T result)`

  The previous transform.

  `float`

  `getTimeDelta()`

  The amount of time elapsed between the current transform and the previous transform.

  `void`

  `nextFrame(float timeDelta)`

  Copies the current transform to previous transform.

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

  + ### timeDelta

    private float timeDelta

    The time (in seconds) it takes to get from previous transform to current transform
  + ### previousTransform

    private final [TwistableBoneTransform](TwistableBoneTransform.html "class in zombie.core.skinnedmodel.animation") previousTransform

    The previous transform. We can infer our velocities from this and the time delta.
  + ### s\_pool

    private static final zombie.util.Pool<[AnimatorsBoneTransform](AnimatorsBoneTransform.html "class in zombie.core.skinnedmodel.animation")> s\_pool
* Constructor Details
  -------------------

  + ### AnimatorsBoneTransform

    public AnimatorsBoneTransform()
* Method Details
  --------------

  + ### set

    public void set([BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") rhs)

    Overrides:
    :   `set` in class `TwistableBoneTransform`
  + ### reset

    public void reset()

    Overrides:
    :   `reset` in class `TwistableBoneTransform`
  + ### getPreviousTransform

    public <T extends [BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation")> T getPreviousTransform(T result)

    The previous transform.
  + ### getTimeDelta

    public float getTimeDelta()

    The amount of time elapsed between the current transform and the previous transform.
    Allows us to derive velocities.
  + ### nextFrame

    public void nextFrame(float timeDelta)

    Copies the current transform to previous transform.
    Updates timeDelta.
  + ### alloc

    public static [AnimatorsBoneTransform](AnimatorsBoneTransform.html "class in zombie.core.skinnedmodel.animation") alloc()
  + ### allocArray

    public static [TwistableBoneTransform](TwistableBoneTransform.html "class in zombie.core.skinnedmodel.animation")[] allocArray(int count)