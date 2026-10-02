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
3. [StateData](UI3DScene.StateData.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [projection](#projection)
   2. [modelView](#modelView)
   3. [zoom](#zoom)
   4. [gridPlaneDrawer](#gridPlaneDrawer)
   5. [overlaysDrawer](#overlaysDrawer)
   6. [objectData](#objectData)
   7. [gizmo](#gizmo)
   8. [gizmoTranslate](#gizmoTranslate)
   9. [gizmoRotate](#gizmoRotate)
   10. [gizmoParentTransform](#gizmoParentTransform)
   11. [gizmoOriginTransform](#gizmoOriginTransform)
   12. [gizmoChildTransform](#gizmoChildTransform)
   13. [gizmoChildAttachmentTransform](#gizmoChildAttachmentTransform)
   14. [gizmoChildAttachmentTransformInv](#gizmoChildAttachmentTransformInv)
   15. [gizmoTransform](#gizmoTransform)
   16. [hasGizmoOrigin](#hasGizmoOrigin)
   17. [gizmoOriginIsGeometry](#gizmoOriginIsGeometry)
   18. [selectedAttachmentIsChildAttachment](#selectedAttachmentIsChildAttachment)
   19. [gizmoAxis](#gizmoAxis)
   20. [translateGizmoRenderData](#translateGizmoRenderData)
   21. [axes](#axes)
   22. [aabb](#aabb)
   23. [box3d](#box3d)
   24. [physicsMesh](#physicsMesh)
6. [Constructor Details](#constructor-detail)
   1. [StateData()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [zoomMult()](#zoomMult())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.StateData
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.vehicles.UI3DScene.StateData

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.StateData
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final ArrayList<UI3DScene.AABB>`

  `aabb`

  `(package private) final ArrayList<UI3DScene.PositionRotation>`

  `axes`

  `(package private) final ArrayList<UI3DScene.Box3D>`

  `box3d`

  `(package private) UI3DScene.Gizmo`

  `gizmo`

  `(package private) UI3DScene.Axis`

  `gizmoAxis`

  `(package private) final org.joml.Matrix4f`

  `gizmoChildAttachmentTransform`

  `(package private) final org.joml.Matrix4f`

  `gizmoChildAttachmentTransformInv`

  `(package private) final org.joml.Matrix4f`

  `gizmoChildTransform`

  `(package private) boolean`

  `gizmoOriginIsGeometry`

  `(package private) final org.joml.Matrix4f`

  `gizmoOriginTransform`

  `(package private) final org.joml.Matrix4f`

  `gizmoParentTransform`

  `(package private) final Vector3f`

  `gizmoRotate`

  `(package private) final org.joml.Matrix4f`

  `gizmoTransform`

  `(package private) final Vector3f`

  `gizmoTranslate`

  `(package private) UI3DScene.GridPlaneDrawer`

  `gridPlaneDrawer`

  `(package private) boolean`

  `hasGizmoOrigin`

  `(package private) final org.joml.Matrix4f`

  `modelView`

  `(package private) final ArrayList<UI3DScene.SceneObjectRenderData>`

  `objectData`

  `(package private) UI3DScene.OverlaysDrawer`

  `overlaysDrawer`

  `(package private) final ArrayList<UI3DScene.PhysicsMesh>`

  `physicsMesh`

  `(package private) final org.joml.Matrix4f`

  `projection`

  `(package private) boolean`

  `selectedAttachmentIsChildAttachment`

  `(package private) final UI3DScene.TranslateGizmoRenderData`

  `translateGizmoRenderData`

  `(package private) int`

  `zoom`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `StateData()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private float`

  `zoomMult()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### projection

    final org.joml.Matrix4f projection
  + ### modelView

    final org.joml.Matrix4f modelView
  + ### zoom

    int zoom
  + ### gridPlaneDrawer

    [UI3DScene.GridPlaneDrawer](UI3DScene.GridPlaneDrawer.html "class in zombie.vehicles") gridPlaneDrawer
  + ### overlaysDrawer

    [UI3DScene.OverlaysDrawer](UI3DScene.OverlaysDrawer.html "class in zombie.vehicles") overlaysDrawer
  + ### objectData

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles")> objectData
  + ### gizmo

    [UI3DScene.Gizmo](UI3DScene.Gizmo.html "class in zombie.vehicles") gizmo
  + ### gizmoTranslate

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") gizmoTranslate
  + ### gizmoRotate

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") gizmoRotate
  + ### gizmoParentTransform

    final org.joml.Matrix4f gizmoParentTransform
  + ### gizmoOriginTransform

    final org.joml.Matrix4f gizmoOriginTransform
  + ### gizmoChildTransform

    final org.joml.Matrix4f gizmoChildTransform
  + ### gizmoChildAttachmentTransform

    final org.joml.Matrix4f gizmoChildAttachmentTransform
  + ### gizmoChildAttachmentTransformInv

    final org.joml.Matrix4f gizmoChildAttachmentTransformInv
  + ### gizmoTransform

    final org.joml.Matrix4f gizmoTransform
  + ### hasGizmoOrigin

    boolean hasGizmoOrigin
  + ### gizmoOriginIsGeometry

    boolean gizmoOriginIsGeometry
  + ### selectedAttachmentIsChildAttachment

    boolean selectedAttachmentIsChildAttachment
  + ### gizmoAxis

    [UI3DScene.Axis](UI3DScene.Axis.html "enum class in zombie.vehicles") gizmoAxis
  + ### translateGizmoRenderData

    final [UI3DScene.TranslateGizmoRenderData](UI3DScene.TranslateGizmoRenderData.html "class in zombie.vehicles") translateGizmoRenderData
  + ### axes

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.PositionRotation](UI3DScene.PositionRotation.html "class in zombie.vehicles")> axes
  + ### aabb

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.AABB](UI3DScene.AABB.html "class in zombie.vehicles")> aabb
  + ### box3d

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.Box3D](UI3DScene.Box3D.html "class in zombie.vehicles")> box3d
  + ### physicsMesh

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.PhysicsMesh](UI3DScene.PhysicsMesh.html "class in zombie.vehicles")> physicsMesh
* Constructor Details
  -------------------

  + ### StateData

    private StateData()
* Method Details
  --------------

  + ### zoomMult

    private float zoomMult()