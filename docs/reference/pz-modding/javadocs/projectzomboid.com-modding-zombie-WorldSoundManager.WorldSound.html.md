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
3. [WorldSound](WorldSoundManager.WorldSound.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [source](#source)
   2. [life](#life)
   3. [radius](#radius)
   4. [stresshumans](#stresshumans)
   5. [stressZombies](#stressZombies)
   6. [stressAnimals](#stressAnimals)
   7. [volume](#volume)
   8. [x](#x)
   9. [y](#y)
   10. [z](#z)
   11. [zombieIgnoreDist](#zombieIgnoreDist)
   12. [sourceIsZombie](#sourceIsZombie)
   13. [sourceIsPlayer](#sourceIsPlayer)
   14. [sourceIsPlayerBase](#sourceIsPlayerBase)
   15. [stressMod](#stressMod)
   16. [repeating](#repeating)
6. [Constructor Details](#constructor-detail)
   1. [WorldSound()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [isSourceIsPlayerBase(Object)](#isSourceIsPlayerBase(java.lang.Object))
   2. [init(Object, int, int, int, int, int)](#init(java.lang.Object,int,int,int,int,int))
   3. [init(Object, int, int, int, int, int, boolean)](#init(java.lang.Object,int,int,int,int,int,boolean))
   4. [init(Object, int, int, int, int, int, boolean, float, float)](#init(java.lang.Object,int,int,int,int,int,boolean,float,float))
   5. [init(Object, int, int, int, int, int, float, float, short)](#init(java.lang.Object,int,int,int,int,int,float,float,short))
   6. [init(boolean, int, int, int, int, int, boolean, float, float)](#init(boolean,int,int,int,int,int,boolean,float,float))
   7. [init(WorldSoundManager.WorldSound)](#init(zombie.WorldSoundManager.WorldSound))
   8. [sourceIsVehicle()](#sourceIsVehicle())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class WorldSoundManager.WorldSound
==================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.WorldSoundManager.WorldSound

Enclosing class:
:   `WorldSoundManager`

---

public static final class WorldSoundManager.WorldSound
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `int`

  `life`

  `int`

  `radius`

  `boolean`

  `repeating`

  `Object`

  `source`

  `boolean`

  `sourceIsPlayer`

  `boolean`

  `sourceIsPlayerBase`

  `boolean`

  `sourceIsZombie`

  `boolean`

  `stressAnimals`

  `boolean`

  `stresshumans`

  `float`

  `stressMod`

  `boolean`

  `stressZombies`

  `int`

  `volume`

  `int`

  `x`

  `int`

  `y`

  `int`

  `z`

  `float`

  `zombieIgnoreDist`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `WorldSound()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `WorldSoundManager.WorldSound`

  `init(boolean sourceIsZombie,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  boolean stressHumans,
  float zombieIgnoreDist,
  float stressMod)`

  `WorldSoundManager.WorldSound`

  `init(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume)`

  `WorldSoundManager.WorldSound`

  `init(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  boolean stresshumans)`

  `WorldSoundManager.WorldSound`

  `init(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  boolean stresshumans,
  float zombieIgnoreDist,
  float stressMod)`

  `WorldSoundManager.WorldSound`

  `init(Object source,
  int x,
  int y,
  int z,
  int radius,
  int volume,
  float zombieIgnoreDist,
  float stressMod,
  short flags)`

  `WorldSoundManager.WorldSound`

  `init(WorldSoundManager.WorldSound other)`

  `private boolean`

  `isSourceIsPlayerBase(Object source)`

  `boolean`

  `sourceIsVehicle()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### source

    public [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source
  + ### life

    public int life
  + ### radius

    public int radius
  + ### stresshumans

    public boolean stresshumans
  + ### stressZombies

    public boolean stressZombies
  + ### stressAnimals

    public boolean stressAnimals
  + ### volume

    public int volume
  + ### x

    public int x
  + ### y

    public int y
  + ### z

    public int z
  + ### zombieIgnoreDist

    public float zombieIgnoreDist
  + ### sourceIsZombie

    public boolean sourceIsZombie
  + ### sourceIsPlayer

    public boolean sourceIsPlayer
  + ### sourceIsPlayerBase

    public boolean sourceIsPlayerBase
  + ### stressMod

    public float stressMod
  + ### repeating

    public boolean repeating
* Constructor Details
  -------------------

  + ### WorldSound

    public WorldSound()
* Method Details
  --------------

  + ### isSourceIsPlayerBase

    private boolean isSourceIsPlayerBase([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source)
  + ### init

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") init([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume)
  + ### init

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") init([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    boolean stresshumans)
  + ### init

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") init([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    boolean stresshumans,
    float zombieIgnoreDist,
    float stressMod)
  + ### init

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") init([Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang") source,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    float zombieIgnoreDist,
    float stressMod,
    short flags)
  + ### init

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") init(boolean sourceIsZombie,
    int x,
    int y,
    int z,
    int radius,
    int volume,
    boolean stressHumans,
    float zombieIgnoreDist,
    float stressMod)
  + ### init

    public [WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") init([WorldSoundManager.WorldSound](WorldSoundManager.WorldSound.html "class in zombie") other)
  + ### sourceIsVehicle

    public boolean sourceIsVehicle()