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
3. [SceneGeometry](UI3DScene.SceneGeometry.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [selected](#selected)
6. [Constructor Details](#constructor-detail)
   1. [SceneGeometry(UI3DScene, String)](#%3Cinit%3E(zombie.vehicles.UI3DScene,java.lang.String))
7. [Method Details](#method-detail)
   1. [getTypeName()](#getTypeName())
   2. [isBox()](#isBox())
   3. [asBox()](#asBox())
   4. [isCylinder()](#isCylinder())
   5. [asCylinder()](#asCylinder())
   6. [isPolygon()](#isPolygon())
   7. [asPolygon()](#asPolygon())
   8. [getOriginTransform(String, Matrix4f)](#getOriginTransform(java.lang.String,org.joml.Matrix4f))
   9. [getNormalizedDepthAt(float, float)](#getNormalizedDepthAt(float,float))
   10. [toGeometryFileObject()](#toGeometryFileObject())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneGeometry
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.SceneGeometry

Direct Known Subclasses:
:   `UI3DScene.SceneBox, UI3DScene.SceneCylinder, UI3DScene.ScenePolygon`

Enclosing class:
:   `UI3DScene`

---

private abstract static class UI3DScene.SceneGeometry
extends [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) boolean`

  `selected`

  ### Fields inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#field-summary "class in zombie.vehicles")

  `attachment, autoRotate, autoRotateAngle, id, parent, parentAttachment, parentVehiclePart, rotate, scale, scene, translate, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SceneGeometry(UI3DScene scene,
  String id)`
* Method Summary
  --------------

  All MethodsInstance MethodsAbstract MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `UI3DScene.SceneBox`

  `asBox()`

  `UI3DScene.SceneCylinder`

  `asCylinder()`

  `UI3DScene.ScenePolygon`

  `asPolygon()`

  `(package private) abstract float`

  `getNormalizedDepthAt(float tileX,
  float tileY)`

  `(package private) abstract org.joml.Matrix4f`

  `getOriginTransform(String hint,
  org.joml.Matrix4f xfrm)`

  `abstract String`

  `getTypeName()`

  `boolean`

  `isBox()`

  `boolean`

  `isCylinder()`

  `boolean`

  `isPolygon()`

  `(package private) abstract zombie.tileDepth.TileGeometryFile.Geometry`

  `toGeometryFileObject()`

  ### Methods inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#method-summary "class in zombie.vehicles")

  `clone, getAttachmentTransform, getGlobalTransform, getLocalTransform, initClone, renderMain`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### selected

    boolean selected
* Constructor Details
  -------------------

  + ### SceneGeometry

    SceneGeometry([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### getTypeName

    public abstract [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTypeName()
  + ### isBox

    public boolean isBox()
  + ### asBox

    public [UI3DScene.SceneBox](UI3DScene.SceneBox.html "class in zombie.vehicles") asBox()
  + ### isCylinder

    public boolean isCylinder()
  + ### asCylinder

    public [UI3DScene.SceneCylinder](UI3DScene.SceneCylinder.html "class in zombie.vehicles") asCylinder()
  + ### isPolygon

    public boolean isPolygon()
  + ### asPolygon

    public [UI3DScene.ScenePolygon](UI3DScene.ScenePolygon.html "class in zombie.vehicles") asPolygon()
  + ### getOriginTransform

    abstract org.joml.Matrix4f getOriginTransform([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hint,
    org.joml.Matrix4f xfrm)
  + ### getNormalizedDepthAt

    abstract float getNormalizedDepthAt(float tileX,
    float tileY)
  + ### toGeometryFileObject

    abstract zombie.tileDepth.TileGeometryFile.Geometry toGeometryFileObject()