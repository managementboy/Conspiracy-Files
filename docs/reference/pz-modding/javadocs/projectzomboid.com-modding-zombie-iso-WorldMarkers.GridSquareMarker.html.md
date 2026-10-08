[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [WorldMarkers](WorldMarkers.html)
3. [GridSquareMarker](WorldMarkers.GridSquareMarker.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [textureName](#textureName)
   3. [overlayTextureName](#overlayTextureName)
   4. [sprite](#sprite)
   5. [spriteOverlay](#spriteOverlay)
   6. [origX](#origX)
   7. [origY](#origY)
   8. [origZ](#origZ)
   9. [x](#x)
   10. [y](#y)
   11. [z](#z)
   12. [scaleRatio](#scaleRatio)
   13. [r](#r)
   14. [g](#g)
   15. [b](#b)
   16. [a](#a)
   17. [size](#size)
   18. [doBlink](#doBlink)
   19. [doAlpha](#doAlpha)
   20. [scaleCircleTexture](#scaleCircleTexture)
   21. [fadeSpeed](#fadeSpeed)
   22. [alpha](#alpha)
   23. [alphaMax](#alphaMax)
   24. [alphaMin](#alphaMin)
   25. [alphaInc](#alphaInc)
   26. [active](#active)
   27. [isRemoved](#isRemoved)
6. [Constructor Details](#constructor-detail)
   1. [GridSquareMarker()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getID()](#getID())
   2. [remove()](#remove())
   3. [isRemoved()](#isRemoved())
   4. [init(String, String, int, int, int, float)](#init(java.lang.String,java.lang.String,int,int,int,float))
   5. [setPosAndSize(int, int, int, float)](#setPosAndSize(int,int,int,float))
   6. [setPos(int, int, int)](#setPos(int,int,int))
   7. [setSize(float)](#setSize(float))
   8. [isActive()](#isActive())
   9. [setActive(boolean)](#setActive(boolean))
   10. [getSize()](#getSize())
   11. [getX()](#getX())
   12. [getY()](#getY())
   13. [getZ()](#getZ())
   14. [getR()](#getR())
   15. [setR(float)](#setR(float))
   16. [getG()](#getG())
   17. [setG(float)](#setG(float))
   18. [getB()](#getB())
   19. [setB(float)](#setB(float))
   20. [getA()](#getA())
   21. [setA(float)](#setA(float))
   22. [getAlpha()](#getAlpha())
   23. [setAlpha(float)](#setAlpha(float))
   24. [getAlphaMax()](#getAlphaMax())
   25. [setAlphaMax(float)](#setAlphaMax(float))
   26. [getAlphaMin()](#getAlphaMin())
   27. [setAlphaMin(float)](#setAlphaMin(float))
   28. [isDoAlpha()](#isDoAlpha())
   29. [setDoAlpha(boolean)](#setDoAlpha(boolean))
   30. [getFadeSpeed()](#getFadeSpeed())
   31. [setFadeSpeed(float)](#setFadeSpeed(float))
   32. [isDoBlink()](#isDoBlink())
   33. [setDoBlink(boolean)](#setDoBlink(boolean))
   34. [isScaleCircleTexture()](#isScaleCircleTexture())
   35. [setScaleCircleTexture(boolean)](#setScaleCircleTexture(boolean))
   36. [getOriginalX()](#getOriginalX())
   37. [getOriginalY()](#getOriginalY())
   38. [getOriginalZ()](#getOriginalZ())
   39. [getTextureName()](#getTextureName())
   40. [getOverlayTextureName()](#getOverlayTextureName())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class WorldMarkers.GridSquareMarker
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.WorldMarkers.GridSquareMarker

Enclosing class:
:   `WorldMarkers`

---

public static final class WorldMarkers.GridSquareMarker
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private float`

  `a`

  `private boolean`

  `active`

  `private float`

  `alpha`

  `private boolean`

  `alphaInc`

  `private float`

  `alphaMax`

  `private float`

  `alphaMin`

  `private float`

  `b`

  `private boolean`

  `doAlpha`

  `private boolean`

  `doBlink`

  `private float`

  `fadeSpeed`

  `private float`

  `g`

  `private final int`

  `id`

  `private boolean`

  `isRemoved`

  `private float`

  `origX`

  `private float`

  `origY`

  `private float`

  `origZ`

  `private String`

  `overlayTextureName`

  `private float`

  `r`

  `private boolean`

  `scaleCircleTexture`

  `private float`

  `scaleRatio`

  `private float`

  `size`

  `private IsoSpriteInstance`

  `sprite`

  `private IsoSpriteInstance`

  `spriteOverlay`

  `private String`

  `textureName`

  `private float`

  `x`

  `private float`

  `y`

  `private float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GridSquareMarker()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getA()`

  `float`

  `getAlpha()`

  `float`

  `getAlphaMax()`

  `float`

  `getAlphaMin()`

  `float`

  `getB()`

  `float`

  `getFadeSpeed()`

  `float`

  `getG()`

  `int`

  `getID()`

  `float`

  `getOriginalX()`

  `float`

  `getOriginalY()`

  `float`

  `getOriginalZ()`

  `String`

  `getOverlayTextureName()`

  `float`

  `getR()`

  `float`

  `getSize()`

  `String`

  `getTextureName()`

  `float`

  `getX()`

  `float`

  `getY()`

  `float`

  `getZ()`

  `void`

  `init(String texid,
  String overlay,
  int x,
  int y,
  int z,
  float size)`

  `boolean`

  `isActive()`

  `boolean`

  `isDoAlpha()`

  `boolean`

  `isDoBlink()`

  `boolean`

  `isRemoved()`

  `boolean`

  `isScaleCircleTexture()`

  `void`

  `remove()`

  `void`

  `setA(float a)`

  `void`

  `setActive(boolean active)`

  `void`

  `setAlpha(float alpha)`

  `void`

  `setAlphaMax(float alphaMax)`

  `void`

  `setAlphaMin(float alphaMin)`

  `void`

  `setB(float b)`

  `void`

  `setDoAlpha(boolean doAlpha)`

  `void`

  `setDoBlink(boolean doBlink)`

  `void`

  `setFadeSpeed(float fadeSpeed)`

  `void`

  `setG(float g)`

  `void`

  `setPos(int x,
  int y,
  int z)`

  `void`

  `setPosAndSize(int x,
  int y,
  int z,
  float size)`

  `void`

  `setR(float r)`

  `void`

  `setScaleCircleTexture(boolean bScale)`

  `void`

  `setSize(float size)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private final int id
  + ### textureName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") textureName
  + ### overlayTextureName

    private [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") overlayTextureName
  + ### sprite

    private [IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") sprite
  + ### spriteOverlay

    private [IsoSpriteInstance](sprite/IsoSpriteInstance.html "class in zombie.iso.sprite") spriteOverlay
  + ### origX

    private float origX
  + ### origY

    private float origY
  + ### origZ

    private float origZ
  + ### x

    private float x
  + ### y

    private float y
  + ### z

    private float z
  + ### scaleRatio

    private float scaleRatio
  + ### r

    private float r
  + ### g

    private float g
  + ### b

    private float b
  + ### a

    private float a
  + ### size

    private float size
  + ### doBlink

    private boolean doBlink
  + ### doAlpha

    private boolean doAlpha
  + ### scaleCircleTexture

    private boolean scaleCircleTexture
  + ### fadeSpeed

    private float fadeSpeed
  + ### alpha

    private float alpha
  + ### alphaMax

    private float alphaMax
  + ### alphaMin

    private float alphaMin
  + ### alphaInc

    private boolean alphaInc
  + ### active

    private boolean active
  + ### isRemoved

    private boolean isRemoved
* Constructor Details
  -------------------

  + ### GridSquareMarker

    public GridSquareMarker()
* Method Details
  --------------

  + ### getID

    public int getID()
  + ### remove

    public void remove()
  + ### isRemoved

    public boolean isRemoved()
  + ### init

    public void init([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texid,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") overlay,
    int x,
    int y,
    int z,
    float size)
  + ### setPosAndSize

    public void setPosAndSize(int x,
    int y,
    int z,
    float size)
  + ### setPos

    public void setPos(int x,
    int y,
    int z)
  + ### setSize

    public void setSize(float size)
  + ### isActive

    public boolean isActive()
  + ### setActive

    public void setActive(boolean active)
  + ### getSize

    public float getSize()
  + ### getX

    public float getX()
  + ### getY

    public float getY()
  + ### getZ

    public float getZ()
  + ### getR

    public float getR()
  + ### setR

    public void setR(float r)
  + ### getG

    public float getG()
  + ### setG

    public void setG(float g)
  + ### getB

    public float getB()
  + ### setB

    public void setB(float b)
  + ### getA

    public float getA()
  + ### setA

    public void setA(float a)
  + ### getAlpha

    public float getAlpha()
  + ### setAlpha

    public void setAlpha(float alpha)
  + ### getAlphaMax

    public float getAlphaMax()
  + ### setAlphaMax

    public void setAlphaMax(float alphaMax)
  + ### getAlphaMin

    public float getAlphaMin()
  + ### setAlphaMin

    public void setAlphaMin(float alphaMin)
  + ### isDoAlpha

    public boolean isDoAlpha()
  + ### setDoAlpha

    public void setDoAlpha(boolean doAlpha)
  + ### getFadeSpeed

    public float getFadeSpeed()
  + ### setFadeSpeed

    public void setFadeSpeed(float fadeSpeed)
  + ### isDoBlink

    public boolean isDoBlink()
  + ### setDoBlink

    public void setDoBlink(boolean doBlink)
  + ### isScaleCircleTexture

    public boolean isScaleCircleTexture()
  + ### setScaleCircleTexture

    public void setScaleCircleTexture(boolean bScale)
  + ### getOriginalX

    public float getOriginalX()
  + ### getOriginalY

    public float getOriginalY()
  + ### getOriginalZ

    public float getOriginalZ()
  + ### getTextureName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getTextureName()
  + ### getOverlayTextureName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getOverlayTextureName()