[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.scripting.objects](package-summary.html)
2. [ModelAttachment](ModelAttachment.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [owner](#owner)
   2. [id](#id)
   3. [offset](#offset)
   4. [rotate](#rotate)
   5. [scale](#scale)
   6. [bone](#bone)
   7. [canAttach](#canAttach)
   8. [zoffset](#zoffset)
   9. [updateConstraint](#updateConstraint)
6. [Constructor Details](#constructor-detail)
   1. [ModelAttachment(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [setOwner(IModelAttachmentOwner)](#setOwner(zombie.scripting.objects.IModelAttachmentOwner))
   2. [getId()](#getId())
   3. [setId(String)](#setId(java.lang.String))
   4. [getOffset()](#getOffset())
   5. [getRotate()](#getRotate())
   6. [getScale()](#getScale())
   7. [setScale(float)](#setScale(float))
   8. [getBone()](#getBone())
   9. [setBone(String)](#setBone(java.lang.String))
   10. [getCanAttach()](#getCanAttach())
   11. [setCanAttach(ArrayList)](#setCanAttach(java.util.ArrayList))
   12. [getZOffset()](#getZOffset())
   13. [setZOffset(float)](#setZOffset(float))
   14. [isUpdateConstraint()](#isUpdateConstraint())
   15. [setUpdateConstraint(boolean)](#setUpdateConstraint(boolean))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class ModelAttachment
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.scripting.objects.ModelAttachment

---

public final class ModelAttachment
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private String`

  `bone`

  `private ArrayList<String>`

  `canAttach`

  `private String`

  `id`

  `private final Vector3f`

  `offset`

  `private zombie.scripting.objects.IModelAttachmentOwner`

  `owner`

  `private final Vector3f`

  `rotate`

  `private float`

  `scale`

  `private boolean`

  `updateConstraint`

  `private float`

  `zoffset`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ModelAttachment(String id)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getBone()`

  `ArrayList<String>`

  `getCanAttach()`

  `String`

  `getId()`

  `Vector3f`

  `getOffset()`

  `Vector3f`

  `getRotate()`

  `float`

  `getScale()`

  `float`

  `getZOffset()`

  `boolean`

  `isUpdateConstraint()`

  `void`

  `setBone(String bone)`

  `void`

  `setCanAttach(ArrayList<String> canAttach)`

  `void`

  `setId(String id)`

  `void`

  `setOwner(zombie.scripting.objects.IModelAttachmentOwner owner)`

  `void`

  `setScale(float scale)`

  `void`

  `setUpdateConstraint(boolean updateConstraint)`

  `void`

  `setZOffset(float zoffset)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### owner

    private zombie.scripting.objects.IModelAttachmentOwner owner
  + ### id

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id
  + ### offset

    private final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") offset
  + ### rotate

    private final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") rotate
  + ### scale

    private float scale
  + ### bone

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bone
  + ### canAttach

    private [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> canAttach
  + ### zoffset

    private float zoffset
  + ### updateConstraint

    private boolean updateConstraint
* Constructor Details
  -------------------

  + ### ModelAttachment

    public ModelAttachment([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### setOwner

    public void setOwner(zombie.scripting.objects.IModelAttachmentOwner owner)
  + ### getId

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getId()
  + ### setId

    public void setId([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
  + ### getOffset

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getOffset()
  + ### getRotate

    public [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") getRotate()
  + ### getScale

    public float getScale()
  + ### setScale

    public void setScale(float scale)
  + ### getBone

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getBone()
  + ### setBone

    public void setBone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") bone)
  + ### getCanAttach

    public [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> getCanAttach()
  + ### setCanAttach

    public void setCanAttach([ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang")> canAttach)
  + ### getZOffset

    public float getZOffset()
  + ### setZOffset

    public void setZOffset(float zoffset)
  + ### isUpdateConstraint

    public boolean isUpdateConstraint()
  + ### setUpdateConstraint

    public void setUpdateConstraint(boolean updateConstraint)