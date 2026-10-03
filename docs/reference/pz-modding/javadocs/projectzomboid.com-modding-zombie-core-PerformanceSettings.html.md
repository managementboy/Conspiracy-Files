[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.core](package-summary.html)
2. [PerformanceSettings](PerformanceSettings.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [manualFrameSkips](#manualFrameSkips)
   2. [lockFps](#lockFps)
   3. [uncappedFps](#uncappedFps)
   4. [waterQuality](#waterQuality)
   5. [puddlesQuality](#puddlesQuality)
   6. [newRoofHiding](#newRoofHiding)
   7. [lightingThread](#lightingThread)
   8. [lightingFps](#lightingFps)
   9. [auto3DZombies](#auto3DZombies)
   10. [instance](#instance)
   11. [interpolateAnims](#interpolateAnims)
   12. [animationSkip](#animationSkip)
   13. [modelLighting](#modelLighting)
   14. [zombieAnimationSpeedFalloffCount](#zombieAnimationSpeedFalloffCount)
   15. [zombieBonusFullspeedFalloff](#zombieBonusFullspeedFalloff)
   16. [baseStaticAnimFramerate](#baseStaticAnimFramerate)
   17. [useFbos](#useFbos)
   18. [numberZombiesBlended](#numberZombiesBlended)
   19. [fboRenderChunk](#fboRenderChunk)
   20. [fogQuality](#fogQuality)
   21. [viewConeOpacity](#viewConeOpacity)
6. [Constructor Details](#constructor-detail)
   1. [PerformanceSettings()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [getLockFPS()](#getLockFPS())
   2. [setLockFPS(int)](#setLockFPS(int))
   3. [isFramerateUncapped()](#isFramerateUncapped())
   4. [setFramerateUncapped(boolean)](#setFramerateUncapped(boolean))
   5. [getFramerate()](#getFramerate())
   6. [setFramerate(int)](#setFramerate(int))
   7. [setLightingQuality(int)](#setLightingQuality(int))
   8. [getLightingQuality()](#getLightingQuality())
   9. [setWaterQuality(int)](#setWaterQuality(int))
   10. [getWaterQuality()](#getWaterQuality())
   11. [setPuddlesQuality(int)](#setPuddlesQuality(int))
   12. [getPuddlesQuality()](#getPuddlesQuality())
   13. [setNewRoofHiding(boolean)](#setNewRoofHiding(boolean))
   14. [getNewRoofHiding()](#getNewRoofHiding())
   15. [setLightingFPS(int)](#setLightingFPS(int))
   16. [getLightingFPS()](#getLightingFPS())
   17. [getUIRenderFPS()](#getUIRenderFPS())
   18. [getFogQuality()](#getFogQuality())
   19. [setFogQuality(int)](#setFogQuality(int))
   20. [getViewConeOpacity()](#getViewConeOpacity())
   21. [setViewConeOpacity(int)](#setViewConeOpacity(int))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class PerformanceSettings
=========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.core.PerformanceSettings

---

public final class PerformanceSettings
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `static int`

  `animationSkip`

  `static boolean`

  `auto3DZombies`

  `static int`

  `baseStaticAnimFramerate`

  `static boolean`

  `fboRenderChunk`

  `static int`

  `fogQuality`

  `static final PerformanceSettings`

  `instance`

  `static boolean`

  `interpolateAnims`

  `static int`

  `lightingFps`

  `static boolean`

  `lightingThread`

  `private static int`

  `lockFps`

  `static int`

  `manualFrameSkips`

  `static boolean`

  `modelLighting`

  `static boolean`

  `newRoofHiding`

  `static int`

  `numberZombiesBlended`

  `static int`

  `puddlesQuality`

  `private static boolean`

  `uncappedFps`

  `static boolean`

  `useFbos`

  `static int`

  `viewConeOpacity`

  `static int`

  `waterQuality`

  `static int`

  `zombieAnimationSpeedFalloffCount`

  `static int`

  `zombieBonusFullspeedFalloff`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `PerformanceSettings()`
* Method Summary
  --------------

  All MethodsStatic MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `int`

  `getFogQuality()`

  `int`

  `getFramerate()`

  `int`

  `getLightingFPS()`

  `int`

  `getLightingQuality()`

  `static int`

  `getLockFPS()`

  `boolean`

  `getNewRoofHiding()`

  `int`

  `getPuddlesQuality()`

  `int`

  `getUIRenderFPS()`

  `int`

  `getViewConeOpacity()`

  `int`

  `getWaterQuality()`

  `boolean`

  `isFramerateUncapped()`

  `void`

  `setFogQuality(int fogQuality)`

  `void`

  `setFramerate(int framerate)`

  `void`

  `setFramerateUncapped(boolean uncappedFPS)`

  `void`

  `setLightingFPS(int fps)`

  `void`

  `setLightingQuality(int lighting)`

  `static void`

  `setLockFPS(int lockFPS)`

  `void`

  `setNewRoofHiding(boolean enabled)`

  `void`

  `setPuddlesQuality(int puddles)`

  `void`

  `setViewConeOpacity(int viewConeOpacity)`

  `void`

  `setWaterQuality(int water)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### manualFrameSkips

    public static int manualFrameSkips
  + ### lockFps

    private static int lockFps
  + ### uncappedFps

    private static boolean uncappedFps
  + ### waterQuality

    public static int waterQuality
  + ### puddlesQuality

    public static int puddlesQuality
  + ### newRoofHiding

    public static boolean newRoofHiding
  + ### lightingThread

    public static boolean lightingThread
  + ### lightingFps

    public static int lightingFps
  + ### auto3DZombies

    public static boolean auto3DZombies
  + ### instance

    public static final [PerformanceSettings](PerformanceSettings.html "class in zombie.core") instance
  + ### interpolateAnims

    public static boolean interpolateAnims
  + ### animationSkip

    public static int animationSkip
  + ### modelLighting

    public static boolean modelLighting
  + ### zombieAnimationSpeedFalloffCount

    public static int zombieAnimationSpeedFalloffCount
  + ### zombieBonusFullspeedFalloff

    public static int zombieBonusFullspeedFalloff
  + ### baseStaticAnimFramerate

    public static int baseStaticAnimFramerate
  + ### useFbos

    public static boolean useFbos
  + ### numberZombiesBlended

    public static int numberZombiesBlended
  + ### fboRenderChunk

    public static boolean fboRenderChunk
  + ### fogQuality

    public static int fogQuality
  + ### viewConeOpacity

    public static int viewConeOpacity
* Constructor Details
  -------------------

  + ### PerformanceSettings

    public PerformanceSettings()
* Method Details
  --------------

  + ### getLockFPS

    public static int getLockFPS()
  + ### setLockFPS

    public static void setLockFPS(int lockFPS)
  + ### isFramerateUncapped

    public boolean isFramerateUncapped()
  + ### setFramerateUncapped

    public void setFramerateUncapped(boolean uncappedFPS)
  + ### getFramerate

    public int getFramerate()
  + ### setFramerate

    public void setFramerate(int framerate)
  + ### setLightingQuality

    public void setLightingQuality(int lighting)
  + ### getLightingQuality

    public int getLightingQuality()
  + ### setWaterQuality

    public void setWaterQuality(int water)
  + ### getWaterQuality

    public int getWaterQuality()
  + ### setPuddlesQuality

    public void setPuddlesQuality(int puddles)
  + ### getPuddlesQuality

    public int getPuddlesQuality()
  + ### setNewRoofHiding

    public void setNewRoofHiding(boolean enabled)
  + ### getNewRoofHiding

    public boolean getNewRoofHiding()
  + ### setLightingFPS

    public void setLightingFPS(int fps)
  + ### getLightingFPS

    public int getLightingFPS()
  + ### getUIRenderFPS

    public int getUIRenderFPS()
  + ### getFogQuality

    public int getFogQuality()
  + ### setFogQuality

    public void setFogQuality(int fogQuality)
  + ### getViewConeOpacity

    public int getViewConeOpacity()
  + ### setViewConeOpacity

    public void setViewConeOpacity(int viewConeOpacity)