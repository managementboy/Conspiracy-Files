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
3. [PlayerScreen](WorldMarkers.PlayerScreen.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [centerX](#centerX)
   2. [centerY](#centerY)
   3. [x](#x)
   4. [y](#y)
   5. [width](#width)
   6. [height](#height)
   7. [padTop](#padTop)
   8. [padLeft](#padLeft)
   9. [padBot](#padBot)
   10. [padRight](#padRight)
   11. [innerX](#innerX)
   12. [innerY](#innerY)
   13. [innerX2](#innerX2)
   14. [innerY2](#innerY2)
   15. [borderTop](#borderTop)
   16. [borderRight](#borderRight)
   17. [borderBot](#borderBot)
   18. [borderLeft](#borderLeft)
   19. [borders](#borders)
6. [Constructor Details](#constructor-detail)
   1. [PlayerScreen()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [update(int)](#update(int))
   2. [getBorders()](#getBorders())
   3. [getBorderTop()](#getBorderTop())
   4. [getBorderRight()](#getBorderRight())
   5. [getBorderBot()](#getBorderBot())
   6. [getBorderLeft()](#getBorderLeft())
   7. [clampToInnerX(float)](#clampToInnerX(float))
   8. [clampToInnerY(float)](#clampToInnerY(float))
   9. [isOnScreen(float, float)](#isOnScreen(float,float))
   10. [isWithinInner(float, float)](#isWithinInner(float,float))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class WorldMarkers.PlayerScreen
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.WorldMarkers.PlayerScreen

Enclosing class:
:   `WorldMarkers`

---

class WorldMarkers.PlayerScreen
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final WorldMarkers.Line`

  `borderBot`

  `private final WorldMarkers.Line`

  `borderLeft`

  `private final WorldMarkers.Line`

  `borderRight`

  `private final WorldMarkers.Line[]`

  `borders`

  `private final WorldMarkers.Line`

  `borderTop`

  `private float`

  `centerX`

  `private float`

  `centerY`

  `private float`

  `height`

  `private float`

  `innerX`

  `private float`

  `innerX2`

  `private float`

  `innerY`

  `private float`

  `innerY2`

  `private final float`

  `padBot`

  `private final float`

  `padLeft`

  `private final float`

  `padRight`

  `private final float`

  `padTop`

  `private float`

  `width`

  `private float`

  `x`

  `private float`

  `y`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PlayerScreen()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `private float`

  `clampToInnerX(float x)`

  `private float`

  `clampToInnerY(float y)`

  `private WorldMarkers.Line`

  `getBorderBot()`

  `private WorldMarkers.Line`

  `getBorderLeft()`

  `private WorldMarkers.Line`

  `getBorderRight()`

  `private WorldMarkers.Line[]`

  `getBorders()`

  `private WorldMarkers.Line`

  `getBorderTop()`

  `private boolean`

  `isOnScreen(float x,
  float y)`

  `private boolean`

  `isWithinInner(float x,
  float y)`

  `private void`

  `update(int plrIndex)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### centerX

    private float centerX
  + ### centerY

    private float centerY
  + ### x

    private float x
  + ### y

    private float y
  + ### width

    private float width
  + ### height

    private float height
  + ### padTop

    private final float padTop

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.WorldMarkers.PlayerScreen.padTop)
  + ### padLeft

    private final float padLeft

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.WorldMarkers.PlayerScreen.padLeft)
  + ### padBot

    private final float padBot

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.WorldMarkers.PlayerScreen.padBot)
  + ### padRight

    private final float padRight

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.WorldMarkers.PlayerScreen.padRight)
  + ### innerX

    private float innerX
  + ### innerY

    private float innerY
  + ### innerX2

    private float innerX2
  + ### innerY2

    private float innerY2
  + ### borderTop

    private final [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso") borderTop
  + ### borderRight

    private final [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso") borderRight
  + ### borderBot

    private final [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso") borderBot
  + ### borderLeft

    private final [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso") borderLeft
  + ### borders

    private final [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso")[] borders
* Constructor Details
  -------------------

  + ### PlayerScreen

    PlayerScreen()
* Method Details
  --------------

  + ### update

    private void update(int plrIndex)
  + ### getBorders

    private [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso")[] getBorders()
  + ### getBorderTop

    private [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso") getBorderTop()
  + ### getBorderRight

    private [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso") getBorderRight()
  + ### getBorderBot

    private [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso") getBorderBot()
  + ### getBorderLeft

    private [WorldMarkers.Line](WorldMarkers.Line.html "class in zombie.iso") getBorderLeft()
  + ### clampToInnerX

    private float clampToInnerX(float x)
  + ### clampToInnerY

    private float clampToInnerY(float y)
  + ### isOnScreen

    private boolean isOnScreen(float x,
    float y)
  + ### isWithinInner

    private boolean isWithinInner(float x,
    float y)