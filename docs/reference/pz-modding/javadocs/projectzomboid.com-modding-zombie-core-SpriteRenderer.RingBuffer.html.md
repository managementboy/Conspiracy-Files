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

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [vbo](#vbo)
   2. [ibo](#ibo)
   3. [bufferSize](#bufferSize)
   4. [bufferSizeInVertices](#bufferSizeInVertices)
   5. [indexBufferSize](#indexBufferSize)
   6. [numBuffers](#numBuffers)
   7. [sequence](#sequence)
   8. [mark](#mark)
   9. [currentVertices](#currentVertices)
   10. [currentIndices](#currentIndices)
   11. [vertices](#vertices)
   12. [verticesBytes](#verticesBytes)
   13. [indices](#indices)
   14. [indicesBytes](#indicesBytes)
   15. [lastRenderedTexture0](#lastRenderedTexture0)
   16. [currentTexture0](#currentTexture0)
   17. [lastRenderedTexture1](#lastRenderedTexture1)
   18. [currentTexture1](#currentTexture1)
   19. [lastRenderedTexture2](#lastRenderedTexture2)
   20. [currentTexture2](#currentTexture2)
   21. [shaderChangedTexture1](#shaderChangedTexture1)
   22. [lastUseAttribArray](#lastUseAttribArray)
   23. [currentUseAttribArray](#currentUseAttribArray)
   24. [lastRenderedStyle](#lastRenderedStyle)
   25. [currentStyle](#currentStyle)
   26. [stateRun](#stateRun)
   27. [restoreVbos](#restoreVbos)
   28. [restoreBoundTextures](#restoreBoundTextures)
   29. [vertexCursor](#vertexCursor)
   30. [indexCursor](#indexCursor)
   31. [numRuns](#numRuns)
   32. [currentRun](#currentRun)
   33. [ignoreStyles](#ignoreStyles)
   34. [drawRangleElements](#drawRangleElements)
7. [Constructor Details](#constructor-detail)
   1. [RingBuffer()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [create()](#create())
   2. [add(TextureDraw, TextureDraw, Style)](#add(zombie.core.textures.TextureDraw,zombie.core.textures.TextureDraw,zombie.core.Styles.Style))
   3. [prepareCurrentRun(TextureDraw, TextureDraw, Style)](#prepareCurrentRun(zombie.core.textures.TextureDraw,zombie.core.textures.TextureDraw,zombie.core.Styles.Style))
   4. [isStateChanged(TextureDraw, TextureDraw, Style, Texture, Texture, Texture, byte)](#isStateChanged(zombie.core.textures.TextureDraw,zombie.core.textures.TextureDraw,zombie.core.Styles.Style,zombie.core.textures.Texture,zombie.core.textures.Texture,zombie.core.textures.Texture,byte))
   5. [next()](#next())
   6. [begin()](#begin())
   7. [render()](#render())
   8. [growStateRuns()](#growStateRuns())
   9. [shaderChangedTexture1()](#shaderChangedTexture1())
   10. [checkShaderChangedTexture1()](#checkShaderChangedTexture1())
   11. [drawElements(int, int, int, int)](#drawElements(int,int,int,int))
   12. [debugBoundTexture(Texture, int)](#debugBoundTexture(zombie.core.textures.Texture,int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class SpriteRenderer.RingBuffer
===============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.SpriteRenderer.RingBuffer

Enclosing class:
:   `SpriteRenderer`

---

public static final class SpriteRenderer.RingBuffer
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `private class`

  `SpriteRenderer.RingBuffer.StateRun`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `(package private) long`

  `bufferSize`

  `(package private) long`

  `bufferSizeInVertices`

  `(package private) ShortBuffer`

  `currentIndices`

  `(package private) SpriteRenderer.RingBuffer.StateRun`

  `currentRun`

  `(package private) zombie.core.Styles.Style`

  `currentStyle`

  `(package private) Texture`

  `currentTexture0`

  `(package private) Texture`

  `currentTexture1`

  `(package private) Texture`

  `currentTexture2`

  `(package private) byte`

  `currentUseAttribArray`

  `(package private) FloatBuffer`

  `currentVertices`

  `(package private) final zombie.core.profiling.PerformanceProfileProbe`

  `drawRangleElements`

  `(package private) zombie.core.VBO.GLVertexBufferObject[]`

  `ibo`

  `static boolean`

  `ignoreStyles`

  `(package private) long`

  `indexBufferSize`

  `(package private) int`

  `indexCursor`

  `(package private) ShortBuffer[]`

  `indices`

  `(package private) ByteBuffer[]`

  `indicesBytes`

  `(package private) zombie.core.Styles.Style`

  `lastRenderedStyle`

  `(package private) Texture`

  `lastRenderedTexture0`

  `(package private) Texture`

  `lastRenderedTexture1`

  `(package private) Texture`

  `lastRenderedTexture2`

  `(package private) byte`

  `lastUseAttribArray`

  `(package private) int`

  `mark`

  `(package private) int`

  `numBuffers`

  `(package private) int`

  `numRuns`

  `boolean`

  `restoreBoundTextures`

  `boolean`

  `restoreVbos`

  `(package private) int`

  `sequence`

  `(package private) boolean`

  `shaderChangedTexture1`

  `(package private) SpriteRenderer.RingBuffer.StateRun[]`

  `stateRun`

  `(package private) zombie.core.VBO.GLVertexBufferObject[]`

  `vbo`

  `(package private) int`

  `vertexCursor`

  `(package private) FloatBuffer[]`

  `vertices`

  `(package private) ByteBuffer[]`

  `verticesBytes`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `RingBuffer()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `(package private) void`

  `add(zombie.core.textures.TextureDraw draw,
  zombie.core.textures.TextureDraw prevDraw,
  zombie.core.Styles.Style newStyle)`

  `(package private) void`

  `begin()`

  `void`

  `checkShaderChangedTexture1()`

  `(package private) void`

  `create()`

  `void`

  `debugBoundTexture(Texture texture0,
  int unit)`

  `private void`

  `drawElements(int start,
  int length,
  int startIndex,
  int endIndex)`

  `(package private) void`

  `growStateRuns()`

  `private boolean`

  `isStateChanged(zombie.core.textures.TextureDraw draw,
  zombie.core.textures.TextureDraw prevDraw,
  zombie.core.Styles.Style newStyle,
  Texture newTexture0,
  Texture newTexture1,
  Texture newTexture2,
  byte newUseAttribArray)`

  `private void`

  `next()`

  `private boolean`

  `prepareCurrentRun(zombie.core.textures.TextureDraw draw,
  zombie.core.textures.TextureDraw prevDraw,
  zombie.core.Styles.Style newStyle)`

  `(package private) void`

  `render()`

  `void`

  `shaderChangedTexture1()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### vbo

    zombie.core.VBO.GLVertexBufferObject[] vbo
  + ### ibo

    zombie.core.VBO.GLVertexBufferObject[] ibo
  + ### bufferSize

    long bufferSize
  + ### bufferSizeInVertices

    long bufferSizeInVertices
  + ### indexBufferSize

    long indexBufferSize
  + ### numBuffers

    int numBuffers
  + ### sequence

    int sequence
  + ### mark

    int mark
  + ### currentVertices

    [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio") currentVertices
  + ### currentIndices

    [ShortBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ShortBuffer.html "class or interface in java.nio") currentIndices
  + ### vertices

    [FloatBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/FloatBuffer.html "class or interface in java.nio")[] vertices
  + ### verticesBytes

    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")[] verticesBytes
  + ### indices

    [ShortBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ShortBuffer.html "class or interface in java.nio")[] indices
  + ### indicesBytes

    [ByteBuffer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/nio/ByteBuffer.html "class or interface in java.nio")[] indicesBytes
  + ### lastRenderedTexture0

    [Texture](textures/Texture.html "class in zombie.core.textures") lastRenderedTexture0
  + ### currentTexture0

    [Texture](textures/Texture.html "class in zombie.core.textures") currentTexture0
  + ### lastRenderedTexture1

    [Texture](textures/Texture.html "class in zombie.core.textures") lastRenderedTexture1
  + ### currentTexture1

    [Texture](textures/Texture.html "class in zombie.core.textures") currentTexture1
  + ### lastRenderedTexture2

    [Texture](textures/Texture.html "class in zombie.core.textures") lastRenderedTexture2
  + ### currentTexture2

    [Texture](textures/Texture.html "class in zombie.core.textures") currentTexture2
  + ### shaderChangedTexture1

    boolean shaderChangedTexture1
  + ### lastUseAttribArray

    byte lastUseAttribArray
  + ### currentUseAttribArray

    byte currentUseAttribArray
  + ### lastRenderedStyle

    zombie.core.Styles.Style lastRenderedStyle
  + ### currentStyle

    zombie.core.Styles.Style currentStyle
  + ### stateRun

    [SpriteRenderer.RingBuffer.StateRun](SpriteRenderer.RingBuffer.StateRun.html "class in zombie.core")[] stateRun
  + ### restoreVbos

    public boolean restoreVbos
  + ### restoreBoundTextures

    public boolean restoreBoundTextures
  + ### vertexCursor

    int vertexCursor
  + ### indexCursor

    int indexCursor
  + ### numRuns

    int numRuns
  + ### currentRun

    [SpriteRenderer.RingBuffer.StateRun](SpriteRenderer.RingBuffer.StateRun.html "class in zombie.core") currentRun
  + ### ignoreStyles

    public static boolean ignoreStyles
  + ### drawRangleElements

    final zombie.core.profiling.PerformanceProfileProbe drawRangleElements
* Constructor Details
  -------------------

  + ### RingBuffer

    RingBuffer()
* Method Details
  --------------

  + ### create

    void create()
  + ### add

    void add(zombie.core.textures.TextureDraw draw,
    zombie.core.textures.TextureDraw prevDraw,
    zombie.core.Styles.Style newStyle)
  + ### prepareCurrentRun

    private boolean prepareCurrentRun(zombie.core.textures.TextureDraw draw,
    zombie.core.textures.TextureDraw prevDraw,
    zombie.core.Styles.Style newStyle)
  + ### isStateChanged

    private boolean isStateChanged(zombie.core.textures.TextureDraw draw,
    zombie.core.textures.TextureDraw prevDraw,
    zombie.core.Styles.Style newStyle,
    [Texture](textures/Texture.html "class in zombie.core.textures") newTexture0,
    [Texture](textures/Texture.html "class in zombie.core.textures") newTexture1,
    [Texture](textures/Texture.html "class in zombie.core.textures") newTexture2,
    byte newUseAttribArray)
  + ### next

    private void next()
  + ### begin

    void begin()
  + ### render

    void render()
  + ### growStateRuns

    void growStateRuns()
  + ### shaderChangedTexture1

    public void shaderChangedTexture1()
  + ### checkShaderChangedTexture1

    public void checkShaderChangedTexture1()
  + ### drawElements

    private void drawElements(int start,
    int length,
    int startIndex,
    int endIndex)
  + ### debugBoundTexture

    public void debugBoundTexture([Texture](textures/Texture.html "class in zombie.core.textures") texture0,
    int unit)