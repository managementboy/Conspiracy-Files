[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../../deprecated-list.html)
* [Index](../../../../index-files/index-1.html)
* [Search](../../../../search.html)
* [Help](../../../../help-doc.html#class)

1. [zombie.iso.weather.fx](package-summary.html)
2. [IsoWeatherFX](IsoWeatherFX.html)
3. [Drawer](IsoWeatherFX.Drawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [s\_matrix4f](#s_matrix4f)
   2. [mvp](#mvp)
   3. [width](#width)
   4. [height](#height)
   5. [set](#set)
6. [Constructor Details](#constructor-detail)
   1. [Drawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(int, int)](#init(int,int))
   2. [render()](#render())

Hide sidebar ![Hide sidebar](../../../../resource-files/left.svg)![Show sidebar](../../../../resource-files/right.svg) Show sidebar

Class IsoWeatherFX.Drawer
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.iso.weather.fx.IsoWeatherFX.Drawer

Enclosing class:
:   `IsoWeatherFX`

---

private static final class IsoWeatherFX.Drawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) int`

  `height`

  `(package private) final org.lwjgl.util.vector.Matrix4f`

  `mvp`

  `(package private) static final org.joml.Matrix4f`

  `s_matrix4f`

  `(package private) boolean`

  `set`

  `(package private) int`

  `width`
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

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `init(int w,
  int h)`

  `void`

  `render()`

  ### Methods inherited from class zombie.core.textures.TextureDraw.GenericDrawer

  `postRender, render`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### s\_matrix4f

    static final org.joml.Matrix4f s\_matrix4f
  + ### mvp

    final org.lwjgl.util.vector.Matrix4f mvp
  + ### width

    int width
  + ### height

    int height
  + ### set

    boolean set
* Constructor Details
  -------------------

  + ### Drawer

    private Drawer()
* Method Details
  --------------

  + ### init

    void init(int w,
    int h)
  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`