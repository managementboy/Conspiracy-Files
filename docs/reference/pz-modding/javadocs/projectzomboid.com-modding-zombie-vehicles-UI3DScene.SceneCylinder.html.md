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
3. [SceneCylinder](UI3DScene.SceneCylinder.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [radius](#radius)
   2. [height](#height)
6. [Constructor Details](#constructor-detail)
   1. [SceneCylinder(UI3DScene, String)](#%3Cinit%3E(zombie.vehicles.UI3DScene,java.lang.String))
7. [Method Details](#method-detail)
   1. [getTypeName()](#getTypeName())
   2. [initClone(UI3DScene.SceneObject)](#initClone(zombie.vehicles.UI3DScene.SceneObject))
   3. [clone(String)](#clone(java.lang.String))
   4. [renderMain()](#renderMain())
   5. [isCylinder()](#isCylinder())
   6. [getOriginTransform(String, Matrix4f)](#getOriginTransform(java.lang.String,org.joml.Matrix4f))
   7. [getNormalizedDepthAt(float, float)](#getNormalizedDepthAt(float,float))
   8. [toGeometryFileObject()](#toGeometryFileObject())
   9. [intersect(UI3DScene.Ray, CylinderUtils.IntersectionRecord)](#intersect(zombie.vehicles.UI3DScene.Ray,zombie.tileDepth.CylinderUtils.IntersectionRecord))
   10. [getAABB(UI3DScene.AABB)](#getAABB(zombie.vehicles.UI3DScene.AABB))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneCylinder
=============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

[zombie.vehicles.UI3DScene.SceneGeometry](UI3DScene.SceneGeometry.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.SceneCylinder

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.SceneCylinder
extends [UI3DScene.SceneGeometry](UI3DScene.SceneGeometry.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `height`

  `(package private) float`

  `radius`

  ### Fields inherited from class [UI3DScene.SceneGeometry](UI3DScene.SceneGeometry.html#field-summary "class in zombie.vehicles")

  `selected`

  ### Fields inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#field-summary "class in zombie.vehicles")

  `attachment, autoRotate, autoRotateAngle, id, parent, parentAttachment, parentVehiclePart, rotate, scale, scene, translate, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SceneCylinder(UI3DScene scene,
  String id)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) UI3DScene.SceneObject`

  `clone(String id)`

  `(package private) UI3DScene.AABB`

  `getAABB(UI3DScene.AABB aabb)`

  `(package private) float`

  `getNormalizedDepthAt(float tileX,
  float tileY)`

  `(package private) org.joml.Matrix4f`

  `getOriginTransform(String hint,
  org.joml.Matrix4f xfrm)`

  `String`

  `getTypeName()`

  `(package private) void`

  `initClone(UI3DScene.SceneObject clone)`

  `(package private) boolean`

  `intersect(UI3DScene.Ray rayIn,
  zombie.tileDepth.CylinderUtils.IntersectionRecord outRecord)`

  `boolean`

  `isCylinder()`

  `(package private) UI3DScene.SceneObjectRenderData`

  `renderMain()`

  `(package private) zombie.tileDepth.TileGeometryFile.Geometry`

  `toGeometryFileObject()`

  ### Methods inherited from class [UI3DScene.SceneGeometry](UI3DScene.SceneGeometry.html#method-summary "class in zombie.vehicles")

  `asBox, asCylinder, asPolygon, isBox, isPolygon`

  ### Methods inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#method-summary "class in zombie.vehicles")

  `getAttachmentTransform, getGlobalTransform, getLocalTransform`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### radius

    float radius
  + ### height

    float height
* Constructor Details
  -------------------

  + ### SceneCylinder

    SceneCylinder([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### getTypeName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTypeName()

    Specified by:
    :   `getTypeName` in class `UI3DScene.SceneGeometry`
  + ### initClone

    void initClone([UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles") clone)

    Overrides:
    :   `initClone` in class `UI3DScene.SceneObject`
  + ### clone

    [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles") clone([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)

    Overrides:
    :   `clone` in class `UI3DScene.SceneObject`
  + ### renderMain

    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") renderMain()

    Specified by:
    :   `renderMain` in class `UI3DScene.SceneObject`
  + ### isCylinder

    public boolean isCylinder()

    Overrides:
    :   `isCylinder` in class `UI3DScene.SceneGeometry`
  + ### getOriginTransform

    org.joml.Matrix4f getOriginTransform([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") hint,
    org.joml.Matrix4f xfrm)

    Specified by:
    :   `getOriginTransform` in class `UI3DScene.SceneGeometry`
  + ### getNormalizedDepthAt

    float getNormalizedDepthAt(float tileX,
    float tileY)

    Specified by:
    :   `getNormalizedDepthAt` in class `UI3DScene.SceneGeometry`
  + ### toGeometryFileObject

    zombie.tileDepth.TileGeometryFile.Geometry toGeometryFileObject()

    Specified by:
    :   `toGeometryFileObject` in class `UI3DScene.SceneGeometry`
  + ### intersect

    boolean intersect([UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") rayIn,
    zombie.tileDepth.CylinderUtils.IntersectionRecord outRecord)
  + ### getAABB

    [UI3DScene.AABB](UI3DScene.AABB.html "class in zombie.vehicles") getAABB([UI3DScene.AABB](UI3DScene.AABB.html "class in zombie.vehicles") aabb)