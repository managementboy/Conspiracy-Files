[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.core.textures](package-summary.html)
2. [AnimatedTexture](AnimatedTexture.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [textureId](#textureId)
   2. [frameNumber](#frameNumber)
   3. [textures](#textures)
   4. [renderTimeMs](#renderTimeMs)
   5. [lastRenderTimeMs](#lastRenderTimeMs)
6. [Constructor Details](#constructor-detail)
   1. [AnimatedTexture(AnimatedTextureID)](#%3Cinit%3E(zombie.core.textures.AnimatedTextureID))
7. [Method Details](#method-detail)
   1. [isReady()](#isReady())
   2. [initTextures()](#initTextures())
   3. [getWidth()](#getWidth())
   4. [getHeight()](#getHeight())
   5. [renderToWidth(int, int, int, float, float, float, float)](#renderToWidth(int,int,int,float,float,float,float))
   6. [render(int, int, int, int, float, float, float, float)](#render(int,int,int,int,float,float,float,float))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class AnimatedTexture
=====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.textures.AnimatedTexture

---

public final class AnimatedTexture
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private int`

  `frameNumber`

  `private long`

  `lastRenderTimeMs`

  `private long`

  `renderTimeMs`

  `private final zombie.core.textures.AnimatedTextureID`

  `textureId`

  `private final ArrayList<Texture>`

  `textures`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AnimatedTexture(zombie.core.textures.AnimatedTextureID textureId)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getHeight()`

  `int`

  `getWidth()`

  `(package private) void`

  `initTextures()`

  `boolean`

  `isReady()`

  `void`

  `render(int x,
  int y,
  int width,
  int height,
  float r,
  float g,
  float b,
  float a)`

  `void`

  `renderToWidth(int x,
  int y,
  int width,
  float r,
  float g,
  float b,
  float a)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### textureId

    private final zombie.core.textures.AnimatedTextureID textureId
  + ### frameNumber

    private int frameNumber
  + ### textures

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[Texture](Texture.html "class in zombie.core.textures")> textures
  + ### renderTimeMs

    private long renderTimeMs
  + ### lastRenderTimeMs

    private long lastRenderTimeMs
* Constructor Details
  -------------------

  + ### AnimatedTexture

    public AnimatedTexture(zombie.core.textures.AnimatedTextureID textureId)
* Method Details
  --------------

  + ### isReady

    public boolean isReady()
  + ### initTextures

    void initTextures()
  + ### getWidth

    public int getWidth()
  + ### getHeight

    public int getHeight()
  + ### renderToWidth

    public void renderToWidth(int x,
    int y,
    int width,
    float r,
    float g,
    float b,
    float a)
  + ### render

    public void render(int x,
    int y,
    int width,
    int height,
    float r,
    float g,
    float b,
    float a)