[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.gameStates](package-summary.html)
2. [MainScreenState](MainScreenState.html)
3. [ScreenElement](MainScreenState.ScreenElement.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [alpha](#alpha)
   2. [alphaStep](#alphaStep)
   3. [jumpBack](#jumpBack)
   4. [sx](#sx)
   5. [sy](#sy)
   6. [targetAlpha](#targetAlpha)
   7. [tex](#tex)
   8. [ticksTillTargetAlpha](#ticksTillTargetAlpha)
   9. [x](#x)
   10. [xCount](#xCount)
   11. [xVel](#xVel)
   12. [xVelO](#xVelO)
   13. [y](#y)
   14. [yVel](#yVel)
   15. [yVelO](#yVelO)
6. [Constructor Details](#constructor-detail)
   1. [ScreenElement(Texture, int, int, float, float, int)](#%3Cinit%3E(zombie.core.textures.Texture,int,int,float,float,int))
7. [Method Details](#method-detail)
   1. [render()](#render())
   2. [setY(float)](#setY(float))
   3. [update()](#update())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class MainScreenState.ScreenElement
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.gameStates.MainScreenState.ScreenElement

Enclosing class:
:   `MainScreenState`

---

public static class MainScreenState.ScreenElement
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `alpha`

  `float`

  `alphaStep`

  `boolean`

  `jumpBack`

  `float`

  `sx`

  `float`

  `sy`

  `float`

  `targetAlpha`

  `Texture`

  `tex`

  `int`

  `ticksTillTargetAlpha`

  `float`

  `x`

  `int`

  `xCount`

  `float`

  `xVel`

  `float`

  `xVelO`

  `float`

  `y`

  `float`

  `yVel`

  `float`

  `yVelO`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `ScreenElement(Texture tex,
  int x,
  int y,
  float xVel,
  float yVel,
  int xCount)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `render()`

  `void`

  `setY(float y)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### alpha

    public float alpha
  + ### alphaStep

    public float alphaStep
  + ### jumpBack

    public boolean jumpBack
  + ### sx

    public float sx
  + ### sy

    public float sy
  + ### targetAlpha

    public float targetAlpha
  + ### tex

    public [Texture](../core/textures/Texture.html "class in zombie.core.textures") tex
  + ### ticksTillTargetAlpha

    public int ticksTillTargetAlpha
  + ### x

    public float x
  + ### xCount

    public int xCount
  + ### xVel

    public float xVel
  + ### xVelO

    public float xVelO
  + ### y

    public float y
  + ### yVel

    public float yVel
  + ### yVelO

    public float yVelO
* Constructor Details
  -------------------

  + ### ScreenElement

    public ScreenElement([Texture](../core/textures/Texture.html "class in zombie.core.textures") tex,
    int x,
    int y,
    float xVel,
    float yVel,
    int xCount)
* Method Details
  --------------

  + ### render

    public void render()
  + ### setY

    public void setY(float y)
  + ### update

    public void update()