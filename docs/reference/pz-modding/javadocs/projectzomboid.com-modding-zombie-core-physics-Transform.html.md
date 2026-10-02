[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.physics](package-summary.html)
2. [Transform](Transform.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [basis](#basis)
   2. [origin](#origin)
6. [Constructor Details](#constructor-detail)
   1. [Transform()](#%3Cinit%3E())
   2. [Transform(Matrix3f)](#%3Cinit%3E(org.joml.Matrix3f))
   3. [Transform(Matrix4f)](#%3Cinit%3E(org.joml.Matrix4f))
   4. [Transform(Transform)](#%3Cinit%3E(zombie.core.physics.Transform))
7. [Method Details](#method-detail)
   1. [set(Transform)](#set(zombie.core.physics.Transform))
   2. [set(Matrix3f)](#set(org.joml.Matrix3f))
   3. [set(Matrix4f)](#set(org.joml.Matrix4f))
   4. [transform(Vector3f)](#transform(org.joml.Vector3f))
   5. [setIdentity()](#setIdentity())
   6. [inverse()](#inverse())
   7. [inverse(Transform)](#inverse(zombie.core.physics.Transform))
   8. [getRotation(Quaternionf)](#getRotation(org.joml.Quaternionf))
   9. [setRotation(Quaternionf)](#setRotation(org.joml.Quaternionf))
   10. [getMatrix(Matrix4f)](#getMatrix(org.joml.Matrix4f))
   11. [equals(Object)](#equals(java.lang.Object))
   12. [hashCode()](#hashCode())
   13. [getOrigin()](#getOrigin())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class Transform
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.physics.Transform

---

public final class Transform
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

Transform represents translation and rotation (rigid transform). Scaling and
shearing is not supported.

You can use local shape scaling or
invalid reference

```
UniformScalingShape
```

for static rescaling
of collision objects.

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `final org.joml.Matrix3f`

  `basis`

  Rotation matrix of this Transform.

  `final Vector3f`

  `origin`

  Translation vector of this Transform.
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Transform()`

  `Transform(org.joml.Matrix3f mat)`

  `Transform(org.joml.Matrix4f mat)`

  `Transform(Transform tr)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `boolean`

  `equals(Object obj)`

  `org.joml.Matrix4f`

  `getMatrix(org.joml.Matrix4f out)`

  `Vector3f`

  `getOrigin()`

  `org.joml.Quaternionf`

  `getRotation(org.joml.Quaternionf out)`

  `int`

  `hashCode()`

  `void`

  `inverse()`

  `void`

  `inverse(Transform tr)`

  `void`

  `set(org.joml.Matrix3f mat)`

  `void`

  `set(org.joml.Matrix4f mat)`

  `void`

  `set(Transform tr)`

  `void`

  `setIdentity()`

  `void`

  `setRotation(org.joml.Quaternionf q)`

  `void`

  `transform(Vector3f v)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, finalize, getClass, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### basis

    public final org.joml.Matrix3f basis

    Rotation matrix of this Transform.
  + ### origin

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") origin

    Translation vector of this Transform.
* Constructor Details
  -------------------

  + ### Transform

    public Transform()
  + ### Transform

    public Transform(org.joml.Matrix3f mat)
  + ### Transform

    public Transform(org.joml.Matrix4f mat)
  + ### Transform

    public Transform([Transform](Transform.html "class in zombie.core.physics") tr)
* Method Details
  --------------

  + ### set

    public void set([Transform](Transform.html "class in zombie.core.physics") tr)
  + ### set

    public void set(org.joml.Matrix3f mat)
  + ### set

    public void set(org.joml.Matrix4f mat)
  + ### transform

    public void transform([Vector3f](../../../org/joml/Vector3f.html "class in org.joml") v)
  + ### setIdentity

    public void setIdentity()
  + ### inverse

    public void inverse()
  + ### inverse

    public void inverse([Transform](Transform.html "class in zombie.core.physics") tr)
  + ### getRotation

    public org.joml.Quaternionf getRotation(org.joml.Quaternionf out)
  + ### setRotation

    public void setRotation(org.joml.Quaternionf q)
  + ### getMatrix

    public org.joml.Matrix4f getMatrix(org.joml.Matrix4f out)
  + ### equals

    public boolean equals([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") obj)

    Overrides:
    :   `equals` in class `Object`
  + ### hashCode

    public int hashCode()

    Overrides:
    :   `hashCode` in class `Object`
  + ### getOrigin

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getOrigin()