[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.objects](package-summary.html)
2. [IsoMannequin](IsoMannequin.html)
3. [Drawer](IsoMannequin.Drawer.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x](#x)
   2. [y](#y)
   3. [z](#z)
   4. [animPlayerAngle](#animPlayerAngle)
   5. [rendered](#rendered)
6. [Constructor Details](#constructor-detail)
   1. [Drawer()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [init(float, float, float)](#init(float,float,float))
   2. [render()](#render())
   3. [postRender()](#postRender())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoMannequin.Drawer
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.TextureDraw.GenericDrawer

zombie.iso.objects.IsoMannequin.Drawer

Enclosing class:
:   `IsoMannequin`

---

private final class IsoMannequin.Drawer
extends zombie.core.textures.TextureDraw.GenericDrawer

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `animPlayerAngle`

  `private boolean`

  `rendered`

  `private float`

  `x`

  `private float`

  `y`

  `private float`

  `z`
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

  `init(float x,
  float y,
  float z)`

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

  + ### x

    private float x
  + ### y

    private float y
  + ### z

    private float z
  + ### animPlayerAngle

    private float animPlayerAngle
  + ### rendered

    private boolean rendered
* Constructor Details
  -------------------

  + ### Drawer

    private Drawer()
* Method Details
  --------------

  + ### init

    public void init(float x,
    float y,
    float z)
  + ### render

    public void render()

    Specified by:
    :   `render` in class `zombie.core.textures.TextureDraw.GenericDrawer`
  + ### postRender

    public void postRender()

    Overrides:
    :   `postRender` in class `zombie.core.textures.TextureDraw.GenericDrawer`