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
3. [SceneDepthTexture](UI3DScene.SceneDepthTexture.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [texture](#texture)
6. [Constructor Details](#constructor-detail)
   1. [SceneDepthTexture(UI3DScene, String)](#%3Cinit%3E(zombie.vehicles.UI3DScene,java.lang.String))
7. [Method Details](#method-detail)
   1. [renderMain()](#renderMain())
   2. [calculatePixelSize(UI3DScene)](#calculatePixelSize(zombie.vehicles.UI3DScene))
   3. [calculateTextureTopLeft(UI3DScene, float, float, float, Vector2f)](#calculateTextureTopLeft(zombie.vehicles.UI3DScene,float,float,float,org.joml.Vector2f))
   4. [renderTexture(float, float, float)](#renderTexture(float,float,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DScene.SceneDepthTexture
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

[zombie.vehicles.UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

zombie.vehicles.UI3DScene.SceneDepthTexture

Enclosing class:
:   `UI3DScene`

---

private static final class UI3DScene.SceneDepthTexture
extends [UI3DScene.SceneObject](UI3DScene.SceneObject.html "class in zombie.vehicles")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) Texture`

  `texture`

  ### Fields inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#field-summary "class in zombie.vehicles")

  `attachment, autoRotate, autoRotateAngle, id, parent, parentAttachment, parentVehiclePart, rotate, scale, scene, translate, visible`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `SceneDepthTexture(UI3DScene scene,
  String id)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) static float`

  `calculatePixelSize(UI3DScene scene)`

  `(package private) static Vector2f`

  `calculateTextureTopLeft(UI3DScene scene,
  float sceneX,
  float sceneY,
  float sceneZ,
  Vector2f topLeft)`

  `(package private) UI3DScene.SceneObjectRenderData`

  `renderMain()`

  `(package private) void`

  `renderTexture(float x,
  float y,
  float z)`

  ### Methods inherited from class [UI3DScene.SceneObject](UI3DScene.SceneObject.html#method-summary "class in zombie.vehicles")

  `clone, getAttachmentTransform, getGlobalTransform, getLocalTransform, initClone`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### texture

    [Texture](../core/textures/Texture.html "class in zombie.core.textures") texture
* Constructor Details
  -------------------

  + ### SceneDepthTexture

    SceneDepthTexture([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") id)
* Method Details
  --------------

  + ### renderMain

    [UI3DScene.SceneObjectRenderData](UI3DScene.SceneObjectRenderData.html "class in zombie.vehicles") renderMain()

    Specified by:
    :   `renderMain` in class `UI3DScene.SceneObject`
  + ### calculatePixelSize

    static float calculatePixelSize([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene)
  + ### calculateTextureTopLeft

    static [Vector2f](../../org/joml/Vector2f.html "class in org.joml") calculateTextureTopLeft([UI3DScene](UI3DScene.html "class in zombie.vehicles") scene,
    float sceneX,
    float sceneY,
    float sceneZ,
    [Vector2f](../../org/joml/Vector2f.html "class in org.joml") topLeft)
  + ### renderTexture

    void renderTexture(float x,
    float y,
    float z)