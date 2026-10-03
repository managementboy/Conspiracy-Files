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
3. [ParentVehiclePart](UI3DScene.ParentVehiclePart.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [vehicle](#vehicle)
   2. [partId](#partId)
   3. [partModelId](#partModelId)
   4. [attachmentName](#attachmentName)
6. [Constructor Details](#constructor-detail)
   1. [ParentVehiclePart()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getGlobalTransform(Matrix4f)](#getGlobalTransform(org.joml.Matrix4f))
   2. [getScriptPart()](#getScriptPart())
   3. [getScriptModel()](#getScriptModel())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.ParentVehiclePart
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.ParentVehiclePart

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.ParentVehiclePart
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) String`

  `attachmentName`

  `(package private) String`

  `partId`

  `(package private) String`

  `partModelId`

  `(package private) UI3DScene.SceneVehicle`

  `vehicle`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `ParentVehiclePart()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) org.joml.Matrix4f`

  `getGlobalTransform(org.joml.Matrix4f transform)`

  `(package private) VehicleScript.Model`

  `getScriptModel()`

  `(package private) VehicleScript.Part`

  `getScriptPart()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### vehicle

    [UI3DScene.SceneVehicle](UI3DScene.SceneVehicle.html "class in zombie.vehicles") vehicle
  + ### partId

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partId
  + ### partModelId

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") partModelId
  + ### attachmentName

    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") attachmentName
* Constructor Details
  -------------------

  + ### ParentVehiclePart

    private ParentVehiclePart()
* Method Details
  --------------

  + ### getGlobalTransform

    org.joml.Matrix4f getGlobalTransform(org.joml.Matrix4f transform)
  + ### getScriptPart

    [VehicleScript.Part](../scripting/objects/VehicleScript.Part.html "class in zombie.scripting.objects") getScriptPart()
  + ### getScriptModel

    [VehicleScript.Model](../scripting/objects/VehicleScript.Model.html "class in zombie.scripting.objects") getScriptModel()