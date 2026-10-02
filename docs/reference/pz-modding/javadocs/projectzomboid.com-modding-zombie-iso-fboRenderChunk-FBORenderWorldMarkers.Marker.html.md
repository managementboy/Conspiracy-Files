[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.fboRenderChunk](package-summary.html)
2. [FBORenderWorldMarkers](FBORenderWorldMarkers.html)
3. [Marker](FBORenderWorldMarkers.Marker.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x1](#x1)
   2. [y1](#y1)
   3. [x2](#x2)
   4. [y2](#y2)
   5. [z](#z)
   6. [r](#r)
   7. [g](#g)
   8. [b](#b)
   9. [a](#a)
   10. [renderTimeMs](#renderTimeMs)
   11. [texture1](#texture1)
   12. [texture2](#texture2)
6. [Constructor Details](#constructor-detail)
   1. [Marker()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(float, float, float, float, float, float, float, float, float)](#set(float,float,float,float,float,float,float,float,float))
   2. [set(FBORenderWorldMarkers.Marker)](#set(zombie.iso.fboRenderChunk.FBORenderWorldMarkers.Marker))
   3. [isOnScreen(int)](#isOnScreen(int))
   4. [render(float, float, float, float, float)](#render(float,float,float,float,float))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FBORenderWorldMarkers.Marker
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.fboRenderChunk.FBORenderWorldMarkers.Marker

Enclosing class:
:   `FBORenderWorldMarkers`

---

private static final class FBORenderWorldMarkers.Marker
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `a`

  `(package private) float`

  `b`

  `(package private) float`

  `g`

  `(package private) float`

  `r`

  `(package private) long`

  `renderTimeMs`

  `(package private) Texture`

  `texture1`

  `(package private) Texture`

  `texture2`

  `(package private) float`

  `x1`

  `(package private) float`

  `x2`

  `(package private) float`

  `y1`

  `(package private) float`

  `y2`

  `(package private) float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Marker()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) boolean`

  `isOnScreen(int playerIndex)`

  `(package private) void`

  `render(float playerX,
  float playerY,
  float playerZ,
  float cx,
  float cy)`

  `(package private) FBORenderWorldMarkers.Marker`

  `set(float x1,
  float y1,
  float x2,
  float y2,
  float z,
  float r,
  float g,
  float b,
  float a)`

  `(package private) FBORenderWorldMarkers.Marker`

  `set(FBORenderWorldMarkers.Marker other)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x1

    float x1
  + ### y1

    float y1
  + ### x2

    float x2
  + ### y2

    float y2
  + ### z

    float z
  + ### r

    float r
  + ### g

    float g
  + ### b

    float b
  + ### a

    float a
  + ### renderTimeMs

    long renderTimeMs
  + ### texture1

    [Texture](../../core/textures/Texture.html "class in zombie.core.textures") texture1
  + ### texture2

    [Texture](../../core/textures/Texture.html "class in zombie.core.textures") texture2
* Constructor Details
  -------------------

  + ### Marker

    private Marker()
* Method Details
  --------------

  + ### set

    [FBORenderWorldMarkers.Marker](FBORenderWorldMarkers.Marker.html "class in zombie.iso.fboRenderChunk") set(float x1,
    float y1,
    float x2,
    float y2,
    float z,
    float r,
    float g,
    float b,
    float a)
  + ### set

    [FBORenderWorldMarkers.Marker](FBORenderWorldMarkers.Marker.html "class in zombie.iso.fboRenderChunk") set([FBORenderWorldMarkers.Marker](FBORenderWorldMarkers.Marker.html "class in zombie.iso.fboRenderChunk") other)
  + ### isOnScreen

    boolean isOnScreen(int playerIndex)
  + ### render

    void render(float playerX,
    float playerY,
    float playerZ,
    float cx,
    float cy)