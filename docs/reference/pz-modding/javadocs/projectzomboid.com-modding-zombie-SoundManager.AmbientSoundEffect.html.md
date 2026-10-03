[Skip navigation links](#skip-navbar-top "Skip navigation links")

* [Overview](../index.html)
* Class
* [Tree](package-tree.html)
* [Deprecated](../deprecated-list.html)
* [Index](../index-files/index-1.html)
* [Search](../search.html)
* [Help](../help-doc.html#class)

1. [zombie](package-summary.html)
2. [SoundManager](SoundManager.html)
3. [AmbientSoundEffect](SoundManager.AmbientSoundEffect.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [name](#name)
   2. [eventInstance](#eventInstance)
   3. [gain](#gain)
   4. [clip](#clip)
   5. [effectiveVolume](#effectiveVolume)
6. [Constructor Details](#constructor-detail)
   1. [AmbientSoundEffect(String)](#%3Cinit%3E(java.lang.String))
7. [Method Details](#method-detail)
   1. [setVolume(float)](#setVolume(float))
   2. [start()](#start())
   3. [pause()](#pause())
   4. [stop()](#stop())
   5. [isPlaying()](#isPlaying())
   6. [setName(String)](#setName(java.lang.String))
   7. [getName()](#getName())
   8. [update()](#update())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class SoundManager.AmbientSoundEffect
=====================================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.SoundManager.AmbientSoundEffect

All Implemented Interfaces:
:   `fmod.fmod.Audio`

Enclosing class:
:   `SoundManager`

---

public static final class SoundManager.AmbientSoundEffect
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")
implements fmod.fmod.Audio

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `GameSoundClip`

  `clip`

  `float`

  `effectiveVolume`

  `long`

  `eventInstance`

  `float`

  `gain`

  `String`

  `name`
* Constructor Summary
  -------------------

  Constructors

  Constructor

  Description

  `AmbientSoundEffect(String name)`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `String`

  `getName()`

  `boolean`

  `isPlaying()`

  `void`

  `pause()`

  `void`

  `setName(String choice)`

  `void`

  `setVolume(float volume)`

  `void`

  `start()`

  `void`

  `stop()`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### name

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name
  + ### eventInstance

    public long eventInstance
  + ### gain

    public float gain
  + ### clip

    public [GameSoundClip](audio/GameSoundClip.html "class in zombie.audio") clip
  + ### effectiveVolume

    public float effectiveVolume
* Constructor Details
  -------------------

  + ### AmbientSoundEffect

    public AmbientSoundEffect([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") name)
* Method Details
  --------------

  + ### setVolume

    public void setVolume(float volume)

    Specified by:
    :   `setVolume` in interface `fmod.fmod.Audio`
  + ### start

    public void start()

    Specified by:
    :   `start` in interface `fmod.fmod.Audio`
  + ### pause

    public void pause()

    Specified by:
    :   `pause` in interface `fmod.fmod.Audio`
  + ### stop

    public void stop()

    Specified by:
    :   `stop` in interface `fmod.fmod.Audio`
  + ### isPlaying

    public boolean isPlaying()

    Specified by:
    :   `isPlaying` in interface `fmod.fmod.Audio`
  + ### setName

    public void setName([String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") choice)

    Specified by:
    :   `setName` in interface `fmod.fmod.Audio`
  + ### getName

    public [String](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/String.html "class or interface in java.lang") getName()

    Specified by:
    :   `getName` in interface `fmod.fmod.Audio`
  + ### update

    public void update()