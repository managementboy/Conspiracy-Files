[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [SpriteRenderer](SpriteRenderer.html)
3. [RingBuffer](SpriteRenderer.RingBuffer.html)
4. [StateRun](SpriteRenderer.RingBuffer.StateRun.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [z](#z)
   2. [chunkDepth](#chunkDepth)
   3. [texture0](#texture0)
   4. [texture1](#texture1)
   5. [texture2](#texture2)
   6. [useAttribArray](#useAttribArray)
   7. [style](#style)
   8. [start](#start)
   9. [length](#length)
   10. [indices](#indices)
   11. [startIndex](#startIndex)
   12. [endIndex](#endIndex)
   13. [ops](#ops)
6. [Constructor Details](#constructor-detail)
   1. [StateRun()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [toString()](#toString())
   2. [render()](#render())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SpriteRenderer.RingBuffer.StateRun
========================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.SpriteRenderer.RingBuffer.StateRun

Enclosing class:
:   `SpriteRenderer.RingBuffer`

---

private class SpriteRenderer.RingBuffer.StateRun
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) float`

  `chunkDepth`

  `(package private) int`

  `endIndex`

  `(package private) ShortBuffer`

  `indices`

  `(package private) int`

  `length`

  `(package private) final ArrayList<zombie.core.textures.TextureDraw>`

  `ops`

  `(package private) int`

  `start`

  `(package private) int`

  `startIndex`

  `(package private) zombie.core.Styles.Style`

  `style`

  `(package private) Texture`

  `texture0`

  `(package private) Texture`

  `texture1`

  `(package private) Texture`

  `texture2`

  `(package private) byte`

  `useAttribArray`

  `(package private) float`

  `z`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `StateRun()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `render()`

  `String`

  `toString()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, wait, wait, wait`

* Field Details
  -------------

  + ### z

    float z
  + ### chunkDepth

    float chunkDepth
  + ### texture0

    [Texture](textures/Texture.html "class in zombie.core.textures") texture0
  + ### texture1

    [Texture](textures/Texture.html "class in zombie.core.textures") texture1
  + ### texture2

    [Texture](textures/Texture.html "class in zombie.core.textures") texture2
  + ### useAttribArray

    byte useAttribArray
  + ### style

    zombie.core.Styles.Style style
  + ### start

    int start
  + ### length

    int length
  + ### indices

    [ShortBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ShortBuffer.html "class or interface in java.nio") indices
  + ### startIndex

    int startIndex
  + ### endIndex

    int endIndex
  + ### ops

    final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<zombie.core.textures.TextureDraw> ops
* Constructor Details
  -------------------

  + ### StateRun

    private StateRun()
* Method Details
  --------------

  + ### toString

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") toString()

    Overrides:
    :   `toString` in class `Object`
  + ### render

    void render()