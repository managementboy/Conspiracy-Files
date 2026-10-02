[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.fboRenderChunk](package-summary.html)
2. [FBORenderChunk](FBORenderChunk.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [PIXELS\_PER\_LEVEL](#PIXELS_PER_LEVEL)
   2. [FLOOR\_WIDTH](#FLOOR_WIDTH)
   3. [FLOOR\_HEIGHT](#FLOOR_HEIGHT)
   4. [JUMBO\_L\_WIDTH](#JUMBO_L_WIDTH)
   5. [JUMBO\_L\_HEIGHT](#JUMBO_L_HEIGHT)
   6. [JUMBO\_XL\_WIDTH](#JUMBO_XL_WIDTH)
   7. [JUMBO\_XL\_HEIGHT](#JUMBO_XL_HEIGHT)
   8. [JUMBO\_XXL\_WIDTH](#JUMBO_XXL_WIDTH)
   9. [JUMBO\_XXL\_HEIGHT](#JUMBO_XXL_HEIGHT)
   10. [TEXTURE\_HEIGHT](#TEXTURE_HEIGHT)
   11. [LEVELS\_PER\_TEXTURE](#LEVELS_PER_TEXTURE)
   12. [DIRTY\_NONE](#DIRTY_NONE)
   13. [DIRTY\_BLOOD](#DIRTY_BLOOD)
   14. [DIRTY\_CORPSE](#DIRTY_CORPSE)
   15. [DIRTY\_ITEM\_ADD](#DIRTY_ITEM_ADD)
   16. [DIRTY\_ITEM\_REMOVE](#DIRTY_ITEM_REMOVE)
   17. [DIRTY\_ITEM\_MODIFY](#DIRTY_ITEM_MODIFY)
   18. [DIRTY\_LIGHTING](#DIRTY_LIGHTING)
   19. [DIRTY\_OBJECT\_ADD](#DIRTY_OBJECT_ADD)
   20. [DIRTY\_OBJECT\_REMOVE](#DIRTY_OBJECT_REMOVE)
   21. [DIRTY\_OBJECT\_MODIFY](#DIRTY_OBJECT_MODIFY)
   22. [DIRTY\_CREATE](#DIRTY_CREATE)
   23. [DIRTY\_REDRAW](#DIRTY_REDRAW)
   24. [DIRTY\_CUTAWAYS](#DIRTY_CUTAWAYS)
   25. [DIRTY\_TREES](#DIRTY_TREES)
   26. [DIRTY\_OBSCURING](#DIRTY_OBSCURING)
   27. [DIRTY\_REDO\_CUTAWAYS](#DIRTY_REDO_CUTAWAYS)
   28. [renderLevels](#renderLevels)
   29. [index](#index)
   30. [fbo](#fbo)
   31. [submitted](#submitted)
   32. [isInit](#isInit)
   33. [tex](#tex)
   34. [depth](#depth)
   35. [w](#w)
   36. [h](#h)
   37. [chunk](#chunk)
   38. [highRes](#highRes)
   39. [minLevel](#minLevel)
   40. [renderX](#renderX)
   41. [renderY](#renderY)
   42. [renderW](#renderW)
   43. [renderH](#renderH)
6. [Constructor Details](#constructor-detail)
   1. [FBORenderChunk()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [setRenderLevels(FBORenderLevels)](#setRenderLevels(zombie.iso.fboRenderChunk.FBORenderLevels))
   2. [getRenderLevels()](#getRenderLevels())
   3. [getTextureWidth(float)](#getTextureWidth(float))
   4. [getTextureHeight(float)](#getTextureHeight(float))
   5. [getMinLevel()](#getMinLevel())
   6. [getTopLevel()](#getTopLevel())
   7. [isTopLevel(int)](#isTopLevel(int))
   8. [preInit()](#preInit())
   9. [init()](#init())
   10. [beginMainThread(boolean)](#beginMainThread(boolean))
   11. [endMainThread()](#endMainThread())
   12. [beginRenderThread(boolean)](#beginRenderThread(boolean))
   13. [endRenderThread()](#endRenderThread())
   14. [getTexture()](#getTexture())
   15. [renderInWorldMainThread()](#renderInWorldMainThread())

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class FBORenderChunk
====================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.fboRenderChunk.FBORenderChunk

---

public final class FBORenderChunk
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `IsoChunk`

  `chunk`

  `Texture`

  `depth`

  `static final long`

  `DIRTY_BLOOD`

  `static final long`

  `DIRTY_CORPSE`

  `static final long`

  `DIRTY_CREATE`

  `static final long`

  `DIRTY_CUTAWAYS`

  `static final long`

  `DIRTY_ITEM_ADD`

  `static final long`

  `DIRTY_ITEM_MODIFY`

  `static final long`

  `DIRTY_ITEM_REMOVE`

  `static final long`

  `DIRTY_LIGHTING`

  `static final long`

  `DIRTY_NONE`

  `static final long`

  `DIRTY_OBJECT_ADD`

  `static final long`

  `DIRTY_OBJECT_MODIFY`

  `static final long`

  `DIRTY_OBJECT_REMOVE`

  `static final long`

  `DIRTY_OBSCURING`

  `static final long`

  `DIRTY_REDO_CUTAWAYS`

  `static final long`

  `DIRTY_REDRAW`

  `static final long`

  `DIRTY_TREES`

  `zombie.core.textures.TextureFBO`

  `fbo`

  `static final int`

  `FLOOR_HEIGHT`

  `static final int`

  `FLOOR_WIDTH`

  `int`

  `h`

  `boolean`

  `highRes`

  `int`

  `index`

  `boolean`

  `isInit`

  `static final int`

  `JUMBO_L_HEIGHT`

  `static final int`

  `JUMBO_L_WIDTH`

  `static final int`

  `JUMBO_XL_HEIGHT`

  `static final int`

  `JUMBO_XL_WIDTH`

  `static final int`

  `JUMBO_XXL_HEIGHT`

  `static final int`

  `JUMBO_XXL_WIDTH`

  `static final int`

  `LEVELS_PER_TEXTURE`

  `int`

  `minLevel`

  `static final int`

  `PIXELS_PER_LEVEL`

  `float`

  `renderH`

  `private zombie.iso.fboRenderChunk.FBORenderLevels`

  `renderLevels`

  `float`

  `renderW`

  `float`

  `renderX`

  `float`

  `renderY`

  `boolean`

  `submitted`

  `Texture`

  `tex`

  `static final int`

  `TEXTURE_HEIGHT`

  `int`

  `w`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FBORenderChunk()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `beginMainThread(boolean bClear)`

  `void`

  `beginRenderThread(boolean bClear)`

  `void`

  `endMainThread()`

  `void`

  `endRenderThread()`

  `int`

  `getMinLevel()`

  `zombie.iso.fboRenderChunk.FBORenderLevels`

  `getRenderLevels()`

  `Texture`

  `getTexture()`

  `int`

  `getTextureHeight(float cameraZoom)`

  `int`

  `getTextureWidth(float cameraZoom)`

  `int`

  `getTopLevel()`

  `void`

  `init()`

  `boolean`

  `isTopLevel(int level)`

  `void`

  `preInit()`

  `void`

  `renderInWorldMainThread()`

  `void`

  `setRenderLevels(zombie.iso.fboRenderChunk.FBORenderLevels renderLevels)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### PIXELS\_PER\_LEVEL

    public static final int PIXELS\_PER\_LEVEL
  + ### FLOOR\_WIDTH

    public static final int FLOOR\_WIDTH
  + ### FLOOR\_HEIGHT

    public static final int FLOOR\_HEIGHT
  + ### JUMBO\_L\_WIDTH

    public static final int JUMBO\_L\_WIDTH
  + ### JUMBO\_L\_HEIGHT

    public static final int JUMBO\_L\_HEIGHT
  + ### JUMBO\_XL\_WIDTH

    public static final int JUMBO\_XL\_WIDTH
  + ### JUMBO\_XL\_HEIGHT

    public static final int JUMBO\_XL\_HEIGHT
  + ### JUMBO\_XXL\_WIDTH

    public static final int JUMBO\_XXL\_WIDTH
  + ### JUMBO\_XXL\_HEIGHT

    public static final int JUMBO\_XXL\_HEIGHT
  + ### TEXTURE\_HEIGHT

    public static final int TEXTURE\_HEIGHT

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.TEXTURE_HEIGHT)
  + ### LEVELS\_PER\_TEXTURE

    public static final int LEVELS\_PER\_TEXTURE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.LEVELS_PER_TEXTURE)
  + ### DIRTY\_NONE

    public static final long DIRTY\_NONE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_NONE)
  + ### DIRTY\_BLOOD

    public static final long DIRTY\_BLOOD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_BLOOD)
  + ### DIRTY\_CORPSE

    public static final long DIRTY\_CORPSE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_CORPSE)
  + ### DIRTY\_ITEM\_ADD

    public static final long DIRTY\_ITEM\_ADD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_ITEM_ADD)
  + ### DIRTY\_ITEM\_REMOVE

    public static final long DIRTY\_ITEM\_REMOVE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_ITEM_REMOVE)
  + ### DIRTY\_ITEM\_MODIFY

    public static final long DIRTY\_ITEM\_MODIFY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_ITEM_MODIFY)
  + ### DIRTY\_LIGHTING

    public static final long DIRTY\_LIGHTING

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_LIGHTING)
  + ### DIRTY\_OBJECT\_ADD

    public static final long DIRTY\_OBJECT\_ADD

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_OBJECT_ADD)
  + ### DIRTY\_OBJECT\_REMOVE

    public static final long DIRTY\_OBJECT\_REMOVE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_OBJECT_REMOVE)
  + ### DIRTY\_OBJECT\_MODIFY

    public static final long DIRTY\_OBJECT\_MODIFY

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_OBJECT_MODIFY)
  + ### DIRTY\_CREATE

    public static final long DIRTY\_CREATE

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_CREATE)
  + ### DIRTY\_REDRAW

    public static final long DIRTY\_REDRAW

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_REDRAW)
  + ### DIRTY\_CUTAWAYS

    public static final long DIRTY\_CUTAWAYS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_CUTAWAYS)
  + ### DIRTY\_TREES

    public static final long DIRTY\_TREES

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_TREES)
  + ### DIRTY\_OBSCURING

    public static final long DIRTY\_OBSCURING

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_OBSCURING)
  + ### DIRTY\_REDO\_CUTAWAYS

    public static final long DIRTY\_REDO\_CUTAWAYS

    See Also:
    :   - [Constant Field Values](../../../constant-values.html#zombie.iso.fboRenderChunk.FBORenderChunk.DIRTY_REDO_CUTAWAYS)
  + ### renderLevels

    private zombie.iso.fboRenderChunk.FBORenderLevels renderLevels
  + ### index

    public int index
  + ### fbo

    public zombie.core.textures.TextureFBO fbo
  + ### submitted

    public boolean submitted
  + ### isInit

    public boolean isInit
  + ### tex

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") tex
  + ### depth

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") depth
  + ### w

    public int w
  + ### h

    public int h
  + ### chunk

    public [IsoChunk](../IsoChunk.html "class in zombie.iso") chunk
  + ### highRes

    public boolean highRes
  + ### minLevel

    public int minLevel
  + ### renderX

    public float renderX
  + ### renderY

    public float renderY
  + ### renderW

    public float renderW
  + ### renderH

    public float renderH
* Constructor Details
  -------------------

  + ### FBORenderChunk

    public FBORenderChunk()
* Method Details
  --------------

  + ### setRenderLevels

    public void setRenderLevels(zombie.iso.fboRenderChunk.FBORenderLevels renderLevels)
  + ### getRenderLevels

    public zombie.iso.fboRenderChunk.FBORenderLevels getRenderLevels()
  + ### getTextureWidth

    public int getTextureWidth(float cameraZoom)
  + ### getTextureHeight

    public int getTextureHeight(float cameraZoom)
  + ### getMinLevel

    public int getMinLevel()
  + ### getTopLevel

    public int getTopLevel()
  + ### isTopLevel

    public boolean isTopLevel(int level)
  + ### preInit

    public void preInit()
  + ### init

    public void init()
  + ### beginMainThread

    public void beginMainThread(boolean bClear)
  + ### endMainThread

    public void endMainThread()
  + ### beginRenderThread

    public void beginRenderThread(boolean bClear)
  + ### endRenderThread

    public void endRenderThread()
  + ### getTexture

    public [Texture](../../core/textures/Texture.html "class in zombie.core.textures") getTexture()
  + ### renderInWorldMainThread

    public void renderInWorldMainThread()