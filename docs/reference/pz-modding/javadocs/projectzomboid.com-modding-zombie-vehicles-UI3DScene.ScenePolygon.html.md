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
3. [ScenePolygon](UI3DScene.ScenePolygon.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [plane](#plane)
   2. [extents](#extents)
   3. [points](#points)
   4. [editing](#editing)
   5. [highlightPointIndex](#highlightPointIndex)
   6. [triangles](#triangles)
   7. [s\_rasterize](#s_rasterize)
6. [Constructor Details](#constructor-detail)
   1. [ScenePolygon(UI3DScene, String)](#%3Cinit%3E(zombie.vehicles.UI3DScene,java.lang.String))
7. [Method Details](#method-detail)
   1. [getTypeName()](#getTypeName())
   2. [initClone(UI3DScene.SceneObject)](#initClone(zombie.vehicles.UI3DScene.SceneObject))
   3. [clone(String)](#clone(java.lang.String))
   4. [renderMain()](#renderMain())
   5. [getLocalTransform(Matrix4f)](#getLocalTransform(org.joml.Matrix4f))
   6. [isPolygon()](#isPolygon())
   7. [getOriginTransform(String, Matrix4f)](#getOriginTransform(java.lang.String,org.joml.Matrix4f))
   8. [getNormalizedDepthAt(float, float)](#getNormalizedDepthAt(float,float))
   9. [toGeometryFileObject()](#toGeometryFileObject())
   10. [addPointOnEdge(float, float, float, float)](#addPointOnEdge(float,float,float,float))
   11. [pickEdge(float, float, float)](#pickEdge(float,float,float))
   12. [distanceOfPointToLineSegment(Vector2f, Vector2f, Vector2f)](#distanceOfPointToLineSegment(org.joml.Vector2f,org.joml.Vector2f,org.joml.Vector2f))
   13. [isClockwise()](#isClockwise())
   14. [triangulate()](#triangulate())
   15. [pickPoint(float, float, float)](#pickPoint(float,float,float))
   16. [renderPoints()](#renderPoints())
   17. [uiToTile(Vector2f, float, Vector2f, Vector2f)](#uiToTile(org.joml.Vector2f,float,org.joml.Vector2f,org.joml.Vector2f))
   18. [rasterize(Rasterize.ICallback)](#rasterize(zombie.worldMap.Rasterize.ICallback))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.ScenePolygon
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

[zombie.vehicles.UI3DScene.SceneGeometry](UI3DScene.SceneGeometry.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.ScenePolygon

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.ScenePolygon
extends [UI3DScene.SceneGeometry](UI3DScene.SceneGeometry.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) boolean`

  `editing`

  `(package private) final Vector3f`

  `extents`

  `(package private) int`

  `highlightPointIndex`

  `(package private) UI3DScene.GridPlane`

  `plane`

  `(package private) final ArrayList<Vector2f>`

  `points`

  `(package private) static final zombie.worldMap.Rasterize`

  `s_rasterize`

  `(package private) final gnu.trove.list.array.TFloatArrayList`

  `triangles`

  ### Fields inherited from class [UI3DScene.SceneGeometry](UI3DScene.SceneGeometry.html#field-summary "class in zombie.vehicles")

  `selected`

  ### Fields inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#field-summary "class in zombie.vehicles")

  `attachment, autoRotate, autoRotateAngle, id, parent, parentAttachment, parentVehiclePart, rotate, scale, scene, translate, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ScenePolygon(UI3DScene scene,
  String id)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) int`

  `addPointOnEdge(float uiX,
  float uiY,
  float pointX,
  float pointY)`

  `(package private) UI3DScene.SceneObject`

  `clone(String id)`

  `(package private) float`

  `distanceOfPointToLineSegment(Vector2f p1,
  Vector2f p2,
  Vector2f p)`

  `(package private) org.joml.Matrix4f`

  `getLocalTransform(org.joml.Matrix4f transform)`

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

  `isClockwise()`

  `boolean`

  `isPolygon()`

  `(package private) int`

  `pickEdge(float uiX,
  float uiY,
  float maxDist)`

  `(package private) int`

  `pickPoint(float uiX,
  float uiY,
  float maxDist)`

  `(package private) void`

  `rasterize(zombie.worldMap.Rasterize.ICallback consumer)`

  `(package private) UI3DScene.SceneObjectRenderData`

  `renderMain()`

  `(package private) void`

  `renderPoints()`

  `(package private) zombie.tileDepth.TileGeometryFile.Geometry`

  `toGeometryFileObject()`

  `(package private) void`

  `triangulate()`

  `(package private) Vector2f`

  `uiToTile(Vector2f tileXY,
  float pixelSize,
  Vector2f uiPos,
  Vector2f tilePos)`

  ### Methods inherited from class [UI3DScene.SceneGeometry](UI3DScene.SceneGeometry.html#method-summary "class in zombie.vehicles")

  `asBox, asCylinder, asPolygon, isBox, isCylinder`

  ### Methods inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#method-summary "class in zombie.vehicles")

  `getAttachmentTransform, getGlobalTransform`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### plane

    [UI3DScene.GridPlane](UI3DScene.GridPlane.html "enum class in zombie.vehicles") plane
  + ### extents

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") extents
  + ### points

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Vector2f](../../org/joml/Vector2f.html "class in org.joml")> points
  + ### editing

    boolean editing
  + ### highlightPointIndex

    int highlightPointIndex
  + ### triangles

    final gnu.trove.list.array.TFloatArrayList triangles
  + ### s\_rasterize

    static final zombie.worldMap.Rasterize s\_rasterize
* Constructor Details
  -------------------

  + ### ScenePolygon

    ScenePolygon([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene,
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
  + ### getLocalTransform

    org.joml.Matrix4f getLocalTransform(org.joml.Matrix4f transform)

    Overrides:
    :   `getLocalTransform` in class `UI3DScene.SceneObject`
  + ### isPolygon

    public boolean isPolygon()

    Overrides:
    :   `isPolygon` in class `UI3DScene.SceneGeometry`
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
  + ### addPointOnEdge

    int addPointOnEdge(float uiX,
    float uiY,
    float pointX,
    float pointY)
  + ### pickEdge

    int pickEdge(float uiX,
    float uiY,
    float maxDist)
  + ### distanceOfPointToLineSegment

    float distanceOfPointToLineSegment([Vector2f](../../org/joml/Vector2f.html "class in org.joml") p1,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") p2,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") p)
  + ### isClockwise

    boolean isClockwise()
  + ### triangulate

    void triangulate()
  + ### pickPoint

    int pickPoint(float uiX,
    float uiY,
    float maxDist)
  + ### renderPoints

    void renderPoints()
  + ### uiToTile

    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") uiToTile([Vector2f](../../org/joml/Vector2f.html "class in org.joml") tileXY,
    float pixelSize,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") uiPos,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") tilePos)
  + ### rasterize

    void rasterize(zombie.worldMap.Rasterize.ICallback consumer)