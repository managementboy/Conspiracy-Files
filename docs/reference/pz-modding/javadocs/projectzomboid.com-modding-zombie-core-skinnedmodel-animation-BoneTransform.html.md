[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.core.skinnedmodel.animation](package-summary.html)
2. [BoneTransform](BoneTransform.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [matrixValid](#matrixValid)
   2. [matrix](#matrix)
   3. [transformResult](#transformResult)
   4. [prsValid](#prsValid)
   5. [pos](#pos)
   6. [rot](#rot)
   7. [scale](#scale)
   8. [s\_pool](#s_pool)
6. [Constructor Details](#constructor-detail)
   1. [BoneTransform()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [onReleased()](#onReleased())
   2. [setIdentity()](#setIdentity())
   3. [reset()](#reset())
   4. [set(BoneTransform)](#set(zombie.core.skinnedmodel.animation.BoneTransform))
   5. [set(Vector3f, Quaternion, Vector3f)](#set(org.lwjgl.util.vector.Vector3f,org.lwjgl.util.vector.Quaternion,org.lwjgl.util.vector.Vector3f))
   6. [set(Matrix4f)](#set(org.lwjgl.util.vector.Matrix4f))
   7. [mul(Matrix4f, Matrix4f)](#mul(org.lwjgl.util.vector.Matrix4f,org.lwjgl.util.vector.Matrix4f))
   8. [getMatrix(Matrix4f)](#getMatrix(org.lwjgl.util.vector.Matrix4f))
   9. [getPRS(Vector3f, Quaternion, Vector3f)](#getPRS(org.lwjgl.util.vector.Vector3f,org.lwjgl.util.vector.Quaternion,org.lwjgl.util.vector.Vector3f))
   10. [setPosition(Vector3f)](#setPosition(org.lwjgl.util.vector.Vector3f))
   11. [getPosition(Vector3f)](#getPosition(org.lwjgl.util.vector.Vector3f))
   12. [getRotation(Quaternion)](#getRotation(org.lwjgl.util.vector.Quaternion))
   13. [getValidMatrix\_Internal()](#getValidMatrix_Internal())
   14. [validateMatrix()](#validateMatrix())
   15. [validatePRS()](#validatePRS())
   16. [validateInternal()](#validateInternal())
   17. [mul(BoneTransform, Matrix4f, Matrix4f)](#mul(zombie.core.skinnedmodel.animation.BoneTransform,org.lwjgl.util.vector.Matrix4f,org.lwjgl.util.vector.Matrix4f))
   18. [mul(BoneTransform, Matrix4f, BoneTransform)](#mul(zombie.core.skinnedmodel.animation.BoneTransform,org.lwjgl.util.vector.Matrix4f,zombie.core.skinnedmodel.animation.BoneTransform))
   19. [mul(BoneTransform, BoneTransform, BoneTransform)](#mul(zombie.core.skinnedmodel.animation.BoneTransform,zombie.core.skinnedmodel.animation.BoneTransform,zombie.core.skinnedmodel.animation.BoneTransform))
   20. [mul(Matrix4f, BoneTransform, BoneTransform)](#mul(org.lwjgl.util.vector.Matrix4f,zombie.core.skinnedmodel.animation.BoneTransform,zombie.core.skinnedmodel.animation.BoneTransform))
   21. [alloc()](#alloc())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class BoneTransform
===================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.util.PooledObject

zombie.core.skinnedmodel.animation.BoneTransform

All Implemented Interfaces:
:   `zombie.util.IPooledObject`

Direct Known Subclasses:
:   `TwistableBoneTransform`

---

public class BoneTransform
extends zombie.util.PooledObject

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final org.lwjgl.util.vector.Matrix4f`

  `matrix`

  `private boolean`

  `matrixValid`

  `private final org.lwjgl.util.vector.Vector3f`

  `pos`

  `private boolean`

  `prsValid`

  `private final org.lwjgl.util.vector.Quaternion`

  `rot`

  `private static final zombie.util.Pool<BoneTransform>`

  `s_pool`

  `private final org.lwjgl.util.vector.Vector3f`

  `scale`

  `private final zombie.core.skinnedmodel.HelperFunctions.TransformResult_QPS`

  `transformResult`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `protected`

  `BoneTransform()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static BoneTransform`

  `alloc()`

  `void`

  `getMatrix(org.lwjgl.util.vector.Matrix4f result)`

  `void`

  `getPosition(org.lwjgl.util.vector.Vector3f pos)`

  `void`

  `getPRS(org.lwjgl.util.vector.Vector3f pos,
  org.lwjgl.util.vector.Quaternion rot,
  org.lwjgl.util.vector.Vector3f scale)`

  `void`

  `getRotation(org.lwjgl.util.vector.Quaternion rot)`

  `private org.lwjgl.util.vector.Matrix4f`

  `getValidMatrix_Internal()`

  `void`

  `mul(org.lwjgl.util.vector.Matrix4f a,
  org.lwjgl.util.vector.Matrix4f b)`

  `static void`

  `mul(org.lwjgl.util.vector.Matrix4f a,
  BoneTransform b,
  BoneTransform result)`

  `static void`

  `mul(BoneTransform a,
  org.lwjgl.util.vector.Matrix4f b,
  org.lwjgl.util.vector.Matrix4f result)`

  `static void`

  `mul(BoneTransform a,
  org.lwjgl.util.vector.Matrix4f b,
  BoneTransform result)`

  `static void`

  `mul(BoneTransform a,
  BoneTransform b,
  BoneTransform result)`

  `void`

  `onReleased()`

  `void`

  `reset()`

  `void`

  `set(org.lwjgl.util.vector.Matrix4f matrix)`

  `void`

  `set(org.lwjgl.util.vector.Vector3f pos,
  org.lwjgl.util.vector.Quaternion rot,
  org.lwjgl.util.vector.Vector3f scale)`

  `void`

  `set(BoneTransform rhs)`

  `void`

  `setIdentity()`

  `void`

  `setPosition(org.lwjgl.util.vector.Vector3f position)`

  `protected void`

  `validateInternal()`

  `private void`

  `validateMatrix()`

  `protected void`

  `validatePRS()`

  ### Methods inherited from class zombie.util.PooledObject

  `getPoolReference, isFree, release, setFree, setPool`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### matrixValid

    private boolean matrixValid
  + ### matrix

    private final org.lwjgl.util.vector.Matrix4f matrix
  + ### transformResult

    private final zombie.core.skinnedmodel.HelperFunctions.TransformResult\_QPS transformResult
  + ### prsValid

    private boolean prsValid
  + ### pos

    private final org.lwjgl.util.vector.Vector3f pos
  + ### rot

    private final org.lwjgl.util.vector.Quaternion rot
  + ### scale

    private final org.lwjgl.util.vector.Vector3f scale
  + ### s\_pool

    private static final zombie.util.Pool<[BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation")> s\_pool
* Constructor Details
  -------------------

  + ### BoneTransform

    protected BoneTransform()
* Method Details
  --------------

  + ### onReleased

    public void onReleased()
  + ### setIdentity

    public void setIdentity()
  + ### reset

    public void reset()
  + ### set

    public void set([BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") rhs)
  + ### set

    public void set(org.lwjgl.util.vector.Vector3f pos,
    org.lwjgl.util.vector.Quaternion rot,
    org.lwjgl.util.vector.Vector3f scale)
  + ### set

    public void set(org.lwjgl.util.vector.Matrix4f matrix)
  + ### mul

    public void mul(org.lwjgl.util.vector.Matrix4f a,
    org.lwjgl.util.vector.Matrix4f b)
  + ### getMatrix

    public void getMatrix(org.lwjgl.util.vector.Matrix4f result)
  + ### getPRS

    public void getPRS(org.lwjgl.util.vector.Vector3f pos,
    org.lwjgl.util.vector.Quaternion rot,
    org.lwjgl.util.vector.Vector3f scale)
  + ### setPosition

    public void setPosition(org.lwjgl.util.vector.Vector3f position)
  + ### getPosition

    public void getPosition(org.lwjgl.util.vector.Vector3f pos)
  + ### getRotation

    public void getRotation(org.lwjgl.util.vector.Quaternion rot)
  + ### getValidMatrix\_Internal

    private org.lwjgl.util.vector.Matrix4f getValidMatrix\_Internal()
  + ### validateMatrix

    private void validateMatrix()
  + ### validatePRS

    protected void validatePRS()
  + ### validateInternal

    protected void validateInternal()
  + ### mul

    public static void mul([BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") a,
    org.lwjgl.util.vector.Matrix4f b,
    org.lwjgl.util.vector.Matrix4f result)
  + ### mul

    public static void mul([BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") a,
    org.lwjgl.util.vector.Matrix4f b,
    [BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") result)
  + ### mul

    public static void mul([BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") a,
    [BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") b,
    [BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") result)
  + ### mul

    public static void mul(org.lwjgl.util.vector.Matrix4f a,
    [BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") b,
    [BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") result)
  + ### alloc

    public static [BoneTransform](BoneTransform.html "class in zombie.core.skinnedmodel.animation") alloc()