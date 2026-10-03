[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [VehicleScript](VehicleScript.html)
3. [Model](VehicleScript.Model.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [file](#file)
   3. [scale](#scale)
   4. [offset](#offset)
   5. [rotate](#rotate)
   6. [attachmentNameParent](#attachmentNameParent)
   7. [attachmentNameSelf](#attachmentNameSelf)
   8. [ignoreVehicleScale](#ignoreVehicleScale)
6. [Constructor Details](#constructor-detail)
   1. [Model()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getId()](#getId())
   2. [getFile()](#getFile())
   3. [getScale()](#getScale())
   4. [getOffset()](#getOffset())
   5. [getRotate()](#getRotate())
   6. [getAttachmentNameParent()](#getAttachmentNameParent())
   7. [getAttachmentNameSelf()](#getAttachmentNameSelf())
   8. [makeCopy()](#makeCopy())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class VehicleScript.Model
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.VehicleScript.Model

Enclosing class:
:   `VehicleScript`

---

public static final class VehicleScript.Model
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `String`

  `attachmentNameParent`

  `String`

  `attachmentNameSelf`

  `String`

  `file`

  `String`

  `id`

  `boolean`

  `ignoreVehicleScale`

  `final Vector3f`

  `offset`

  `final Vector3f`

  `rotate`

  `float`

  `scale`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `Model()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getAttachmentNameParent()`

  `String`

  `getAttachmentNameSelf()`

  `String`

  `getFile()`

  `String`

  `getId()`

  `Vector3f`

  `getOffset()`

  `Vector3f`

  `getRotate()`

  `float`

  `getScale()`

  `(package private) VehicleScript.Model`

  `makeCopy()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### file

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") file
  + ### scale

    public float scale
  + ### offset

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") offset
  + ### rotate

    public final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") rotate
  + ### attachmentNameParent

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentNameParent
  + ### attachmentNameSelf

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentNameSelf
  + ### ignoreVehicleScale

    public boolean ignoreVehicleScale
* Constructor Details
  -------------------

  + ### Model

    public Model()
* Method Details
  --------------

  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### getFile

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getFile()
  + ### getScale

    public float getScale()
  + ### getOffset

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getOffset()
  + ### getRotate

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getRotate()
  + ### getAttachmentNameParent

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttachmentNameParent()
  + ### getAttachmentNameSelf

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getAttachmentNameSelf()
  + ### makeCopy

    [VehicleScript.Model](VehicleScript.Model.html "class in zombie.scripting.objects") makeCopy()