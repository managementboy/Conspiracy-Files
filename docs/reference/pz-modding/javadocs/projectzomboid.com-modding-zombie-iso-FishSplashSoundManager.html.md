[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.iso](package-summary.html)
2. [FishSplashSoundManager](FishSplashSoundManager.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [SPLASH\_SOUND\_RADIUS](#SPLASH_SOUND_RADIUS)
   2. [instance](#instance)
   3. [squares](#squares)
   4. [soundTime](#soundTime)
   5. [comp](#comp)
6. [Constructor Details](#constructor-detail)
   1. [FishSplashSoundManager()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [addSquare(IsoGridSquare)](#addSquare(zombie.iso.IsoGridSquare))
   2. [update()](#update())
   3. [getFreeSoundSlot(long)](#getFreeSoundSlot(long))

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class FishSplashSoundManager
============================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.iso.FishSplashSoundManager

---

public class FishSplashSoundManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final Comparator<IsoGridSquare>`

  `comp`

  `static final FishSplashSoundManager`

  `instance`

  `private final long[]`

  `soundTime`

  `private static final int`

  `SPLASH_SOUND_RADIUS`

  `private final ArrayList<IsoGridSquare>`

  `squares`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `FishSplashSoundManager()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `void`

  `addSquare(IsoGridSquare square)`

  `private int`

  `getFreeSoundSlot(long ms)`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### SPLASH\_SOUND\_RADIUS

    private static final int SPLASH\_SOUND\_RADIUS

    See Also:
    :   - [Constant Field Values](../../constant-values.html#zombie.iso.FishSplashSoundManager.SPLASH_SOUND_RADIUS)
  + ### instance

    public static final [FishSplashSoundManager](FishSplashSoundManager.html "class in zombie.iso") instance
  + ### squares

    private final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> squares
  + ### soundTime

    private final long[] soundTime
  + ### comp

    private final [Comparator](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/Comparator.html "class or interface in java.util")<[IsoGridSquare](IsoGridSquare.html "class in zombie.iso")> comp
* Constructor Details
  -------------------

  + ### FishSplashSoundManager

    public FishSplashSoundManager()
* Method Details
  --------------

  + ### addSquare

    public void addSquare([IsoGridSquare](IsoGridSquare.html "class in zombie.iso") square)
  + ### update

    public void update()
  + ### getFreeSoundSlot

    private int getFreeSoundSlot(long ms)