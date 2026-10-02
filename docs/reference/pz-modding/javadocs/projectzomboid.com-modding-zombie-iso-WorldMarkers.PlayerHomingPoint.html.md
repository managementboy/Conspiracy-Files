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
3. [PlayerHomingPoint](WorldMarkers.PlayerHomingPoint.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [id](#id)
   2. [texture](#texture)
   3. [x](#x)
   4. [y](#y)
   5. [r](#r)
   6. [g](#g)
   7. [b](#b)
   8. [a](#a)
   9. [angle](#angle)
   10. [targetAngle](#targetAngle)
   11. [customTargetAngle](#customTargetAngle)
   12. [angleLerpVal](#angleLerpVal)
   13. [movementLerpVal](#movementLerpVal)
   14. [dist](#dist)
   15. [targRenderX](#targRenderX)
   16. [targRenderY](#targRenderY)
   17. [renderX](#renderX)
   18. [renderY](#renderY)
   19. [renderOffsetX](#renderOffsetX)
   20. [renderOffsetY](#renderOffsetY)
   21. [renderWidth](#renderWidth)
   22. [renderHeight](#renderHeight)
   23. [renderSizeMod](#renderSizeMod)
   24. [targetScreenX](#targetScreenX)
   25. [targetScreenY](#targetScreenY)
   26. [targetOnScreen](#targetOnScreen)
   27. [stickToCharDist](#stickToCharDist)
   28. [active](#active)
   29. [homeOnTargetInView](#homeOnTargetInView)
   30. [homeOnTargetDist](#homeOnTargetDist)
   31. [homeOnOffsetX](#homeOnOffsetX)
   32. [homeOnOffsetY](#homeOnOffsetY)
   33. [isRemoved](#isRemoved)
6. [Constructor Details](#constructor-detail)
   1. [PlayerHomingPoint(int)](#%3Cinit%3E(int))
7. [Method Details](#method-detail)
   1. [setTexture(String)](#setTexture(java.lang.String))
   2. [remove()](#remove())
   3. [isRemoved()](#isRemoved())
   4. [isActive()](#isActive())
   5. [setActive(boolean)](#setActive(boolean))
   6. [getR()](#getR())
   7. [setR(float)](#setR(float))
   8. [getB()](#getB())
   9. [setB(float)](#setB(float))
   10. [getG()](#getG())
   11. [setG(float)](#setG(float))
   12. [getA()](#getA())
   13. [setA(float)](#setA(float))
   14. [getHomeOnTargetDist()](#getHomeOnTargetDist())
   15. [setHomeOnTargetDist(int)](#setHomeOnTargetDist(int))
   16. [getID()](#getID())
   17. [getTargetAngle()](#getTargetAngle())
   18. [setTargetAngle(float)](#setTargetAngle(float))
   19. [isCustomTargetAngle()](#isCustomTargetAngle())
   20. [setCustomTargetAngle(boolean)](#setCustomTargetAngle(boolean))
   21. [getX()](#getX())
   22. [setX(int)](#setX(int))
   23. [getY()](#getY())
   24. [setY(int)](#setY(int))
   25. [getAngleLerpVal()](#getAngleLerpVal())
   26. [setAngleLerpVal(float)](#setAngleLerpVal(float))
   27. [getMovementLerpVal()](#getMovementLerpVal())
   28. [setMovementLerpVal(float)](#setMovementLerpVal(float))
   29. [isHomeOnTargetInView()](#isHomeOnTargetInView())
   30. [setHomeOnTargetInView(boolean)](#setHomeOnTargetInView(boolean))
   31. [getRenderWidth()](#getRenderWidth())
   32. [setRenderWidth(float)](#setRenderWidth(float))
   33. [getRenderHeight()](#getRenderHeight())
   34. [setRenderHeight(float)](#setRenderHeight(float))
   35. [getStickToCharDist()](#getStickToCharDist())
   36. [setStickToCharDist(float)](#setStickToCharDist(float))
   37. [getRenderOffsetX()](#getRenderOffsetX())
   38. [setRenderOffsetX(float)](#setRenderOffsetX(float))
   39. [getRenderOffsetY()](#getRenderOffsetY())
   40. [setRenderOffsetY(float)](#setRenderOffsetY(float))
   41. [getHomeOnOffsetX()](#getHomeOnOffsetX())
   42. [setHomeOnOffsetX(float)](#setHomeOnOffsetX(float))
   43. [getHomeOnOffsetY()](#getHomeOnOffsetY())
   44. [setHomeOnOffsetY(float)](#setHomeOnOffsetY(float))
   45. [setTableSurface()](#setTableSurface())
   46. [setHighCounter()](#setHighCounter())
   47. [setYOffsetScaled(float)](#setYOffsetScaled(float))
   48. [setXOffsetScaled(float)](#setXOffsetScaled(float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class WorldMarkers.PlayerHomingPoint
====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.WorldMarkers.PlayerHomingPoint

Enclosing class:
:   `WorldMarkers`

---

public static class WorldMarkers.PlayerHomingPoint
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

  `angle`

  `private float`

  `angleLerpVal`

  `private float`

  `b`

  `private boolean`

  `customTargetAngle`

  `private int`

  `dist`

  `private float`

  `g`

  `private float`

  `homeOnOffsetX`

  `private float`

  `homeOnOffsetY`

  `private int`

  `homeOnTargetDist`

  `private boolean`

  `homeOnTargetInView`

  `private final int`

  `id`

  `private boolean`

  `isRemoved`

  `private float`

  `movementLerpVal`

  `private float`

  `r`

  `private float`

  `renderHeight`

  `private float`

  `renderOffsetX`

  `private float`

  `renderOffsetY`

  `private float`

  `renderSizeMod`

  `private float`

  `renderWidth`

  `private float`

  `renderX`

  `private float`

  `renderY`

  `private float`

  `stickToCharDist`

  `private float`

  `targetAngle`

  `private boolean`

  `targetOnScreen`

  `private float`

  `targetScreenX`

  `private float`

  `targetScreenY`

  `private float`

  `targRenderX`

  `private float`

  `targRenderY`

  `private Texture`

  `texture`

  `private int`

  `x`

  `private int`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PlayerHomingPoint(int plrIndex)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getA()`

  `float`

  `getAngleLerpVal()`

  `float`

  `getB()`

  `float`

  `getG()`

  `float`

  `getHomeOnOffsetX()`

  `float`

  `getHomeOnOffsetY()`

  `int`

  `getHomeOnTargetDist()`

  `int`

  `getID()`

  `float`

  `getMovementLerpVal()`

  `float`

  `getR()`

  `float`

  `getRenderHeight()`

  `float`

  `getRenderOffsetX()`

  `float`

  `getRenderOffsetY()`

  `float`

  `getRenderWidth()`

  `float`

  `getStickToCharDist()`

  `float`

  `getTargetAngle()`

  `int`

  `getX()`

  `int`

  `getY()`

  `boolean`

  `isActive()`

  `boolean`

  `isCustomTargetAngle()`

  `boolean`

  `isHomeOnTargetInView()`

  `boolean`

  `isRemoved()`

  `void`

  `remove()`

  `void`

  `setA(float a)`

  `void`

  `setActive(boolean active)`

  `void`

  `setAngleLerpVal(float angleLerpVal)`

  `void`

  `setB(float b)`

  `void`

  `setCustomTargetAngle(boolean customTargetAngle)`

  `void`

  `setG(float g)`

  `void`

  `setHighCounter()`

  `void`

  `setHomeOnOffsetX(float homeOnOffsetX)`

  `void`

  `setHomeOnOffsetY(float homeOnOffsetY)`

  `void`

  `setHomeOnTargetDist(int homeOnTargetDist)`

  `void`

  `setHomeOnTargetInView(boolean homeOnTargetInView)`

  `void`

  `setMovementLerpVal(float movementLerpVal)`

  `void`

  `setR(float r)`

  `void`

  `setRenderHeight(float renderHeight)`

  `void`

  `setRenderOffsetX(float renderOffsetX)`

  `void`

  `setRenderOffsetY(float renderOffsetY)`

  `void`

  `setRenderWidth(float renderWidth)`

  `void`

  `setStickToCharDist(float stickToCharDist)`

  `void`

  `setTableSurface()`

  `void`

  `setTargetAngle(float targetAngle)`

  `void`

  `setTexture(String texname)`

  `void`

  `setX(int x)`

  `void`

  `setXOffsetScaled(float offset)`

  `void`

  `setY(int y)`

  `void`

  `setYOffsetScaled(float offset)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### id

    private final int id
  + ### texture

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") texture
  + ### x

    private int x
  + ### y

    private int y
  + ### r

    private float r
  + ### g

    private float g
  + ### b

    private float b
  + ### a

    private float a
  + ### angle

    private float angle
  + ### targetAngle

    private float targetAngle
  + ### customTargetAngle

    private boolean customTargetAngle
  + ### angleLerpVal

    private float angleLerpVal
  + ### movementLerpVal

    private float movementLerpVal
  + ### dist

    private int dist
  + ### targRenderX

    private float targRenderX
  + ### targRenderY

    private float targRenderY
  + ### renderX

    private float renderX
  + ### renderY

    private float renderY
  + ### renderOffsetX

    private float renderOffsetX
  + ### renderOffsetY

    private float renderOffsetY
  + ### renderWidth

    private float renderWidth
  + ### renderHeight

    private float renderHeight
  + ### renderSizeMod

    private float renderSizeMod
  + ### targetScreenX

    private float targetScreenX
  + ### targetScreenY

    private float targetScreenY
  + ### targetOnScreen

    private boolean targetOnScreen
  + ### stickToCharDist

    private float stickToCharDist
  + ### active

    private boolean active
  + ### homeOnTargetInView

    private boolean homeOnTargetInView
  + ### homeOnTargetDist

    private int homeOnTargetDist
  + ### homeOnOffsetX

    private float homeOnOffsetX
  + ### homeOnOffsetY

    private float homeOnOffsetY
  + ### isRemoved

    private boolean isRemoved
* Constructor Details
  -------------------

  + ### PlayerHomingPoint

    public PlayerHomingPoint(int plrIndex)
* Method Details
  --------------

  + ### setTexture

    public void setTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texname)
  + ### remove

    public void remove()
  + ### isRemoved

    public boolean isRemoved()
  + ### isActive

    public boolean isActive()
  + ### setActive

    public void setActive(boolean active)
  + ### getR

    public float getR()
  + ### setR

    public void setR(float r)
  + ### getB

    public float getB()
  + ### setB

    public void setB(float b)
  + ### getG

    public float getG()
  + ### setG

    public void setG(float g)
  + ### getA

    public float getA()
  + ### setA

    public void setA(float a)
  + ### getHomeOnTargetDist

    public int getHomeOnTargetDist()
  + ### setHomeOnTargetDist

    public void setHomeOnTargetDist(int homeOnTargetDist)
  + ### getID

    public int getID()
  + ### getTargetAngle

    public float getTargetAngle()
  + ### setTargetAngle

    public void setTargetAngle(float targetAngle)
  + ### isCustomTargetAngle

    public boolean isCustomTargetAngle()
  + ### setCustomTargetAngle

    public void setCustomTargetAngle(boolean customTargetAngle)
  + ### getX

    public int getX()
  + ### setX

    public void setX(int x)
  + ### getY

    public int getY()
  + ### setY

    public void setY(int y)
  + ### getAngleLerpVal

    public float getAngleLerpVal()
  + ### setAngleLerpVal

    public void setAngleLerpVal(float angleLerpVal)
  + ### getMovementLerpVal

    public float getMovementLerpVal()
  + ### setMovementLerpVal

    public void setMovementLerpVal(float movementLerpVal)
  + ### isHomeOnTargetInView

    public boolean isHomeOnTargetInView()
  + ### setHomeOnTargetInView

    public void setHomeOnTargetInView(boolean homeOnTargetInView)
  + ### getRenderWidth

    public float getRenderWidth()
  + ### setRenderWidth

    public void setRenderWidth(float renderWidth)
  + ### getRenderHeight

    public float getRenderHeight()
  + ### setRenderHeight

    public void setRenderHeight(float renderHeight)
  + ### getStickToCharDist

    public float getStickToCharDist()
  + ### setStickToCharDist

    public void setStickToCharDist(float stickToCharDist)
  + ### getRenderOffsetX

    public float getRenderOffsetX()
  + ### setRenderOffsetX

    public void setRenderOffsetX(float renderOffsetX)
  + ### getRenderOffsetY

    public float getRenderOffsetY()
  + ### setRenderOffsetY

    public void setRenderOffsetY(float renderOffsetY)
  + ### getHomeOnOffsetX

    public float getHomeOnOffsetX()
  + ### setHomeOnOffsetX

    public void setHomeOnOffsetX(float homeOnOffsetX)
  + ### getHomeOnOffsetY

    public float getHomeOnOffsetY()
  + ### setHomeOnOffsetY

    public void setHomeOnOffsetY(float homeOnOffsetY)
  + ### setTableSurface

    public void setTableSurface()
  + ### setHighCounter

    public void setHighCounter()
  + ### setYOffsetScaled

    public void setYOffsetScaled(float offset)
  + ### setXOffsetScaled

    public void setXOffsetScaled(float offset)