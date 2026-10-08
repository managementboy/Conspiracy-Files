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
3. [Music](SoundManager.Music.html)

Contents

1. [Description](#)
2. [Field Summary](#field-summary)
3. [Constructor Summary](#constructor-summary)
4. [Method Summary](#method-summary)
5. [Field Details](#field-detail)
   1. [clip](#clip)
   2. [instance](#instance)
   3. [channel](#channel)
   4. [sound](#sound)
   5. [effectiveVolume](#effectiveVolume)
6. [Constructor Details](#constructor-detail)
   1. [Music()](#%3Cinit%3E())
7. [Method Details](#method-detail)
   1. [isPlaying()](#isPlaying())
   2. [update()](#update())
   3. [getPosition()](#getPosition())
   4. [stop()](#stop())

Hide sidebar ![Hide sidebar](../resource-files/left.svg)![Show sidebar](../resource-files/right.svg) Show sidebar

Class SoundManager.Music
========================

[java.lang.Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

zombie.SoundManager.Music

Enclosing class:
:   `SoundManager`

---

private static final class SoundManager.Music
extends [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html "class or interface in java.lang")

* Field Summary
  -------------

  Fields

  Modifier and Type

  Field

  Description

  `long`

  `channel`

  `GameSoundClip`

  `clip`

  `float`

  `effectiveVolume`

  `long`

  `instance`

  `long`

  `sound`
* Constructor Summary
  -------------------

  Constructors

  Modifier

  Constructor

  Description

  `private`

  `Music()`
* Method Summary
  --------------

  All MethodsInstance MethodsConcrete Methods

  Modifier and Type

  Method

  Description

  `float`

  `getPosition()`

  `boolean`

  `isPlaying()`

  `void`

  `stop()`

  `void`

  `update()`

  ### Methods inherited from class [Object](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/Object.html#method-summary "class or interface in java.lang")

  `clone, equals, finalize, getClass, hashCode, notify, notifyAll, toString, wait, wait, wait`

* Field Details
  -------------

  + ### clip

    public [GameSoundClip](audio/GameSoundClip.html "class in zombie.audio") clip
  + ### instance

    public long instance
  + ### channel

    public long channel
  + ### sound

    public long sound
  + ### effectiveVolume

    public float effectiveVolume
* Constructor Details
  -------------------

  + ### Music

    private Music()
* Method Details
  --------------

  + ### isPlaying

    public boolean isPlaying()
  + ### update

    public void update()
  + ### getPosition

    public float getPosition()
  + ### stop

    public void stop()