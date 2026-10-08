[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.fboRenderChunk](package-summary.html)
2. [FBORenderTracerEffects](FBORenderTracerEffects.html)
3. [Effect](FBORenderTracerEffects.Effect.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [x0](#x0)
   2. [y0](#y0)
   3. [z0](#z0)
   4. [angle](#angle)
   5. [range](#range)
   6. [r0](#r0)
   7. [g0](#g0)
   8. [b0](#b0)
   9. [a0](#a0)
   10. [r1](#r1)
   11. [g1](#g1)
   12. [b1](#b1)
   13. [a1](#a1)
   14. [thickness0](#thickness0)
   15. [thickness1](#thickness1)
   16. [length](#length)
   17. [speed](#speed)
   18. [t](#t)
   19. [projection](#projection)
   20. [view](#view)
   21. [model](#model)
   22. [weaponXfrm](#weaponXfrm)
6. [Constructor Details](#constructor-detail)
   1. [Effect()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [set(FBORenderTracerEffects.Effect)](#set(zombie.iso.fboRenderChunk.FBORenderTracerEffects.Effect))
   2. [update()](#update())
   3. [render()](#render())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FBORenderTracerEffects.Effect
===================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.fboRenderChunk.FBORenderTracerEffects.Effect

Enclosing class:
:   `FBORenderTracerEffects`

---

private static final class FBORenderTracerEffects.Effect
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `a0`

  `(package private) float`

  `a1`

  `(package private) float`

  `angle`

  `(package private) float`

  `b0`

  `(package private) float`

  `b1`

  `(package private) float`

  `g0`

  `(package private) float`

  `g1`

  `(package private) float`

  `length`

  `(package private) final org.joml.Matrix4f`

  `model`

  `(package private) final org.joml.Matrix4f`

  `projection`

  `(package private) float`

  `r0`

  `(package private) float`

  `r1`

  `(package private) float`

  `range`

  `(package private) float`

  `speed`

  `(package private) float`

  `t`

  `(package private) float`

  `thickness0`

  `(package private) float`

  `thickness1`

  `(package private) final org.joml.Matrix4f`

  `view`

  `(package private) final org.joml.Matrix4f`

  `weaponXfrm`

  `(package private) float`

  `x0`

  `(package private) float`

  `y0`

  `(package private) float`

  `z0`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Effect()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `render()`

  `(package private) FBORenderTracerEffects.Effect`

  `set(FBORenderTracerEffects.Effect other)`

  `(package private) void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### x0

    float x0
  + ### y0

    float y0
  + ### z0

    float z0
  + ### angle

    float angle
  + ### range

    float range
  + ### r0

    float r0
  + ### g0

    float g0
  + ### b0

    float b0
  + ### a0

    float a0
  + ### r1

    float r1
  + ### g1

    float g1
  + ### b1

    float b1
  + ### a1

    float a1
  + ### thickness0

    float thickness0
  + ### thickness1

    float thickness1
  + ### length

    float length
  + ### speed

    float speed
  + ### t

    float t
  + ### projection

    final org.joml.Matrix4f projection
  + ### view

    final org.joml.Matrix4f view
  + ### model

    final org.joml.Matrix4f model
  + ### weaponXfrm

    final org.joml.Matrix4f weaponXfrm
* Constructor Details
  -------------------

  + ### Effect

    private Effect()
* Method Details
  --------------

  + ### set

    [FBORenderTracerEffects.Effect](FBORenderTracerEffects.Effect.html "class in zombie.iso.fboRenderChunk") set([FBORenderTracerEffects.Effect](FBORenderTracerEffects.Effect.html "class in zombie.iso.fboRenderChunk") other)
  + ### update

    void update()
  + ### render

    void render()