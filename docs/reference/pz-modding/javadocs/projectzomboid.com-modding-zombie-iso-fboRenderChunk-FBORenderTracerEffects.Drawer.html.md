[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.fboRenderChunk](package-summary.html)
2. [FBORenderTracerEffects](FBORenderTracerEffects.html)
3. [Drawer](FBORenderTracerEffects.Drawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [tempMatrix4f\_1](#tempMatrix4f_1)
   2. [tempVector3f\_1](#tempVector3f_1)
   3. [effects](#effects)
6. [Constructor Details](#constructor-detail)
   1. [Drawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [render()](#render())
   2. [postRender()](#postRender())
   3. [calculateProjectViewXfrm(Matrix4f, Matrix4f, boolean)](#calculateProjectViewXfrm(org.joml.Matrix4f,org.joml.Matrix4f,boolean))
   4. [calculateModelXfrm(float, float, float, float, boolean, Matrix4f, boolean)](#calculateModelXfrm(float,float,float,float,boolean,org.joml.Matrix4f,boolean))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FBORenderTracerEffects.Drawer
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.iso.fboRenderChunk.FBORenderTracerEffects.Drawer

Enclosing class:
:   `FBORenderTracerEffects`

---

private static final class FBORenderTracerEffects.Drawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) final ArrayList<FBORenderTracerEffects.Effect>`

  `effects`

  `(package private) static final org.joml.Matrix4f`

  `tempMatrix4f_1`

  `(package private) static final Vector3f`

  `tempVector3f_1`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Drawer()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) static void`

  `calculateModelXfrm(float ox,
  float oy,
  float oz,
  float useangle,
  boolean vehicle,
  org.joml.Matrix4f model,
  boolean renderThread)`

  `(package private) static org.joml.Matrix4f`

  `calculateProjectViewXfrm(org.joml.Matrix4f projection,
  org.joml.Matrix4f view,
  boolean renderThread)`

  `void`

  `postRender()`

  `void`

  `render()`

  ### Methods inherited from class zombie.core.textures.TextureDraw.GenericDrawer

  `render`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### tempMatrix4f\_1

    static final org.joml.Matrix4f tempMatrix4f\_1
  + ### tempVector3f\_1

    static final [Vector3f](../../../org/joml/Vector3f.html "class in org.joml") tempVector3f\_1
  + ### effects

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[FBORenderTracerEffects.Effect](FBORenderTracerEffects.Effect.html "class in zombie.iso.fboRenderChunk")> effects
* Constructor Details
  -------------------

  + ### Drawer

    private Drawer()
* Method Details
  --------------

  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### postRender

    public void postRender()

    Overrides:
    :   `postRender` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### calculateProjectViewXfrm

    static org.joml.Matrix4f calculateProjectViewXfrm(org.joml.Matrix4f projection,
    org.joml.Matrix4f view,
    boolean renderThread)
  + ### calculateModelXfrm

    static void calculateModelXfrm(float ox,
    float oy,
    float oz,
    float useangle,
    boolean vehicle,
    org.joml.Matrix4f model,
    boolean renderThread)