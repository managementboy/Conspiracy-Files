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
3. [DirectionArrow](WorldMarkers.DirectionArrow.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [doDebug](#doDebug)
   2. [debugStuff](#debugStuff)
   3. [id](#id)
   4. [active](#active)
   5. [isRemoved](#isRemoved)
   6. [isDrawOnWorld](#isDrawOnWorld)
   7. [renderTexture](#renderTexture)
   8. [texture](#texture)
   9. [texStairsUp](#texStairsUp)
   10. [texStairsDown](#texStairsDown)
   11. [texDown](#texDown)
   12. [x](#x)
   13. [y](#y)
   14. [z](#z)
   15. [r](#r)
   16. [g](#g)
   17. [b](#b)
   18. [a](#a)
   19. [renderWidth](#renderWidth)
   20. [renderHeight](#renderHeight)
   21. [angle](#angle)
   22. [angleLerpVal](#angleLerpVal)
   23. [lastWasWithinView](#lastWasWithinView)
   24. [renderScreenX](#renderScreenX)
   25. [renderScreenY](#renderScreenY)
   26. [renderWithAngle](#renderWithAngle)
   27. [renderSizeMod](#renderSizeMod)
7. [Constructor Details](#constructor-detail)
   1. [DirectionArrow(int)](#%3Cinit%3E(int))
8. [Method Details](#method-detail)
   1. [setTexture(String)](#setTexture(java.lang.String))
   2. [setTexDown(String)](#setTexDown(java.lang.String))
   3. [setTexStairsDown(String)](#setTexStairsDown(java.lang.String))
   4. [setTexStairsUp(String)](#setTexStairsUp(java.lang.String))
   5. [remove()](#remove())
   6. [isRemoved()](#isRemoved())
   7. [isActive()](#isActive())
   8. [setActive(boolean)](#setActive(boolean))
   9. [getR()](#getR())
   10. [setR(float)](#setR(float))
   11. [getB()](#getB())
   12. [setB(float)](#setB(float))
   13. [getG()](#getG())
   14. [setG(float)](#setG(float))
   15. [getA()](#getA())
   16. [setA(float)](#setA(float))
   17. [setRGBA(float, float, float, float)](#setRGBA(float,float,float,float))
   18. [getID()](#getID())
   19. [getX()](#getX())
   20. [setX(int)](#setX(int))
   21. [getY()](#getY())
   22. [setY(int)](#setY(int))
   23. [getZ()](#getZ())
   24. [setZ(int)](#setZ(int))
   25. [getRenderWidth()](#getRenderWidth())
   26. [setRenderWidth(float)](#setRenderWidth(float))
   27. [getRenderHeight()](#getRenderHeight())
   28. [setRenderHeight(float)](#setRenderHeight(float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class WorldMarkers.DirectionArrow
=================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.WorldMarkers.DirectionArrow

Enclosing class:
:   `WorldMarkers`

---

public class WorldMarkers.DirectionArrow
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private class`

  `WorldMarkers.DirectionArrow.DebugStuff`
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

  `private final float`

  `angleLerpVal`

  `private float`

  `b`

  `private WorldMarkers.DirectionArrow.DebugStuff`

  `debugStuff`

  `static final boolean`

  `doDebug`

  `private float`

  `g`

  `private final int`

  `id`

  `private boolean`

  `isDrawOnWorld`

  `private boolean`

  `isRemoved`

  `private boolean`

  `lastWasWithinView`

  `private float`

  `r`

  `private float`

  `renderHeight`

  `private float`

  `renderScreenX`

  `private float`

  `renderScreenY`

  `private float`

  `renderSizeMod`

  `private Texture`

  `renderTexture`

  `private float`

  `renderWidth`

  `private boolean`

  `renderWithAngle`

  `private Texture`

  `texDown`

  `private Texture`

  `texStairsDown`

  `private Texture`

  `texStairsUp`

  `private Texture`

  `texture`

  `private int`

  `x`

  `private int`

  `y`

  `private int`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `DirectionArrow(int plrIndex)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getA()`

  `float`

  `getB()`

  `float`

  `getG()`

  `int`

  `getID()`

  `float`

  `getR()`

  `float`

  `getRenderHeight()`

  `float`

  `getRenderWidth()`

  `int`

  `getX()`

  `int`

  `getY()`

  `int`

  `getZ()`

  `boolean`

  `isActive()`

  `boolean`

  `isRemoved()`

  `void`

  `remove()`

  `void`

  `setA(float a)`

  `void`

  `setActive(boolean active)`

  `void`

  `setB(float b)`

  `void`

  `setG(float g)`

  `void`

  `setR(float r)`

  `void`

  `setRenderHeight(float renderHeight)`

  `void`

  `setRenderWidth(float renderWidth)`

  `void`

  `setRGBA(float r,
  float g,
  float b,
  float a)`

  `void`

  `setTexDown(String texname)`

  `void`

  `setTexStairsDown(String texname)`

  `void`

  `setTexStairsUp(String texname)`

  `void`

  `setTexture(String texname)`

  `void`

  `setX(int x)`

  `void`

  `setY(int y)`

  `void`

  `setZ(int z)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### doDebug

    public static final boolean doDebug

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.WorldMarkers.DirectionArrow.doDebug)
  + ### debugStuff

    private [WorldMarkers.DirectionArrow.DebugStuff](WorldMarkers.DirectionArrow.DebugStuff.html "class in zombie.iso") debugStuff
  + ### id

    private final int id
  + ### active

    private boolean active
  + ### isRemoved

    private boolean isRemoved
  + ### isDrawOnWorld

    private boolean isDrawOnWorld
  + ### renderTexture

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") renderTexture
  + ### texture

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") texture
  + ### texStairsUp

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") texStairsUp
  + ### texStairsDown

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") texStairsDown
  + ### texDown

    private [Texture](../core/textures/Texture.html "class in zombie.core.textures") texDown
  + ### x

    private int x
  + ### y

    private int y
  + ### z

    private int z
  + ### r

    private float r
  + ### g

    private float g
  + ### b

    private float b
  + ### a

    private float a
  + ### renderWidth

    private float renderWidth
  + ### renderHeight

    private float renderHeight
  + ### angle

    private float angle
  + ### angleLerpVal

    private final float angleLerpVal

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.WorldMarkers.DirectionArrow.angleLerpVal)
  + ### lastWasWithinView

    private boolean lastWasWithinView
  + ### renderScreenX

    private float renderScreenX
  + ### renderScreenY

    private float renderScreenY
  + ### renderWithAngle

    private boolean renderWithAngle
  + ### renderSizeMod

    private float renderSizeMod
* Constructor Details
  -------------------

  + ### DirectionArrow

    public DirectionArrow(int plrIndex)
* Method Details
  --------------

  + ### setTexture

    public void setTexture([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texname)
  + ### setTexDown

    public void setTexDown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texname)
  + ### setTexStairsDown

    public void setTexStairsDown([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texname)
  + ### setTexStairsUp

    public void setTexStairsUp([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") texname)
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
  + ### setRGBA

    public void setRGBA(float r,
    float g,
    float b,
    float a)
  + ### getID

    public int getID()
  + ### getX

    public int getX()
  + ### setX

    public void setX(int x)
  + ### getY

    public int getY()
  + ### setY

    public void setY(int y)
  + ### getZ

    public int getZ()
  + ### setZ

    public void setZ(int z)
  + ### getRenderWidth

    public float getRenderWidth()
  + ### setRenderWidth

    public void setRenderWidth(float renderWidth)
  + ### getRenderHeight

    public float getRenderHeight()
  + ### setRenderHeight

    public void setRenderHeight(float renderHeight)