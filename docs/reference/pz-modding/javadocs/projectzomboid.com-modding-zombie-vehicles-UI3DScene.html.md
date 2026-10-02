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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [Z\_SCALE](#Z_SCALE)
   2. [objects](#objects)
   3. [view](#view)
   4. [transformMode](#transformMode)
   5. [viewX](#viewX)
   6. [viewY](#viewY)
   7. [viewRotation](#viewRotation)
   8. [zoom](#zoom)
   9. [zoomMax](#zoomMax)
   10. [gridDivisions](#gridDivisions)
   11. [gridPlane](#gridPlane)
   12. [projection](#projection)
   13. [modelView](#modelView)
   14. [VIEW\_CHANGE\_TIME](#VIEW_CHANGE_TIME)
   15. [viewChangeTime](#viewChangeTime)
   16. [modelViewChange](#modelViewChange)
   17. [drawAttachments](#drawAttachments)
   18. [drawGrid](#drawGrid)
   19. [drawGridAxes](#drawGridAxes)
   20. [drawGeometry](#drawGeometry)
   21. [drawGridPlane](#drawGridPlane)
   22. [characterSceneModelCamera](#characterSceneModelCamera)
   23. [vehicleSceneModelCamera](#vehicleSceneModelCamera)
   24. [s\_SetModelCameraPool](#s_SetModelCameraPool)
   25. [stateData](#stateData)
   26. [gizmo](#gizmo)
   27. [rotateGizmo](#rotateGizmo)
   28. [scaleGizmo](#scaleGizmo)
   29. [translateGizmo](#translateGizmo)
   30. [gizmoPos](#gizmoPos)
   31. [gizmoRotate](#gizmoRotate)
   32. [gizmoParent](#gizmoParent)
   33. [gizmoOrigin](#gizmoOrigin)
   34. [gizmoChild](#gizmoChild)
   35. [originAttachment](#originAttachment)
   36. [originBone](#originBone)
   37. [originGeometry](#originGeometry)
   38. [originGizmo](#originGizmo)
   39. [originVehiclePart](#originVehiclePart)
   40. [gizmoScale](#gizmoScale)
   41. [gizmoAxisVisibleX](#gizmoAxisVisibleX)
   42. [gizmoAxisVisibleY](#gizmoAxisVisibleY)
   43. [gizmoAxisVisibleZ](#gizmoAxisVisibleZ)
   44. [selectedAttachment](#selectedAttachment)
   45. [axes](#axes)
   46. [highlightBone](#highlightBone)
   47. [highlightPartBone](#highlightPartBone)
   48. [polygonEditor](#polygonEditor)
   49. [clipper](#clipper)
   50. [s\_posRotPool](#s_posRotPool)
   51. [aabb](#aabb)
   52. [s\_aabbPool](#s_aabbPool)
   53. [box3d](#box3d)
   54. [s\_box3DPool](#s_box3DPool)
   55. [physicsMesh](#physicsMesh)
   56. [s\_physicsMeshPool](#s_physicsMeshPool)
   57. [tempVector3f](#tempVector3f)
   58. [viewport](#viewport)
   59. [GRID\_DARK](#GRID_DARK)
   60. [GRID\_LIGHT](#GRID_LIGHT)
   61. [gridAlpha](#gridAlpha)
   62. [HALF\_GRID](#HALF_GRID)
   63. [vboRenderer](#vboRenderer)
   64. [TL\_Ray\_pool](#TL_Ray_pool)
   65. [TL\_Plane\_pool](#TL_Plane_pool)
   66. [SMALL\_NUM](#SMALL_NUM)
7. [Constructor Details](#constructor-detail)
   1. [UI3DScene(KahluaTable)](#%3Cinit%3E(se.krka.kahlua.vm.KahluaTable))
8. [Method Details](#method-detail)
   1. [getSceneObjectById(String, boolean)](#getSceneObjectById(java.lang.String,boolean))
   2. [getSceneObjectById(String, Class, boolean)](#getSceneObjectById(java.lang.String,java.lang.Class,boolean))
   3. [render()](#render())
   4. [setModelViewProjection(UI3DScene.StateData)](#setModelViewProjection(zombie.vehicles.UI3DScene.StateData))
   5. [setGizmoTransforms(UI3DScene.StateData)](#setGizmoTransforms(zombie.vehicles.UI3DScene.StateData))
   6. [gridMult()](#gridMult())
   7. [zoomMult()](#zoomMult())
   8. [allocMatrix4f()](#allocMatrix4f())
   9. [releaseMatrix4f(Matrix4f)](#releaseMatrix4f(org.joml.Matrix4f))
   10. [allocQuaternionf()](#allocQuaternionf())
   11. [releaseQuaternionf(Quaternionf)](#releaseQuaternionf(org.joml.Quaternionf))
   12. [allocRay()](#allocRay())
   13. [releaseRay(UI3DScene.Ray)](#releaseRay(zombie.vehicles.UI3DScene.Ray))
   14. [allocPlane()](#allocPlane())
   15. [releasePlane(UI3DScene.Plane)](#releasePlane(zombie.vehicles.UI3DScene.Plane))
   16. [allocVector2()](#allocVector2())
   17. [releaseVector2(Vector2)](#releaseVector2(zombie.iso.Vector2))
   18. [allocVector2f()](#allocVector2f())
   19. [releaseVector2f(Vector2f)](#releaseVector2f(org.joml.Vector2f))
   20. [allocVector3f()](#allocVector3f())
   21. [releaseVector3f(Vector3f)](#releaseVector3f(org.joml.Vector3f))
   22. [fromLua0(String)](#fromLua0(java.lang.String))
   23. [fromLua1(String, Object)](#fromLua1(java.lang.String,java.lang.Object))
   24. [fromLua2(String, Object, Object)](#fromLua2(java.lang.String,java.lang.Object,java.lang.Object))
   25. [fromLua3(String, Object, Object, Object)](#fromLua3(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object))
   26. [fromLua4(String, Object, Object, Object, Object)](#fromLua4(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   27. [fromLua5(String, Object, Object, Object, Object, Object)](#fromLua5(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   28. [fromLua6(String, Object, Object, Object, Object, Object, Object)](#fromLua6(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   29. [fromLua7(String, Object, Object, Object, Object, Object, Object, Object)](#fromLua7(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   30. [fromLua9(String, Object, Object, Object, Object, Object, Object, Object, Object, Object)](#fromLua9(java.lang.String,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object,java.lang.Object))
   31. [screenWidth()](#screenWidth())
   32. [screenHeight()](#screenHeight())
   33. [uiToSceneX(float, float)](#uiToSceneX(float,float))
   34. [uiToSceneY(float, float)](#uiToSceneY(float,float))
   35. [uiToScene(float, float, float, Vector3f)](#uiToScene(float,float,float,org.joml.Vector3f))
   36. [uiToScene(Matrix4f, float, float, float, Vector3f)](#uiToScene(org.joml.Matrix4f,float,float,float,org.joml.Vector3f))
   37. [sceneToUIX(float, float, float)](#sceneToUIX(float,float,float))
   38. [sceneToUIY(float, float, float)](#sceneToUIY(float,float,float))
   39. [sceneToUIX(Vector3f)](#sceneToUIX(org.joml.Vector3f))
   40. [sceneToUIY(Vector3f)](#sceneToUIY(org.joml.Vector3f))
   41. [uiToGrid(float, float, UI3DScene.GridPlane, Vector3f)](#uiToGrid(float,float,zombie.vehicles.UI3DScene.GridPlane,org.joml.Vector3f))
   42. [renderGridXY(int)](#renderGridXY(int))
   43. [renderGridXZ(int)](#renderGridXZ(int))
   44. [renderGridYZ(int)](#renderGridYZ(int))
   45. [renderGrid()](#renderGrid())
   46. [renderAxis(UI3DScene.PositionRotation)](#renderAxis(zombie.vehicles.UI3DScene.PositionRotation))
   47. [renderAxis(Vector3f, Vector3f, boolean)](#renderAxis(org.joml.Vector3f,org.joml.Vector3f,boolean))
   48. [renderAABB(float, float, float, float, float, float, float, float, float, float, float, float, float, boolean)](#renderAABB(float,float,float,float,float,float,float,float,float,float,float,float,float,boolean))
   49. [renderAABB(float, float, float, Vector3f, Vector3f, float, float, float)](#renderAABB(float,float,float,org.joml.Vector3f,org.joml.Vector3f,float,float,float))
   50. [renderBox3D(float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, boolean)](#renderBox3D(float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,float,boolean))
   51. [renderPhysicsMesh(float, float, float, float, float, float, float, float, float, float[])](#renderPhysicsMesh(float,float,float,float,float,float,float,float,float,float%5B%5D))
   52. [calcMatrices(Matrix4f, Matrix4f)](#calcMatrices(org.joml.Matrix4f,org.joml.Matrix4f))
   53. [getCameraRay(float, float, UI3DScene.Ray)](#getCameraRay(float,float,zombie.vehicles.UI3DScene.Ray))
   54. [getCameraRay(float, float, Matrix4f, Matrix4f, UI3DScene.Ray)](#getCameraRay(float,float,org.joml.Matrix4f,org.joml.Matrix4f,zombie.vehicles.UI3DScene.Ray))
   55. [getCameraRay(float, float, Matrix4f, Matrix4f, int, int, UI3DScene.Ray)](#getCameraRay(float,float,org.joml.Matrix4f,org.joml.Matrix4f,int,int,zombie.vehicles.UI3DScene.Ray))
   56. [closest\_distance\_between\_lines(UI3DScene.Ray, UI3DScene.Ray)](#closest_distance_between_lines(zombie.vehicles.UI3DScene.Ray,zombie.vehicles.UI3DScene.Ray))
   57. [project(Vector3f, Vector3f, Vector3f)](#project(org.joml.Vector3f,org.joml.Vector3f,org.joml.Vector3f))
   58. [reject(Vector3f, Vector3f, Vector3f)](#reject(org.joml.Vector3f,org.joml.Vector3f,org.joml.Vector3f))
   59. [intersect\_ray\_plane(UI3DScene.Plane, UI3DScene.Ray, Vector3f)](#intersect_ray_plane(zombie.vehicles.UI3DScene.Plane,zombie.vehicles.UI3DScene.Ray,org.joml.Vector3f))
   60. [distance\_between\_point\_ray(Vector3f, UI3DScene.Ray)](#distance_between_point_ray(org.joml.Vector3f,zombie.vehicles.UI3DScene.Ray))
   61. [closest\_distance\_line\_circle(UI3DScene.Ray, UI3DScene.Circle, Vector3f)](#closest_distance_line_circle(zombie.vehicles.UI3DScene.Ray,zombie.vehicles.UI3DScene.Circle,org.joml.Vector3f))
   62. [stateDataMain()](#stateDataMain())
   63. [stateDataRender()](#stateDataRender())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.ui.UIElement](../ui/UIElement.html "class in zombie.ui")

zombie.vehicles.UI3DScene

All Implemented Interfaces:
:   `zombie.ui.UIElementInterface`

---

public final class UI3DScene
extends [UIElement](../ui/UIElement.html "class in zombie.ui")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private static final class`

  `UI3DScene.AABB`

  `(package private) static enum`

  `UI3DScene.Axis`

  `private static final class`

  `UI3DScene.Box3D`

  `private static final class`

  `UI3DScene.CharacterDrawer`

  `private static class`

  `UI3DScene.CharacterRenderData`

  `private final class`

  `UI3DScene.CharacterSceneModelCamera`

  `static final class`

  `UI3DScene.Circle`

  `private class`

  `UI3DScene.Gizmo`

  `static enum`

  `UI3DScene.GridPlane`

  `private final class`

  `UI3DScene.GridPlaneDrawer`

  `private static final class`

  `UI3DScene.ModelDrawer`

  `private static class`

  `UI3DScene.ModelRenderData`

  `private static final class`

  `UI3DScene.OriginAttachment`

  `private static final class`

  `UI3DScene.OriginBone`

  `private static final class`

  `UI3DScene.OriginGeometry`

  `private static final class`

  `UI3DScene.OriginGizmo`

  `private static final class`

  `UI3DScene.OriginVehiclePart`

  `private final class`

  `UI3DScene.OverlaysDrawer`

  `private static final class`

  `UI3DScene.ParentVehiclePart`

  `static final class`

  `UI3DScene.PhysicsMesh`

  `static final class`

  `UI3DScene.Plane`

  `static final class`

  `UI3DScene.PlaneObjectPool`

  `static final class`

  `UI3DScene.PolygonEditor`

  `private static final class`

  `UI3DScene.PositionRotation`

  `static final class`

  `UI3DScene.Ray`

  `static final class`

  `UI3DScene.RayObjectPool`

  `private final class`

  `UI3DScene.RotateGizmo`

  `private final class`

  `UI3DScene.ScaleGizmo`

  `private static final class`

  `UI3DScene.SceneAnimal`

  `private static final class`

  `UI3DScene.SceneBox`

  `private static class`

  `UI3DScene.SceneCharacter`

  `private static final class`

  `UI3DScene.SceneCylinder`

  `private static final class`

  `UI3DScene.SceneCylinderDrawer`

  `private static final class`

  `UI3DScene.SceneDepthTexture`

  `private static class`

  `UI3DScene.SceneGeometry`

  `private static final class`

  `UI3DScene.SceneModel`

  `private class`

  `UI3DScene.SceneModelCamera`

  `private static class`

  `UI3DScene.SceneObject`

  `private static class`

  `UI3DScene.SceneObjectRenderData`

  `private static final class`

  `UI3DScene.ScenePlayer`

  `private static final class`

  `UI3DScene.ScenePolygon`

  `private static final class`

  `UI3DScene.ScenePolygonDrawer`

  `private static class`

  `UI3DScene.ScenePolygonRenderData`

  `private static final class`

  `UI3DScene.SceneVehicle`

  `private static final class`

  `UI3DScene.SceneVehicleModelInfo`

  `private static final class`

  `UI3DScene.SetModelCamera`

  `private static final class`

  `UI3DScene.SpriteGridTextureMaskDrawer`

  `private static final class`

  `UI3DScene.StateData`

  `private static final class`

  `UI3DScene.TextureMaskDrawer`

  `private static enum`

  `UI3DScene.TransformMode`

  `private final class`

  `UI3DScene.TranslateGizmo`

  `private static final class`

  `UI3DScene.TranslateGizmoRenderData`

  `private static final class`

  `UI3DScene.VehicleDrawer`

  `private static class`

  `UI3DScene.VehicleModelRenderData`

  `private static class`

  `UI3DScene.VehicleRenderData`

  `private final class`

  `UI3DScene.VehicleSceneModelCamera`

  `private static enum`

  `UI3DScene.View`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final ArrayList<UI3DScene.AABB>`

  `aabb`

  `private final ArrayList<UI3DScene.PositionRotation>`

  `axes`

  `private final ArrayList<UI3DScene.Box3D>`

  `box3d`

  `private final UI3DScene.CharacterSceneModelCamera`

  `characterSceneModelCamera`

  `private static zombie.vehicles.Clipper`

  `clipper`

  `private boolean`

  `drawAttachments`

  `private boolean`

  `drawGeometry`

  `private boolean`

  `drawGrid`

  `private boolean`

  `drawGridAxes`

  `private boolean`

  `drawGridPlane`

  `private UI3DScene.Gizmo`

  `gizmo`

  `private boolean`

  `gizmoAxisVisibleX`

  `private boolean`

  `gizmoAxisVisibleY`

  `private boolean`

  `gizmoAxisVisibleZ`

  `private UI3DScene.SceneObject`

  `gizmoChild`

  `private UI3DScene.SceneObject`

  `gizmoOrigin`

  `private UI3DScene.SceneObject`

  `gizmoParent`

  `private final Vector3f`

  `gizmoPos`

  `private final Vector3f`

  `gizmoRotate`

  `private float`

  `gizmoScale`

  `private static final float`

  `GRID_DARK`

  `private static final float`

  `GRID_LIGHT`

  `private float`

  `gridAlpha`

  `private int`

  `gridDivisions`

  `private UI3DScene.GridPlane`

  `gridPlane`

  `private static final int`

  `HALF_GRID`

  `private final UI3DScene.OriginBone`

  `highlightBone`

  `private final UI3DScene.OriginVehiclePart`

  `highlightPartBone`

  `private final org.joml.Matrix4f`

  `modelView`

  `private final org.joml.Quaternionf`

  `modelViewChange`

  `private final ArrayList<UI3DScene.SceneObject>`

  `objects`

  `private final UI3DScene.OriginAttachment`

  `originAttachment`

  `private final UI3DScene.OriginBone`

  `originBone`

  `private final UI3DScene.OriginGeometry`

  `originGeometry`

  `private final UI3DScene.OriginGizmo`

  `originGizmo`

  `private final UI3DScene.OriginVehiclePart`

  `originVehiclePart`

  `private final ArrayList<UI3DScene.PhysicsMesh>`

  `physicsMesh`

  `private final UI3DScene.PolygonEditor`

  `polygonEditor`

  `private final org.joml.Matrix4f`

  `projection`

  `private final UI3DScene.RotateGizmo`

  `rotateGizmo`

  `private static final zombie.popman.ObjectPool<UI3DScene.AABB>`

  `s_aabbPool`

  `private static final zombie.popman.ObjectPool<UI3DScene.Box3D>`

  `s_box3DPool`

  `private static final zombie.popman.ObjectPool<UI3DScene.PhysicsMesh>`

  `s_physicsMeshPool`

  `private static final zombie.popman.ObjectPool<UI3DScene.PositionRotation>`

  `s_posRotPool`

  `private static final zombie.popman.ObjectPool<UI3DScene.SetModelCamera>`

  `s_SetModelCameraPool`

  `private final UI3DScene.ScaleGizmo`

  `scaleGizmo`

  `private String`

  `selectedAttachment`

  `(package private) static final float`

  `SMALL_NUM`

  `private final UI3DScene.StateData[]`

  `stateData`

  `(package private) final Vector3f`

  `tempVector3f`

  `private static final ThreadLocal<zombie.popman.ObjectPool<UI3DScene.Plane>>`

  `TL_Plane_pool`

  `private static final ThreadLocal<zombie.popman.ObjectPool<UI3DScene.Ray>>`

  `TL_Ray_pool`

  `private UI3DScene.TransformMode`

  `transformMode`

  `private final UI3DScene.TranslateGizmo`

  `translateGizmo`

  `private static zombie.core.opengl.VBORenderer`

  `vboRenderer`

  `private final UI3DScene.VehicleSceneModelCamera`

  `vehicleSceneModelCamera`

  `private UI3DScene.View`

  `view`

  `private static final long`

  `VIEW_CHANGE_TIME`

  `private long`

  `viewChangeTime`

  `(package private) final int[]`

  `viewport`

  `private final Vector3f`

  `viewRotation`

  `private int`

  `viewX`

  `private int`

  `viewY`

  `static final float`

  `Z_SCALE`

  `private int`

  `zoom`

  `private int`

  `zoomMax`

  ### Fields inherited from class [UIElement](../ui/UIElement.html#field-summary "class in zombie.ui")

  `alwaysBack, alwaysOnTop, anchorBottom, anchorLeft, anchorRight, anchorTop, capture, clickedValue, controls, defaultDraw, followGameWorld, height, ignoreLossControl, maxDrawHeight, parent, playerContext, scrollChildren, scrollWithParent, table, visible, width, x, y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `UI3DScene(se.krka.kahlua.vm.KahluaTable table)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private static org.joml.Matrix4f`

  `allocMatrix4f()`

  `static UI3DScene.Plane`

  `allocPlane()`

  `private static org.joml.Quaternionf`

  `allocQuaternionf()`

  `static UI3DScene.Ray`

  `allocRay()`

  `private static Vector2`

  `allocVector2()`

  `private static Vector2f`

  `allocVector2f()`

  `private static Vector3f`

  `allocVector3f()`

  `private void`

  `calcMatrices(org.joml.Matrix4f projection,
  org.joml.Matrix4f modelView)`

  `static float`

  `closest_distance_between_lines(UI3DScene.Ray l1,
  UI3DScene.Ray l2)`

  `static float`

  `closest_distance_line_circle(UI3DScene.Ray ray,
  UI3DScene.Circle c,
  Vector3f point)`

  `static float`

  `distance_between_point_ray(Vector3f p,
  UI3DScene.Ray l)`

  `Object`

  `fromLua0(String func)`

  `Object`

  `fromLua1(String func,
  Object arg0)`

  `Object`

  `fromLua2(String func,
  Object arg0,
  Object arg1)`

  `Object`

  `fromLua3(String func,
  Object arg0,
  Object arg1,
  Object arg2)`

  `Object`

  `fromLua4(String func,
  Object arg0,
  Object arg1,
  Object arg2,
  Object arg3)`

  `Object`

  `fromLua5(String func,
  Object arg0,
  Object arg1,
  Object arg2,
  Object arg3,
  Object arg4)`

  `Object`

  `fromLua6(String func,
  Object arg0,
  Object arg1,
  Object arg2,
  Object arg3,
  Object arg4,
  Object arg5)`

  `Object`

  `fromLua7(String func,
  Object arg0,
  Object arg1,
  Object arg2,
  Object arg3,
  Object arg4,
  Object arg5,
  Object arg6)`

  `Object`

  `fromLua9(String func,
  Object arg0,
  Object arg1,
  Object arg2,
  Object arg3,
  Object arg4,
  Object arg5,
  Object arg6,
  Object arg7,
  Object arg8)`

  `(package private) UI3DScene.Ray`

  `getCameraRay(float uiX,
  float uiY,
  org.joml.Matrix4f projection,
  org.joml.Matrix4f modelView,
  int viewWidth,
  int viewHeight,
  UI3DScene.Ray cameraRay)`

  `(package private) UI3DScene.Ray`

  `getCameraRay(float uiX,
  float uiY,
  org.joml.Matrix4f projection,
  org.joml.Matrix4f modelView,
  UI3DScene.Ray cameraRay)`

  `(package private) UI3DScene.Ray`

  `getCameraRay(float uiX,
  float uiY,
  UI3DScene.Ray cameraRay)`

  `(package private) UI3DScene.SceneObject`

  `getSceneObjectById(String id,
  boolean required)`

  `(package private) <C> C`

  `getSceneObjectById(String id,
  Class<C> clazz,
  boolean required)`

  `private float`

  `gridMult()`

  `static int`

  `intersect_ray_plane(UI3DScene.Plane pn,
  UI3DScene.Ray s,
  Vector3f out)`

  `(package private) static Vector3f`

  `project(Vector3f a,
  Vector3f b,
  Vector3f out)`

  `(package private) static Vector3f`

  `reject(Vector3f a,
  Vector3f b,
  Vector3f out)`

  `private static void`

  `releaseMatrix4f(org.joml.Matrix4f matrix)`

  `static void`

  `releasePlane(UI3DScene.Plane plane)`

  `private static void`

  `releaseQuaternionf(org.joml.Quaternionf q)`

  `static void`

  `releaseRay(UI3DScene.Ray ray)`

  `private static void`

  `releaseVector2(Vector2 vector2)`

  `private static void`

  `releaseVector2f(Vector2f vector2f)`

  `private static void`

  `releaseVector3f(Vector3f vector3f)`

  `void`

  `render()`

  `private void`

  `renderAABB(float x,
  float y,
  float z,
  float xMin,
  float yMin,
  float zMin,
  float xMax,
  float yMax,
  float zMax,
  float r,
  float g,
  float b,
  float a,
  boolean bQuads)`

  `private void`

  `renderAABB(float x,
  float y,
  float z,
  Vector3f min,
  Vector3f max,
  float r,
  float g,
  float b)`

  `(package private) void`

  `renderAxis(Vector3f pos,
  Vector3f rot,
  boolean bRelativeToOrigin)`

  `(package private) void`

  `renderAxis(UI3DScene.PositionRotation axis)`

  `private void`

  `renderBox3D(float x,
  float y,
  float z,
  float xMin,
  float yMin,
  float zMin,
  float xMax,
  float yMax,
  float zMax,
  float rx,
  float ry,
  float rz,
  float r,
  float g,
  float b,
  float a,
  boolean bQuads)`

  `private void`

  `renderGrid()`

  `private void`

  `renderGridXY(int div)`

  `private void`

  `renderGridXZ(int div)`

  `private void`

  `renderGridYZ(int div)`

  `private void`

  `renderPhysicsMesh(float x,
  float y,
  float z,
  float rx,
  float ry,
  float rz,
  float r,
  float g,
  float b,
  float[] points)`

  `float`

  `sceneToUIX(float sceneX,
  float sceneY,
  float sceneZ)`

  `float`

  `sceneToUIX(Vector3f scenePos)`

  `float`

  `sceneToUIY(float sceneX,
  float sceneY,
  float sceneZ)`

  `float`

  `sceneToUIY(Vector3f scenePos)`

  `private int`

  `screenHeight()`

  `private int`

  `screenWidth()`

  `private void`

  `setGizmoTransforms(UI3DScene.StateData stateData)`

  `private void`

  `setModelViewProjection(UI3DScene.StateData stateData)`

  `private UI3DScene.StateData`

  `stateDataMain()`

  `private UI3DScene.StateData`

  `stateDataRender()`

  `boolean`

  `uiToGrid(float uiX,
  float uiY,
  UI3DScene.GridPlane gridPlane,
  Vector3f outScenePos)`

  `Vector3f`

  `uiToScene(float uiX,
  float uiY,
  float uiZ,
  Vector3f out)`

  `Vector3f`

  `uiToScene(org.joml.Matrix4f modelTransform,
  float uiX,
  float uiY,
  float uiZ,
  Vector3f out)`

  `float`

  `uiToSceneX(float uiX,
  float uiY)`

  `float`

  `uiToSceneY(float uiX,
  float uiY)`

  `private float`

  `zoomMult()`

  ### Methods inherited from class [UIElement](../ui/UIElement.html#method-summary "class in zombie.ui")

  `AddChild, backMost, bringToTop, BringToTop, ButtonClicked, clampToParentX, clampToParentY, ClearChildren, clearMaxDrawHeight, clearStencilRect, DrawItemIcon, DrawLine, DrawPolygon, DrawScriptItemIcon, DrawSubTextureRGBA, DrawText, DrawText, DrawText, DrawText, DrawTextCentre, DrawTextCentre, DrawTextRight, DrawTextRight, DrawTextUntrimmed, DrawTexture, DrawTexture, DrawTexture_FlippedX, DrawTexture_FlippedXIgnoreOffset, DrawTextureAngle, DrawTextureAngle, DrawTextureCol, DrawTextureColor, DrawTextureIcon, DrawTextureIconMask, DrawTextureIgnoreOffset, DrawTexturePercentage, DrawTexturePercentageBottomUp, DrawTextureScaled, DrawTextureScaledAspect, DrawTextureScaledAspect2, DrawTextureScaledAspect3, DrawTextureScaledCol, DrawTextureScaledCol, DrawTextureScaledColor, DrawTextureScaledUniform, DrawTextureTiled, DrawTextureTiledX, DrawTextureTiledY, DrawTextureTiledYOffset, drawTextWithBackground, DrawUVSliceTexture, EndOutline, getAbsoluteX, getAbsoluteY, getClickedValue, getControls, getHeight, getMaxDrawHeight, getParent, getPlayerContext, getRenderThisPlayerOnly, getScrollChildren, getScrollHeight, getScrollWithParent, getTable, getUIName, getWidth, getX, getXScroll, getXScrolled, getY, getYScroll, getYScrolled, ignoreHeightChange, ignoreWidthChange, isAlwaysOnTop, isAnchorBottom, isAnchorLeft, isAnchorRight, isAnchorTop, isBackMost, isCapture, isConsumeMouseEvents, isDefaultDraw, isEnabled, isFollowGameWorld, isForceCursorVisible, isIgnoreLossControl, isKeyConsumed, isModalVisible, isMouseOver, isOverElement, isPointOver, isReallyVisible, isVisible, isWantExtraMouseEvents, isWantKeyEvents, onConsumeKeyPress, onConsumeKeyRelease, onConsumeKeyRepeat, onConsumeMouseButtonDown, onConsumeMouseButtonUp, onConsumeMouseMove, onConsumeMouseWheel, onExtendMouseMoveOutside, onKeyPress, onKeyRelease, onKeyRepeat, onMouseButtonDown, onMouseButtonDownOutside, onMouseButtonUpOutside, onMouseDown, onMouseMove, onMouseMoveOutside, onMouseUp, onMouseUpOutside, onMouseWheel, onresize, onResize, onRightMouseDown, onRightMouseUp, RemoveChild, RemoveControl, repaintStencilRect, resumeStencil, setAlwaysOnTop, setAnchorBottom, setAnchorLeft, setAnchorRight, setAnchorTop, setCapture, setClickedValue, setConsumeMouseEvents, setControls, setDefaultDraw, setEnabled, setFollowGameWorld, setForceCursorVisible, setHeight, setHeightOnly, setHeightSilent, setIgnoreLossControl, setMaxDrawHeight, setParent, setPlayerContext, setRenderClippedChildren, setRenderThisPlayerOnly, setScrollChildren, setScrollHeight, setScrollWithParent, setStencilCircle, setStencilRect, setTable, setUIName, setVisible, setWantExtraMouseEvents, setWantKeyEvents, setWidth, setWidthOnly, setWidthSilent, setX, setXScroll, setY, setYScroll, StartOutline, suspendStencil, toString, tryGetTableValue, update`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### Z\_SCALE

    public static final float Z\_SCALE

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.UI3DScene.Z_SCALE)
  + ### objects

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")> objects
  + ### view

    private [UI3DScene.View](UI3DScene.View.html "enum class in zombie.vehicles") view
  + ### transformMode

    private [UI3DScene.TransformMode](UI3DScene.TransformMode.html "enum class in zombie.vehicles") transformMode
  + ### viewX

    private int viewX
  + ### viewY

    private int viewY
  + ### viewRotation

    private final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") viewRotation
  + ### zoom

    private int zoom
  + ### zoomMax

    private int zoomMax
  + ### gridDivisions

    private int gridDivisions
  + ### gridPlane

    private [UI3DScene.GridPlane](UI3DScene.GridPlane.html "enum class in zombie.vehicles") gridPlane
  + ### projection

    private final org.joml.Matrix4f projection
  + ### modelView

    private final org.joml.Matrix4f modelView
  + ### VIEW\_CHANGE\_TIME

    private static final long VIEW\_CHANGE\_TIME

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.UI3DScene.VIEW_CHANGE_TIME)
  + ### viewChangeTime

    private long viewChangeTime
  + ### modelViewChange

    private final org.joml.Quaternionf modelViewChange
  + ### drawAttachments

    private boolean drawAttachments
  + ### drawGrid

    private boolean drawGrid
  + ### drawGridAxes

    private boolean drawGridAxes
  + ### drawGeometry

    private boolean drawGeometry
  + ### drawGridPlane

    private boolean drawGridPlane
  + ### characterSceneModelCamera

    private final [UI3DScene.CharacterSceneModelCamera](UI3DScene.CharacterSceneModelCamera.html "class in zombie.vehicles") characterSceneModelCamera
  + ### vehicleSceneModelCamera

    private final [UI3DScene.VehicleSceneModelCamera](UI3DScene.VehicleSceneModelCamera.html "class in zombie.vehicles") vehicleSceneModelCamera
  + ### s\_SetModelCameraPool

    private static final zombie.popman.ObjectPool<[UI3DScene.SetModelCamera](UI3DScene.SetModelCamera.html "class in zombie.vehicles")> s\_SetModelCameraPool
  + ### stateData

    private final [UI3DScene.StateData](UI3DScene.StateData.html "class in zombie.vehicles")[] stateData
  + ### gizmo

    private [UI3DScene.Gizmo](UI3DScene.Gizmo.html "class in zombie.vehicles") gizmo
  + ### rotateGizmo

    private final [UI3DScene.RotateGizmo](UI3DScene.RotateGizmo.html "class in zombie.vehicles") rotateGizmo
  + ### scaleGizmo

    private final [UI3DScene.ScaleGizmo](UI3DScene.ScaleGizmo.html "class in zombie.vehicles") scaleGizmo
  + ### translateGizmo

    private final [UI3DScene.TranslateGizmo](UI3DScene.TranslateGizmo.html "class in zombie.vehicles") translateGizmo
  + ### gizmoPos

    private final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") gizmoPos
  + ### gizmoRotate

    private final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") gizmoRotate
  + ### gizmoParent

    private [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles") gizmoParent
  + ### gizmoOrigin

    private [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles") gizmoOrigin
  + ### gizmoChild

    private [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles") gizmoChild
  + ### originAttachment

    private final [UI3DScene.OriginAttachment](UI3DScene.OriginAttachment.html "class in zombie.vehicles") originAttachment
  + ### originBone

    private final [UI3DScene.OriginBone](UI3DScene.OriginBone.html "class in zombie.vehicles") originBone
  + ### originGeometry

    private final [UI3DScene.OriginGeometry](UI3DScene.OriginGeometry.html "class in zombie.vehicles") originGeometry
  + ### originGizmo

    private final [UI3DScene.OriginGizmo](UI3DScene.OriginGizmo.html "class in zombie.vehicles") originGizmo
  + ### originVehiclePart

    private final [UI3DScene.OriginVehiclePart](UI3DScene.OriginVehiclePart.html "class in zombie.vehicles") originVehiclePart
  + ### gizmoScale

    private float gizmoScale
  + ### gizmoAxisVisibleX

    private boolean gizmoAxisVisibleX
  + ### gizmoAxisVisibleY

    private boolean gizmoAxisVisibleY
  + ### gizmoAxisVisibleZ

    private boolean gizmoAxisVisibleZ
  + ### selectedAttachment

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") selectedAttachment
  + ### axes

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.PositionRotation](UI3DScene.PositionRotation.html "class in zombie.vehicles")> axes
  + ### highlightBone

    private final [UI3DScene.OriginBone](UI3DScene.OriginBone.html "class in zombie.vehicles") highlightBone
  + ### highlightPartBone

    private final [UI3DScene.OriginVehiclePart](UI3DScene.OriginVehiclePart.html "class in zombie.vehicles") highlightPartBone
  + ### polygonEditor

    private final [UI3DScene.PolygonEditor](UI3DScene.PolygonEditor.html "class in zombie.vehicles") polygonEditor
  + ### clipper

    private static zombie.vehicles.Clipper clipper
  + ### s\_posRotPool

    private static final zombie.popman.ObjectPool<[UI3DScene.PositionRotation](UI3DScene.PositionRotation.html "class in zombie.vehicles")> s\_posRotPool
  + ### aabb

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.AABB](UI3DScene.AABB.html "class in zombie.vehicles")> aabb
  + ### s\_aabbPool

    private static final zombie.popman.ObjectPool<[UI3DScene.AABB](UI3DScene.AABB.html "class in zombie.vehicles")> s\_aabbPool
  + ### box3d

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.Box3D](UI3DScene.Box3D.html "class in zombie.vehicles")> box3d
  + ### s\_box3DPool

    private static final zombie.popman.ObjectPool<[UI3DScene.Box3D](UI3DScene.Box3D.html "class in zombie.vehicles")> s\_box3DPool
  + ### physicsMesh

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[UI3DScene.PhysicsMesh](UI3DScene.PhysicsMesh.html "class in zombie.vehicles")> physicsMesh
  + ### s\_physicsMeshPool

    private static final zombie.popman.ObjectPool<[UI3DScene.PhysicsMesh](UI3DScene.PhysicsMesh.html "class in zombie.vehicles")> s\_physicsMeshPool
  + ### tempVector3f

    final [Vector3f](../../org/joml/Vector3f.html "class in org.joml") tempVector3f
  + ### viewport

    final int[] viewport
  + ### GRID\_DARK

    private static final float GRID\_DARK

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.UI3DScene.GRID_DARK)
  + ### GRID\_LIGHT

    private static final float GRID\_LIGHT

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.UI3DScene.GRID_LIGHT)
  + ### gridAlpha

    private float gridAlpha
  + ### HALF\_GRID

    private static final int HALF\_GRID

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.UI3DScene.HALF_GRID)
  + ### vboRenderer

    private static zombie.core.opengl.VBORenderer vboRenderer
  + ### TL\_Ray\_pool

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<zombie.popman.ObjectPool<[UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles")>> TL\_Ray\_pool
  + ### TL\_Plane\_pool

    private static final [ThreadLocal](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ThreadLocal.html "class or interface in java.lang")<zombie.popman.ObjectPool<[UI3DScene.Plane](UI3DScene.Plane.html "class in zombie.vehicles")>> TL\_Plane\_pool
  + ### SMALL\_NUM

    static final float SMALL\_NUM

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.vehicles.UI3DScene.SMALL_NUM)
* Constructor Details
  -------------------

  + ### UI3DScene

    public UI3DScene(se.krka.kahlua.vm.KahluaTable table)
* Method Details
  --------------

  + ### getSceneObjectById

    [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles") getSceneObjectById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    boolean required)
  + ### getSceneObjectById

    <C> C getSceneObjectById([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id,
    [Class](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Class.html "class or interface in java.lang")<C> clazz,
    boolean required)
  + ### render

    public void render()

    Specified by:
    :   `render` in interface `zombie.ui.UIElementInterface`

    Overrides:
    :   `render` in class `UIElement`
  + ### setModelViewProjection

    private void setModelViewProjection([UI3DScene.StateData](UI3DScene.StateData.html "class in zombie.vehicles") stateData)
  + ### setGizmoTransforms

    private void setGizmoTransforms([UI3DScene.StateData](UI3DScene.StateData.html "class in zombie.vehicles") stateData)
  + ### gridMult

    private float gridMult()
  + ### zoomMult

    private float zoomMult()
  + ### allocMatrix4f

    private static org.joml.Matrix4f allocMatrix4f()
  + ### releaseMatrix4f

    private static void releaseMatrix4f(org.joml.Matrix4f matrix)
  + ### allocQuaternionf

    private static org.joml.Quaternionf allocQuaternionf()
  + ### releaseQuaternionf

    private static void releaseQuaternionf(org.joml.Quaternionf q)
  + ### allocRay

    public static [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") allocRay()
  + ### releaseRay

    public static void releaseRay([UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") ray)
  + ### allocPlane

    public static [UI3DScene.Plane](UI3DScene.Plane.html "class in zombie.vehicles") allocPlane()
  + ### releasePlane

    public static void releasePlane([UI3DScene.Plane](UI3DScene.Plane.html "class in zombie.vehicles") plane)
  + ### allocVector2

    private static [Vector2](../iso/Vector2.html "class in zombie.iso") allocVector2()
  + ### releaseVector2

    private static void releaseVector2([Vector2](../iso/Vector2.html "class in zombie.iso") vector2)
  + ### allocVector2f

    private static [Vector2f](../../org/joml/Vector2f.html "class in org.joml") allocVector2f()
  + ### releaseVector2f

    private static void releaseVector2f([Vector2f](../../org/joml/Vector2f.html "class in org.joml") vector2f)
  + ### allocVector3f

    private static [Vector3f](../../org/joml/Vector3f.html "class in org.joml") allocVector3f()
  + ### releaseVector3f

    private static void releaseVector3f([Vector3f](../../org/joml/Vector3f.html "class in org.joml") vector3f)
  + ### fromLua0

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua0([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func)
  + ### fromLua1

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua1([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0)
  + ### fromLua2

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua2([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1)
  + ### fromLua3

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua3([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2)
  + ### fromLua4

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua4([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg3)
  + ### fromLua5

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua5([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg4)
  + ### fromLua6

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua6([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg4,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg5)
  + ### fromLua7

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua7([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg4,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg5,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg6)
  + ### fromLua9

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") fromLua9([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") func,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg0,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg1,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg2,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg3,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg4,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg5,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg6,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg7,
    [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") arg8)
  + ### screenWidth

    private int screenWidth()
  + ### screenHeight

    private int screenHeight()
  + ### uiToSceneX

    public float uiToSceneX(float uiX,
    float uiY)
  + ### uiToSceneY

    public float uiToSceneY(float uiX,
    float uiY)
  + ### uiToScene

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") uiToScene(float uiX,
    float uiY,
    float uiZ,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### uiToScene

    public [Vector3f](../../org/joml/Vector3f.html "class in org.joml") uiToScene(org.joml.Matrix4f modelTransform,
    float uiX,
    float uiY,
    float uiZ,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### sceneToUIX

    public float sceneToUIX(float sceneX,
    float sceneY,
    float sceneZ)
  + ### sceneToUIY

    public float sceneToUIY(float sceneX,
    float sceneY,
    float sceneZ)
  + ### sceneToUIX

    public float sceneToUIX([Vector3f](../../org/joml/Vector3f.html "class in org.joml") scenePos)
  + ### sceneToUIY

    public float sceneToUIY([Vector3f](../../org/joml/Vector3f.html "class in org.joml") scenePos)
  + ### uiToGrid

    public boolean uiToGrid(float uiX,
    float uiY,
    [UI3DScene.GridPlane](UI3DScene.GridPlane.html "enum class in zombie.vehicles") gridPlane,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") outScenePos)
  + ### renderGridXY

    private void renderGridXY(int div)
  + ### renderGridXZ

    private void renderGridXZ(int div)
  + ### renderGridYZ

    private void renderGridYZ(int div)
  + ### renderGrid

    private void renderGrid()
  + ### renderAxis

    void renderAxis([UI3DScene.PositionRotation](UI3DScene.PositionRotation.html "class in zombie.vehicles") axis)
  + ### renderAxis

    void renderAxis([Vector3f](../../org/joml/Vector3f.html "class in org.joml") pos,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") rot,
    boolean bRelativeToOrigin)
  + ### renderAABB

    private void renderAABB(float x,
    float y,
    float z,
    float xMin,
    float yMin,
    float zMin,
    float xMax,
    float yMax,
    float zMax,
    float r,
    float g,
    float b,
    float a,
    boolean bQuads)
  + ### renderAABB

    private void renderAABB(float x,
    float y,
    float z,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") min,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") max,
    float r,
    float g,
    float b)
  + ### renderBox3D

    private void renderBox3D(float x,
    float y,
    float z,
    float xMin,
    float yMin,
    float zMin,
    float xMax,
    float yMax,
    float zMax,
    float rx,
    float ry,
    float rz,
    float r,
    float g,
    float b,
    float a,
    boolean bQuads)
  + ### renderPhysicsMesh

    private void renderPhysicsMesh(float x,
    float y,
    float z,
    float rx,
    float ry,
    float rz,
    float r,
    float g,
    float b,
    float[] points)
  + ### calcMatrices

    private void calcMatrices(org.joml.Matrix4f projection,
    org.joml.Matrix4f modelView)
  + ### getCameraRay

    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") getCameraRay(float uiX,
    float uiY,
    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") cameraRay)
  + ### getCameraRay

    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") getCameraRay(float uiX,
    float uiY,
    org.joml.Matrix4f projection,
    org.joml.Matrix4f modelView,
    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") cameraRay)
  + ### getCameraRay

    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") getCameraRay(float uiX,
    float uiY,
    org.joml.Matrix4f projection,
    org.joml.Matrix4f modelView,
    int viewWidth,
    int viewHeight,
    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") cameraRay)
  + ### closest\_distance\_between\_lines

    public static float closest\_distance\_between\_lines([UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") l1,
    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") l2)
  + ### project

    static [Vector3f](../../org/joml/Vector3f.html "class in org.joml") project([Vector3f](../../org/joml/Vector3f.html "class in org.joml") a,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") b,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### reject

    static [Vector3f](../../org/joml/Vector3f.html "class in org.joml") reject([Vector3f](../../org/joml/Vector3f.html "class in org.joml") a,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") b,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### intersect\_ray\_plane

    public static int intersect\_ray\_plane([UI3DScene.Plane](UI3DScene.Plane.html "class in zombie.vehicles") pn,
    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") s,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") out)
  + ### distance\_between\_point\_ray

    public static float distance\_between\_point\_ray([Vector3f](../../org/joml/Vector3f.html "class in org.joml") p,
    [UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") l)
  + ### closest\_distance\_line\_circle

    public static float closest\_distance\_line\_circle([UI3DScene.Ray](UI3DScene.Ray.html "class in zombie.vehicles") ray,
    [UI3DScene.Circle](UI3DScene.Circle.html "class in zombie.vehicles") c,
    [Vector3f](../../org/joml/Vector3f.html "class in org.joml") point)
  + ### stateDataMain

    private [UI3DScene.StateData](UI3DScene.StateData.html "class in zombie.vehicles") stateDataMain()
  + ### stateDataRender

    private [UI3DScene.StateData](UI3DScene.StateData.html "class in zombie.vehicles") stateDataRender()