[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../../deprecated-list.html)
* [Index](../../index-files/index-1.html)
* [Search](../../search.html)
* [Help](../../help-doc.html#class)

1. [zombie.audio](package-summary.html)
2. [GameSound](GameSound.html)

Contents

1. [Description](#)
2. [Nested Class Summary](#nested-class-summary)
3. [Field Summary](#field-summary)
4. [Constructor Summary](#constructor-summary)
5. [Method Summary](#method-summary)
6. [Field Details](#field-detail)
   1. [name](#name)
   2. [category](#category)
   3. [loop](#loop)
   4. [is3d](#is3d)
   5. [clips](#clips)
   6. [userVolume](#userVolume)
   7. [master](#master)
   8. [maxInstancesPerEmitter](#maxInstancesPerEmitter)
   9. [reloadEpoch](#reloadEpoch)
7. [Constructor Details](#constructor-detail)
   1. [GameSound()](#%3Cinit%3E())
8. [Method Details](#method-detail)
   1. [getName()](#getName())
   2. [getCategory()](#getCategory())
   3. [isLooped()](#isLooped())
   4. [setUserVolume(float)](#setUserVolume(float))
   5. [getUserVolume()](#getUserVolume())
   6. [getRandomClip()](#getRandomClip())
   7. [getMaxDistanceOfClips()](#getMaxDistanceOfClips())
   8. [getMasterName()](#getMasterName())
   9. [numClipsUsingParameter(boolean, String)](#numClipsUsingParameter(boolean,java.lang.String))
   10. [reset()](#reset())

Hide sidebar ![Hide sidebar](../../resource-files/left.svg)![Show sidebar](../../resource-files/right.svg) Show sidebar

Class GameSound
===============

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.audio.GameSound

---

public final class GameSound
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Nested Class Summary
  --------------------

  Nested Classes

  Modifier and Type

  Class

  Description

  `static enum`

  `GameSound.MasterVolume`
* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `String`

  `category`

  `final ArrayList<GameSoundClip>`

  `clips`

  `boolean`

  `is3d`

  `boolean`

  `loop`

  `GameSound.MasterVolume`

  `master`

  `int`

  `maxInstancesPerEmitter`

  `String`

  `name`

  `short`

  `reloadEpoch`

  `private float`

  `userVolume`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `GameSound()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getCategory()`

  `String`

  `getMasterName()`

  `float`

  `getMaxDistanceOfClips()`

  `String`

  `getName()`

  `GameSoundClip`

  `getRandomClip()`

  `float`

  `getUserVolume()`

  `boolean`

  `isLooped()`

  `int`

  `numClipsUsingParameter(boolean remote,
  String parameterName)`

  `void`

  `reset()`

  `void`

  `setUserVolume(float gain)`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### category

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") category
  + ### loop

    public boolean loop
  + ### is3d

    public boolean is3d
  + ### clips

    public final [ArrayList](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/util/ArrayList.html "class or interface in java.util")<[GameSoundClip](GameSoundClip.html "class in zombie.audio")> clips
  + ### userVolume

    private float userVolume
  + ### master

    public [GameSound.MasterVolume](GameSound.MasterVolume.html "enum class in zombie.audio") master
  + ### maxInstancesPerEmitter

    public int maxInstancesPerEmitter
  + ### reloadEpoch

    public short reloadEpoch
* Constructor Details
  -------------------

  + ### GameSound

    public GameSound()
* Method Details
  --------------

  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()
  + ### getCategory

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getCategory()
  + ### isLooped

    public boolean isLooped()
  + ### setUserVolume

    public void setUserVolume(float gain)
  + ### getUserVolume

    public float getUserVolume()
  + ### getRandomClip

    public [GameSoundClip](GameSoundClip.html "class in zombie.audio") getRandomClip()
  + ### getMaxDistanceOfClips

    public float getMaxDistanceOfClips()
  + ### getMasterName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getMasterName()
  + ### numClipsUsingParameter

    public int numClipsUsingParameter(boolean remote,
    [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") parameterName)
  + ### reset

    public void reset()