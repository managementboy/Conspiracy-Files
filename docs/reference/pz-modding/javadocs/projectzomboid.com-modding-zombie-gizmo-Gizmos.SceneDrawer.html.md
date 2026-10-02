[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gizmo](package-summary.html)
2. [Gizmos](Gizmos.html)
3. [SceneDrawer](Gizmos.SceneDrawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [scene](#scene)
6. [Constructor Details](#constructor-detail)
   1. [SceneDrawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(Scene)](#init(zombie.gizmo.Scene))
   2. [render()](#render())
   3. [postRender()](#postRender())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class Gizmos.SceneDrawer
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.gizmo.Gizmos.SceneDrawer

Enclosing class:
:   `Gizmos`

---

private static final class Gizmos.SceneDrawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) zombie.gizmo.Scene`

  `scene`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `SceneDrawer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) Gizmos.SceneDrawer`

  `init(zombie.gizmo.Scene scene)`

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

  + ### scene

    zombie.gizmo.Scene scene
* Constructor Details
  -------------------

  + ### SceneDrawer

    private SceneDrawer()
* Method Details
  --------------

  + ### init

    [Gizmos.SceneDrawer](Gizmos.SceneDrawer.html "class in zombie.gizmo") init(zombie.gizmo.Scene scene)
  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### postRender

    public void postRender()

    Overrides:
    :   `postRender` in class `zombie.core.textures.TextureDraw.GenericDrawer`