[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.ui](package-summary.html)
2. [UI3DModel](UI3DModel.html)
3. [Drawer](UI3DModel.Drawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [absX](#absX)
   2. [absY](#absY)
   3. [animPlayerAngle](#animPlayerAngle)
   4. [zoom](#zoom)
   5. [rendered](#rendered)
6. [Constructor Details](#constructor-detail)
   1. [Drawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(int, int)](#init(int,int))
   2. [render()](#render())
   3. [postRender()](#postRender())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class UI3DModel.Drawer
======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.ui.UI3DModel.Drawer

Enclosing class:
:   `UI3DModel`

---

private final class UI3DModel.Drawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) int`

  `absX`

  `(package private) int`

  `absY`

  `(package private) float`

  `animPlayerAngle`

  `(package private) boolean`

  `rendered`

  `(package private) float`

  `zoom`
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

  `void`

  `init(int x,
  int y)`

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

  + ### absX

    int absX
  + ### absY

    int absY
  + ### animPlayerAngle

    float animPlayerAngle
  + ### zoom

    float zoom
  + ### rendered

    boolean rendered
* Constructor Details
  -------------------

  + ### Drawer

    private Drawer()
* Method Details
  --------------

  + ### init

    public void init(int x,
    int y)
  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### postRender

    public void postRender()

    Overrides:
    :   `postRender` in class `zombie.core.textures.TextureDraw.GenericDrawer`