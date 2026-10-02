[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [WorldSoundManager](WorldSoundManager.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [instance](#instance)
   2. [MUFFLE\_SOUND\_DIFFERENT\_ROOMS](#MUFFLE_SOUND_DIFFERENT_ROOMS)
   3. [MUFFLE\_SOUND\_INSIDE\_OUTSIDE](#MUFFLE_SOUND_INSIDE_OUTSIDE)
   4. [soundList](#soundList)
   5. [freeSounds](#freeSounds)
   6. [resultBiggestSound](#resultBiggestSound)
7. [Constructor Details](#constructor-detail)
   1. [WorldSoundManager()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [init(IsoCell)](#init(zombie.iso.IsoCell))
   2. [initFrame()](#initFrame())
   3. [KillCell()](#KillCell())
   4. [getNew()](#getNew())
   5. [release(WorldSoundManager.WorldSound)](#release(zombie.WorldSoundManager.WorldSound))
   6. [addSound(Object, int, int, int, int, int)](#addSound(java.lang.Object,int,int,int,int,int))
   7. [addSound(Object, int, int, int, int, int, boolean)](#addSound(java.lang.Object,int,int,int,int,int,boolean))
   8. [addSound(Object, int, int, int, int, int, boolean, float, float)](#addSound(java.lang.Object,int,int,int,int,int,boolean,float,float))
   9. [addSoundRepeating(Object, int, int, int, int, int, boolean, float, float)](#addSoundRepeating(java.lang.Object,int,int,int,int,int,boolean,float,float))
   10. [addSound(Object, int, int, int, int, int, boolean, float, float, boolean, boolean, boolean)](#addSound(java.lang.Object,int,int,int,int,int,boolean,float,float,boolean,boolean,boolean))
   11. [addSound(Object, int, int, int, int, int, boolean, float, float, boolean, boolean, boolean, boolean, boolean)](#addSound(java.lang.Object,int,int,int,int,int,boolean,float,float,boolean,boolean,boolean,boolean,boolean))
   12. [addSound(Object, int, int, int, int, int, float, float, boolean, boolean, boolean, boolean, short)](#addSound(java.lang.Object,int,int,int,int,int,float,float,boolean,boolean,boolean,boolean,short))
   13. [addSoundRepeating(Object, int, int, int, int, int, boolean, boolean)](#addSoundRepeating(java.lang.Object,int,int,int,int,int,boolean,boolean))
   14. [addSoundRepeating(Object, int, int, int, int, int, boolean)](#addSoundRepeating(java.lang.Object,int,int,int,int,int,boolean))
   15. [addSoundRepeating(Object, int, int, int, int, int, short)](#addSoundRepeating(java.lang.Object,int,int,int,int,int,short))
   16. [getSoundZomb(IsoZombie)](#getSoundZomb(zombie.characters.IsoZombie))
   17. [getSoundAnimal(IsoAnimal)](#getSoundAnimal(zombie.characters.animals.IsoAnimal))
   18. [getBiggestSoundZomb(int, int, int, boolean, IsoZombie)](#getBiggestSoundZomb(int,int,int,boolean,zombie.characters.IsoZombie))
   19. [getSoundAttract(WorldSoundManager.WorldSound, IsoZombie)](#getSoundAttract(zombie.WorldSoundManager.WorldSound,zombie.characters.IsoZombie))
   20. [getSoundAttractAnimal(WorldSoundManager.WorldSound, IsoAnimal)](#getSoundAttractAnimal(zombie.WorldSoundManager.WorldSound,zombie.characters.animals.IsoAnimal))
   21. [getStressFromSounds(int, int, int)](#getStressFromSounds(int,int,int))
   22. [update()](#update())
   23. [render()](#render())
   24. [getHearingMultiplier(IsoZombie)](#getHearingMultiplier(zombie.characters.IsoZombie))
   25. [getHearingMultiplier(int)](#getHearingMultiplier(int))

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class WorldSoundManager
=======================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.WorldSoundManager

---

public final class WorldSoundManager
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static final class`

  `WorldSoundManager.ResultBiggestSound`

  `static final class`

  `WorldSoundManager.WorldSound`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `private final zombie.popman.ObjectPool<WorldSoundManager.WorldSound>`

  `freeSounds`

  `static final WorldSoundManager`

  `instance`

  `private static final float`

  `MUFFLE_SOUND_DIFFERENT_ROOMS`

  `private static final float`

  `MUFFLE_SOUND_INSIDE_OUTSIDE`

  `private static final WorldSoundManager.ResultBiggestSound`

  `resultBiggestSound`

  `final List<WorldSoundManager.WorldSound>`

  `soundList`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WorldSoundManager()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `WorldSoundManager.WorldSound`

  `addSound(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume)`

  `WorldSoundManager.WorldSound`

  `addSound(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  boolean stressHumans)`

  `WorldSoundManager.WorldSound`

  `addSound(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  boolean stressHumans,
  float zombieIgnoreDist,
  float stressMod)`

  `WorldSoundManager.WorldSound`

  `addSound(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  boolean stressHumans,
  float zombieIgnoreDist,
  float stressMod,
  boolean sourceIsZombie,
  boolean doSend,
  boolean remote)`

  `WorldSoundManager.WorldSound`

  `addSound(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  boolean stressHumans,
  float zombieIgnoreDist,
  float stressMod,
  boolean sourceIsZombie,
  boolean doSend,
  boolean remote,
  boolean repeating,
  boolean stressAnimals)`

  `WorldSoundManager.WorldSound`

  `addSound(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  float zombieIgnoreDist,
  float stressMod,
  boolean sourceIsZombie,
  boolean doSend,
  boolean remote,
  boolean repeating,
  short flags)`

  `WorldSoundManager.WorldSound`

  `addSoundRepeating(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  boolean stressHumans)`

  `WorldSoundManager.WorldSound`

  `addSoundRepeating(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  boolean stressHumans,
  boolean stressAnimals)`

  `WorldSoundManager.WorldSound`

  `addSoundRepeating(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  boolean stressHumans,
  float zombieIgnoreDist,
  float stressMod)`

  `WorldSoundManager.WorldSound`

  `addSoundRepeating(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  short flags)`

  `WorldSoundManager.ResultBiggestSound`

  `getBiggestSoundZomb(int x,
  int y,
  int z,
  boolean ignoreBySameType,
  IsoZombie zom)`

  `float`

  `getHearingMultiplier(int hearing)`

  `float`

  `getHearingMultiplier(IsoZombie zombie)`

  `WorldSoundManager.WorldSound`

  `getNew()`

  `WorldSoundManager.WorldSound`

  `getSoundAnimal(IsoAnimal animal)`

  `float`

  `getSoundAttract(WorldSoundManager.WorldSound sound,
  IsoZombie zom)`

  `float`

  `getSoundAttractAnimal(WorldSoundManager.WorldSound sound,
  IsoAnimal animal)`

  `WorldSoundManager.WorldSound`

  `getSoundZomb(IsoZombie zom)`

  `float`

  `getStressFromSounds(int x,
  int y,
  int z)`

  `void`

  `init(IsoCell cell)`

  `void`

  `initFrame()`

  `void`

  `KillCell()`

  `WorldSoundManager.WorldSound`

  `release(WorldSoundManager.WorldSound worldSound)`

  `void`

  `render()`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### instance

    public static final [WorldSoundManager](WorldSoundManager.html "class in zombie") instance
  + ### MUFFLE\_SOUND\_DIFFERENT\_ROOMS

    private static final float MUFFLE\_SOUND\_DIFFERENT\_ROOMS

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.WorldSoundManager.MUFFLE_SOUND_DIFFERENT_ROOMS)
  + ### MUFFLE\_SOUND\_INSIDE\_OUTSIDE

    private static final float MUFFLE\_SOUND\_INSIDE\_OUTSIDE

    See Also:
    :   - [Constant Field Values](../constant-values.html#zombie.WorldSoundManager.MUFFLE_SOUND_INSIDE_OUTSIDE)
  + ### soundList

    public final [List](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/List.html "class or interface in java.util")<[WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie")> soundList
  + ### freeSounds

    private final zombie.popman.ObjectPool<[WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie")> freeSounds
  + ### resultBiggestSound

    private static final [WorldSoundManager.ResultBiggestSound](WorldSoundManager.ResultBiggestSound.html "class in zombie") resultBiggestSound
* Constructor Details
  -------------------

  + ### WorldSoundManager

    public WorldSoundManager()
* Method Details
  --------------

  + ### init

    public void init([IsoCell](iso/IsoCell.html "class in zombie.iso") cell)
  + ### initFrame

    public void initFrame()
  + ### KillCell

    public void KillCell()
  + ### getNew

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") getNew()
  + ### release

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") release([WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") worldSound)
  + ### addSound

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") addSound([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume)
  + ### addSound

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") addSound([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    boolean stressHumans)
  + ### addSound

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") addSound([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    boolean stressHumans,
    float zombieIgnoreDist,
    float stressMod)
  + ### addSoundRepeating

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") addSoundRepeating([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    boolean stressHumans,
    float zombieIgnoreDist,
    float stressMod)
  + ### addSound

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") addSound([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    boolean stressHumans,
    float zombieIgnoreDist,
    float stressMod,
    boolean sourceIsZombie,
    boolean doSend,
    boolean remote)
  + ### addSound

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") addSound([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    boolean stressHumans,
    float zombieIgnoreDist,
    float stressMod,
    boolean sourceIsZombie,
    boolean doSend,
    boolean remote,
    boolean repeating,
    boolean stressAnimals)
  + ### addSound

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") addSound([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    float zombieIgnoreDist,
    float stressMod,
    boolean sourceIsZombie,
    boolean doSend,
    boolean remote,
    boolean repeating,
    short flags)
  + ### addSoundRepeating

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") addSoundRepeating([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    boolean stressHumans,
    boolean stressAnimals)
  + ### addSoundRepeating

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") addSoundRepeating([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    boolean stressHumans)
  + ### addSoundRepeating

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") addSoundRepeating([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    short flags)
  + ### getSoundZomb

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") getSoundZomb([IsoZombie](characters/IsoZombie.html "class in zombie.characters") zom)
  + ### getSoundAnimal

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") getSoundAnimal([IsoAnimal](characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### getBiggestSoundZomb

    public [WorldSoundManager.ResultBiggestSound](WorldSoundManager.ResultBiggestSound.html "class in zombie") getBiggestSoundZomb(int x,
    int y,
    int z,
    boolean ignoreBySameType,
    [IsoZombie](characters/IsoZombie.html "class in zombie.characters") zom)
  + ### getSoundAttract

    public float getSoundAttract([WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") sound,
    [IsoZombie](characters/IsoZombie.html "class in zombie.characters") zom)
  + ### getSoundAttractAnimal

    public float getSoundAttractAnimal([WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") sound,
    [IsoAnimal](characters/animals/IsoAnimal.html "class in zombie.characters.animals") animal)
  + ### getStressFromSounds

    public float getStressFromSounds(int x,
    int y,
    int z)
  + ### update

    public void update()
  + ### render

    public void render()
  + ### getHearingMultiplier

    public float getHearingMultiplier([IsoZombie](characters/IsoZombie.html "class in zombie.characters") zombie)
  + ### getHearingMultiplier

    public float getHearingMultiplier(int hearing)