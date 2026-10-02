[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../../deprecated-list.html)
* [Index](../../../index-files/index-1.html)
* [Search](../../../search.html)
* [Help](../../../help-doc.html#class)

1. [zombie.iso.sprite](package-summary.html)
2. [IsoSpriteInstance](IsoSpriteInstance.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [pool](#pool)
   2. [lock](#lock)
   3. [parentSprite](#parentSprite)
   4. [tintb](#tintb)
   5. [tintg](#tintg)
   6. [tintr](#tintr)
   7. [frame](#frame)
   8. [alpha](#alpha)
   9. [targetAlpha](#targetAlpha)
   10. [copyTargetAlpha](#copyTargetAlpha)
   11. [multiplyObjectAlpha](#multiplyObjectAlpha)
   12. [flip](#flip)
   13. [offZ](#offZ)
   14. [offX](#offX)
   15. [offY](#offY)
   16. [animFrameIncrease](#animFrameIncrease)
   17. [multiplier](#multiplier)
   18. [looped](#looped)
   19. [finished](#finished)
   20. [nextFrame](#nextFrame)
   21. [scaleX](#scaleX)
   22. [scaleY](#scaleY)
6. [Constructor Details](#constructor-detail)
   1. [IsoSpriteInstance()](#%3Cinit%3E())
   2. [IsoSpriteInstance(IsoSprite)](#%3Cinit%3E(zombie.iso.sprite.IsoSprite))
7. [Method Details](#method-detail)
   1. [get(IsoSprite)](#get(zombie.iso.sprite.IsoSprite))
   2. [reset()](#reset())
   3. [setFrameSpeedPerFrame(float)](#setFrameSpeedPerFrame(float))
   4. [getID()](#getID())
   5. [getName()](#getName())
   6. [getParentSprite()](#getParentSprite())
   7. [getTintR()](#getTintR())
   8. [getTintG()](#getTintG())
   9. [getTintB()](#getTintB())
   10. [getAlpha()](#getAlpha())
   11. [getTargetAlpha()](#getTargetAlpha())
   12. [isCopyTargetAlpha()](#isCopyTargetAlpha())
   13. [isMultiplyObjectAlpha()](#isMultiplyObjectAlpha())
   14. [render(IsoObject, float, float, float, IsoDirections, float, float, ColorInfo)](#render(zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo))
   15. [render(IsoObject, float, float, float, IsoDirections, float, float, ColorInfo, boolean)](#render(zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo,boolean))
   16. [render(IsoObject, float, float, float, IsoDirections, float, float, ColorInfo, boolean, Consumer)](#render(zombie.iso.IsoObject,float,float,float,zombie.iso.IsoDirections,float,float,zombie.core.textures.ColorInfo,boolean,java.util.function.Consumer))
   17. [SetAlpha(float)](#SetAlpha(float))
   18. [SetTargetAlpha(float)](#SetTargetAlpha(float))
   19. [update()](#update())
   20. [renderprep(IsoObject)](#renderprep(zombie.iso.IsoObject))
   21. [getFrame()](#getFrame())
   22. [isFinished()](#isFinished())
   23. [Dispose()](#Dispose())
   24. [RenderGhostTileColor(int, int, int, float, float, float, float)](#RenderGhostTileColor(int,int,int,float,float,float,float))
   25. [setScale(float, float)](#setScale(float,float))
   26. [getScaleX()](#getScaleX())
   27. [getScaleY()](#getScaleY())
   28. [scaleAspect(float, float, float, float)](#scaleAspect(float,float,float,float))
   29. [add(IsoSpriteInstance)](#add(zombie.iso.sprite.IsoSpriteInstance))

Hide sidebar ![Hide sidebar](../../../resource-files/left.svg)![Show sidebar](../../../resource-files/right.svg) Show sidebar

Class IsoSpriteInstance
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.sprite.IsoSpriteInstance

---

public final class IsoSpriteInstance
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `float`

  `alpha`

  `float`

  `animFrameIncrease`

  `boolean`

  `copyTargetAlpha`

  `boolean`

  `finished`

  `boolean`

  `flip`

  `float`

  `frame`

  `private static final AtomicBoolean`

  `lock`

  `boolean`

  `looped`

  `(package private) static float`

  `multiplier`

  `boolean`

  `multiplyObjectAlpha`

  `boolean`

  `nextFrame`

  `float`

  `offX`

  `float`

  `offY`

  `float`

  `offZ`

  `IsoSprite`

  `parentSprite`

  `static final zombie.popman.ObjectPool<IsoSpriteInstance>`

  `pool`

  `float`

  `scaleX`

  `float`

  `scaleY`

  `float`

  `targetAlpha`

  `float`

  `tintb`

  `float`

  `tintg`

  `float`

  `tintr`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `IsoSpriteInstance()`

  `IsoSpriteInstance(IsoSprite spr)`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `static void`

  `add(IsoSpriteInstance isoSpriteInstance)`

  `void`

  `Dispose()`

  `static IsoSpriteInstance`

  `get(IsoSprite spr)`

  `float`

  `getAlpha()`

  `float`

  `getFrame()`

  `int`

  `getID()`

  `String`

  `getName()`

  `IsoSprite`

  `getParentSprite()`

  `float`

  `getScaleX()`

  `float`

  `getScaleY()`

  `float`

  `getTargetAlpha()`

  `float`

  `getTintB()`

  `float`

  `getTintG()`

  `float`

  `getTintR()`

  `boolean`

  `isCopyTargetAlpha()`

  `boolean`

  `isFinished()`

  `boolean`

  `isMultiplyObjectAlpha()`

  `void`

  `render(IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo info2)`

  `void`

  `render(IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo info2,
  boolean bDoRenderPrep)`

  `void`

  `render(IsoObject obj,
  float x,
  float y,
  float z,
  IsoDirections dir,
  float offsetX,
  float offsetY,
  ColorInfo info2,
  boolean bDoRenderPrep,
  Consumer<zombie.core.textures.TextureDraw> texdModifier)`

  `void`

  `RenderGhostTileColor(int x,
  int y,
  int z,
  float r,
  float g,
  float b,
  float a)`

  `protected void`

  `renderprep(IsoObject obj)`

  `private void`

  `reset()`

  `void`

  `scaleAspect(float texW,
  float texH,
  float width,
  float height)`

  `void`

  `SetAlpha(float f)`

  `void`

  `setFrameSpeedPerFrame(float perSecond)`

  `void`

  `setScale(float scaleX,
  float scaleY)`

  `void`

  `SetTargetAlpha(float targetAlpha)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### pool

    public static final zombie.popman.ObjectPool<[IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite")> pool
  + ### lock

    private static final [AtomicBoolean](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/concurrent/atomic/AtomicBoolean.html "class or interface in java.util.concurrent.atomic") lock
  + ### parentSprite

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") parentSprite
  + ### tintb

    public float tintb
  + ### tintg

    public float tintg
  + ### tintr

    public float tintr
  + ### frame

    public float frame
  + ### alpha

    public float alpha
  + ### targetAlpha

    public float targetAlpha
  + ### copyTargetAlpha

    public boolean copyTargetAlpha
  + ### multiplyObjectAlpha

    public boolean multiplyObjectAlpha
  + ### flip

    public boolean flip
  + ### offZ

    public float offZ
  + ### offX

    public float offX
  + ### offY

    public float offY
  + ### animFrameIncrease

    public float animFrameIncrease
  + ### multiplier

    static float multiplier
  + ### looped

    public boolean looped
  + ### finished

    public boolean finished
  + ### nextFrame

    public boolean nextFrame
  + ### scaleX

    public float scaleX
  + ### scaleY

    public float scaleY
* Constructor Details
  -------------------

  + ### IsoSpriteInstance

    public IsoSpriteInstance()
  + ### IsoSpriteInstance

    public IsoSpriteInstance([IsoSprite](IsoSprite.html "class in zombie.iso.sprite") spr)
* Method Details
  --------------

  + ### get

    public static [IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") get([IsoSprite](IsoSprite.html "class in zombie.iso.sprite") spr)
  + ### reset

    private void reset()
  + ### setFrameSpeedPerFrame

    public void setFrameSpeedPerFrame(float perSecond)
  + ### getID

    public int getID()
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getParentSprite

    public [IsoSprite](IsoSprite.html "class in zombie.iso.sprite") getParentSprite()
  + ### getTintR

    public float getTintR()
  + ### getTintG

    public float getTintG()
  + ### getTintB

    public float getTintB()
  + ### getAlpha

    public float getAlpha()
  + ### getTargetAlpha

    public float getTargetAlpha()
  + ### isCopyTargetAlpha

    public boolean isCopyTargetAlpha()
  + ### isMultiplyObjectAlpha

    public boolean isMultiplyObjectAlpha()
  + ### render

    public void render([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2)
  + ### render

    public void render([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2,
    boolean bDoRenderPrep)
  + ### render

    public void render([IsoObject](../IsoObject.html "class in zombie.iso") obj,
    float x,
    float y,
    float z,
    [IsoDirections](../IsoDirections.html "enum class in zombie.iso") dir,
    float offsetX,
    float offsetY,
    [ColorInfo](../../core/textures/ColorInfo.html "class in zombie.core.textures") info2,
    boolean bDoRenderPrep,
    [Consumer](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/function/Consumer.html "class or interface in java.util.function")<zombie.core.textures.TextureDraw> texdModifier)
  + ### SetAlpha

    public void SetAlpha(float f)
  + ### SetTargetAlpha

    public void SetTargetAlpha(float targetAlpha)
  + ### update

    public void update()
  + ### renderprep

    protected void renderprep([IsoObject](../IsoObject.html "class in zombie.iso") obj)
  + ### getFrame

    public float getFrame()
  + ### isFinished

    public boolean isFinished()
  + ### Dispose

    public void Dispose()
  + ### RenderGhostTileColor

    public void RenderGhostTileColor(int x,
    int y,
    int z,
    float r,
    float g,
    float b,
    float a)
  + ### setScale

    public void setScale(float scaleX,
    float scaleY)
  + ### getScaleX

    public float getScaleX()
  + ### getScaleY

    public float getScaleY()
  + ### scaleAspect

    public void scaleAspect(float texW,
    float texH,
    float width,
    float height)
  + ### add

    public static void add([IsoSpriteInstance](IsoSpriteInstance.html "class in zombie.iso.sprite") isoSpriteInstance)